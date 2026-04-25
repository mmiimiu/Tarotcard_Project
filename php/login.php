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
    echo "error";
    exit;
}

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

$sql = "SELECT * FROM users 
        WHERE email='$email' AND password='$password'
        LIMIT 1";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();

    echo json_encode([
        "id" => $user["id"],
        "email" => $user["email"],
        "name" => $user["email"]
    ]);
} else {
    echo "error";
}
?>