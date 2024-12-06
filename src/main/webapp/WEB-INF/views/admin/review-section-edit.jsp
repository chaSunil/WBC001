<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객후기 관리</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome 추가 -->
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

        h2 {
            color: #fff;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5rem;
        }

        .review-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
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

        .current-image {
            width: 100px;
            height: 100px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.1);
        }

        .current-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        textarea.form-control {
            min-height: 120px;
        }

        .order-control {
            width: 80px;
            text-align: center;
        }

        .form-check-input {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
        }

        .form-check-input:checked {
            background-color: #1a237e;
            border-color: #1a237e;
        }

        .preview-section {
            background: rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 15px;
            margin-top: 10px;
        }

        .preview-section h6 {
            color: #aaa;
            margin-bottom: 10px;
        }

        .profile-image-container {
            text-align: center;
        }

        .profile-image-container .current-image {
            width: 100px;
            height: 100px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.1);
        }

        .profile-image-container .current-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        .profile-image-container input[type="file"] {
            margin-top: 10px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
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
            <a href="/admin/success-cases">성공사례 섹션</a>
            <a href="/admin/reviews" class="active">고객후기 섹션</a>
            <a href="/admin/legal-guides">법률가이드 섹션</a>
        </div>

        <h2>고객후기 관리</h2>

        <div class="mb-4">
            <img src="/images/review-guide.jpg" alt="고객후기 가이드" style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        </div>

        <!-- 새 후기 추가 버튼 -->
        <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addReviewModal">
            새 후기 추가
        </button>

        <!-- 기존 후기 목록 -->
        <c:forEach items="${reviews}" var="review">
            <div class="review-card">
                <form action="/admin/reviews" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${review.id}">
                    <!-- 기존 이미지 경로를 hidden으로 유지 -->
                    <input type="hidden" name="profileImage" value="${review.profileImage}">
                    
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label>프로필 이미지</label>
                                <div class="profile-image-container">
                                    <div class="current-image mb-2">
                                        <img src="${review.profileImage}" alt="고객 프로필" id="preview${review.id}">
                                    </div>
                                    <input type="file" name="profileImageFile" class="form-control" 
                                           accept="image/*" onchange="previewImage(this, 'preview${review.id}')">
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>고객명</label>
                                        <input type="text" name="clientName" value="${review.clientName}" 
                                               class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>사건 유형</label>
                                        <input type="text" name="caseType" value="${review.caseType}" 
                                               class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>후기 날짜</label>
                                        <input type="text" name="reviewDate" value="${review.reviewDate}" 
                                               class="form-control" required placeholder="YYYY.MM.DD">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>전체 후기 내용</label>
                                <textarea name="content" class="form-control" rows="10" required 
                                          placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다. 특히 임대차보호법에 대한 깊은 이해를 바탕으로 법리 검토와 증거자료 수집 과정에서 세세한 부분까지 꼼꼼하게 챙겨주셨고, 법원 조정 과정에서도 임대인 측의 부당한 주장에 대해 명확한 반박과 함께 저희의 입장을 강력하게 대변해주셨습니다.">${review.content}</textarea>
                            </div>

                            <div class="form-group">
                                <label>미리보기 내용 (하단 카드)</label>
                                <textarea name="previewContent" class="form-control" rows="2" required
                                          placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다...">${review.previewContent}</textarea>
                            </div>
                            
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <div class="form-group mb-0">
                                        <label>표시 순서</label>
                                        <input type="number" name="displayOrder" value="${review.displayOrder}" 
                                               class="form-control order-control" min="1" max="${reviews.size()}">
                                    </div>
                                </div>
                                
                                <div class="col-auto">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="checkbox" name="isActive" 
                                               id="isActive${review.id}" value="true" 
                                               ${review.isActive ? 'checked' : ''}>
                                        <label class="form-check-label" for="isActive${review.id}">
                                            화면에 표시하기
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="col text-end">
                                    <button type="submit" class="btn btn-primary">저장</button>
                                    <button type="button" class="btn btn-danger" 
                                            onclick="deleteReview(${review.id})">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </c:forEach>
    </div>

    <!-- 새 후기 추가 모달 -->
    <div class="modal fade" id="addReviewModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-dark">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">새 후기 추가</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/reviews/new" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>고객명</label>
                                    <input type="text" name="clientName" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>사건 유형</label>
                                    <input type="text" name="caseType" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>후기 날짜</label>
                                    <input type="text" name="reviewDate" class="form-control" 
                                           required placeholder="YYYY.MM.DD">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>전체 후기 내용</label>
                            <textarea name="content" class="form-control" rows="5" required
                                      placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다. 특히 임대차보호법에 대한 깊은 이해를 바탕으로 법리 검토와 증거자료 수집 과정에서 세세한 부분까지 꼼꼼하게 챙겨주셨고, 법원 조정 과정에서도 임대인 측의 부당한 주장에 대해 명확한 반박과 함께 저희의 입장을 강력하게 대변해주셨습니다."></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>미리보기 내용 (하단 카드)</label>
                            <textarea name="previewContent" class="form-control" rows="2" required
                                      placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다..."></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label>프로필 이미지</label>
                            <div class="profile-image-container">
                                <div class="current-image mb-2">
                                    <img src="/images/default-profile.png" alt="고객 프로필" id="previewNew">
                                </div>
                                <input type="file" name="profileImageFile" class="form-control" 
                                       accept="image/*" onchange="previewImage(this, 'previewNew')">
                            </div>
                        </div>
                        
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="form-group">
                                    <label>표시 순서</label>
                                    <input type="number" name="displayOrder" class="form-control order-control" 
                                           required min="1" max="${reviews.size() + 1}" value="1">
                                </div>
                            </div>
                            
                            <div class="col-auto">
                                <div class="form-check">
                                    <input type="hidden" name="isActive" value="false">
                                    <input class="form-check-input" type="checkbox" name="isActive" 
                                           id="newIsActive" value="true">
                                    <label class="form-check-label" for="newIsActive">
                                        화면에 표시하기
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-primary">추가</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function deleteReview(id) {
            if (confirm('이 후기를 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '/admin/reviews/delete/' + id;
                document.body.appendChild(form);
                form.submit();
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const addReviewForm = document.querySelector('#addReviewModal form');
            const currentReviewCount = ${reviews.size()}; 
            
            const displayOrderInputs = document.querySelectorAll('input[name="displayOrder"]');
            displayOrderInputs.forEach(input => {
                input.addEventListener('change', function() {
                    const value = parseInt(this.value);
                    if (value > currentReviewCount) {
                        alert(`표시 순서는 1부터 ${currentReviewCount}까지만 입력 가능합니다.`);
                        this.value = Math.min(value, currentReviewCount);
                    }
                });
            });

            addReviewForm.addEventListener('submit', function(e) {
                if (currentReviewCount >= 6) {
                    e.preventDefault();
                    alert('최대 6개의 리뷰만 등록할 수 있습니다.');
                    return false;
                }
            });
        });

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