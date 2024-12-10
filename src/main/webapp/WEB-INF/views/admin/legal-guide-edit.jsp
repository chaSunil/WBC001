<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>법률가이드 관리</title>
    
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

        /* 가이드 카드 스타일 */
        .guide-card {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #e5e7eb;
        }

        /* 폼 컨트롤 */
        .form-control {
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            padding: 0.75rem;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        /* 버튼 스타일 */
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
        }

        .btn-primary {
            background: #2563eb;
            border: none;
        }

        .btn-primary:hover {
            background: #1d4ed8;
        }

        .btn-danger {
            background: #dc2626;
            border: none;
        }

        .btn-danger:hover {
            background: #b91c1c;
        }

        /* 모달 스타일 */
        .modal-content {
            border-radius: 1rem;
            border: none;
            background: white;
        }

        .modal-header {
            border-bottom: 1px solid #e5e7eb;
            padding: 1.5rem;
        }

        .modal-body {
            padding: 1.5rem;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            body {
                padding-left: 0;
            }

            .sidebar {
                transform: translateX(-100%);
                z-index: 999;
                transition: transform 0.3s ease;
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .menu-toggle {
                display: block;
            }

            .main-content {
                padding-top: 4rem;
            }
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

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
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
            <a href="/admin/legal-guides" class="active">
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
            <h1>법률가이드 관리</h1>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addGuideModal">
                <i class="fas fa-plus"></i> 새 가이드 추가
            </button>
        </div>

        <div class="content-card">
            <div class="mb-4">
                <img src="/images/법률 가이드.png" alt="법률 가이드" 
                     style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
            </div>

            <!-- 기존 가이드 목록 -->
            <c:forEach items="${legalGuides}" var="guide">
                <div class="guide-card">
                    <form action="/admin/legal-guides" method="post">
                        <input type="hidden" name="id" value="${guide.id}">
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label>카테고리</label>
                                    <input type="text" name="category" value="${guide.category}" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>제목</label>
                                    <input type="text" name="title" value="${guide.title}" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>내용</label>
                                    <textarea name="content" class="form-control" rows="4" required>${guide.content}</textarea>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label>출처</label>
                                    <input type="text" name="source" value="${guide.source}" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>날짜</label>
                                    <input type="date" name="date" value="${guide.date}" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>링크</label>
                                    <input type="url" name="link" value="${guide.link}" class="form-control">
                                </div>

                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <div class="form-group">
                                            <label>표시 순서</label>
                                            <input type="number" name="displayOrder" value="${guide.displayOrder}" 
                                                   class="form-control" style="width: 80px" min="1" max="${legalGuides.size()}">
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="isHighlighted" 
                                                   value="true" ${guide.isHighlighted ? 'checked' : ''}>
                                            <label class="form-check-label">최상단 표시</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="isActive" 
                                                   value="true" ${guide.isActive ? 'checked' : ''}>
                                            <label class="form-check-label">활성화</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col text-end">
                                        <button type="submit" class="btn btn-primary">저장</button>
                                        <button type="button" class="btn btn-danger" 
                                                onclick="deleteGuide(${guide.id})">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>

    <!-- 새 법률가이드 추가 모달 -->
    <div class="modal fade" id="addGuideModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">새 법률가이드 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/legal-guides" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label>카테고리</label>
                                    <input type="text" name="category" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>제목</label>
                                    <input type="text" name="title" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>내용</label>
                                    <textarea name="content" class="form-control" rows="4" required></textarea>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group mb-3">
                                    <label>출처</label>
                                    <input type="text" name="source" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>날짜</label>
                                    <input type="date" name="date" class="form-control" required>
                                </div>

                                <div class="form-group mb-3">
                                    <label>링크</label>
                                    <input type="url" name="link" class="form-control">
                                </div>

                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <div class="form-group">
                                            <label>표시 순서</label>
                                            <input type="number" name="displayOrder" class="form-control" 
                                                   style="width: 80px" min="1" max="${legalGuides.size() + 1}" value="1">
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="isHighlighted" value="true">
                                            <label class="form-check-label">최상단 표시</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="isActive" value="true" checked>
                                            <label class="form-check-label">활성화</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-end mt-4">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">추가하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteGuide(id) {
            if (confirm('이 법률가이드를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/legal-guides/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

        // 사이드바 토글 기능
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.querySelector('.sidebar');
        const mainContent = document.querySelector('.main-content');

        menuToggle.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });

        mainContent.addEventListener('click', () => {
            if (window.innerWidth <= 768 && sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });

        window.addEventListener('resize', () => {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
            }
        });
    </script>
</body>
</html>