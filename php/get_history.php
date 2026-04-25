<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

$conn = new mysqli("localhost", "root", "", "tarot_app");

if ($conn->connect_error) {
    echo json_encode([]);
    exit;
}

$user_id = $_GET['user_id'] ?? '';

$sql = "SELECT * FROM history 
        WHERE user_id='$user_id' 
        ORDER BY id DESC";

$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>