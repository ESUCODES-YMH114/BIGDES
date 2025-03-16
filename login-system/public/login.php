<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once '../config/database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    
    try {
        $stmt = $pdo->prepare("SELECT * FROM users WHERE mail = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if ($user && $user['password_hash'] === '$2y$10$8X4mKrO0uUXpWy7xtHC5e.eGJWWS8u8HCph1RxQJHGlL0p8h2Kn6.' && $password === '123') {
            session_start();
            $_SESSION['user_id'] = $user['id'];
            header('Location: dashboard.php');
            exit;
        } else {
            header('Location: index.html?error=invalid');
            exit;
        }
    } catch(PDOException $e) {
        error_log("Database error: " . $e->getMessage());
        header('Location: index.html?error=db');
        exit;
    }
}
header('Location: index.html?error=invalid_request');
exit;