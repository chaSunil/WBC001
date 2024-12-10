<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경력 관리</title>
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="/images/wbclogotab.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/wbclogotab.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/images/wbclogotab.png">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- CSRF 토큰 추가 -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
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
        }

        .career-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .career-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            padding: 12px 20px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
            color: #fff;
        }

        .category-header {
            background: rgba(0, 0, 0, 0.2);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .btn-add-career {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: #1a237e;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
        }

        .btn-add-career:hover {
            transform: scale(1.1);
            background: #283593;
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

        .modal-content {
            background: rgba(40, 40, 40, 0.95) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .modal-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .modal-footer {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-primary {
            background-color: #1a237e;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0d47a1;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }

        .category-header {
            background: rgba(0, 0, 0, 0.2);
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            backdrop-filter: blur(5px);
        }

        .form-check-input {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
        }

        .form-check-input:checked {
            background-color: #1a237e;
            border-color: #1a237e;
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

        h2 {
            color: #fff;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5rem;
        }

        /* 아이콘 선택기 스타일 */
        .icon-selector {
            position: relative;
        }

        .icon-preview {
            background: rgba(255, 255, 255, 0.05);
            padding: 10px;
            border-radius: 5px;
            margin: 10px 0;
            text-align: center;
        }

        .icon-preview i {
            font-size: 24px;
            color: #fff;
        }

        .icon-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 10px;
        }

        .icon-item {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .icon-item:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        .icon-item.selected {
            background: rgba(26, 35, 126, 0.5);
            border-color: #1a237e;
        }

        .icon-item i {
            font-size: 20px;
            color: #fff;
            margin-bottom: 5px;
            display: block;
        }

        .icon-item span {
            font-size: 12px;
            color: #fff;
            display: block;
        }

        /* 모달 내부 폼 요소 스타일 */
        #editCategoryModal .form-control,
        #addCategoryModal .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        #editCategoryModal .form-control:focus,
        #addCategoryModal .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
        }

        #editCategoryModal .form-label,
        #addCategoryModal .form-label {
            color: #fff;
            margin-bottom: 8px;
        }

        /* 아이콘 입력 필드 스타일 */
        #editIconInput,
        #iconInput {
            background: rgba(255, 255, 255, 0.05) !important;
            cursor: default;
        }

        .btn-outline-danger {
            color: #dc3545;
            border-color: #dc3545;
        }

        .btn-outline-danger:hover {
            color: #fff;
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .category-header .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            line-height: 1.5;
            border-radius: 0.2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 네비게이션 -->
        <div class="nav-links mb-4">
            <a href="/" class="home-btn"><i class="fas fa-home"></i> 메인페이지</a>
            <a href="/admin/hero-section">메인화면</a>
            <a href="/admin/lawyer-profile">프로필 섹션</a>
            <a href="/admin/video-section">비디오 섹션</a>
            <a href="/admin/success-cases">성공사례 섹션</a>
            <a href="/admin/reviews">고객후기 섹션</a>
            <a href="/admin/legal-guides">법률가이드 섹션</a>
            <a href="/admin/careers" class="active">경력 관리</a>
        </div>

        <h2 class="text-center mb-4">경력 관리</h2>
        
        <div class="mb-4">
            <img src="/images/경력 관리 가이드.png" alt="경력 관리 가이드" style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        </div>

        <!-- 새로운 미리보기 섹션 추가 -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card bg-dark text-white">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">실시간 미리보기</h5>
                    </div>
                    <div class="card-body">
                        <div id="previewArea" class="preview-container" style="background: rgba(255,255,255,0.05); padding: 20px; border-radius: 10px;">
                            <!-- 여기에 미리보기 내용이 동적으로 로드됨 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 카테고리별 경력 목록 -->
        <c:forEach items="${careersByCategory}" var="entry">
            <div class="category-section mb-5">
                <div class="category-header">
                    <div class="d-flex align-items-center justify-content-between">
                        <h3>
                            <i class="${entry.key.icon} me-2"></i>
                            <input type="text" class="form-control d-inline-block" 
                                   style="width: auto; background: transparent; border: none; color: white;"
                                   name="categoryTitle" value="${entry.key.name}" 
                                   onchange="updateCategory(this, '${entry.key.name}', '${entry.key.icon}')">
                            <button type="button" class="btn btn-sm btn-outline-light ms-2" 
                                    onclick="showEditCategoryModal('${entry.key.name}', '${entry.key.icon}')">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button type="button" class="btn btn-sm btn-outline-danger ms-2" 
                                    onclick="deleteCategory('${entry.key.id}')">
                                <i class="fas fa-trash"></i>
                            </button>
                        </h3>
                    </div>
                </div>

                <c:forEach items="${entry.value}" var="career">
                    <div class="career-card">
                        <form action="/admin/careers/${career.id}" method="post">
                            <div class="row g-3 align-items-center">
                                <div class="col-md-2">
                                    <select class="form-control" name="category.id" required>
                                        <c:forEach items="${categories}" var="cat">
                                            <option value="${cat.id}" ${career.category.id == cat.id ? 'selected' : ''}>
                                                ${cat.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" class="form-control" name="startYear" 
                                           value="${career.startYear}" placeholder="시작년도" required>
                                </div>
                                <div class="col-md-2">
                                    <input type="text" class="form-control" name="endYear" 
                                           value="${career.endYear}" placeholder="종료년도">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="organization" 
                                           value="${career.organization}" placeholder="기관명" required>
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" name="position" 
                                           value="${career.position}" placeholder="직위" required>
                                </div>
                                <div class="col-auto">
                                    <input type="number" class="form-control" name="displayOrder" 
                                           value="${career.displayOrder}" style="width: 80px" min="1">
                                </div>
                                <div class="col-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" 
                                               ${career.isActive ? 'checked disabled' : ''}
                                               onchange="toggleActive(${career.id}, this)">
                                        <label class="form-check-label">
                                            ${career.isActive ? '활성화 됨' : '활성화'}
                                        </label>
                                    </div>
                                </div>
                                <div class="col text-end">
                                    <button type="submit" class="btn btn-primary">저장</button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="deleteCareer(${career.id})">삭제</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>

        <!-- 새 카테고리 추가 버튼 -->
        <button type="button" class="btn btn-success mb-4" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
            <i class="fas fa-plus"></i> 새 카테고리
        </button>

        <!-- 새 경력 추가 버튼 -->
        <button type="button" class="btn-add-career" data-bs-toggle="modal" data-bs-target="#addCareerModal">
            <i class="fas fa-plus"></i>
        </button>

    </div>

    <!-- 새 카테고리 추가 모달 -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background: rgba(40, 40, 40, 0.95);">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title">새 카테고리 추가</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="categoryForm">
                        <div class="mb-3">
                            <label class="form-label">카테고리 이름</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">아이콘 선택</label>
                            <div class="icon-selector">
                                <input type="text" name="icon" class="form-control" id="iconInput" readonly>
                                <div class="icon-preview" id="iconPreview">
                                    <i class=""></i>
                                </div>
                                <div class="icon-list mt-2">
                                    <div class="icon-grid">
                                        <div class="icon-item" data-icon="fas fa-university">
                                            <i class="fas fa-university"></i>
                                            <span>대학교</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-gavel">
                                            <i class="fas fa-gavel"></i>
                                            <span>법률</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-graduation-cap">
                                            <i class="fas fa-graduation-cap"></i>
                                            <span>졸업</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-briefcase">
                                            <i class="fas fa-briefcase"></i>
                                            <span>경력</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-award">
                                            <i class="fas fa-award"></i>
                                            <span>수상</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-certificate">
                                            <i class="fas fa-certificate"></i>
                                            <span>자격증</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-user-graduate">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>학위</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-balance-scale">
                                            <i class="fas fa-balance-scale"></i>
                                            <span>정의</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" onclick="createCategory()">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 새 경력 추가 모달 -->
    <div class="modal fade" id="addCareerModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background: rgba(40, 40, 40, 0.95);">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title">새 경력 추가</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/careers" method="post">
                        <div class="mb-3">
                            <label class="form-label">카테고리</label>
                            <select name="category.id" class="form-control" required>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">시작년도</label>
                            <input type="text" name="startYear" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">종료년도</label>
                            <input type="text" name="endYear" class="form-control" placeholder="현재인 경우 비워두세요">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">기관명</label>
                            <input type="text" name="organization" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">직위</label>
                            <input type="text" name="position" class="form-control" required>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 카테고리 수정 모달 -->
    <div class="modal fade" id="editCategoryModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="background: rgba(40, 40, 40, 0.95);">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title">카테고리 수정</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editCategoryForm">
                        <input type="hidden" id="oldCategoryName">
                        <div class="mb-3">
                            <label class="form-label">카테고리 이름</label>
                            <input type="text" name="name" id="editCategoryName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">아이콘 선택</label>
                            <div class="icon-selector">
                                <input type="text" name="icon" class="form-control" id="editIconInput" readonly>
                                <div class="icon-preview" id="editIconPreview">
                                    <i class=""></i>
                                </div>
                                <div class="icon-list mt-2">
                                    <div class="icon-grid">
                                        <div class="icon-item" data-icon="fas fa-university">
                                            <i class="fas fa-university"></i>
                                            <span>대학교</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-gavel">
                                            <i class="fas fa-gavel"></i>
                                            <span>법률</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-graduation-cap">
                                            <i class="fas fa-graduation-cap"></i>
                                            <span>졸업</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-briefcase">
                                            <i class="fas fa-briefcase"></i>
                                            <span>경력</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-award">
                                            <i class="fas fa-award"></i>
                                            <span>수상</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-certificate">
                                            <i class="fas fa-certificate"></i>
                                            <span>자격증</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-user-graduate">
                                            <i class="fas fa-user-graduate"></i>
                                            <span>학위</span>
                                        </div>
                                        <div class="icon-item" data-icon="fas fa-balance-scale">
                                            <i class="fas fa-balance-scale"></i>
                                            <span>정의</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" onclick="updateCategory()">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function createCategory() {
            const form = document.getElementById('categoryForm');
            const formData = {
                name: form.name.value,
                icon: form.icon.value
            };

            fetch('/admin/careers/category', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (!response.ok) throw new Error('카테고리 생성 실패');
                return response.json();
            })
            .then(() => location.reload())
            .catch(error => alert('카테고리 생성 중 오류가 발생했습니다.'));
        }

        function deleteCategory(categoryId) {
            if (!confirm('정말 삭제하시겠습니까?')) return;
            
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '/admin/careers/category/delete/' + categoryId;
            document.body.appendChild(form);
            form.submit();
        }

        function toggleActive(id, checkbox) {
            fetch(`/admin/careers/${id}/toggle-active`, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(isActive => checkbox.checked = isActive)
            .catch(() => {
                alert('상태 변경 중 오류가 발생했습니다.');
                checkbox.checked = !checkbox.checked;
            });
        }

        function deleteCareer(id) {
            if (confirm('이 경력을 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/careers/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

        function updateCategory(input, oldTitle, currentIcon) {
            if (confirm('카테고리 이름을 변경하시겠습니까?')) {
                fetch('/admin/careers/category/update', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        oldTitle: oldTitle,
                        newTitle: input.value,
                        newIcon: currentIcon
                    })
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('카테고리 이름 변경 실패');
                    }
                    return response.json();
                })
                .then(data => {
                    location.reload();
                })
                .catch(error => {
                    alert('카테고리 이름 변경 중 오류가 발생했습니다.');
                    input.value = oldTitle;
                });
            } else {
                input.value = oldTitle;
            }
        }

        function updatePreview() {
            $.ajax({
                url: '/admin/careers/preview',
                method: 'GET',
                success: function(data) {
                    $('#previewArea').html(data);
                }
            });
        }

        // 폼 수정시 미리보기 업데이트
        $('form input, form textarea, form select').on('change', function() {
            const formData = new FormData($('form')[0]);
            $.ajax({
                url: '/admin/careers/preview',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    $('#previewArea').html(data);
                }
            });
        });

        // 초기 로딩시 미리보기 표시
        $(document).ready(function() {
            updatePreview();
        });

        function showEditCategoryModal(categoryName, currentIcon) {
            document.getElementById('oldCategoryName').value = categoryName;
            document.getElementById('editCategoryName').value = categoryName;
            document.getElementById('editIconInput').value = currentIcon;
            
            // 현재 아이콘 미리보기 설정
            const previewIcon = document.querySelector('#editIconPreview i');
            previewIcon.className = currentIcon;
            
            // 현재 선택된 아이콘 표시
            document.querySelectorAll('#editCategoryModal .icon-item').forEach(item => {
                if (item.dataset.icon === currentIcon) {
                    item.classList.add('selected');
                } else {
                    item.classList.remove('selected');
                }
            });
            
            new bootstrap.Modal(document.getElementById('editCategoryModal')).show();
        }

        function updateCategory() {
            const oldName = document.getElementById('oldCategoryName').value;
            const newName = document.getElementById('editCategoryName').value;
            const newIcon = document.getElementById('editIconInput').value;
            
            fetch('/admin/careers/category/update', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    oldTitle: oldName,
                    newTitle: newName,
                    newIcon: newIcon
                })
            })
            .then(response => {
                if (!response.ok) throw new Error('카테고리 수정 실패');
                return response.json();
            })
            .then(() => location.reload())
            .catch(error => alert('카테고리 수정 중 오류가 발생했습니다.'));
        }

        // 아이콘 선택 이벤트 리스너
        document.querySelectorAll('#editCategoryModal .icon-item').forEach(item => {
            item.addEventListener('click', function() {
                const iconClass = this.dataset.icon;
                document.getElementById('editIconInput').value = iconClass;
                
                // 선��된 아이콘 표시
                document.querySelectorAll('#editCategoryModal .icon-item').forEach(i => i.classList.remove('selected'));
                this.classList.add('selected');
                
                // 미리보기 업데이트
                const previewIcon = document.querySelector('#editIconPreview i');
                previewIcon.className = iconClass;
            });
        });

        // 새 카테고리 모달의 아이콘 선택 이벤트 리스너
        document.querySelectorAll('#addCategoryModal .icon-item').forEach(item => {
            item.addEventListener('click', function() {
                const iconClass = this.dataset.icon;
                document.getElementById('iconInput').value = iconClass;
                
                // 선택된 아이콘 표시
                document.querySelectorAll('#addCategoryModal .icon-item').forEach(i => i.classList.remove('selected'));
                this.classList.add('selected');
                
                // 미리보기 업데이트
                const previewIcon = document.querySelector('#iconPreview i');
                previewIcon.className = iconClass;
            });
        });

        // 모달이 열릴 때 초기화
        document.getElementById('addCategoryModal').addEventListener('show.bs.modal', function() {
            // 입력 필드 초기화
            document.getElementById('iconInput').value = '';
            document.getElementById('categoryForm').reset();
            
            // 선택된 아이콘 클래스 제거
            document.querySelectorAll('#addCategoryModal .icon-item').forEach(i => i.classList.remove('selected'));
            
            // 미리보기 초기화
            const previewIcon = document.querySelector('#iconPreview i');
            previewIcon.className = '';
        });
    </script>
</body>
</html> 