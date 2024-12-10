<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지 상단 관리</title>
    
    <link rel="icon" type="image/png" sizes="32x32" href="/images/wbclogotab.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        @import url('https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css');

        :root {
            --sidebar-width: 280px;
        }

        body {
            font-family: 'Pretendard', sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding-left: var(--sidebar-width);
        }

        /* 사이드바 */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: var(--sidebar-width);
            height: 100vh;
            background: #fff;
            border-right: 1px solid #e5e7eb;
            padding: 2rem;
            overflow-y: auto;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e5e7eb;
        }

        .sidebar-logo img {
            width: 40px;
            height: 40px;
        }

        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .nav-links a {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            color: #4b5563;
            text-decoration: none;
            border-radius: 0.5rem;
            transition: all 0.2s;
        }

        .nav-links a:hover {
            background: #f3f4f6;
        }

        .nav-links a.active {
            background: #2563eb;
            color: white;
        }

        /* 메인 컨텐츠 */
        .main-content {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .content-card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        /* 폼 스타일링 */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .form-section {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
        }

        .form-control {
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            padding: 0.75rem;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        /* 이미지 업로드 */
        .image-upload {
            position: relative;
            background: #f8fafc;
            border: 2px dashed #e5e7eb;
            border-radius: 0.75rem;
            padding: 2rem;
            text-align: center;
            transition: all 0.2s;
        }

        .image-upload:hover {
            border-color: #2563eb;
        }

        .preview-image {
            max-width: 100%;
            border-radius: 0.5rem;
            margin-top: 1rem;
        }

        /* 버튼 */
        .btn-row {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
        }

        .btn-primary {
            background: #2563eb;
            color: white;
            border: none;
        }

        .btn-secondary {
            background: #f3f4f6;
            color: #4b5563;
            border: 1px solid #e5e7eb;
        }

        @media (max-width: 768px) {
            body {
                padding-left: 0;
            }

            .sidebar {
                transform: translateX(-100%);
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        /* 모바일 메뉴 토글 버튼 */
        .menu-toggle {
            display: none;
            position: fixed;
            top: 1rem;
            left: 1rem;
            z-index: 1000;
            background: #2563eb;
            color: white;
            border: none;
            padding: 0.5rem;
            border-radius: 0.5rem;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }

            .sidebar {
                transform: translateX(-100%);
                z-index: 999;
                transition: transform 0.3s ease;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            body {
                padding-left: 0;
            }

            .main-content {
                padding-top: 4rem;  /* 토글 버튼 공간 확보 */
            }
        }
    </style>
</head>
<body>

    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <!-- 사이드바 -->
    <div class="sidebar">
        <div class="sidebar-logo">
            <img src="/images/wbclogotab.png" alt="로고">
            <h2>관리자 패널</h2>
        </div>
        <nav class="nav-links">
            <a href="/" class="home-btn">
                <i class="fas fa-home"></i>
                <span>메인페이지</span>
            </a>
            <a href="/admin/hero-section" class="active">
                <i class="fas fa-image"></i>
                <span>메인화면</span>
            </a>
            <a href="/admin/lawyer-profile">
                <i class="fas fa-user"></i>
                <span>프로필 섹션</span>
            </a>
            <a href="/admin/video-section">
                <i class="fas fa-video"></i>
                <span>비디오 섹션</span>
            </a>
            <a href="/admin/success-cases">
                <i class="fas fa-trophy"></i>
                <span>성공사례 섹션</span>
            </a>
            <a href="/admin/reviews">
                <i class="fas fa-star"></i>
                <span>고객후기 섹션</span>
            </a>
            <a href="/admin/legal-guides">
                <i class="fas fa-book"></i>
                <span>법률가이드 섹션</span>
            </a>
            <a href="/admin/careers">
                <i class="fas fa-briefcase"></i>
                <span>경력 관리</span>
            </a>
        </nav>
    </div>

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <div class="page-header">
            <h1>메인화면 수정</h1>
            <button type="button" class="btn btn-secondary" onclick="location.href='/admin/hero-section/reset'">
                <i class="fas fa-undo"></i> 기본값으로 초기화
            </button>
        </div>

        <div class="content-card">
            <form action="/admin/hero-section" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${heroSection.id}">

                <div class="mb-4">
                    <img src="/images/메인화면 가이드.png" alt="메인화면 가이드" 
                         style="width: 100%; 
                                max-width: 1200px;
                                border-radius: 10px; 
                                box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
                </div> 
                
                <div class="form-grid">
                    <!-- 기본 정보 섹션 -->
                    <div class="form-section">
                        <h3>기본 정보</h3>
                        <div class="mb-3">
                            <label for="lawyerName" class="form-label">변호사 이름</label>
                            <input type="text" class="form-control" id="lawyerName" 
                                   name="lawyerName" value="${heroSection.lawyerName}" required>
                        </div>
                        <div class="mb-3">
                            <label for="subtitle" class="form-label">서브타이틀</label>
                            <input type="text" class="form-control" id="subtitle" 
                                   name="subtitle" value='${heroSection.subtitle}' required>
                        </div>
                    </div>

                    <!-- 프로필 이미지 섹션 -->
                    <div class="form-section">
                        <h3>프로필 이미지</h3>
                        <div class="image-upload">
                            <input type="file" class="form-control" id="profileImage" 
                                   name="profileImage" accept="image/*" onchange="previewImage(this, 'profilePreview')">
                            <img src="${heroSection.profileImage}" alt="현재 프로필 이미지" 
                                 id="profilePreview" class="preview-image">
                        </div>
                    </div>

                    <!-- 로고 섹션 -->
                    <div class="form-section">
                        <h3>대학 & 회사 로고</h3>
                        <div class="image-upload mb-3">
                            <label for="universityLogo">대학 로고</label>
                            <input type="file" class="form-control" id="universityLogo" 
                                   name="universityLogo" accept="image/*" onchange="previewImage(this, 'universityPreview')">
                            <img src="${heroSection.universityLogo}" alt="현재 대학 로고" 
                                 id="universityPreview" class="preview-image">
                        </div>
                        <div class="image-upload">
                            <label for="companyLogo">회사 로고</label>
                            <input type="file" class="form-control" id="companyLogo" 
                                   name="companyLogo" accept="image/*" onchange="previewImage(this, 'companyPreview')">
                            <img src="${heroSection.companyLogo}" alt="현재 회사 로고" 
                                 id="companyPreview" class="preview-image">
                        </div>
                    </div>
                </div>

                <div class="btn-row">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> 저장하기
                    </button>
                </div>
            </form>
        </div>
    </main>

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

    // 사이드바 토글 기능
    const menuToggle = document.getElementById('menuToggle');
    const sidebar = document.querySelector('.sidebar');
    const mainContent = document.querySelector('.main-content');

    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('active');
    });

    // 메인 컨텐츠 클릭시 사이드바 닫기
    mainContent.addEventListener('click', () => {
        if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
            sidebar.classList.remove('active');
        }
    });

    // 화면 크기 변경 시 사이드바 상태 초기화
    window.addEventListener('resize', () => {
        if (window.innerWidth > 768) {
            sidebar.classList.remove('active');
        }
    });
    </script>
</body>
</html>