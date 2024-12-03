<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>민사 변호사 소개 사이트</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        @font-face {
            font-family: 'MaruBuriBold';
            src: url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-Bold.eot);
            src: url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-Bold.eot?#iefix) format("embedded-opentype"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-Bold.woff2) format("woff2"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-Bold.woff) format("woff"), url(https://hangeul.pstatic.net/hangeul_static/webfont/MaruBuri/MaruBuri-Bold.ttf) format("truetype");
        }

        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        /* body 스타일 수정 */
        body {
            font-family: 'GmarketSansMedium';
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .hero-section {
            font-family: 'MaruBuriBold', sans-serif;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
            background: linear-gradient(to right, #333333, #666666);
        }

        .hero-content {
            padding-left: 20%;
            padding-top: 35vh;
            text-align: left;
            color: #ffffff;
        }

        .hero-title, .hero-subtitle, .lawyer-name {
            background: linear-gradient(to right, #fff, #e0e0e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .lawyer-image-container {
            height: 100vh;
            display: flex;
            align-items: flex-end;
            justify-content: flex-end;
        }

        .lawyer-profile-img {
            height: 90%;
            max-height: 90vh;
            object-fit: contain;
            position: absolute;
            bottom: 0;
            right: 0;
        }

        .hero-title {
            color: #fff;
            font-size: 2.5rem;
        }
        
        .hero-subtitle {
            background: linear-gradient(to right, #fff, #e0e0e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2rem;
            opacity: 1;
            animation: fadeInDown 1s ease forwards;
            animation-delay: 0.8s;
        }
        
        .lawyer-name {
            color: #fff;
            font-size: 3.8rem;
        }
        
        .logo-container {
            display: flex;
            gap: 20px;
            margin-top: 2rem;
            opacity: 0;
            animation: fadeInUp 1s ease forwards;
            animation-delay: 3.1s; /* 세 번째로 나타남 */
        }
        
        .logo-container img {
            height: 60px;
            object-fit: contain;
        }
        
        .cta-button {
            background-color: #1a237e;
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .cta-button:hover {
            background-color: #0d47a1;
            transform: scale(1.05);
        }
        
        @media (max-width: 768px) {
            .hero-section {
                padding-left: 5%;
            }
            
            .hero-title {
                font-size: 1.8rem;
            }
            
            .hero-subtitle {
                font-size: 1.5rem;
            }
            
            .lawyer-name {
                font-size: 2.5rem;
            }
        }

        /* 타임라인 스타일 */
        .timeline {
            position: relative;
            padding: 20px 0;
        }

        .timeline-item {
            position: relative;
            padding-left: 50px;
            margin-bottom: 30px;
        }

        .timeline-badge {
            position: absolute;
            left: 0;
            width: 40px;
            height: 40px;
            background: #1a237e;
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
        }

        .timeline-content {
            padding: 15px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* 반응형 조정 */
        @media (max-width: 768px) {
            .timeline-item {
                padding-left: 30px;
            }
            
            .timeline-badge {
                width: 30px;
                height: 30px;
                line-height: 30px;
                font-size: 12px;
            }
        }

        /* 법률정보 섹션 스타일 */
        .latest-news {
            background: linear-gradient(135deg, #1a237e, #3949ab);
        }

        .card {
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .newsletter-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
        }

        /* 반응형 조정 */
        @media (max-width: 768px) {
            .newsletter-form {
                flex-direction: column;
            }
            
            .newsletter-form input,
            .newsletter-form button {
                width: 100%;
                max-width: 100%;
            }
        }

        /* fullpage 관련 스타일 */
        .hero-section {
            height: 100vh;
            overflow: hidden;
            position: relative;
        }
        
        .hero-content {
            opacity: 0;
            transform: translateY(20px);
            transition: all 1s ease-out;
        }
        
        .hero-content.active {
            opacity: 1;
            transform: translateY(0);
        }
        
        .scroll-down {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            text-align: center;
            cursor: pointer;
        }
        
        .scroll-down i {
            animation: bounce 2s infinite;
        }
        
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        /* 푸터 스타일 */
        footer {
            background-color: #1a237e;
        }

        footer h5 {
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        footer .social-links a {
            display: inline-block;
            width: 32px;
            height: 32px;
            line-height: 32px;
            text-align: center;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.1);
            transition: background-color 0.3s;
        }

        footer .social-links a:hover {
            background-color: rgba(255,255,255,0.2);
        }

        /* 반응형 조정 */
        @media (max-width: 768px) {
            footer {
                text-align: center;
            }
            
            footer .social-links {
                margin-bottom: 2rem;
            }
        }

        /* 반응형 스타일 */
        @media (max-width: 991px) {
            .hero-section {
                min-height: auto;
                padding: 80px 0;
                background: linear-gradient(to bottom, #333333, #666666);
            }

            .hero-content {
                padding: 2rem 15px;
                text-align: center;
                order: 1;
            }

            .lawyer-image-container {
                height: auto;
                min-height: 50vh;
                max-height: 70vh;
                position: relative;
                order: 2;
                margin-top: -50px;
            }

            .lawyer-profile-img {
                position: relative;
                height: auto;
                max-height: 65vh;
                width: auto;
                max-width: 90%;
                margin: 0 auto;
                display: block;
                right: auto;
                bottom: auto;
            }

            .hero-title {
                font-size: 1.8rem;
                margin-bottom: 1rem;
            }

            .hero-subtitle {
                font-size: 1.2rem;
                margin-bottom: 1rem;
            }

            .lawyer-name {
                font-size: 2.5rem;
                margin-bottom: 1.5rem;
            }

            .logo-container {
                justify-content: center;
                margin-top: 1.5rem;
            }

            .logo-container img {
                height: 40px;
            }
        }

        @media (max-width: 576px) {
            .hero-section {
                padding: 60px 0;
            }

            .lawyer-image-container {
                min-height: 40vh;
                margin-top: -30px;
            }

            .lawyer-profile-img {
                max-height: 55vh;
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* 애니메이션 키프레임 정 */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* 텍스트 스타일 */
        .hero-title {
            background: linear-gradient(to right, #fff, #e0e0e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.1rem;
            opacity: 0; /* 초기에는 숨김 */
            animation: fadeInDown 1s ease forwards;
            animation-delay: 0.3s; /* 첫 번째로 나타남 */
        }

        .hero-subtitle {
            background: linear-gradient(to right, #fff, #e0e0e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.3rem;
            opacity: 0;
            animation: fadeInUp 1s ease forwards;
            animation-delay: 1.3s; /* 두 번째로 나타남 */
        }

        .lawyer-name {
            background: linear-gradient(to right, #fff, #e0e0e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 3.8rem;
            opacity: 0;
            animation: fadeInUp 1s ease forwards;
            animation-delay: 2.2s; /* 세 번째로 타남 */
        }

        /* 모바일 대응 */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 1.8rem;
            }
            
            .hero-subtitle {
                font-size: 1.5rem;
            }
            
            .lawyer-name {
                font-size: 2.8rem;
            }
        }

        .subtitle-line {
            display: inline;
        }

        /* 모바일 환경에서 줄바꿈 적용 */
        @media (max-width: 991px) {
            .subtitle-line {
                display: block; /* 줄바꿈을 위한 블록 처리 */
            }
            
            .hero-subtitle {
                font-size: 2rem; /* 원래 크기 유지 */
                line-height: 1.8; /* 줄간격만 조정 */
            }
        }

        /* 더 작은 모바일 화면 */
        @media (max-width: 576px) {
            .hero-subtitle {
                font-size: 1.2rem;
                line-height: 1.6;
            }
        }

        .career-items {
            margin: 0;
            padding: 0;
        }

        .career-item {
            font-size: 1.1rem;
            padding: 12px 0;
            color: white;
            opacity: 0;
            animation: fadeInRight 0.5s ease forwards;
            border-bottom: none;
            background: none;
            -webkit-background-clip: initial;
            -webkit-text-fill-color: white;
            font-weight: 500;
        }

        .career-item:last-child {
            border-bottom: none;
        }

        /* 각 항목별 애니메이션 딜레이 */
        .career-item:nth-child(1) { animation-delay: 0.1s; }
        .career-item:nth-child(2) { animation-delay: 0.2s; }
        .career-item:nth-child(3) { animation-delay: 0.3s; }
        .career-item:nth-child(4) { animation-delay: 0.4s; }
        .career-item:nth-child(5) { animation-delay: 0.5s; }
        .career-item:nth-child(6) { animation-delay: 0.6s; }
        .career-item:nth-child(7) { animation-delay: 0.7s; }
        .career-item:nth-child(8) { animation-delay: 0.8s; }
        .career-item:nth-child(9) { animation-delay: 0.9s; }
        .career-item:nth-child(10) { animation-delay: 1.0s; }

        @keyframes fadeInRight {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @media (max-width: 768px) {
            .career-item {
                font-size: 1rem;
                padding: 10px 0;
            }
        }

        .profile-card img {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .profile-card img:hover {
            transform: scale(1.02);
        }

        /* 프로필 섹션 전체 스타일 */
        .about-section {
            position: relative;
            overflow: hidden;
            padding: 100px 0;
        }

        /* 프로필 카드 컨테이너 */
        .profile-card {
            background: rgba(255, 255, 255, 0.05);
            padding: 2rem;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            height: 100%;
            margin-bottom: 2rem;
        }

        /* 프로필 이미지 */
        .profile-card img {
            width: 100%;
            max-width: 300px;
            height: auto;
            margin: 0 auto;
            display: block;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            transition: transform 0.3s ease;
            border-radius: 15px;
        }

        /* 경력 리스트와 인사말 박스 공통 스타일 */
        .career-list, .greeting-box {
            height: 100%;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 2rem;
        }

        /* 반응형 디자인 */
        @media (max-width: 992px) {
            .profile-card, .career-list, .greeting-box {
                margin-bottom: 2rem;
                height: auto;
            }

            .profile-card img {
                max-width: 250px;
            }

            .row.align-items-center {
                margin: 0;
            }

            .col-lg-4, .col-lg-3, .col-lg-5 {
                padding: 0 15px;
            }
        }

        @media (max-width: 768px) {
            .about-section {
                padding: 50px 0;
            }

            .profile-card {
                padding: 1.5rem;
            }

            .profile-card img {
                max-width: 200px;
            }

            .career-list, .greeting-box {
                padding: 1.5rem;
            }

            .greeting-text p {
                font-size: 1rem !important;
            }
        }

        /* 컨테이너 여백 조정 */
        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }

        .container {
            padding: 0 15px;
        }

        .social-links a {
            opacity: 0.8;
            transition: opacity 0.3s ease;
        }

        .social-links a:hover {
            opacity: 1;
        }

        .video-buttons .accordion-button {
            background-color: #f8f9fa;
            border: none;
            transition: all 0.3s ease;
        }

        .video-buttons .accordion-button:hover {
            background-color: #e9ecef;
        }

        .video-buttons .accordion-button:not(.collapsed) {
            background-color: #1a237e;
            color: white;
        }

        .video-buttons .accordion-body {
            background-color: #f8f9fa;
            padding: 1rem;
        }

        #videoPlayer {
            transition: opacity 0.3s ease;
        }

        .expertise-section {
            padding: 6rem 0;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .card {
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .accordion-button:not(.collapsed) {
            background-color: #1a237e !important;
            color: white;
        }

        .accordion-button:focus {
            box-shadow: none;
            border-color: rgba(0,0,0,.125);
        }

        .accordion-item {
            border-radius: 8px;
            overflow: hidden;
        }

        .philosophy-section {
            padding: 6rem 0;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .philosophy-item {
            opacity: 0;
            animation: fadeInUp 0.8s ease forwards;
        }

        .philosophy-item:nth-child(1) { animation-delay: 0.3s; }
        .philosophy-item:nth-child(2) { animation-delay: 0.6s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .video-container {
            transition: transform 0.3s ease;
        }

        .video-container:hover {
            transform: scale(1.02);
        }

        .accordion-button {
            transition: all 0.3s ease;
        }

        .accordion-button:not(.collapsed) {
            background-color: #1a237e !important;
            color: white;
        }

        .accordion-button:hover {
            background-color: #e9ecef;
        }

        .accordion-button:focus {
            box-shadow: none;
        }

        .career-item {
            color: #fff;
            font-size: 1.1rem;
            transition: transform 0.3s ease;
        }

        .career-item:hover {
            transform: translateX(10px);
        }

        .greeting-box {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .greeting-text {
            font-size: 1.1rem;
        }

        .signature-box {
            margin-top: auto;
        }

        @media (max-width: 991px) {
            .greeting-box {
                margin-top: 2rem;
            }
        }

        /* 프로필 카드, 경력 리스트, 인사말 박스의 높이와 정렬 설정 */
        .profile-card, .career-list, .greeting-box {
            height: 600px;
            display: flex;
            flex-direction: column;
            justify-content: center; /* 수직 중앙 정렬 */
            padding: 2rem;
        }

        /* 경력 리스트 내부 정렬 조정 */
        .career-list ul {
            width: 100%;
            padding: 0;
        }

        /* 서명 박스 조정 */
        .signature-box {
            margin-top: auto;
            width: 100%;
        }

        .signature-box .d-flex {
            display: flex;
            align-items: center;
            justify-content: flex-end; /* 오른쪽 정렬 */
        }

        .signature-box .text-white {
            margin-right: 0; /* 이름 오른쪽 마진 제거 */
        }

        .signature-box img {
            height: 50px;
            margin-left: -15px; /* 서명을 이름 쪽으로 더 당김 */
        }

        .expertise-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .accordion-button:not(.collapsed) {
            background: rgba(26, 35, 126, 0.1) !important;
            color: white !important;
        }

        .accordion-button::after {
            filter: brightness(0) invert(1);
        }

        /* 전문분야 카드 내부 스타일 수정 */
        .expertise-card h-100 {
            background: rgba(255, 255, 255, 0.05); 
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 50px 40px;
            transition: all 0.3s ease;
        }

        .expertise-card h-100 .text-center mb-5 {
            margin-bottom: 50px;
        }

        .expertise-card h-100 .icon-circle {
            width: 100px; 
            height: 100px; 
            background: rgba(26, 35, 126, 0.1); 
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .expertise-card h-100 .icon-circle img {
            width: 60%;
            height: 60%;
            object-fit: cover;
        }

        .expertise-card h-100 .text-white {
            font-size: 1.8rem;
            font-weight: 600;
        }

        .expertise-card h-100 ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .expertise-card h-100 li {
            margin-bottom: 20px;
            padding: 12px 20px;
            background: rgba(26, 35, 126, 0.1);
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .expertise-card h-100 li span {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .expertise-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .expertise-card:hover .icon-circle {
            transform: scale(1.1);
            background: rgba(26, 35, 126, 0.2);
        }

        .expertise-item:hover {
            background: rgba(26, 35, 126, 0.2);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        /* FAQ 스타일 개선 */
        .accordion-button {
            font-size: 1.2rem;
            padding: 20px 30px;
        }

        .accordion-body {
            font-size: 1.1rem;
            padding: 25px 30px;
        }

        .accordion-body ul li {
            margin-bottom: 12px;
        }

        /* 섹션 제목 애니메이션 */
        .display-4 {
            position: relative;
            display: inline-block;
        }

        .display-4::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: #1a237e;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            transition: width 0.3s ease;
        }

        .display-4:hover::after {
            width: 100px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .latest-news:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }

        .btn-outline-light:hover {
            background-color: #1a237e;
            border-color: #1a237e;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
            box-shadow: none;
        }

        .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.3);
            color: white;
            box-shadow: none;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        /* 법률정보 섹션 스타일 개선 */
        #blog {
            padding: 120px 0;  /* 상하 패딩 증가 */
            margin-bottom: 80px; /* 하단 마진 추가 */
            background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.8)), url('/images/배경.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* 패럴랙스 과 추가 */
        }

        /* 최신 법률 정보 카드 개선 */
        .latest-news {
            background: rgba(26, 35, 126, 0.15);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            margin-bottom: 50px; /* 하단 마진 증가 */
        }

        /* 상담 예약 섹션 스타일 복원 */
        #contact {
            padding: 120px 0;  /* 상하 패딩 */
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.95)), url('/images/배경.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* 상담 예약 폼 스타일 복원 */
        #contact .card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            min-width: unset;  /* 최소 너비 제거 */
            padding: 2rem;     /* 원래 패딩으로 복원 */
        }

        #contact .container {
            max-width: 1140px;  /* 원래 컨테이너 크기로 복원 */
            margin: 0 auto;
            padding: 0 15px;
        }

        #contact .form-control {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        #contact .form-control:focus {
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: none;
        }

        #contact .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        /* 상담 예약 섹션 제목 스타일 */
        #contact h2 {
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 3rem;
            position: relative;
            display: inline-block;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            width: 100%;
        }

        .kakao-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1000;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            background: none;
            border: none;
            padding: 0;
        }

        .kakao-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        }

        .kakao-icon {
            width: 60px;
            height: 60px;
        }

        /* 모바일 화면에서의 크기 조정 */
        @media (max-width: 768px) {
            .kakao-btn {
                bottom: 20px;
                right: 20px;
            }
            
            .kakao-icon {
                width: 50px;
                height: 50px;
            }
        }

        /* 기존 container-fluid 스타일 수정 */
        .container-fluid {
            width: 100vw;
            max-width: 100%;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* 각 섹션 스타일 수정 */
        section {
            width: 100%;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* 내부 컨테이너 조정 */
        section .container {
            max-width: 1400px !important;  /* 전체 컨테이너 너비 증가 */
            margin: 0 auto;
            padding-left: 15px;
            padding-right: 15px;
        }

        @media (max-width: 1200px) {
            section .container {
                max-width: 960px;  /* Bootstrap의 기본 lg 브레이크포인트 */
            }
        }

        @media (max-width: 992px) {
            section .container {
                max-width: 720px;  /* Bootstrap의 기본 md 브레이크포인트 */
            }
        }

        @media (max-width: 768px) {
            section .container {
                max-width: 540px;  /* Bootstrap의 기본 xs 브레이크포인트 */
            }
        }

        /* 네비게이션 바 수정 */
        .navbar {
            width: 100%;
            max-width: 100vw;
            left: 0;
            right: 0;
        }

        /* body 스타일 수정 */
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* 기본 컨테이너 크기 유지하면서 여백만 제거 */
        .container-fluid {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* 섹션 스타일 - 여백만 제거 */
        section {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* 법률정보 섹션의 카드 크기 유지 */
        .latest-news {
            width: 100%;
            padding: 2.5rem;
            margin-bottom: 2rem;
            min-height: 280px;  /* 최소 높이 설정 */
        }

        /* 카드 컨테이너 크기 유지 */
        .col-md-4 {
            padding: 1.5rem;  /* 카드 간 여백 증가 */
        }

        /* 카드 자체의 크기 유지 */
        .card {
            height: 100%;
            padding: 2rem;
            min-width: 380px;  /* 최소 너비 설정 */
        }

        /* 내부 컨테이너는 기존 크기 유지 */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* 푸터 관련 추가 스타일 */
        .footer .hover-effect {
            transition: all 0.3s ease;
        }

        .footer .hover-effect:hover {
            color: #ffffff !important;
            transform: translateY(-2px);
        }

        .footer .social-links a {
            display: inline-block;
            transition: all 0.3s ease;
        }

        .footer .social-links a:hover {
            transform: translateY(-3px);
            color: #ffffff !important;
        }

        .footer .btn-outline-light {
            transition: all 0.3s ease;
        }

        .footer .btn-outline-light:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .footer .contact-info i,
        .footer .office-hours i {
            color: #1a237e;
        }

        /* 카드 최소 너비 제거 및 반응형 패딩 조정 */
        .card {
            height: 100%;
            padding: 1.5rem;
            width: 100%;
            min-width: unset; /* 소 너비 제거 */
        }

        /* 모바일 환경을 위한 미디어 쿼리 추가 */
        @media (max-width: 768px) {
            .col-md-4 {
                padding: 0.75rem;  /* 모일에서 카드 간 여백 축소 */
            }
            
            .card {
                padding: 1rem;  /* 모바일에서 카드 내부 패딩 축소 */
            }
            
            .expertise-card {
                padding: 30px 20px !important;  /* 전문분야 카드 패딩 축소 */
            }
            
            .container {
                padding: 0 10px;  /* 컨테이너 좌우 패딩 축소 */
            }
            
            /* 법률정보 섹션 카드 조정 */
            #blog .card {
                margin: 0 10px;  /* 좌우 마진 추가 */
            }
        }

        /* 전문분야 카드 스타일 수정 */
        .expertise-card {
            width: 100%;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px 30px;
            transition: all 0.3s ease;
        }

        /* 컨테이너 오버플로우 방지 */
        .container-fluid {
            overflow-x: hidden;
            width: 100%;
            max-width: 100vw;
        }

        /* 섹션 내부 여백 조정 */
        section {
            overflow-x: hidden;
            padding: 0;
            margin: 0;
        }

        /* 작은 화면에서 아이콘 크기 조정 */
        @media (max-width: 576px) {
            .icon-circle {
                width: 80px !important;
                height: 80px !important;
            }
            
            .expertise-card h4 {
                font-size: 1.5rem !important;
            }
            
            .expertise-item span {
                font-size: 1rem !important;
            }
        }

        /* 배경 이미지 공통 스타일 */
        .about-section, .expertise-section, #blog, #contact {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.95)), url('/images/배경.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;  /* 배경 반복 방지 */
            background-attachment: fixed;  /* 패럴랙스 효과 유지 */
            width: 100%;
            position: relative;
        }

        /* 모바일 기기에서는 fixed 배경 비활성화 */
        @media (max-width: 768px) {
            .about-section, .expertise-section, #blog, #contact {
                background-attachment: scroll;  /* 모바일에서는 스크롤로 변경 */
            }
        }

        /* 각 섹션별 배경 투명도 조정 */
        .about-section {
            background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.9)), url('/images/배경.jpg');
        }

        .expertise-section {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.85)), url('/images/배경.jpg');
        }

        #blog {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)), url('/images/배경.jpg');
        }

        #contact {
            background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.95)), url('/images/배경.jpg');
        }

        /* 네비게이션 바 모바일 스타일 */
        @media (max-width: 991px) {
            .navbar {
                padding: 10px 0 !important;  /* 상하 패딩 축소 */
            }
            
            .navbar-brand {
                font-size: 1.2rem !important;  /* 브랜드명 크기 축소 */
            }
            
            .navbar-toggler {
                padding: 4px 8px !important;  /* 토글 버튼 크기 축소 */
                font-size: 1rem !important;
            }
            
            .nav-link {
                font-size: 1rem !important;  /* 메뉴 항목 텍스트 크기 축소 */
                padding: 8px 15px !important;  /* 메뉴 항목 패딩 축소 */
            }
            
            .navbar-collapse {
                background: rgba(0, 0, 0, 0.95);  /* 메뉴 펼침 시 배경 */
                border-radius: 10px;
                margin-top: 10px;
                padding: 10px;
            }
        }

        /* 더 작은 모바일 화면에서 추가 조정 */
        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.1rem !important;
            }
            
            .navbar {
                padding: 8px 0 !important;
            }
        }
    </style>
</head>
<body>
    <!-- body 태그 바로 아래에 배경 div 추가 -->
    <div class="global-background"></div>

    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg fixed-top" 
         style="background: rgba(0, 0, 0, 0.8);
                backdrop-filter: blur(10px);
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                padding: 20px 0;
                transition: all 0.3s ease;">
        <div class="container">
            <a class="navbar-brand" 
               href="#" 
               style="color: white;
                      font-size: 1.5rem;
                      font-weight: 600;
                      transition: color 0.3s ease;">
                강진태 법률사무소
            </a>
            <button class="navbar-toggler" 
                    type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav"
                    style="border-color: rgba(255, 255, 255, 0.5);">
                <span class="navbar-toggler-icon" style="filter: brightness(0) invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link px-3" 
                           href="#about" 
                           style="color: rgba(255, 255, 255, 0.9);
                                  font-size: 1.1rem;
                                  transition: all 0.3s ease;">
                            변호사 소개
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" 
                           href="#expertise" 
                           style="color: rgba(255, 255, 255, 0.9);
                                  font-size: 1.1rem;
                                  transition: all 0.3s ease;">
                            전문분야
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" 
                           href="#cases" 
                           style="color: rgba(255, 255, 255, 0.9);
                                  font-size: 1.1rem;
                                  transition: all 0.3s ease;">
                            성공사례
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" 
                           href="#blog" 
                           style="color: rgba(255, 255, 255, 0.9);
                                  font-size: 1.1rem;
                                  transition: all 0.3s ease;">
                            법률정보
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link px-3" 
                           href="#contact" 
                           style="color: rgba(255, 255, 255, 0.9);
                                  font-size: 1.1rem;
                                  transition: all 0.3s ease;">
                            상담예약
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 히어로 섹션 -->
    <section class="hero-section">
        <div class="container-fluid">
            <div class="row">
                <!-- 왼쪽 콘텐츠 -->
                <div class="col-lg-7">
                    <div class="hero-content">
                        <h2 class="hero-title">${heroSection.title}</h2>
                        <p class="hero-subtitle">
                            <span class="subtitle-line">${heroSection.subtitleLine1}</span>
                            <span class="subtitle-line">${heroSection.subtitleLine2}</span>
                        </p>
                        <h1 class="lawyer-name">${heroSection.lawyerName}</h1>
                        <div class="logo-container">
                            <img src="${heroSection.universityLogo}" 
                                 alt="연세대학교 법학전문대학원" 
                                 style="height: 60px;
                                        filter: brightness(0) invert(1);
                                        opacity: 0.9;
                                        transition: transform 0.3s ease;">
                            <img src="${heroSection.companyLogo}" 
                                 alt="법무법인 최선과믿음" 
                                 style="height: 60px;
                                        filter: brightness(0) invert(1);
                                        opacity: 0.9;
                                        transition: transform 0.3s ease;">
                        </div>
                    </div>
                </div>
                <!-- 오른쪽 이미지 -->
                <div class="col-lg-5">
                    <div class="lawyer-image-container">
                        <img src="${heroSection.profileImage}" alt="강진태 변호사" class="lawyer-profile-img">
                    </div>
                </div>
            </div>
            <div class="scroll-down">
                <i class="fas fa-chevron-down"></i>
                <p>스크롤을 내려주세요</p>
            </div>
        </div>
    </section>

    <!-- 변호사 프로필 섹션 -->
    <section id="about" class="py-6">
        <div class="container-fluid px-0">
            <div class="about-section">
                <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.85);"></div>
                
                <div class="container position-relative">
                    <!-- 섹션 헤더 -->
                    <div class="row justify-content-center mb-5">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white display-4 mb-3" style="font-weight: 600;">변호사 소개</h2>
                            <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                        </div>
                    </div>

                    <!-- 프로필 컨텐츠 -->
                    <div class="row align-items-stretch g-4">
                        <!-- 프로필 이미지 및 기본 정보 -->
                        <div class="col-lg-4">
                            <div class="profile-card text-center h-100" style="padding: 2rem;">
                                <img src="/images/대표통일감.jpg" alt="강진태 변호사" class="mb-4" style="width: 100%; max-width: 320px;">
                                <h3 class="mb-2 text-white" style="font-size: 2.5rem;">최선 변호사</h3>
                                <p class="text-light mb-3" style="font-size: 1.2rem; opacity: 0.9;">민사전문 / 대한변호사협회</p>
                            </div>
                        </div>

                        <!-- 경력 리스트 -->
                        <div class="col-lg-3">
                            <div class="career-list h-100" style="padding: 2rem;">
                                <h2 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">주요 경력</h2>
                                <ul class="list-unstyled mb-0">
                                    <li class="career-item mb-4 d-flex align-items-center" 
                                        style="border-left: 3px solid #1a237e; 
                                               padding-left: 20px;
                                               transition: transform 0.3s ease;">
                                        <div>
                                            <h6 class="text-white mb-1" style="font-size: 1.1rem;">법무법인 다래 변호사</h6>
                                            <small class="text-light opacity-75">2020 - 현재</small>
                                        </div>
                                    </li>
                                    <li class="career-item mb-4 d-flex align-items-center" 
                                        style="border-left: 3px solid #1a237e; 
                                               padding-left: 20px;
                                               transition: transform 0.3s ease;">
                                        <div>
                                            <h6 class="text-white mb-1" style="font-size: 1.1rem;">서울중앙지방법원 부장판사</h6>
                                            <small class="text-light opacity-75">2015 - 2020</small>
                                        </div>
                                    </li>
                                    <li class="career-item mb-4 d-flex align-items-center" 
                                        style="border-left: 3px solid #1a237e; 
                                               padding-left: 20px;
                                               transition: transform 0.3s ease;">
                                        <div>
                                            <h6 class="text-white mb-1" style="font-size: 1.1rem;">사법연수원 교수</h6>
                                            <small class="text-light opacity-75">2013 - 2015</small>
                                        </div>
                                    </li>
                                    <li class="career-item mb-4 d-flex align-items-center" 
                                        style="border-left: 3px solid #1a237e; 
                                               padding-left: 20px;
                                               transition: transform 0.3s ease;">
                                        <div>
                                            <h6 class="text-white mb-1" style="font-size: 1.1rem;">인천지방법원 부장판사</h6>
                                            <small class="text-light opacity-75">2010 - 2013</small>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 인사말 -->
                        <div class="col-lg-5">
                            <div class="greeting-box h-100" style="padding: 2rem;">
                                <h3 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">
                                    인사말
                                </h3>
                                <div class="greeting-text text-white" style="line-height: 1.8; opacity: 0.9;">
                                    <p style="font-size: 1.1rem;">저는 다양한 사건을 통해 쌓아 경험과 노하우로 객님의 법적 문제를 신속하고 정확하게 해결해 드리는 것을 목표로 하고 있습니다.</p>
                                    <p style="font-size: 1.1rem;">모든 사건은 각자의 소중한 인생이 걸린 문제라고 생각하며, 철저한 분석과 꼼꼼한 준비로 고님의 권리를 끝까지 지켜드리겠습니다.</p>
                                    <p style="font-size: 1.1rem;">어려운 법률 문제도 함께라면 해결의 길을 찾을 수 있습니다. 작은 상담이라도 편하게 문의 주세요. 언제나 고객님의 입장에서 최선의 방안을 제시하겠습니다.</p>
                                </div>
                                <div class="signature-box mt-4">
                                    <div class="d-flex align-items-center justify-content-end">
                                        <span class="text-white me-3" style="font-size: 1.2rem;">변호사 최 선</span>
                                        <img src="/images/싸인.png" alt="최선 변호사 서명" 
                                             style="height: 70px; width: auto; opacity: 0.9;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 변호사 철학 및 인터뷰 섹션 -->
    <section id="philosophy" class="py-5">
        <div class="container-fluid px-0">
            <div class="philosophy-section" style="background-image: url('/images/배경.jpg'); position: relative;">
                <!-- 배경 오버레이 -->
                <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.8);"></div>
                
                <div class="container position-relative" style="z-index: 2;">
                    <!-- 변호사 철학 -->
                    <div class="row mb-5 justify-content-center">
                        <div class="col-lg-8">
                            <div class="text-center mb-5">
                                <h2 class="text-white mb-4">변호사 철학</h2>
                                <div class="philosophy-content">
                                    <div class="philosophy-item mb-5">
                                        <h3 class="text-white mb-3" style="font-size: 1.8rem;">첫 번째 철칙</h3>
                                        <p class="lead text-white" style="font-size: 1.3rem; line-height: 1.8;">
                                            "법은 어려울 수 있지만, 저와 함께라면 길을 찾을 수 있습니다.<br>
                                            신뢰와 책임감을 바탕으로 의뢰인의 권리를 지켜드리겠습니다."
                                        </p>
                                    </div>
                                    <div class="philosophy-item">
                                        <h3 class="text-white mb-3" style="font-size: 1.8rem;">두 번째 철칙</h3>
                                        <p class="lead text-white" style="font-size: 1.3rem; line-height: 1.8;">
                                            "사건의 크고 작음을 떠나, 모든 의뢰인의 문제를 내 일처럼 여기고<br>
                                            끝까지 책임지겠습니다. 신뢰와 공감으로 최선의 해결책을 제시하겠습니다."
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 인뷰 상 섹션 -->
                    <div class="row align-items-center">
                        <div class="col-lg-6 mb-4 mb-lg-0">
                            <div class="video-container" style="box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);">
                                <div class="ratio ratio-16x9">
                                    <iframe id="videoPlayer" src="https://www.youtube.com/embed" 
                                            title="변호사 인터뷰" allowfullscreen 
                                            style="border-radius: 10px;"></iframe>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="video-content">
                                <h3 class="text-white mb-4">변호사 인터뷰 영상</h3>
                                <div class="video-buttons">
                                    <div class="accordion" id="videoAccordion">
                                        <!-- 영상 1 -->
                                        <div class="accordion-item mb-3" style="background: rgba(255, 255, 255, 0.9); border-radius: 10px;">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" 
                                                        data-bs-target="#video1" data-video-id="VIDEO_ID_1"
                                                        onclick="changeVideo('VIDEO_ID_1')"
                                                        style="border-radius: 10px;">
                                                    민사소송 진행 절차 안내
                                                </button>
                                            </h2>
                                            <div id="video1" class="accordion-collapse collapse show" data-bs-parent="#videoAccordion">
                                                <div class="accordion-body">
                                                    민사소송의 전반적인 진행 절차와 준비사항에 대해 상세히 설명드립니다.
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- 영상 2 -->
                                        <div class="accordion-item mb-3" style="background: rgba(255, 255, 255, 0.9); border-radius: 10px;">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                                                        data-bs-target="#video2" data-video-id="VIDEO_ID_2"
                                                        onclick="changeVideo('VIDEO_ID_2')"
                                                        style="border-radius: 10px;">
                                                    부동산 분쟁 해결 사례
                                                </button>
                                            </h2>
                                            <div id="video2" class="accordion-collapse collapse" data-bs-parent="#videoAccordion">
                                                <div class="accordion-body">
                                                    실제 부동산 분쟁 사례를 해 해결 정을 설명해드립니다.
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- 영상 3 -->
                                        <div class="accordion-item" style="background: rgba(255, 255, 255, 0.9); border-radius: 10px;">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
                                                        data-bs-target="#video3" data-video-id="VIDEO_ID_3"
                                                        onclick="changeVideo('VIDEO_ID_3')"
                                                        style="border-radius: 10px;">
                                                    채권추심 성공 노하우
                                                </button>
                                            </h2>
                                            <div id="video3" class="accordion-collapse collapse" data-bs-parent="#videoAccordion">
                                                <div class="accordion-body">
                                                    효과적인 채권추심을 위한 법적 절차와 노하우를 공유합니다.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 전문분야 섹션 -->
    <section id="expertise" class="py-6">
        <div class="container-fluid px-0">
            <div class="expertise-section" style="padding: 100px 0;">
                <!-- 배경 오버레이 -->
                <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.85);"></div>
                
                <div class="container position-relative" style="z-index: 1;">
                    <!-- 섹션 헤더 -->
                    <div class="row justify-content-center mb-5">
                        <div class="col-lg-8 text-center">
                            <h2 class="text-white display-4 mb-3" style="font-weight: 600;">전문분야</h2>
                            <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                        </div>
                    </div>
                    
                    <!-- 주요 전문분야 카드 -->
                    <div class="row g-4 mb-5">
                        <!-- 금전 소송 -->
                        <div class="col-md-4">
                            <div class="expertise-card h-100" 
                                 style="background: rgba(255, 255, 255, 0.05); 
                                        backdrop-filter: blur(10px);
                                        border: 1px solid rgba(255, 255, 255, 0.1);
                                        border-radius: 20px;
                                        padding: 50px 40px;
                                        transition: all 0.3s ease;">
                                <div class="text-center mb-5">
                                    <div class="icon-circle mb-4" 
                                         style="width: 100px; 
                                                height: 100px; 
                                                background: rgba(26, 35, 126, 0.1); 
                                                border-radius: 50%;
                                                display: inline-flex;
                                                align-items: center;
                                                justify-content: center;
                                                transition: all 0.3s ease;
                                                overflow: hidden;">
                                        <img src="/images/금전.png" alt="금전 소송" 
                                             style="width: 60%; 
                                                    height: 60%; 
                                                    object-fit: cover;
                                                    filter: brightness(0) invert(1);
                                                    opacity: 0.9;">
                                    </div>
                                    <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">금전 소송</h4>
                                </div>
                                <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">채권 추심</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">대여금 반환</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">투자금 회수</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">금융 쟁</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 부동산 소송 -->
                        <div class="col-md-4">
                            <div class="expertise-card h-100" 
                                 style="background: rgba(255, 255, 255, 0.05); 
                                        backdrop-filter: blur(10px);
                                        border: 1px solid rgba(255, 255, 255, 0.1);
                                        border-radius: 20px;
                                        padding: 50px 40px;
                                        transition: all 0.3s ease;">
                                <div class="text-center mb-5">
                                    <div class="icon-circle mb-4" 
                                         style="width: 100px; 
                                                height: 100px; 
                                                background: rgba(26, 35, 126, 0.1); 
                                                border-radius: 50%;
                                                display: inline-flex;
                                                align-items: center;
                                                justify-content: center;
                                                transition: all 0.3s ease;
                                                overflow: hidden;">
                                        <img src="/images/부동산.png" alt="부동산 소송" 
                                             style="width: 60%; 
                                                    height: 60%; 
                                                    object-fit: cover;
                                                    filter: brightness(0) invert(1);
                                                    opacity: 0.9;">
                                    </div>
                                    <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">부동산 소송</h4>
                                </div>
                                <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">임대차 분쟁</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">도급 소송</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">건축 분쟁</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">재건축/재개발</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 손해배상 청구 -->
                        <div class="col-md-4">
                            <div class="expertise-card h-100" 
                                 style="background: rgba(255, 255, 255, 0.05); 
                                        backdrop-filter: blur(10px);
                                        border: 1px solid rgba(255, 255, 255, 0.1);
                                        border-radius: 20px;
                                        padding: 50px 40px;
                                        transition: all 0.3s ease;">
                                <div class="text-center mb-5">
                                    <div class="icon-circle mb-4" 
                                         style="width: 100px; 
                                        height: 100px; 
                                        background: rgba(26, 35, 126, 0.1); 
                                        border-radius: 50%;
                                        display: inline-flex;
                                        align-items: center;
                                        justify-content: center;
                                        transition: all 0.3s ease;
                                        overflow: hidden;">
                                        <img src="/images/손해배상.png" alt="손해배상 청구" 
                                             style="width: 60%; 
                                                    height: 60%; 
                                                    object-fit: cover;
                                                    filter: brightness(0) invert(1);
                                                    opacity: 0.9;">
                                    </div>
                                    <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">손해배상 청구</h4>
                                </div>
                                <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">계약 분쟁</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">개인 간 손해배상</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">보험 분쟁</span>
                                        </div>
                                    </li>
                                    <li class="mb-4 text-white">
                                        <div class="expertise-item" 
                                             style="padding: 12px 20px;
                                                    background: rgba(26, 35, 126, 0.1);
                                                    border-radius: 12px;
                                                    transition: all 0.3s ease;">
                                            <span style="font-size: 1.2rem; opacity: 0.9;">의료 분쟁</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- FAQ 섹션 -->
                    <div class="row mt-5">
                        <div class="col-lg-8 mx-auto">
                            <h3 class="text-center mb-4 text-white" style="font-size: 2rem;">자주 묻는 질문</h3>
                            <div class="accordion" id="expertiseFAQ">
                                <div class="accordion-item border-0 mb-3">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button" 
                                                style="background: rgba(255, 255, 255, 0.05);
                                                       backdrop-filter: blur(10px);
                                                       border: 1px solid rgba(255, 255, 255, 0.1);
                                                       color: black;
                                                       border-radius: 15px;" 
                                                type="button" 
                                                data-bs-toggle="collapse" 
                                                data-bs-target="#faqOne">
                                        소송을 시작하려면 어떤 준비가 필요할까요?
                                    </button>
                                </h2>
                                <div id="faqOne" class="accordion-collapse collapse show" data-bs-parent="#expertiseFAQ">
                                    <div class="accordion-body" 
                                         style="background: rgba(255, 255, 255, 0.05);
                                                backdrop-filter: blur(10px);
                                                color: white;
                                                border-bottom-left-radius: 15px;
                                                border-bottom-right-radius: 15px;">
                                        <p>소송 준비를 위해 다음과 같은 자료들이 필요합니다:</p>
                                        <ul style="opacity: 0.9;">
                                            <li>관련 계약서 및 증빙서류</li>
                                            <li>사진, 영상 등 증거자료</li>
                                            <li>주고받은 메시지나 이메일</li>
                                            <li>기타 관련 문서들</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 성공 사례 및 고객 후기 섹션 -->
    <section id="cases" class="py-5" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.8)), url('/images/배경.jpg');
                    background-size: cover;
                    background-position: center;
                    background-attachment: fixed;
                    padding: 120px 0;
                    margin-top: 80px;  /* 상단 여백 추가 */
                    margin-bottom: 80px;">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="text-white display-4 mb-3" style="font-weight: 600;">주요 성공사례</h2>
                <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
            </div>
            
            <!-- 성공 사례 카드 -->
            <div class="row g-4 mb-5">
                <!-- 사례 1 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" style="background: rgba(255, 255, 255, 0.9);">
                        <div class="card-body">
                            <div class="case-badge mb-3">
                                <span class="badge bg-success">승소</span>
                                <span class="badge" style="background-color: #1a237e;">부동산</span>
                            </div>
                            <h5 class="card-title" style="color: #1a237e;">임대차보증금 반환 청구 승소</h5>
                            <p class="card-text">임대인의 보증금 반환 거부에 대해 적극 대응하여 전액 승소 판결을 이끌어냈습니다.</p>
                            <div class="case-details mt-3">
                                <small class="text-muted">
                                    <i class="fas fa-gavel me-2"></i>승소금액: 3억원<br>
                                    <i class="fas fa-calendar me-2"></i>소요기간: 6개월
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사례 2 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" style="background: rgba(255, 255, 255, 0.9);">
                        <div class="card-body">
                            <div class="case-badge mb-3">
                                <span class="badge bg-success">승소</span>
                                <span class="badge" style="background-color: #1a237e;">손상</span>
                            </div>
                            <h5 class="card-title" style="color: #1a237e;">교통사고 손해배상 청구</h5>
                            <p class="card-text">보험사의 부당한 보상액 산정에 대해 적극 대응하여 정당한 상을 받냈습니다.</p>
                            <div class="case-details mt-3">
                                <small class="text-muted">
                                    <i class="fas fa-gavel me-2"></i>승소금액: 1억 5천만원<br>
                                    <i class="fas fa-calendar me-2"></i>소요기간: 8개월
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사례 3 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" style="background: rgba(255, 255, 255, 0.9);">
                        <div class="card-body">
                            <div class="case-badge mb-3">
                                <span class="badge bg-success">승소</span>
                                <span class="badge bg-primary">금전</span>
                            </div>
                            <h5 class="card-title">투자금 사기 피해 구제</h5>
                            <p class="card-text">가상화폐 투자 사기로 인한 피해금액을 전액 회수하는데 성공했습니다.</p>
                            <div class="case-details mt-3">
                                <small class="text-muted">
                                    <i class="fas fa-gavel me-2"></i>승소금액: 2억원<br>
                                    <i class="fas fa-calendar me-2"></i>소요기간: 12개월
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 고객 후기 섹션 -->
            <div class="row mt-5">
                <div class="col-lg-10 mx-auto"> <!-- 너비를 col-lg-8에서 col-lg-10으로 증가 -->
                    <h3 class="text-center mb-4 text-white">고객 후기</h3>
                    <div id="reviewCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <!-- 첫 번째 후기 -->
                            <div class="carousel-item active">
                                <div class="testimonial-card p-5 rounded" style="background: rgba(255, 255, 255, 0.9); min-height: 300px;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="me-4 overflow-hidden" 
                                             style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid #1a237e;">
                                            <img src="/images/고객1번.jpg" alt="고객 이미지" 
                                                 style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                        <div>
                                            <h5 class="mb-1" style="color: #1a237e; font-size: 1.5rem;">이** 의뢰인</h5>
                                            <small class="text-muted" style="font-size: 1.1rem;">손해배상 청구</small>
                                        </div>
                                    </div>
                                    <p class="mb-0" style="color: #333; font-size: 1.2rem; line-height: 1.8;">
                                        "전문적인 법률 지식과 풍부한 경험을 바탕으로 최선의 결과를 
                                        이끌어내주셨습니다. 정말 감사드립니다."
                                    </p>
                                </div>
                            </div>
                            
                            <!-- 두 번째 후기 -->
                            <div class="carousel-item">
                                <div class="testimonial-card p-5 rounded" style="background: rgba(255, 255, 255, 0.9); min-height: 300px;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="me-4 overflow-hidden" 
                                             style="width: 80px; height: 80px; border-radius: 50%; border: 3px solid #1a237e;">
                                            <img src="/images/고객2번.jpg" alt="고객 이미지" 
                                                 style="width: 100%; height: 100%; object-fit: cover;">
                                        </div>
                                        <div>
                                            <h5 class="mb-1" style="color: #1a237e; font-size: 1.5rem;">김** 의뢰인</h5>
                                            <small class="text-muted" style="font-size: 1.1rem;">부동산 소송</small>
                                        </div>
                                    </div>
                                    <p class="mb-0" style="color: #333; font-size: 1.2rem; line-height: 1.8;">
                                        "처음부터 끝까지 세세하게 설명해주시고 진행상황을 꼼꼼하게 알려주셔서 
                                        믿고 맡길 수 있었습니다. 결과도 매우 만족스럽습니다."
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 캐러셀 컨트롤 크기 증가 -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev" style="width: 5%;">
                            <span class="carousel-control-prev-icon" style="filter: invert(1) brightness(0.5); width: 40px; height: 40px;"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next" style="width: 5%;">
                            <span class="carousel-control-next-icon" style="filter: invert(1) brightness(0.5); width: 40px; height: 40px;"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 법률정보 섹션 -->
    <section id="blog" class="py-5" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.8)), url('/images/배경.jpg');
                    background-size: cover;
                    background-position: center;
                    background-attachment: fixed;
                    padding: 120px 0;
                    margin-bottom: 80px;">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="text-white display-4 mb-3" style="font-weight: 600;">법률정보</h2>
                <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
            </div>

            <!-- 최신 법률 정보 -->
            <div class="row mb-5">
                <div class="col-lg-8 mx-auto">
                    <div class="latest-news p-5 rounded" 
                         style="background: rgba(26, 35, 126, 0.15);
                                backdrop-filter: blur(15px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                                margin-bottom: 50px; /* 하단 마진 증가 */
                                ">
                        <span class="badge mb-3" 
                              style="background-color: #1a237e;
                                     padding: 8px 15px;
                                     font-size: 0.9rem;">최신 업데이트</span>
                        <h4 class="text-white mb-3" 
                            style="font-size: 1.8rem;">2024년 달라지는 부동산 법률</h4>
                        <p class="text-white-50 mb-4" 
                           style="font-size: 1.1rem;">임대차보호법 개정안 시행에 따른 주요 변경항과 임대인/임차인이 알아야 할 내용을 정리했습니다.</p>
                        <a href="#" class="btn btn-outline-light">자세히 보기</a>
                    </div>
                </div>
            </div>

            <!-- 법률 정보 카드 -->
            <div class="row g-4">
                <!-- 법률 가이드 1 -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                transition: all 0.3s ease;">
                        <div class="card-body p-4">
                            <div class="category-badge mb-3">
                                <span class="badge" 
                                      style="background-color: #1a237e;
                                             padding: 8px 15px;">임대차 분쟁</span>
                            </div>
                            <h5 class="card-title text-white mb-3" 
                                style="font-size: 1.4rem;">임대차 분쟁 해결 가이드</h5>
                            <p class="card-text text-white-50 mb-4" 
                               style="font-size: 1.1rem;">보증금 반환, 계약 갱신, 수리비 부담 등 임대차 관련 주요 분쟁 사례와 해결방안을 소개합니다.</p>
                            <div class="article-meta">
                                <small class="text-white-50">
                                    <i class="fas fa-eye me-2"></i>조회수 1,234
                                    <i class="fas fa-calendar ms-3 me-2"></i>2024.01.15
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 법률 가이드 2 (동일한 스타일 적용) -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                transition: all 0.3s ease;">
                        <div class="card-body p-4">
                            <div class="category-badge mb-3">
                                <span class="badge" 
                                      style="background-color: #1a237e;
                                             padding: 8px 15px;">채권추심</span>
                            </div>
                            <h5 class="card-title text-white mb-3" 
                                style="font-size: 1.4rem;">채권 추심의 올바른 절차</h5>
                            <p class="card-text text-white-50 mb-4" 
                               style="font-size: 1.1rem;">합법적인 채 추심 방법과 채권자가 알아야 할 권리, 불�� 추심 대응 방안을 설명합니다.</p>
                            <div class="article-meta">
                                <small class="text-white-50">
                                    <i class="fas fa-eye me-2"></i>조회수 987
                                    <i class="fas fa-calendar ms-3 me-2"></i>2024.01.10
                                </small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 법률 가이드 3 (동일한 스타일 적용) -->
                <div class="col-md-4">
                    <div class="card h-100 border-0" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                transition: all 0.3s ease;">
                        <div class="card-body p-4">
                            <div class="category-badge mb-3">
                                <span class="badge" 
                                      style="background-color: #1a237e;
                                             padding: 8px 15px;">손해배상</span>
                            </div>
                            <h5 class="card-title text-white mb-3" 
                                style="font-size: 1.4rem;">손해배상액 산정 기준</h5>
                            <p class="card-text text-white-50 mb-4" 
                               style="font-size: 1.1rem;">각종 손배상 사건에서 배상액이 어떻게 산정되는지, 청구 가능한 범위를 알아봅니다.</p>
                            <div class="article-meta">
                                <small class="text-white-50">
                                    <i class="fas fa-eye me-2"></i>조회수 856
                                    <i class="fas fa-calendar ms-3 me-2"></i>2024.01.05
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 상담예약 섹션 -->
    <section id="contact" class="py-5" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.95)), url('/images/배경.jpg');
                    background-size: cover;
                    background-position: center;
                    background-attachment: fixed;
                    padding: 120px 0;">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="text-white display-4 mb-3" style="font-weight: 600;">상담 예약</h2>
                <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
            </div>

            <div class="row">
                <!-- 상담 예약 폼 (왼쪽) -->
                <div class="col-lg-6 mb-4">
                    <div class="card border-0" 
                         style="background: rgba(255, 255, 255, 0.08);
                                backdrop-filter: blur(15px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                                transition: all 0.3s ease;">
                        <div class="card-body p-5">
                            <h4 class="card-title mb-4 text-white">상담 예약하기</h4>
                            <form id="consultationForm">
                                <!-- 상담 종류 선택 -->
                                <div class="mb-4">
                                    <label class="form-label text-white">상담 종류</label>
                                    <div class="d-flex gap-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="consultationType" id="online" checked
                                                   style="border-color: rgba(255, 255, 255, 0.5);">
                                            <label class="form-check-label text-white" for="online">온라인 상담</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="consultationType" id="offline"
                                                   style="border-color: rgba(255, 255, 255, 0.5);">
                                            <label class="form-check-label text-white" for="offline">방문 상담</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- 기본 정보 입력 -->
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-white">성함</label>
                                        <input type="text" class="form-control" required
                                               style="background: rgba(255, 255, 255, 0.05);
                                                      border: 1px solid rgba(255, 255, 255, 0.1);
                                                      color: white;">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-white">연락처</label>
                                        <input type="tel" class="form-control" required
                                               style="background: rgba(255, 255, 255, 0.05);
                                                      border: 1px solid rgba(255, 255, 255, 0.1);
                                                      color: white;">
                                    </div>
                                </div>

                                <!-- 상담 분야 선택 -->
                                <div class="mb-3">
                                    <label class="form-label text-white">상담 분야</label>
                                    <select class="form-select" 
                                            style="background: rgba(255, 255, 255, 0.05);
                                                   border: 1px solid rgba(255, 255, 255, 0.1);
                                                   color: white;">
                                        <option selected style="background: #1a237e;">상담 분야를 선택해주세요</option>
                                        <option style="background: #1a237e;">금전 소송</option>
                                        <option style="background: #1a237e;">부동산 소송</option>
                                        <option style="background: #1a237e;">손해배상 청구</option>
                                    </select>
                                </div>

                                <!-- 상담 일시 선택 -->
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-white">희망 상담일</label>
                                        <input type="date" class="form-control" required
                                               style="background: rgba(255, 255, 255, 0.05);
                                                      border: 1px solid rgba(255, 255, 255, 0.1);
                                                      color: white;">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label text-white">희망 시간</label>
                                        <select class="form-select"
                                               style="background: rgba(255, 255, 255, 0.05);
                                                      border: 1px solid rgba(255, 255, 255, 0.1);
                                                      color: white;">
                                            <option style="background: #1a237e;">오전 9:00</option>
                                            <option style="background: #1a237e;">오전 10:00</option>
                                            <option style="background: #1a237e;">오전 11:00</option>
                                            <option style="background: #1a237e;">오후 2:00</option>
                                            <option style="background: #1a237e;">오후 3:00</option>
                                            <option style="background: #1a237e;">오후 4:00</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- 상담 내용 -->
                                <div class="mb-4">
                                    <label class="form-label text-white">상담 내용</label>
                                    <textarea class="form-control" rows="4" 
                                              placeholder="상담하실 내용을 간단히 적어주세요."
                                              style="background: rgba(255, 255, 255, 0.05);
                                                     border: 1px solid rgba(255, 255, 255, 0.1);
                                                     color: white;"></textarea>
                                </div>

                                <!-- 개정보 동의 -->
                                <div class="mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="privacyAgree" required
                                               style="border-color: rgba(255, 255, 255, 0.5);">
                                        <label class="form-check-label text-white" for="privacyAgree">
                                            개인정보 수집 및 이용에 동의합니다.
                                        </label>
                                    </div>
                                </div>

                                <button type="submit" class="btn w-100" 
                                        style="background-color: #1a237e;
                                               color: white;
                                               padding: 12px;
                                               font-size: 1.1rem;
                                               transition: all 0.3s ease;">예약하기</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- 통합된 카오톡 상담 & 오시는 길 정보 (오른쪽) -->
                <div class="col-lg-6">
                    <div class="card border-0 h-100" 
                         style="background: rgba(255, 255, 255, 0.08);
                                backdrop-filter: blur(15px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);">
                        <div class="card-body p-5">
                            <!-- 카카오톡 상담 섹션 -->
                            <div class="mb-5">
                                <h4 class="text-white mb-4">카카오톡 상담</h4>
                                <div class="d-flex align-items-center mb-4">
                                    <img src="/images/kakao-icon.png" alt="카카오톡 아이콘" 
                                         style="width: 40px; height: 40px; margin-right: 15px;">
                                    <div>
                                        <p class="text-white mb-1">실시간 상담 가능</p>
                                        <p class="text-white-50 mb-0">평일 09:00 - 18:00</p>
                                    </div>
                                </div>
                                <a href="#" class="btn btn-warning w-100 mb-4">
                                    카카오톡 상담하기
                                </a>
                            </div>

                            <!-- 구분선 -->
                            <hr style="border-color: rgba(255, 255, 255, 0.1);" class="my-4">

                            <!-- 오시는 길 섹션 -->
                            <div class="mt-5">
                                <h4 class="text-white mb-4">오시는 길</h4>
                                <div class="mb-4">
                                    <p class="text-white mb-2">
                                        <i class="fas fa-map-marker-alt me-2"></i>
                                        서울특별시 강남구 테헤란로 123
                                    </p>
                                    <p class="text-white-50 mb-3">법무법인 최과믿음</p>
                                </div>
                                <div class="mb-4">
                                    <p class="text-white mb-2">
                                        <i class="fas fa-subway me-2"></i>
                                        지하철
                                    </p>
                                    <p class="text-white-50">2호선 강남역 3번 출구 도보 5분</p>
                                </div>
                                <div>
                                    <p class="text-white mb-2">
                                        <i class="fas fa-phone me-2"></i>
                                        연락처
                                    </p>
                                    <p class="text-white-50">02-123-4567</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 카카오톡 고정 버튼 추가 (body 태그 안, footer 위에 추가) -->
    <a href="https://kakao.com/채널URL" 
        target="_blank" 
        class="kakao-btn" 
        title="카카오톡 상담하기">
         <img src="/images/카카오톡.png" alt="카카오톡 상담" class="kakao-icon">
     </a>

    <!-- 푸터 섹션 -->
    <footer class="footer py-5" 
            style="background: linear-gradient(rgba(0, 0, 0, 0.95), rgba(0, 0, 0, 0.98));
                   border-top: 1px solid rgba(255, 255, 255, 0.1);">
        <div class="container">
            <div class="row g-4">
                <!-- 로고 및 간단한 소개 -->
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <h5 class="text-white mb-4" style="font-size: 1.5rem; font-weight: 600;">
                        강진태 법률사무소
                    </h5>
                    <p class="text-white-50 mb-4" style="font-size: 1.1rem; line-height: 1.8;">
                        정직과 신뢰를 바탕으로 의뢰의 권리를 키는 든든한 법률 파트너가 되겠습니다.
                    </p>
                    <div class="social-links">
                        <a href="#" class="me-3 text-white-50 hover-effect">
                            <i class="fab fa-facebook-f fa-lg"></i>
                        </a>
                        <a href="#" class="me-3 text-white-50 hover-effect">
                            <i class="fab fa-instagram fa-lg"></i>
                        </a>
                        <a href="#" class="me-3 text-white-50 hover-effect">
                            <i class="fab fa-youtube fa-lg"></i>
                        </a>
                        <a href="#" class="text-white-50 hover-effect">
                            <i class="fab fa-blog fa-lg"></i>
                        </a>
                    </div>
                </div>

                <!-- 빠른 링크 -->
                <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                    <h6 class="text-white mb-4" style="font-size: 1.2rem;">바로가기</h6>
                    <ul class="list-unstyled">
                        <li class="mb-3">
                            <a href="#about" class="text-white-50 text-decoration-none hover-effect">변호사 소개</a>
                        </li>
                        <li class="mb-3">
                            <a href="#expertise" class="text-white-50 text-decoration-none hover-effect">전문분야</a>
                        </li>
                        <li class="mb-3">
                            <a href="#cases" class="text-white-50 text-decoration-none hover-effect">성공사례</a>
                        </li>
                        <li class="mb-3">
                            <a href="#blog" class="text-white-50 text-decoration-none hover-effect">법률정보</a>
                        </li>
                        <li>
                            <a href="#contact" class="text-white-50 text-decoration-none hover-effect">상담예약</a>
                        </li>
                    </ul>
                </div>

                <!-- 연락처 정보 -->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                    <h6 class="text-white mb-4" style="font-size: 1.2rem;">연락처</h6>
                    <div class="contact-info">
                        <p class="text-white-50 mb-3">
                            <i class="fas fa-map-marker-alt me-2"></i>
                            서울특별시 강남구 테헤란로 123
                        </p>
                        <p class="text-white-50 mb-3">
                            <i class="fas fa-phone me-2"></i>
                            02-123-4567
                        </p>
                        <p class="text-white-50 mb-3">
                            <i class="fas fa-fax me-2"></i>
                            02-123-4568
                        </p>
                        <p class="text-white-50">
                            <i class="fas fa-envelope me-2"></i>
                            contact@lawfirm.com
                        </p>
                    </div>
                </div>

                <!-- 운영시간 -->
                <div class="col-lg-3 col-md-6">
                    <h6 class="text-white mb-4" style="font-size: 1.2rem;">운영시간</h6>
                    <div class="office-hours">
                        <p class="text-white-50 mb-2">평일: 09:00 - 18:00</p>
                        <p class="text-white-50 mb-2">토요: 09:00 - 13:00</p>
                        <p class="text-white-50 mb-4">일요일/공휴일: 휴무</p>
                        <div class="consultation-btn" style="padding: 0;">
                            <a href="#contact" 
                               class="btn btn-outline-light" 
                               style="width: 100%; 
                                      text-align: center; 
                                      padding: 10px 0;">
                                상담 예약하기
                                <i class="fas fa-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 구분선 -->
            <hr class="my-5" style="border-color: rgba(255, 255, 255, 0.1);">

            <!-- 카피라이트 섹션 수정 -->
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="text-white-50 mb-0">
                        © 2024 강진태 법률사무소. All rights reserved.
                    </p>
                </div>
                <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                    <a href="#" class="text-white-50 text-decoration-none me-4">개인정보처리방침</a>
                    <a href="#" class="text-white-50 text-decoration-none me-4">이용약관</a>
                    <a href="/admin/hero-section" class="text-white-50 text-decoration-none">관리자</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 히어로 콘텐츠 페이드인 효과
        setTimeout(function() {
            document.querySelector('.hero-content').classList.add('active');
        }, 500);
        
        // 스크롤 다운 버튼 클릭 이벤트
        document.querySelector('.scroll-down').addEventListener('click', function() {
            const nextSection = document.querySelector('#about');
            nextSection.scrollIntoView({ behavior: 'smooth' });
        });
        
        // 스크롤 이벤트 처리
        let isScrolling = false;
        window.addEventListener('wheel', function(e) {
            if (!isScrolling && window.scrollY === 0 && e.deltaY > 0) {
                isScrolling = true;
                const nextSection = document.querySelector('#about');
                nextSection.scrollIntoView({ behavior: 'smooth' });
                setTimeout(() => { isScrolling = false; }, 1000);
            }
        });
    });

    function changeVideo(videoId) {
        const videoPlayer = document.getElementById('videoPlayer');
        videoPlayer.src = `https://www.youtube.com/embed/${videoId}`;
    }

    // 아코디언 클릭 시 비디오 변경
    document.querySelectorAll('.accordion-button').forEach(button => {
        button.addEventListener('click', function() {
            const videoId = this.getAttribute('data-video-id');
            changeVideo(videoId);
        });
    });

    // 스크롤 시 부드러운 애니메이션 효과
    window.addEventListener('scroll', function() {
        const kakaoBtn = document.querySelector('.kakao-btn');
        if (window.scrollY > 300) {
            kakaoBtn.style.opacity = '1';
        } else {
            kakaoBtn.style.opacity = '0.8';
        }
    });
    </script>
</body>
</html>
