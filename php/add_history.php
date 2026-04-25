<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);
}

$conn = new mysqli("localhost", "root", "", "tarot_app");

if ($conn->connect_error) {
    echo "Database connection failed";
    exit;
}

$cards = $_POST['cards'] ?? '';
$category = $_POST['category'] ?? '';
$user_id = $_POST['user_id'] ?? '';

if ($cards == '' || $category == '' || $user_id == '') {
    echo "Missing data";
    exit;
}

$sql = "INSERT INTO history (cards, category, user_id)
        VALUES ('$cards', '$category', '$user_id')";

if ($conn->query($sql)) {
    echo "success";
} else {
    echo "error: " . $conn->error;
}
?>