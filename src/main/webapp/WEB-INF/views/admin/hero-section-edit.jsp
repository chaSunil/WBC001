<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>히어로 섹션 관리</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'GmarketSansMedium', sans-serif;
            background: linear-gradient(to right, #333333, #666666);
            color: #fff;
            min-height: 100vh;
            padding: 50px 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            max-width: 1200px;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(255, 255, 255, 0.1);
            padding: 5px;
            border-radius: 30px;
            margin-bottom: 30px;
            gap: 5px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            padding: 8px 20px;
            border-radius: 25px;
            flex: 1;
            text-align: center;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .nav-links a:not(.home-btn) {
            background: transparent;
        }

        .nav-links a:not(.home-btn):hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .nav-links a.active {
            background: #1a237e;
        }

        h2 {
            color: #fff;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5rem;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
            color: #fff;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        label {
            color: #fff;
            margin-bottom: 10px;
            font-size: 1.1rem;
        }

        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #1a237e;
            border: none;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .btn-warning {
            background-color: #ff9800;
            border: none;
            color: white;
        }

        .btn-warning:hover {
            background-color: #f57c00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        hr {
            border-color: rgba(255, 255, 255, 0.1);
            margin: 40px 0;
        }

        .img-thumbnail {
            max-width: 200px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: 10px;
        }

        .current-image {
            margin: 10px 0;
            text-align: center;
            background: rgba(255, 255, 255, 0.05);
            padding: 10px;
            border-radius: 5px;
        }

        .current-image img {
            max-width: 200px;
            height: auto;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        input[type="file"] {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            padding: 8px;
        }

        input[type="file"]::-webkit-file-upload-button {
            background: #1a237e;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .home-btn {
            background: #22c55e !important;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-width: 120px;
        }
        
        .home-btn:hover {
            background: #16a34a !important;
        }
        
        .home-btn i {
            font-size: 1.1rem;
        }

        @media (max-width: 768px) {
            .nav-links {
                flex-wrap: wrap;
                gap: 8px;
                padding: 8px;
            }
            
            .nav-links a {
                min-width: calc(50% - 4px);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav-links">
            <a href="/" class="home-btn"><i class="fas fa-home"></i> 메인페이지</a>
            <a href="/admin/hero-section" class="active">히어로 섹션</a>
            <a href="/admin/about-section">프로필 섹션</a>
            <a href="/admin/video-section">비디오 섹션</a>
            <a href="/admin/success-cases">성공사례 섹션</a>
            <a href="/admin/reviews">고객후기 섹션</a>
            <a href="/admin/legal-guides">법률가이드 섹션</a>
        </div>

        <h2>히어로 섹션 수정</h2>

        <div class="mb-4">
            <img src="/images/hero-guide.png" alt="히어로 섹션 가이드" 
                 style="width: 100%; 
                        max-width: 1200px;
                        border-radius: 10px; 
                        box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        </div>        
        
        <form action="/admin/hero-section/reset" method="post" style="text-align: center; margin-bottom: 30px;">
            <button type="submit" class="btn btn-warning" 
                    onclick="return confirm('기본값으로 되돌리시겠습니까?')">
                기본값으로 초기화
            </button>
        </form>
        
        <form action="/admin/hero-section" method="post">
            <input type="hidden" name="id" value="${heroSection.id}">
            
            <div class="form-group">
                <label>메인 타이틀</label>
                <input type="text" name="title" value="${heroSection.title}" 
                       class="form-control" placeholder="민사변호사 전문 50년 경력">
            </div>
            
            <div class="form-group">
                <label>서브타이틀 (첫째 줄)</label>
                <input type="text" name="subtitleLine1" value="${heroSection.subtitleLine1}" 
                       class="form-control" placeholder="&quot;내 일&quot;이라고 생각하고">
            </div>
            
            <div class="form-group">
                <label>서브타이틀 (둘째 줄)</label>
                <input type="text" name="subtitleLine2" value="${heroSection.subtitleLine2}" 
                       class="form-control" placeholder="&quot;내 일&quot;처럼 하겠습니다.">
            </div>
            
            <div class="form-group">
                <label>변호사 이름</label>
                <input type="text" name="lawyerName" value="${heroSection.lawyerName}" 
                       class="form-control" placeholder="강진태 변호사">
            </div>
            
            <button type="submit" class="btn btn-primary">텍스트 저장</button>
        </form>
        
        <hr>
        
        <form action="/admin/hero-section/images" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${heroSection.id}">
            
            <div class="form-group">
                <label>프로필 이미지</label>
                <div class="current-image">
                    <img src="${heroSection.profileImage}" alt="현재 프로필 이미지" 
                         class="img-thumbnail mt-2" id="profilePreview">
                </div>
                <input type="file" name="profileImage" class="form-control mt-2" 
                       accept="image/*" onchange="previewImage(this, 'profilePreview')">
            </div>
            
            <div class="form-group">
                <label>대학 로고</label>
                <div class="current-image">
                    <img src="${heroSection.universityLogo}" alt="현재 대학 로고" 
                         class="img-thumbnail mt-2" id="universityPreview">
                </div>
                <input type="file" name="universityLogo" class="form-control mt-2" 
                       accept="image/*" onchange="previewImage(this, 'universityPreview')">
            </div>
            
            <div class="form-group">
                <label>회사 로고</label>
                <div class="current-image">
                    <img src="${heroSection.companyLogo}" alt="현재 회사 로고" 
                         class="img-thumbnail mt-2" id="companyPreview">
                </div>
                <input type="file" name="companyLogo" class="form-control mt-2" 
                       accept="image/*" onchange="previewImage(this, 'companyPreview')">
            </div>
            
            <button type="submit" class="btn btn-primary">이미지 저장</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function previewImage(input, previewId) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                document.getElementById(previewId).src = e.target.result;
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    </script>
</body>
</html>
