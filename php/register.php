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

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if ($email == '' || $password == '') {
    echo "Missing email or password";
    exit;
}

$sql = "INSERT INTO users (email, password)
        VALUES ('$email', '$password')";

if ($conn->query($sql)) {
    echo "success";
} else {
    echo "error";
}
?>