<?php
session_start();
require_once '../config/db.php';

header('Content-Type: application/json');

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['error' => 'Unauthorized']);
    exit;
}

$pdo = getPDO();

$document_type = $_GET['document_type'] ?? '';
$document_id = $_GET['document_id'] ?? 0;

if (!$document_type || !$document_id) {
    echo json_encode(['error' => 'Missing parameters']);
    exit;
}

try {
    $stmt = $pdo->prepare("
        SELECT 
            recipient_name,
            recipient_email,
            status,
            feedback,
            received_at,
            DATE_FORMAT(received_at, '%M %d, %Y at %h:%i %p') as formatted_received_at
        FROM document_recipients
        WHERE document_type = ? AND document_id = ?
        ORDER BY 
            CASE WHEN status = 'Received' THEN 0 ELSE 1 END,
            received_at DESC
    ");
    $stmt->execute([$document_type, $document_id]);
    $recipients = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($recipients);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>