<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 관리</title>
    
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

        .faq-item {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 1rem;
        }

        .btn-row {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
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

        .btn-danger {
            background: #dc2626;
            color: white;
            border: none;
        }

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
            <a href="/admin/faqs" class="active">
                <i class="fas fa-question-circle"></i>
                <span>FAQ 관리</span>
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
            <h1>FAQ 관리</h1>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFaqModal">
                <i class="fas fa-plus"></i> 새 FAQ 추가
            </button>
        </div>

        <div class="content-card">
            <!-- FAQ 목록 -->
            <c:forEach items="${faqs}" var="faq">
                <div class="faq-item">
                    <form action="/admin/faqs" method="post">
                        <input type="hidden" name="id" value="${faq.id}">
                        <div class="mb-3">
                            <label class="form-label">질문</label>
                            <input type="text" class="form-control" name="question" value="${faq.question}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">답변</label>
                            <textarea class="form-control" name="answer" rows="3" required>${faq.answer}</textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">표시 순서</label>
                            <input type="number" class="form-control" name="displayOrder" value="${faq.displayOrder}" required>
                        </div>
                        <div class="btn-row">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> 저장
                            </button>
                            <button type="button" class="btn btn-danger" onclick="deleteFaq(${faq.id})">
                                <i class="fas fa-trash"></i> 삭제
                            </button>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>

    <!-- 새 FAQ 추가 모달 -->
    <div class="modal fade" id="addFaqModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">새 FAQ 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="/admin/faqs/new" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">질문</label>
                            <input type="text" class="form-control" name="question" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">답변</label>
                            <textarea class="form-control" name="answer" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">표시 순서</label>
                            <input type="number" class="form-control" name="displayOrder" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">추가</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteFaq(id) {
            if (confirm('정말로 이 FAQ를 삭제하시겠습니까?')) {
                const url = '/admin/faqs/delete/' + id;
                
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = url;
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