<?php
// ============================================================
// acknowledge.php - Fixed for InfinityFree
// ============================================================
require_once __DIR__ . '/config/db.php';

// Enable error reporting for debugging (remove after fixing)
error_reporting(E_ALL);
ini_set('display_errors', 1);

$pdo    = getPDO();
$token  = trim($_GET['token']  ?? '');
$action = trim($_GET['action'] ?? 'confirm');
$state  = 'invalid';
$info   = [];

if (empty($token)) {
    $state = 'invalid';
} else {
    try {
        // FIXED: Removed document_ref from SELECT since it doesn't exist
        $stmt = $pdo->prepare("
            SELECT 
                id, 
                status, 
                document_type, 
                document_id,
                recipient_name,
                recipient_email,
                confirmation_token
            FROM document_recipients
            WHERE confirmation_token = :token 
            LIMIT 1
        ");
        $stmt->execute([':token' => $token]);
        $info = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$info) {
            $state = 'invalid';
        } else {
            // Update status to 'Received'
            if ($info['status'] !== 'Received') {
                $update = $pdo->prepare("
                    UPDATE document_recipients 
                    SET status = 'Received', 
                        received_at = NOW() 
                    WHERE confirmation_token = :token
                ");
                $update->execute([':token' => $token]);
                $state = 'success';
            } else {
                $state = 'already';
            }

            // Handle download action
            if ($action === 'download') {
                $doc_type_map = [
                    'Memorandum Order' => 'memorandum_order',
                    'Special Order' => 'special_order', 
                    'Travel Order' => 'travel_order'
                ];
                
                $doc_type_for_file = $doc_type_map[$info['document_type']] ?? strtolower(str_replace(' ', '_', $info['document_type']));
                
                $file_stmt = $pdo->prepare("
                    SELECT original_name, file_path, mime_type
                    FROM document_files
                    WHERE document_type = :document_type AND document_id = :document_id
                    ORDER BY id ASC LIMIT 1
                ");
                $file_stmt->execute([
                    ':document_type' => $doc_type_for_file,
                    ':document_id' => $info['document_id']
                ]);
                $file = $file_stmt->fetch(PDO::FETCH_ASSOC);

                if ($file && !empty($file['file_path'])) {
                    $full_path = __DIR__ . '/' . $file['file_path'];
                    if (file_exists($full_path)) {
                        header('Content-Description: File Transfer');
                        header('Content-Type: ' . ($file['mime_type'] ?: 'application/octet-stream'));
                        header('Content-Disposition: attachment; filename="' . addslashes($file['original_name']) . '"');
                        header('Content-Length: ' . filesize($full_path));
                        header('Cache-Control: must-revalidate');
                        header('Pragma: public');
                        ob_clean(); 
                        flush();
                        readfile($full_path);
                        exit;
                    }
                }
            }
        }
    } catch (PDOException $e) {
        $state = 'invalid';
        $error_message = $e->getMessage();
    }
}

$doc_label = $info['document_type'] ?? 'Document';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Acknowledgement — WMSU</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'IBM Plex Sans', sans-serif; }
    </style>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

    <div class="bg-white rounded-2xl shadow-lg p-10 w-full max-w-md text-center">
        <div class="w-14 h-14 bg-red-800 rounded-full flex items-center justify-center mx-auto mb-3">
            <span class="text-white font-black text-xl">W</span>
        </div>
        <p class="text-xs text-gray-400 mb-8 uppercase tracking-widest">WMSU Document Management</p>

        <?php if ($state === 'success'): ?>
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-5">
                <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/>
                </svg>
            </div>
            <h1 class="text-xl font-bold text-gray-800 mb-2">Document Received!</h1>
            <p class="text-gray-500 text-sm mb-6">
                Thank you, <strong><?= htmlspecialchars($info['recipient_name'] ?? 'User') ?></strong>.<br>
                You have successfully acknowledged receipt of:
            </p>
            <div class="bg-gray-50 border rounded-xl px-5 py-4 mb-6 text-left">
                <p class="text-xs text-gray-400 uppercase mb-1">Document Type</p>
                <p class="font-bold text-gray-800"><?= htmlspecialchars($doc_label) ?></p>
            </div>
            <p class="text-xs text-gray-400">
                This document has been marked as
                <span class="text-green-600 font-semibold">Received</span>.
            </p>
            <a href="pages/inbox.php" class="inline-block mt-6 bg-red-700 text-white px-6 py-3 rounded-lg hover:bg-red-800">
                Go to Inbox
            </a>

        <?php elseif ($state === 'already'): ?>
            <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-5">
                <svg class="w-8 h-8 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M12 2a10 10 0 100 20A10 10 0 0012 2z"/>
                </svg>
            </div>
            <h1 class="text-xl font-bold text-gray-800 mb-2">Already Acknowledged</h1>
            <p class="text-gray-500 text-sm mb-6">
                <strong><?= htmlspecialchars($info['recipient_name'] ?? 'User') ?></strong>,
                you have already confirmed receipt of this document.
            </p>
            <a href="pages/inbox.php" class="inline-block bg-red-700 text-white px-6 py-3 rounded-lg hover:bg-red-800">
                Go to Inbox
            </a>

        <?php else: ?>
            <div class="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-5">
                <svg class="w-8 h-8 text-red-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
            </div>
            <h1 class="text-xl font-bold text-gray-800 mb-2">Invalid Link</h1>
            <p class="text-gray-500 text-sm">
                This acknowledgement link is invalid or has expired.
            </p>
            <?php if (isset($error_message)): ?>
            <p class="text-xs text-red-500 mt-2"><?= htmlspecialchars($error_message) ?></p>
            <?php endif; ?>
        <?php endif; ?>
    </div>

</body>
</html>