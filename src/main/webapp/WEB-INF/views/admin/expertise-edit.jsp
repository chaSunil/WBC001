<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전문분야 관리</title>
    
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

        .expertise-card {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .details-container {
            max-height: 500px;
            overflow-y: auto;
            padding-right: 10px;
        }

        .detail-card {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 1rem;
            border: 1px solid #e5e7eb;
            transition: all 0.2s;
        }

        .detail-card:hover {
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .icon-preview {
            width: 60px;
            height: 60px;
            object-fit: contain;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            padding: 4px;
        }

        .form-label {
            font-weight: 500;
            color: #4b5563;
            margin-bottom: 0.5rem;
        }

        .border-end {
            border-right: 1px solid #e5e7eb;
        }

        @media (max-width: 768px) {
            .border-end {
                border-right: none;
                border-bottom: 1px solid #e5e7eb;
                padding-bottom: 2rem;
                margin-bottom: 2rem;
            }
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
            <img src="/images/wbclogotab.png" alt="로고" style="width: 40px;">
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
            <a href="/admin/faqs">
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
            <a href="/admin/expertise" class="active">
                <i class="fas fa-briefcase"></i>
                <span>전문분야 관리</span>
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

    <!-- 메인 컨텐츠 부분만 수정 -->
    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>전문분야 관리</h2>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addExpertiseModal">
                <i class="fas fa-plus"></i> 새 전문분야 추가
            </button>
        </div>

        <c:forEach items="${expertiseList}" var="expertise">
            <div class="expertise-card">
                <form action="/admin/expertise" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${expertise.id}">
                    <input type="hidden" name="existingIconPath" value="${expertise.iconPath}">
                    
                    <div class="row g-4">
                        <!-- 왼쪽 섹션 -->
                        <div class="col-md-6 border-end">
                            <div class="d-flex align-items-start gap-3 mb-4">
                                <img src="${expertise.iconPath}" alt="아이콘" class="icon-preview">
                                <div class="flex-grow-1">
                                    <label class="form-label">아이콘 변경</label>
                                    <input type="file" name="iconFile" class="form-control" accept="image/*">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">분야명</label>
                                <input type="text" name="mainTitle" value="${expertise.mainTitle}" 
                                       class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">진행 사건 수</label>
                                <input type="number" name="caseCount" value="${expertise.caseCount}" 
                                       class="form-control">
                            </div>

                            <div class="d-flex align-items-center gap-4 mb-3">
                                <div>
                                    <label class="form-label">표시 순서</label>
                                    <input type="number" name="displayOrder" value="${expertise.displayOrder}" 
                                           class="form-control" style="width: 100px" min="1">
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" name="isActive" value="true" 
                                           class="form-check-input" ${expertise.isActive ? 'checked' : ''}>
                                    <label class="form-check-label">활성화</label>
                                </div>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">저장</button>
                                <button type="button" class="btn btn-danger" 
                                        onclick="deleteExpertise(${expertise.id})">삭제</button>
                            </div>
                        </div>

                        <!-- 오른쪽 섹션 - 세부분야 -->
                        <div class="col-md-6">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="mb-0">세부분야</h5>
                                <button type="button" class="btn btn-outline-primary btn-sm" 
                                        onclick="showAddDetailModal(${expertise.id})">
                                    <i class="fas fa-plus"></i> 세부분야 추가
                                </button>
                            </div>

                            <div class="details-container">
                                <c:forEach items="${expertise.details}" var="detail">
                                    <div class="detail-card">
                                        <form action="/admin/expertise/detail" method="post">
                                            <input type="hidden" name="id" value="${detail.id}">
                                            <input type="hidden" name="expertiseId" value="${expertise.id}">
                                            
                                            <div class="row g-3">
                                                <div class="col-md-5">
                                                    <label class="form-label">세부분야명</label>
                                                    <input type="text" name="subtitle" value="${detail.subtitle}" 
                                                           class="form-control" required>
                                                </div>
                                                
                                                <div class="col-md-5">
                                                    <label class="form-label">진행방향</label>
                                                    <input type="text" name="subtitle2" value="${detail.subtitle2}" 
                                                           class="form-control" required>
                                                </div>
                                                
                                                <div class="col-md-2">
                                                    <label class="form-label">순서</label>
                                                    <input type="number" name="displayOrder" value="${detail.displayOrder}" 
                                                           class="form-control" min="1">
                                                </div>
                                            </div>
                                            
                                            <div class="text-end mt-3">
                                                <button type="submit" class="btn btn-primary btn-sm">저장</button>
                                                <button type="button" class="btn btn-danger btn-sm" 
                                                        onclick="deleteDetail(${detail.id})">삭제</button>
                                            </div>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </main>

    <!-- 새 전문분야 추가 모달 -->
    <div class="modal fade" id="addExpertiseModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">새 전문분야 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/expertise" method="post" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label>아이콘</label>
                            <input type="file" name="iconFile" class="form-control" required accept="image/*">
                        </div>

                        <div class="form-group mb-3">
                            <label>분야명</label>
                            <input type="text" name="mainTitle" class="form-control" required>
                        </div>

                        <div class="form-group mb-3">
                            <label>진행 사건 수</label>
                            <input type="number" name="caseCount" class="form-control">
                        </div>

                        <div class="form-group mb-3">
                            <label>표시 순서</label>
                            <input type="number" name="displayOrder" class="form-control" 
                                   value="1" min="1">
                        </div>

                        <div class="form-check mb-3">
                            <input type="checkbox" name="isActive" value="true" 
                                   class="form-check-input" checked>
                            <label class="form-check-label">활성화</label>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" 
                                    data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">추가</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 세부분야 추가 모달 -->
    <div class="modal fade" id="addDetailModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">세부분야 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/expertise/detail" method="post">
                        <input type="hidden" name="expertiseId" id="detailExpertiseId">
                        
                        <div class="form-group mb-3">
                            <label>세부분야명</label>
                            <input type="text" name="subtitle" class="form-control" required>
                        </div>

                        <div class="form-group mb-3">
                            <label>진행방향</label>
                            <input type="text" name="subtitle2" class="form-control" required>
                        </div>

                        <div class="form-group mb-3">
                            <label>표시 순서</label>
                            <input type="number" name="displayOrder" class="form-control" 
                                   value="1" min="1">
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" 
                                    data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">추가</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function deleteExpertise(id) {
            if (confirm('이 전문분야를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/expertise/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

        function deleteDetail(id) {
            if (confirm('이 세부분야를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/expertise/detail/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

        function showAddDetailModal(expertiseId) {
            document.getElementById('detailExpertiseId').value = expertiseId;
            new bootstrap.Modal(document.getElementById('addDetailModal')).show();
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