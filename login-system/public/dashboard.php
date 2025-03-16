<?php
session_start();

// Oturum kontrolü
if (!isset($_SESSION['user_id'])) {
    header('Location: index.html');
    exit;
}

require_once '../config/database.php';

// Kullanıcı bilgilerini veritabanından çekelim
try {
    $stmt = $pdo->prepare("SELECT name, surname, username, mail FROM users WHERE id = ?");
    $stmt->execute([$_SESSION['user_id']]);
    $user = $stmt->fetch();
} catch(PDOException $e) {
    die("Veritabanı hatası: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoş Geldiniz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f0f2f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }
        .welcome-text {
            font-size: 24px;
            color: #1877f2;
        }
        .user-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .logout-btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="welcome-text">
                Hoş Geldiniz, <?php echo htmlspecialchars($user['name'] . ' ' . $user['surname']); ?>!
            </div>
            <a href="logout.php" class="logout-btn">Çıkış Yap</a>
        </div>
        
        <div class="user-info">
            <h3>Kullanıcı Bilgileriniz:</h3>
            <p><strong>Kullanıcı Adı:</strong> <?php echo htmlspecialchars($user['username']); ?></p>
            <p><strong>E-posta:</strong> <?php echo htmlspecialchars($user['mail']); ?></p>
        </div>
    </div>
</body>
</html>