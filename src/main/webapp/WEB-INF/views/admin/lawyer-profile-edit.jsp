<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>변호사 프로필 관리</title>
    
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

        /* 사이드바 스타일 */
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
            z-index: 100;
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

        /* 폼 그리드 레이아웃 */
        .form-grid {
            display: grid;
            grid-template-areas: 
                "basic profile"
                "greeting greeting"
                "signature signature";
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
        }

        .form-section.basic-info { grid-area: basic; }
        .form-section.profile-image { grid-area: profile; }
        .form-section.greeting { grid-area: greeting; }
        .form-section.signature { 
            grid-area: signature;
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 2rem;
            align-items: start;
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

        /* 경력 섹션 */
        .career-section {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .career-item {
            background: white;
            border-radius: 0.5rem;
            padding: 1rem;
            margin-bottom: 1rem;
            border: 1px solid #e5e7eb;
            transition: all 0.2s;
        }

        .career-grid {
            display: grid;
            grid-template-columns: 1fr 1fr auto;
            gap: 1rem;
            align-items: center;
        }

        /* 버튼 스타일 */
        .btn-row {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-primary {
            background: #2563eb;
            border: none;
        }

        .btn-add-career {
            background: #2563eb;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .btn-remove-career {
            background: #ef4444;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
        }

        /* 모바일 메뉴 토글 */
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

        /* 모바일 대응 */
        @media (max-width: 768px) {
            body {
                padding-left: 0;
            }

            .menu-toggle {
                display: block;
            }

            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                padding-top: 4rem;
            }

            .form-grid {
                grid-template-areas: 
                    "basic"
                    "profile"
                    "greeting"
                    "signature";
                grid-template-columns: 1fr;
            }

            .form-section.signature {
                grid-template-columns: 1fr;
            }

            .career-grid {
                grid-template-columns: 1fr;
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
            <a href="/admin/hero-section">
                <i class="fas fa-image"></i>
                <span>메인화면</span>
            </a>
            <a href="/admin/lawyer-profile" class="active">
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

    <main class="main-content">
        <div class="page-header">
            <h1>변호사 프로필 관리</h1>
        </div>

        <div class="content-card">
            <form action="/admin/lawyer-profile" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${profile.id}">

                <div class="mb-4">
                    <img src="/images/변호사 소개 가이드.png" alt="변호사 소개 가이드" 
                         style="width: 100%; max-width: 1200px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
                </div>

                <div class="form-grid">
                    <!-- 기본 정보 섹션 -->
                    <div class="form-section basic-info">
                        <h3>기본 정보</h3>
                        <div class="mb-3">
                            <label>이름</label>
                            <input type="text" name="name" value="${profile.name}" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>부제목 1</label>
                            <input type="text" name="subtitle1" value="${profile.subtitle1}" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>부제목 2</label>
                            <input type="text" name="subtitle2" value="${profile.subtitle2}" class="form-control">
                        </div>
                    </div>

                    <!-- 프로필 이미지 섹션 -->
                    <div class="form-section profile-image">
                        <h3>프로필 이미지</h3>
                        <div class="image-upload">
                            <input type="file" name="profileImage" class="form-control" accept="image/*" 
                                   onchange="previewImage(this, 'profilePreview')">
                            <img src="${profile.profileImage}" class="preview-image" id="profilePreview">
                        </div>
                    </div>

                    <!-- 인사말 섹션 -->
                    <div class="form-section greeting">
                        <h3>인사말</h3>
                        <textarea name="greetingContent" class="form-control" 
                                style="min-height: 300px;">${fn:replace(profile.greetingContent, '<br>', '
')}</textarea>
                    </div>

                    <!-- 서명 섹션 -->
                    <div class="form-section signature">
                        <div class="signature-image">
                            <h3>서명</h3>
                            <div class="image-upload">
                                <label>서명 이미지</label>
                                <input type="file" name="signatureImage" class="form-control" accept="image/*" 
                                       onchange="previewImage(this, 'signaturePreview')">
                                <img src="${profile.signatureImage}" class="preview-image" id="signaturePreview">
                            </div>
                        </div>
                        <div class="signature-name">
                            <h3>서명 정보</h3>
                            <div class="mb-3">
                                <label>서명 이름</label>
                                <input type="text" name="signatureName" value="${profile.signatureName}" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 경력 사항 섹션 -->
                <div class="career-section">
                    <h3>경력 사항</h3>
                    <div id="careers-container">
                        <c:forEach items="${profile.careers}" var="career" varStatus="status">
                            <div class="career-item">
                                <div class="career-grid">
                                    <input type="text" name="careers" 
                                           value="${career.careerTitle}" class="form-control" 
                                           placeholder="경력 제목" required>
                                    <input type="text" name="careers" 
                                           value="${career.period}" class="form-control" 
                                           placeholder="기간" required>
                                    <button type="button" class="btn-remove-career" onclick="removeCareer(this)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                    <input type="hidden" name="careers[${status.index}].id" value="${career.id}">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <button type="button" class="btn-add-career" onclick="addCareer()">
                        <i class="fas fa-plus"></i> 경력 추가
                    </button>
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

        function addCareer() {
            const container = document.getElementById('careers-container');
            const currentCareers = container.getElementsByClassName('career-item');
            
            if (currentCareers.length >= 4) {
                alert('경력은 최대 4개까지만 등록 가능합니다.');
                return;
            }
            
            const careerHtml = `
                <div class="career-item">
                    <div class="career-grid">
                        <input type="text" name="careers" class="form-control" 
                               placeholder="경력 제목" required>
                        <input type="text" name="careers" class="form-control" 
                               placeholder="기간" required>
                        <button type="button" class="btn-remove-career" onclick="removeCareer(this)">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
            `;
            
            container.insertAdjacentHTML('beforeend', careerHtml);
        }

        function removeCareer(button) {
            button.closest('.career-item').remove();
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