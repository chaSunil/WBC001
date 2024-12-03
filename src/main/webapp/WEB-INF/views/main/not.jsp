<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>변호사 송현아</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.20/fullpage.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 500;
            font-style: normal;
        }

        @font-face {
            font-family: 'GangwonEduPowerExtraBoldA';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            font-family: 'Pretendard-Regular';
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .section {
            padding: 40px 20px;
        }

        /* 첫 번째 섹션 - 메인 프로필 */
        #section1 {
            background: white; /* 배경을 흰색으로 변경 */
            color: #333; /* 텍스트 색상을 어두운 색으로 변경 */
            height: 100vh; /* 뷰포트 높이의 100% */
        }

        .content-wrapper {
            padding: 2rem 0;
        }

        .intro-text {
            padding-left: 2rem;
            border-left: 4px solid #152B59; /* 왼쪽 테두리 추가 */
        }

        .intro-text h3 {
            font-size: 1.5rem;
            color: #666;
        }

        .intro-text h1 {
            font-weight: 700;
        }

        .intro-text p {
            font-style: italic;
            color: #666;
            margin-top: 2rem;
        }

        .company-logos img {
            height: 60px; /* 로고 크기도 약간 증가 */
            width: auto;
            margin-right: 20px; /* 로고 사이 간격 조정 */
        }

        .career-list {
            padding-left: 0;
            max-height: 70vh;
            overflow-y: auto;
        }

        .career-list ul li {
            margin-bottom: 0.8rem;
            color: #555;
            padding-right: 20px; /* 오른쪽 여백 추가 */
            white-space: nowrap; /* 한 줄로 표시 */
            line-height: 1.4;
        }

        .lawyer-image {
            height: auto;
            width: 500px; /* 이미지 크기를 450px로 증가 */
        }

        /* 두 번째 섹션 - 전문분야 */
        #section2 {
            background: #152B59;
            color: white;
        }

        .expertise-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            margin: 15px;
            backdrop-filter: blur(10px);
        }

        /* 세 번째 섹션 - 경력사항 */
        #section3 {
            background: #f8f9fa;
        }

        .career-timeline {
            position: relative;
            padding: 20px;
        }

        .timeline-item {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        /* 네 번째 섹션 - 상담예약 */
        #section4 {
            background: linear-gradient(45deg, #152B59 0%, #1a365d 100%);
            color: white;
        }

        .contact-form {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }

        /* 네비게이션 */
        #fp-nav ul li a span {
            background: #152B59;
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
        }

        /* 스크롤바 스타일링 (선택사항) */
        .career-list::-webkit-scrollbar {
            width: 5px;
        }

        .career-list::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .career-list::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 5px;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            /* 메인 배너 모바일 조정 */
            .banner-content {
                left: 5%;
                width: 90%;
            }

            .banner-content h4 {
                font-size: 18px;
            }

            .banner-content p {
                font-size: 24px;
            }

            .banner-content h1 {
                font-size: 36px;
            }

            .logo-container img {
                height: 40px;
            }

            .lawyer-image {
                height: 70%;
                max-width: 70%;
            }

            /* 섹션1 모바일 조정 */
            #section1 .row {
                flex-direction: column;
            }

            #section1 .col-md-5,
            #section1 .col-md-4,
            #section1 .col-md-3 {
                width: 100%;
                margin-bottom: 30px;
            }

            .intro-text {
                padding-left: 1rem;
            }

            .lawyer-image img {
                max-width: 100%;
                height: auto;
            }

            /* 전문분야 섹션 */
            .expertise-card {
                margin-bottom: 20px;
            }

            /* 경력사항 섹션 */
            .career-list {
                max-height: none;
                overflow-y: visible;
            }

            /* 상담예약 섹션 */
            .contact-form {
                padding: 20px;
            }
        }

        /* 태블릿 대응 */
        @media (min-width: 769px) and (max-width: 1024px) {
            .lawyer-image {
                max-width: 45%;
            }

            .intro-text h1 {
                font-size: 2rem;
            }

            .career-list {
                font-size: 0.8rem;
            }
        }

        /* 모바일 환경 스타일 수정 */
        @media screen and (max-width: 430px) {
            .main-banner {
                height: 100vh;
                width: 100%;
            }
            
            .banner-content {
                left: 5%;
                width: 90%;
                top: 30%;
            }
            
            .banner-content h4 {
                font-size: 16px;
                margin-bottom: 10px;
            }
            
            .banner-content p {
                font-size: 20px;
                margin-bottom: 10px;
            }
            
            .banner-content h1 {
                font-size: 28px;
            }
            
            .lawyer-image {
                position: absolute;
                right: 0;
                bottom: 0;
                height: 60%;
                width: auto;
                max-width: 80%;
            }
            
            .lawyer-image img {
                height: 100%;
                width: auto;
                object-fit: contain;
                object-position: bottom right;
            }
        }
    </style>
</head>
<body>
    <div class="main-banner" style="position: relative; width: 100%; height: 100vh; overflow: hidden;">
        <img src="<c:url value='/images/banner.png'/>" alt="메인 배너" style="width: 100%; height: 100%; object-fit: cover;">
        <div class="banner-content" style="position: absolute; top: 50%; left: 10%; transform: translateY(-50%); color: white;">
            <h4 style="font-size: 24px; margin-bottom: 20px;">민사변호사 전문 50년 경력</h4>
            <p style="font-size: 32px; margin-bottom: 20px;">"내 일"이라 생각하고 "내 일"처럼 하겠습니다.</p>
            <h1 style="font-size: 64px; font-weight: bold;">강진태 변호사</h1>
            <div class="logo-container" style="margin-top: 30px;">
                <img src="<c:url value='/images/대학로고투명.png'/>" alt="연세대학교 법학전문대학원" style="height: 60px; margin-right: 20px;">
                <img src="<c:url value='/images/회사로고.png'/>" alt="법무법인 도시와사람" style="height: 60px;">
            </div>
        </div>
        <div class="lawyer-image" style="position: absolute; right: 0; bottom: 0; height: 90%; max-width: 50%; display: flex; align-items: center;">
            <img src="<c:url value='/images/통일감.png'/>" alt="변호사 이미지" style="max-height: 100%; max-width: 100%; object-fit: contain; object-position: bottom right;">
        </div>
    </div>

    <div id="fullpage">
        <!-- 첫 번째 섹션: 메인 프로필 -->
        <div class="section" id="section1">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-md-5">
                        <div class="content-wrapper">
                            <div class="intro-text">
                                <h3 class="mb-3">법무법인 선일과 현아</h3>
                                <h1 class="display-3 fw-bold mb-3">송현아 변호사</h1>
                                <h2 class="display-5 mb-4">무역전문</h2>
                                <p class="lead font-italic mb-4">하이티~~ 믿음의 변호사</p>
                            </div>
                            <div class="company-logos mt-4 d-flex align-items-center">
                                <img src="<c:url value='/images/회사로고.png'/>" alt="회사 로고" class="me-4">
                                <img src="<c:url value='/images/대학로고.png'/>" alt="대학 로고">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex align-items-center justify-content-center">
                        <div class="content-wrapper">
                            <img src="<c:url value='/images/현아.png'/>" alt="변호사 프로필" class="lawyer-image">
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-items-center">
                        <div class="career-list ms-4">
                            <ul class="list-unstyled">
                                <li>법무법인 도시와사람 대표변호사 (2016. 01. ~ 현재)</li>
                                <li>법무법인 한빛 소속변호사 (2001)</li>
                                <li>법률사무소 서우 구성원 변호사 (2001. 09.~2007. 09.)</li>
                                <li>법무법인 두우앤이우 구성원 변호사 (2007. 10.~ 2012. 06. 30.)</li>
                                <li>법무법인 민주 구성원변호 (2012. 07. ~ 2015. 12.)</li>
                                <li>서울특별시 송파구청 무료법률상담관 (2001.~ 2004.)</li>
                                <li>대한변��사협회 신문편집위원회 위원 (2005. 03.~2007. 05.)</li>
                                <li>노근리사건희생자심사보고서 작성기획단 단원 (2005)</li>
                                <li>대한변호사협회 법률서비스선진화 특별위원회 위원 (2005. 03.~2007. 05.)</li>
                                <li>서울지방변호사회 상임이사 (정보통신이사, 교육이사)(2008 ~ 2009)</li>
                                <li>경기도 행정심판위원 (2012. 07.~2018. 07.)</li>
                                <li>용인시 도시계획위원 (2012. 09 ~ 2014. 08.)</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 두 번째 섹션: 전문분야 -->
        <div class="section" id="section2">
            <div class="container">
                <h2 class="section-title text-center">전문분야</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="expertise-card">
                            <h3>사법</h3>
                            <p>살인, 폭행, 절도 등 형사사건 전문</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="expertise-card">
                            <h3>기업범죄</h3>
                            <p>횡령, 배임, 사기 등 기업범죄 전문</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="expertise-card">
                            <h3>이트칼라 범죄</h3>
                            <p>경제범죄, 금융범죄 전문</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 세 번째 섹션: 경력사항 -->
        <div class="section" id="section3">
            <div class="container">
                <h2 class="section-title text-center">주요 경력</h2>
                <div class="career-timeline">
                    <div class="timeline-item">
                        <h3>현) 법무법인 상지 대표변호사</h3>
                        <p>2015 - 현재</p>
                    </div>
                    <div class="timeline-item">
                        <h3>전) 서울중앙방검찰청 검사</h3>
                        <p>2010 - 2015</p>
                    </div>
                    <div class="timeline-item">
                        <h3>서울대학교 법학전문대학원 졸업</h3>
                        <p>2007 - 2010</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 네 번째 섹션: 상담예약 -->
        <div class="section" id="section4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2 class="section-title text-center">상담 예약</h2>
                        <div class="contact-form">
                            <form>
                                <div class="mb-3">
                                    <input type="text" class="form-control" placeholder="성함">
                                </div>
                                <div class="mb-3">
                                    <input type="tel" class="form-control" placeholder="연락처">
                                </div>
                                <div class="mb-3">
                                    <textarea class="form-control" rows="4" placeholder="상담내용"></textarea>
                                </div>
                                <button type="submit" class="btn btn-light w-100">예약하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.20/fullpage.min.js"></script>
    <script>
        new fullpage('#fullpage', {
            autoScrolling: true,
            scrollHorizontally: true,
            navigation: true,
            navigationPosition: 'right',
            scrollingSpeed: 700,
            fitToSection: true,
            anchors: ['main', 'expertise', 'career', 'contact'],
            responsiveWidth: 430,
            scrollOverflow: true,
            normalScrollElements: '.career-list',
            touchSensitivity: 15,
            scrollingSpeed: 500
        });
    </script>
</body>
</html>