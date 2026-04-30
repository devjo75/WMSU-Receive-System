<?php
session_start();
require_once '../config/db.php';

$pdo = getPDO();

$query = $_GET['q'] ?? '';
$results = [];

if (strlen($query) >= 2) {
    $stmt = $pdo->prepare("
        SELECT id, full_name as name, department, role 
        FROM users 
        WHERE is_active = 1 
        AND (full_name LIKE ? OR email LIKE ?)
        LIMIT 10
    ");
    $searchTerm = "%{$query}%";
    $stmt->execute([$searchTerm, $searchTerm]);
    $results = $stmt->fetchAll();
}

header('Content-Type: application/json');
echo json_encode($results);
?>