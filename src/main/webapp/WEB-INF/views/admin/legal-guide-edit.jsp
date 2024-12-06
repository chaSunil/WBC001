<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>법률가이드 관리</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
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

        .guide-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
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

        .btn {
            padding: 10px 25px;
            border-radius: 30px;
            font-size: 1rem;
            transition: all 0.3s ease;
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

        textarea.form-control {
            min-height: 120px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="nav-links mb-4">
            <a href="/" class="home-btn"><i class="fas fa-home"></i> 메인페이지</a>
            <a href="/admin/hero-section">히어로 섹션</a>
            <a href="/admin/about-section">프로필 섹션</a>
            <a href="/admin/video-section">비디오 섹션</a>
            <a href="/admin/success-cases">성공사례 섹션</a>
            <a href="/admin/reviews">고객후기 섹션</a>
            <a href="/admin/legal-guides" class="active">법률가이드 섹션</a>
        </div>

        <h2 class="text-center mb-4">법률가이드 관리</h2>

        <!-- 새 법률가이드 추가 버튼 -->
        <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addGuideModal">
            새 법률가이드 추가
        </button>

        <!-- 기존 법률가이드 목록 -->
        <c:forEach items="${legalGuides}" var="guide">
            <div class="guide-card">
                <form action="/admin/legal-guides" method="post">
                    <input type="hidden" name="id" value="${guide.id}">
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label>카테고리</label>
                                <input type="text" name="category" value="${guide.category}" 
                                       class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label>제목</label>
                                <input type="text" name="title" value="${guide.title}" 
                                       class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label>내용</label>
                                <textarea name="content" class="form-control" 
                                          rows="4" required>${guide.content}</textarea>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group mb-3">
                                <label>출처</label>
                                <input type="text" name="source" value="${guide.source}" 
                                       class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label>날짜</label>
                                <input type="date" name="date"
                                    value="${guide.date}" 
                                    class="form-control" required>
                            </div>

                            <div class="form-group mb-3">
                                <label>링크</label>
                                <input type="url" name="link" value="${guide.link}" 
                                       class="form-control" required>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <div class="form-group mb-0">
                                        <label>표시 순서</label>
                                        <input type="number" name="displayOrder" 
                                               value="${guide.displayOrder}" 
                                               class="form-control" style="width: 80px" min="1">
                                    </div>
                                </div>
                                
                                <div class="col-auto">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="checkbox" 
                                               name="isHighlighted" value="true" 
                                               ${guide.isHighlighted ? 'checked' : ''}>
                                        <label class="form-check-label">최상단 표시</label>
                                    </div>
                                </div>
                                
                                <div class="col-auto">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="checkbox" 
                                               name="isActive" value="true" 
                                               ${guide.isActive ? 'checked' : ''}>
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

    <!-- 새 법률가이드 추가 모달 -->
    <div class="modal fade" id="addGuideModal" tabindex="-1" aria-labelledby="addGuideModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="background: rgba(40, 40, 40, 0.95);">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title" id="addGuideModalLabel">새 법률가이드 추가</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
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
                                    <input type="url" name="link" class="form-control" required>
                                </div>

                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <div class="form-group mb-0">
                                            <label>표시 순서</label>
                                            <input type="number" name="displayOrder" 
                                                   class="form-control" style="width: 80px" min="1">
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check mb-0">
                                            <input class="form-check-input" type="checkbox" 
                                                   name="isHighlighted" value="true">
                                            <label class="form-check-label">최상단 표시</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-auto">
                                        <div class="form-check mb-0">
                                            <input class="form-check-input" type="checkbox" 
                                                   name="isActive" value="true" checked>
                                            <label class="form-check-label">활성화</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-end mt-3">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary">저장</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
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
    </script>
</body>
</html>