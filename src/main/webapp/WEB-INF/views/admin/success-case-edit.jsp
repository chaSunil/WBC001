<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성공사례 관리</title>
    
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

        .nav-links a.home-btn {
            background: #22c55e !important;
        }

        .nav-links a.active {
            background: #1a237e;
        }

        .case-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
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

        .case-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
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

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav-links">
            <a href="/" class="home-btn"><i class="fas fa-home"></i> 메인페이지</a>
            <a href="/admin/hero-section">히어로 섹션</a>
            <a href="/admin/about-section">프로필 섹션</a>
            <a href="/admin/video-section">비디오 섹션</a>
            <a href="/admin/success-cases" class="active">성공사례 섹션</a>
            <a href="/admin/reviews">고객후기 섹션</a>
            <a href="/admin/legal-guides">법률가이드 섹션</a>
        </div>

        <h2 class="text-center mb-4">성공사례 관리</h2>

        <!-- 새 성공사례 추가 버튼 -->
        <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addCaseModal">
            새 성공사례 추가
        </button>

        <!-- 기존 성공사례 목록 -->
        <c:forEach items="${successCases}" var="successCase">
            <div class="case-card">
                <form action="/admin/success-cases/success-cases" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${successCase.id}">
                    <input type="hidden" name="imageUrl" value="${successCase.imageUrl}">
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>사례 이미지</label>
                                <img src="${successCase.imageUrl}" class="case-image" id="preview${successCase.id}">
                                <input type="file" name="imageFile" class="form-control mt-2" 
                                       accept="image/*" onchange="previewImage(this, 'preview${successCase.id}')">
                            </div>
                        </div>
                        
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>카테고리 (쉼표로 구분)</label>
                                <input type="text" name="categoriesString" value="${successCase.categoriesString}" 
                                       class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>제목</label>
                                <input type="text" name="title" value="${successCase.title}" 
                                       class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea name="content" class="form-control" rows="4" required>${successCase.content}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>결과 제목</label>
                                        <input type="text" name="resultTitle" value="${successCase.resultTitle}" 
                                               class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>결과 내용</label>
                                        <input type="text" name="resultContent" value="${successCase.resultContent}" 
                                               class="form-control" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row align-items-center mt-3">
                                <div class="col-auto">
                                    <div class="form-group mb-0">
                                        <label>표시 순서</label>
                                        <input type="number" name="displayOrder" value="${successCase.displayOrder}" 
                                               class="form-control" style="width: 80px" min="1">
                                    </div>
                                </div>
                                
                                <div class="col-auto">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="checkbox" name="isActive" 
                                               value="true" ${successCase.isActive ? 'checked' : ''}>
                                        <label class="form-check-label">화면에 표시하기</label>
                                    </div>
                                </div>
                                
                                <div class="col text-end">
                                    <button type="submit" class="btn btn-primary">저장</button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="deleteCase(${successCase.id})">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const addCaseForm = document.querySelector('#addCaseModal form');
            const currentCaseCount = ${successCases.size()}; 
            
            // 표시 순서 입력 제한
            const displayOrderInputs = document.querySelectorAll('input[name="displayOrder"]');
            displayOrderInputs.forEach(input => {
                input.addEventListener('change', function() {
                    const value = parseInt(this.value);
                    if (value > currentCaseCount) {
                        alert(`표시 순서는 1부터 ${currentCaseCount}까지만 입력 가능합니다.`);
                        this.value = Math.min(value, currentCaseCount);
                    }
                });
            });

            // 최대 6개 제한
            if (addCaseForm) {
                addCaseForm.addEventListener('submit', function(e) {
                    if (currentCaseCount >= 6) {
                        e.preventDefault();
                        alert('최대 6개의 성공사례만 등록할 수 있습니다.');
                        return false;
                    }
                });
            }
        });

        function deleteCase(id) {
            if (confirm('이 성공사례를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/success-cases/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

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