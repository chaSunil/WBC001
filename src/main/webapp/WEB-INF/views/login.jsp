<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WBC 관리자 로그인</title>
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="/images/wbclogotab.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/wbclogotab.png">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'GmarketSansMedium', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)), url('/images/배경.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            max-width: 400px;
            width: 90%;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .login-title {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            padding: 12px 20px;
            margin-bottom: 20px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: #1a237e;
            box-shadow: none;
            color: #fff;
        }

        .btn-login {
            background: #1a237e;
            color: #fff;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: #283593;
        }

        .home-link {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .home-link:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1 class="login-title">WBC 관리자</h1>
        <form action="/login" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="username" placeholder="아이디" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
            </div>
            <button type="submit" class="btn btn-login">로그인</button>
        </form>
        <a href="/" class="home-link">
            <i class="fas fa-home me-2"></i>메인페이지로 돌아가기
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>