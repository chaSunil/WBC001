<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비디오 섹션 관리</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome 추가 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        /* 기존 스타일 유지 */
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
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

        /* 네비게이션 링크 스타일 */
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

        /* 폼 스타일 */
        .form-group {
            margin-bottom: 25px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: #fff;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
            color: #fff;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        /* 비디오 아이템 스타일 */
        .video-item {
            background: rgba(255, 255, 255, 0.05);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .video-preview {
            margin-top: 15px;
            background: rgba(0, 0, 0, 0.2);
            padding: 10px;
            border-radius: 5px;
        }

        /* 버튼 스타일 */
        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #1a237e;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .btn-warning {
            background-color: #ff9800;
            border: none;
            color: white;
            margin-bottom: 30px;
        }

        .btn-warning:hover {
            background-color: #f57c00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .btn-danger {
            padding: 8px 20px;
            font-size: 0.9rem;
        }

        h2 {
            color: #fff;
            margin-bottom: 30px;
            text-align: center;
            font-size: 2.5rem;
        }

        .btn-secondary {
            background-color: #455a64;
            border: none;
            padding: 12px 30px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #37474f;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav-links">
            <a href="/" class="home-btn"><i class="fas fa-home"></i> 메인페이지</a>
            <a href="/admin/hero-section">히어로 섹션</a>
            <a href="/admin/about-section">프로필 섹션</a>
            <a href="/admin/video-section" class="active">비디오 섹션</a>
            <a href="/admin/success-cases">성공사례 섹션</a>
            <a href="/admin/reviews">고객후기 섹션</a>
            <a href="/admin/legal-guides">법률가이드 섹션</a>
        </div>

        <h2>비디오 섹션 관리</h2>

        <div class="mb-4">
            <img src="/images/video-guide.jpg" alt="고객후기 가이드" 
                 style="width: 100%; 
                        max-width: 1200px;
                        border-radius: 10px; 
                        box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
        </div>        

        <form action="/admin/video-section/reset" method="post" style="text-align: center;">
            <button type="submit" class="btn btn-warning" 
                    onclick="return confirm('기본값으로 되돌리시겠습니까?')">
                기본값으로 초기화
            </button>
        </form>

        <form action="/admin/video-section" method="post">
            <input type="hidden" name="id" value="${videoSection.id}">
            
            <div class="form-group">
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
                                       value="${video.videoId}" 
                                       class="form-control" 
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
                                <button type="button" class="btn btn-danger" 
                                        onclick="removeVideo(this)">삭제</button>
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
            
            <div class="d-flex justify-content-between align-items-center mt-4">
                <button type="button" class="btn btn-secondary" onclick="addVideo()">영상 추가</button>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
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
                        <button type="button" class="btn btn-danger" 
                                onclick="removeVideo(this)">삭제</button>
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
            const previewFrame = input.closest('.video-item')
                                    .querySelector('.video-preview iframe');
            if (videoId) {
                previewFrame.src = `https://www.youtube.com/embed/${videoId}`;
                input.value = videoId;  // videoId만 저장
            }
        }
        
        function extractVideoId(url) {
            const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
            const match = url.match(regExp);
            return (match && match[2].length === 11) ? match[2] : null;
        }
        
        // 페이지 로드 시 기존 비디오 미리보기 업데이트
        document.addEventListener('DOMContentLoaded', function() {
            const videoInputs = document.querySelectorAll('input[name$="].videoId"]');
            videoInputs.forEach(input => updateVideoPreview(input));
        });
    </script>
</body>
</html> 