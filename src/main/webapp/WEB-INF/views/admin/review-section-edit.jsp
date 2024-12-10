<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객후기 관리</title>
    
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

        /* 리뷰 카드 스타일 */
        .review-card {
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

        /* 모달 스타일 */
        .modal-content {
            border-radius: 1rem;
            border: none;
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

        /* 프로필 이미지 컨테이너 스타일 */
        .profile-image-container {
            margin-bottom: 1.5rem;
        }

        .current-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border: 3px solid #fff;
        }

        .current-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
        }

        /* 이미지 업로드 input 스타일링 */
        input[type="file"] {
            max-width: 300px;
            margin: 0 auto;
            display: block;
        }

        /* 리뷰 카드 내부 이미지 정렬 */
        .review-card .profile-image-container {
            text-align: center;
        }

        /* 미리보기 이미지 스타일 */
        #previewNew,
        [id^="preview"] {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            display: block;
            margin: 0 auto;
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
            <a href="/admin/reviews" class="active">
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
            <h1>고객후기 관리</h1>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addReviewModal">
                <i class="fas fa-plus"></i> 새 후기 추가
            </button>
        </div>

        <div class="content-card">
            <div class="mb-4">
                <img src="/images/고객 후기 가이드.png" alt="고객후기 가이드" 
                     style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
            </div>

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
    </main>

    <!-- 새 후기 추가 모달 -->
    <div class="modal fade" id="addReviewModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">새 후기 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="/admin/reviews/new" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label>고객명</label>
                                    <input type="text" name="clientName" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label>사건 유형</label>
                                    <input type="text" name="caseType" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mb-3">
                                    <label>후기 날짜</label>
                                    <input type="date" name="reviewDate" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <label>전체 후기 내용</label>
                            <textarea name="content" class="form-control" rows="5" required
                                    placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다..."></textarea>
                        </div>

                        <div class="form-group mb-3">
                            <label>미리보기 내용 (하단 카드)</label>
                            <textarea name="previewContent" class="form-control" rows="2" required
                                    placeholder="예시) 임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다..."></textarea>
                        </div>

                        <div class="form-group mb-3">
                            <label>프로필 이미지</label>
                            <div class="profile-image-container">
                                <div class="current-image mb-2">
                                    <img src="/images/default-profile.png" alt="고객 프로필" id="previewNew" style="max-width: 100px;">
                                </div>
                                <input type="file" name="profileImageFile" class="form-control" 
                                       accept="image/*" onchange="previewImage(this, 'previewNew')">
                            </div>
                        </div>

                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="form-group">
                                    <label>표시 순서</label>
                                    <input type="number" name="displayOrder" class="form-control" 
                                           style="width: 80px" min="1" max="${reviews.size() + 1}" value="1">
                                </div>
                            </div>
                            <div class="col-auto">
                                <div class="form-check">
                                    <input type="hidden" name="isActive" value="false">
                                    <input class="form-check-input" type="checkbox" name="isActive" 
                                           id="newIsActive" value="true" checked>
                                    <label class="form-check-label" for="newIsActive">
                                        화면에 표시하기
                                    </label>
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
                    const maxOrder = this.closest('#addReviewModal') ? currentReviewCount + 1 : currentReviewCount;
                    
                    if (value > maxOrder) {
                        alert(`표시 순서는 1부터 ${maxOrder}까지만 입력 가능합니다.`);
                        this.value = Math.min(value, maxOrder);
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