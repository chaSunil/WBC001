<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비디오 섹션 관리</title>
    
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

        /* 비디오 섹션 스타일 */
        .video-item {
            background: #f8fafc;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid #e5e7eb;
            transition: all 0.2s;
        }

        .video-item:hover {
            border-color: #2563eb;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .video-preview {
            margin-top: 1rem;
            border-radius: 0.5rem;
            overflow: hidden;
            background: #f1f5f9;
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
        .btn-row {
            display: flex;
            justify-content: space-between;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
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
            background: #ef4444;
            color: white;
            border: none;
        }

        .btn-warning {
            background: #f59e0b;
            color: white;
            border: none;
        }

        /* 모바일 대응 */
        @media (max-width: 768px) {
            body {
                padding-left: 0;
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
            <a href="/admin/video-section" class="active">
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
            <h1>비디오 섹션 관리</h1>
            <button type="button" class="btn btn-secondary" onclick="location.href='/admin/video-section/reset'">
                <i class="fas fa-undo"></i> 기본값으로 초기화
            </button>
        </div>

        <div class="content-card">
            <div class="mb-4">
                <img src="/images/video-guide.jpg" alt="비디오 섹션 가이드" 
                     style="width: 100%; max-width: 1200px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
            </div>

            <form action="/admin/video-section" method="post">
                <input type="hidden" name="id" value="${videoSection.id}">
                
                <div class="form-group mb-4">
                    <label>대표 영상 제목</label>
                    <input type="text" name="mainTitle" value="${videoSection.mainTitle}" 
                           class="form-control" placeholder="대표 영상">
                </div>

                <div id="videoList">
                    <c:forEach items="${videoSection.videos}" var="video" varStatus="status">
                        <div class="video-item">
                            <input type="hidden" name="videos[${status.index}].id" value="${video.id}">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>순서</label>
                                    <input type="number" name="videos[${status.index}].number" 
                                           value="${video.number}" class="form-control" min="1" max="3">
                                </div>
                                <div class="col-md-10">
                                    <label>YouTube URL</label>
                                    <input type="text" name="videos[${status.index}].videoId" 
                                           value="${video.videoId}" class="form-control" 
                                           placeholder="https://www.youtube.com/watch?v=..."
                                           onchange="updateVideoPreview(this)">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-5">
                                    <label>제목</label>
                                    <input type="text" name="videos[${status.index}].title" 
                                           value="${video.title}" class="form-control" 
                                           placeholder="영상 제목">
                                </div>
                                <div class="col-md-6">
                                    <label>설명</label>
                                    <input type="text" name="videos[${status.index}].description" 
                                           value="${video.description}" class="form-control" 
                                           placeholder="영상 설명">
                                </div>
                                <div class="col-md-1">
                                    <label>&nbsp;</label>
                                    <button type="button" class="btn btn-danger" onclick="deleteVideo(${video.id}, this)">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="video-preview">
                                <div class="ratio ratio-16x9">
                                    <iframe src="https://www.youtube.com/embed/${video.videoId}" 
                                            title="YouTube video" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="btn-row">
                    <button type="button" class="btn btn-secondary" onclick="addVideo()">
                        <i class="fas fa-plus"></i> 영상 추가
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> 저장하기
                    </button>
                </div>
            </form>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function addVideo() {
            const videoList = document.getElementById('videoList');
            const currentVideos = videoList.getElementsByClassName('video-item');
            
            if (currentVideos.length >= 3) {
                alert('비디오는 최대 3개까지만 등록 가능합니다.');
                return;
            }
            
            const newIndex = currentVideos.length;
            const newVideo = document.createElement('div');
            newVideo.className = 'video-item';
            newVideo.innerHTML = `
                <input type="hidden" name="videos[\${newIndex}].id" value="">
                <div class="row">
                    <div class="col-md-2">
                        <label>순서</label>
                        <input type="number" name="videos[\${newIndex}].number" 
                               class="form-control" min="1" max="3" value="\${newIndex + 1}">
                    </div>
                    <div class="col-md-10">
                        <label>YouTube URL</label>
                        <input type="text" name="videos[\${newIndex}].videoId" 
                               class="form-control" 
                               placeholder="https://www.youtube.com/watch?v=..."
                               onchange="updateVideoPreview(this)">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-5">
                        <label>제목</label>
                        <input type="text" name="videos[\${newIndex}].title" 
                               class="form-control" placeholder="영상 제목">
                    </div>
                    <div class="col-md-6">
                        <label>설명</label>
                        <input type="text" name="videos[\${newIndex}].description" 
                               class="form-control" placeholder="영상 설명">
                    </div>
                    <div class="col-md-1">
                        <label>&nbsp;</label>
                        <button type="button" class="btn btn-danger" onclick="removeVideo(this)">
                            <i class="fas fa-trash"></i>
                        </button>
                    </div>
                </div>
                <div class="video-preview">
                    <div class="ratio ratio-16x9">
                        <iframe src="" title="YouTube video" allowfullscreen></iframe>
                    </div>
                </div>
            `;
            videoList.appendChild(newVideo);
        }

        function removeVideo(button) {
            button.closest('.video-item').remove();
        }

        function updateVideoPreview(input) {
            const videoId = extractVideoId(input.value);
            const previewFrame = input.closest('.video-item').querySelector('.video-preview iframe');
            if (videoId) {
                previewFrame.src = `https://www.youtube.com/embed/${videoId}`;
                input.value = videoId;
            }
        }

        function extractVideoId(url) {
            const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
            const match = url.match(regExp);
            return (match && match[2].length === 11) ? match[2] : null;
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

        // 페이지 로드 시 기존 비디오 미리보기 업데이트
        document.addEventListener('DOMContentLoaded', function() {
            const videoInputs = document.querySelectorAll('input[name$="].videoId"]');
            videoInputs.forEach(input => updateVideoPreview(input));
        });

        function deleteVideo(videoId, button) {
            if (!confirm('정말 삭제하시겠습니까?')) return;
            
            fetch(`/admin/video-section/delete/${videoId}`, {
                method: 'POST'
            })
            .then(response => {
                if (response.ok) {
                    button.closest('.video-item').remove();
                } else {
                    alert('삭제 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('삭제 중 오류가 발생했습니다.');
            });
        }
    </script>
</body>
</html>