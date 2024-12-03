<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전문 변호사 소개 사이트</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="32x32" href="/images/wbclogotab.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/images/wbclogotab.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/images/wbclogotab.png">
    <link rel="manifest" href="/site.webmanifest">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/achievements.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- AOS CSS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <script>

    </script>
</head>
<body>
    <!-- body 태그 바로 아래에 배경 div 추가 -->
    <div class="global-background"></div>

    <!-- 네비게이션 바 -->
    <nav class="navbar navbar-expand-lg fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="/" 
               style="font-family: 'MaruBuriBold'; 
                      font-size: 1.5rem;
                      color: #fff;
                      opacity: 0.9;
                      transition: all 0.3s ease;">
                WBC 법률사무소
            </a>
            
            <button class="navbar-toggler" type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#navbarResponsive" 
                    aria-controls="navbarResponsive" 
                    aria-expanded="false" 
                    aria-label="Toggle navigation"
                    style="border: none;">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#about" onclick="scrollToSection('about')">변호사 소개</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#philosophy" onclick="scrollToSection('philosophy')">변호사 신조</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#expertise" onclick="scrollToSection('expertise')">전문분야</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#cases" onclick="scrollToSection('cases')">성공사례</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact" onclick="scrollToSection('contact')">상담문의</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 히어로 섹션 -->
    <section id="hero" class="position-relative min-vh-100 d-flex align-items-center" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 0.9)), url('/images/배경.jpg');
                    background-size: cover;
                    background-position: center;
                    overflow: hidden;
                    padding: 80px 0;">
        
        <div class="container position-relative" style="z-index: 2;">
            <!-- 데스크톱 레이아웃 -->
            <div class="row align-items-center justify-content-between desktop-layout">
                <div class="col-lg-7">
                    <div class="hero-content">
                        <h1 class="text-white mb-4 hero-title">
                            ${heroSection.lawyerName}
                        </h1>
                        <div class="subtitle-wrapper">
                            <p class="lead text-white hero-subtitle d-none d-md-block">
                                ${heroSection.subtitleLine1} ${heroSection.subtitleLine2}
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-5">
                    <div class="hero-images">
                        <div class="profile-image-wrapper position-relative">
                            <div class="profile-backdrop"></div>
                            <img src="${heroSection.profileImage}" alt="변호사 프로필" 
                                 class="profile-image">
                        </div>
                        <div class="logos-wrapper">
                            <img src="${heroSection.universityLogo}" alt="대학 로고" class="logo-image">
                            <img src="${heroSection.companyLogo}" alt="로펌 로고" class="logo-image">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 모바일 레이아웃 -->
            <div class="row flex-column align-items-center text-center mobile-layout">
                <div class="col-12 mb-4">
                    <h1 class="text-white hero-title-mobile">
                        ${heroSection.lawyerName}
                    </h1>
                </div>
                <div class="col-12 mb-4">
                    <p class="lead text-white mobile-subtitle d-md-none">
                        ${heroSection.subtitleLine1} ${heroSection.subtitleLine2}
                    </p>
                </div>
                <div class="col-12">
                    <div class="profile-container position-relative mx-auto">
                        <img src="${heroSection.profileImage}" alt="변호사 프로필" 
                             class="mobile-profile-image">
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <div class="mobile-logos d-flex justify-content-center align-items-center gap-4">
                        <img src="${heroSection.universityLogo}" alt="대학 로고" class="mobile-logo">
                        <img src="${heroSection.companyLogo}" alt="로펌 로고" class="mobile-logo">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 변호사 소개 섹션 -->
    <section id="about" class="py-6">
        <div class="about-section">
            <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.85);"></div>
            
            <div class="container position-relative">
                <!-- 섹션 헤더 -->
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <h6 class="text-primary fw-bold mb-3" 
                            style="font-family: 'GmarketSansMedium'; 
                                   letter-spacing: 2px;
                                   color: rgba(255,255,255,0.9) !important;">
                            ABOUT
                        </h6>
                        <h2 class="display-4 text-white mb-4" 
                            style="font-family: 'MaruBuriBold';">
                            변호사 소개
                        </h2>
                        <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                    </div>
                </div>

                <!-- 프로필 컨텐츠 -->
                <div class="row g-4">
                    <div class="col-lg-4">
                        <div class="profile-card h-100" 
                             style="background: rgba(255, 255, 255, 0.05);
                                    backdrop-filter: blur(10px);
                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                    border-radius: 20px;
                                    padding: 2.5rem;
                                    transition: all 0.3s ease;">
                            <img src="${heroSection.profileImage}" alt="최 선 변호사" class="mb-4" style="width: 100%; max-width: 320px;">
                            <h3 class="mb-2 text-white" style="font-size: 2.5rem;">최선 변호사</h3>
                            <p class="text-light mb-3" style="font-size: 1.2rem; opacity: 0.9;">민사전문 / 대한변호사협회</p>
                        </div>
                    </div>
                    <!-- 경력 리스트 -->
                    <div class="col-lg-3">
                        <div class="career-list">
                            <h2 class="text-white mb-4">주요 경력</h2>
                            <ul class="career-items">
                                <li class="career-item">
                                    <div class="career-content">
                                        <h6 class="career-title">법무법인 WBC 변호사</h6>
                                        <small class="career-period">2020 - 현재</small>
                                    </div>
                                </li>
                                <li class="career-item">
                                    <div class="career-content">
                                        <h6 class="career-title">서울중앙지방법원 부장판사</h6>
                                        <small class="career-period">2015 - 2020</small>
                                    </div>
                                </li>
                                <li class="career-item">
                                    <div class="career-content">
                                        <h6 class="career-title">사법연수원 교수</h6>
                                        <small class="career-period">2013 - 2015</small>
                                    </div>
                                </li>
                                <li class="career-item">
                                    <div class="career-content">
                                        <h6 class="career-title">인천지방법원 부장판사</h6>
                                        <small class="career-period">2010 - 2013</small>
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
                                <p style="font-size: 1.1rem;">저는 다양한 사건을 통해 쌓아 경험과 노하우로 고객님의 법적 문제를 신속하고 정확하게 해결해 드리는 것을 목표로 하고 있습니다.</p>
                                <p style="font-size: 1.1rem;">모든 사건은 각자의 신중한 인생이 걸린 문제라고 생각하며, 철저한 분석과 꼼꼼한 준비로 고객님의 권리를 끝까지 지켜드리겠습니다.</p>
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

                    <!-- 세부 경력사항 섹션 -->
                    <div class="detailed-career-section mt-5">
                        <h3 class="text-white text-center mb-5" style="font-size: 2.5rem; font-weight: 600;">
                            <span class="highlight-text">세부 경력사항</span>
                        </h3>

                        <!-- 학력 및 소속 섹션 -->
                        <section class="education-affiliation py-5">
                            <div class="container">
                                <div class="row align-items-center">
                                    <!-- 학력 정보 (왼쪽) -->
                                    <div class="col-md-6 education-section">
                                        <div class="education-card">
                                            <div class="d-flex align-items-center">
                                                <div class="university-logo-wrapper me-4">
                                                    <img src="/images/대학로고투명.png" alt="연세대학교" class="university-logo" style="width: 80px; height: auto;">
                                                </div>
                                                <div class="education-details">
                                                    <h3 class="text-white mb-2">연세대학교 법학전문대학원</h3>
                                                    <div class="education-info">
                                                        <span class="degree-badge me-2">법학박사</span>
                                                        <span class="year-badge">2005 - 2008</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 구분선 -->
                                    <div class="col-md-1 d-none d-md-block">
                                        <div class="vertical-divider"></div>
                                    </div>

                                    <!-- 현재 소속 (오른쪽) -->
                                    <div class="col-md-5 affiliation-section">
                                        <div class="affiliation-card">
                                            <div class="d-flex align-items-center">
                                                <div class="law-firm-logo-wrapper me-4">
                                                    <img src="/images/회사로고.png" alt="법무법인" class="law-firm-logo" style="width: 200px; height: auto;">
                                                </div>
                                                <div class="affiliation-details">
                                                    <h3 class="text-white mb-2">법무법인 최선</h3>
                                                    <div class="position-info">
                                                        <span class="position-badge me-2">대표변호사</span>
                                                        <span class="year-badge">2020 - 현재</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        
                        <div class="career-categories">
                            <!-- 학술 경력 -->
                            <div class="career-category academic">
                                <div class="category-icon">
                                    <i class="fas fa-university"></i>
                                </div>
                                <h4 class="category-title">학술 활동</h4>
                                <div class="career-items">
                                    <div class="career-item">
                                        <div class="year-badge">2022 - 현재</div>
                                        <div class="career-content">
                                            <h5>한국민사법학회</h5>
                                            <p>이사</p>
                                        </div>
                                    </div>
                                    <div class="career-item">
                                        <div class="year-badge">2021 - 현재</div>
                                        <div class="career-content">
                                            <h5>한국부동산법학회</h5>
                                            <p>상임이사</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- 자문 위원회 -->
                            <div class="career-category advisory">
                                <div class="category-icon">
                                    <i class="fas fa-balance-scale"></i>
                                </div>
                                <h4 class="category-title">자문 위원회</h4>
                                <div class="career-items">
                                    <div class="career-item">
                                        <div class="year-badge">2023 - 현재</div>
                                        <div class="career-content">
                                            <h5>대한상사중재원</h5>
                                            <p>중재인</p>
                                        </div>
                                    </div>
                                    <div class="career-item">
                                        <div class="year-badge">2022 - 현재</div>
                                        <div class="career-content">
                                            <h5>금융감독원</h5>
                                            <p>법률자문위원</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                            <!-- 공공기관 -->
                            <div class="career-category public">
                                <div class="category-icon">
                                    <i class="fas fa-landmark"></i>
                                </div>
                                <h4 class="category-title">공공기관</h4>
                                <div class="career-items">
                                    <div class="career-item">
                                        <div class="year-badge">2023 - 현재</div>
                                        <div class="career-content">
                                            <h5>서울중앙지방법원</h5>
                                            <p>조정위원</p>
                                        </div>
                                    </div>
                                    <div class="career-item">
                                        <div class="year-badge">2022 - 현재</div>
                                        <div class="career-content">
                                            <h5>법무부</h5>
                                            <p>민사법 개정위원회 자문위원</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 업적 섹션 -->
                        <section id="achievements" class="py-6">
                            <div class="container">
                                <div class="text-center mb-5">
                                    <h6 class="text-primary fw-bold mb-3">ACHIEVEMENTS</h6>
                                    <h2 class="display-4 text-white mb-4">주요 업적 및 수상경력</h2>
                                    <div class="divider mx-auto"></div>
                                </div>

                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <div class="accordion" id="awardsAccordion">
                                            <div class="accordion-item bg-dark text-white">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#awards">
                                                        <i class="fa-solid fa-award me-3"></i>수상
                                                    </button>
                                                </h2>
                                                <div id="awards" class="accordion-collapse collapse" data-bs-parent="#awardsAccordion">
                                                    <div class="accordion-body">
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023</span>
                                                            <p>[대한변협] 2023 우수 민사전문 변호사상</p>
                                                            <p>[법률신문] 올해의 부동산 전문 로펌 선정</p>
                                                            <p>[서울지방변호사회] 공익법률상 수상</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2022</span>
                                                            <p>[법무부] 우수 법률서비스 제공 표창</p>
                                                            <p>[대한상사중재원] 우수 중재인상</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2021</span>
                                                            <p>[서울중앙지방법원] 우수 조정위원상</p>
                                                            <p>[한국부동산법학회] 학술공헌상</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="accordion" id="publicationsAccordion">
                                            <div class="accordion-item bg-dark text-white">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#publications">
                                                        <i class="fa-solid fa-book-open me-3"></i>논문/출판
                                                    </button>
                                                </h2>
                                                <div id="publications" class="accordion-collapse collapse" data-bs-parent="#publicationsAccordion">
                                                    <div class="accordion-body">
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023</span>
                                                            <p>「민사소송법상 증거개시제도의 실무적 쟁점」, 법조협회</p>
                                                            <p>「디지털 증거의 증거능력 판단기준에 관한 연구」, 법학연구</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2022</span>
                                                            <p>「부동산 경매절차에서의 채권자 보호방안」, 민사법학</p>
                                                            <p>「채권추심 실무가이드」, 법률출판사</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="accordion" id="pressAccordion">
                                            <div class="accordion-item bg-dark text-white">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#press">
                                                        <i class="fa-solid fa-newspaper me-3"></i>보도
                                                    </button>
                                                </h2>
                                                <div id="press" class="accordion-collapse collapse" data-bs-parent="#pressAccordion">
                                                    <div class="accordion-body">
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023.12</span>
                                                            <p>[법률신문] 법무법인 최선, '2023 올해의 민사전문 로펌' 선정</p>
                                                            <p>[연합뉴스] 최선 변호사, 대한변협 '우수 변호사상' 수상</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023.09</span>
                                                            <p>[법률저널] 부동산 분쟁해결의 새로운 패러다임 제시한 최선 변호사</p>
                                                            <p>[매일경제] 채권추심 성공률 94%, 법무법인 최선의 차별화 전략</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023.06</span>
                                                            <p>[중앙일보] "의뢰인의 승소가 곧 나의 성공" - 최선 변호사 인터뷰</p>
                                                            <p>[법률방송] 디지털 증거 수집의 새로운 지평을 연 최선 변호사</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="accordion" id="otherAccordion">
                                            <div class="accordion-item bg-dark text-white">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button bg-dark text-white" type="button" data-bs-toggle="collapse" data-bs-target="#other">
                                                        <i class="fa-solid fa-graduation-cap me-3"></i>기타
                                                    </button>
                                                </h2>
                                                <div id="other" class="accordion-collapse collapse" data-bs-parent="#otherAccordion">
                                                    <div class="accordion-body">
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2023 - 현재</span>
                                                            <p>대한변호사협회 민사법 연구위원회 위원</p>
                                                            <p>서울중앙지방법원 조정위원</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2022</span>
                                                            <p>한국부동산법학회 정회원</p>
                                                            <p>대형 건설사 법률자문 위원</p>
                                                            <p>금융감독원 법률자문단</p>
                                                        </div>
                                                        <div class="mb-3">
                                                            <span class="badge bg-primary mb-2">2021</span>
                                                            <p>민사집행법 실무연구회 회장</p>
                                                            <p>대한변호사협회 민사소송법 개정위원회 위원</p>
                                                            <p>법무부 민사법 개정위원회 자문위원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 변호사의 신조 및 인터뷰 섹션 -->
    <section id="philosophy" class="py-6 position-relative">
        <div class="philosophy-background"></div>
        <div class="container position-relative" style="z-index: 2;">
            <!-- 섹션 헤더 -->
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h6 class="text-primary fw-bold mb-3" 
                        style="font-family: 'GmarketSansMedium'; 
                               letter-spacing: 2px;
                               color: rgba(255,255,255,0.9) !important;">
                        CONVICTION
                    </h6>
                    <h2 class="display-4 text-white mb-4" 
                        style="font-family: 'MaruBuriBold';">
                        변호사의 신조
                    </h2>
                    <div class="section-divider bg-light opacity-25 mx-auto"></div>
                </div>
            </div>

            <!-- 변호사 철학 -->
            <div class="row mb-7 justify-content-center">
                <div class="col-lg-10">
                    <div class="philosophy-cards">
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="philosophy-card" style="background-image: url('/images/신조1.png');">
                                    <div class="content-wrapper">
                                        <div class="card-number">01</div>
                                        <h3 class="card-title">절대 어렵지 않습니다.</h3>
                                        <p class="card-text">
                                            "지금 가지고 계신 문제 걱정하지마시고, 어렵지 않게 함께 나아가시면 됩니다."
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="philosophy-card" style="background-image: url('/images/신조2.png');">
                                    <div class="content-wrapper">
                                        <div class="card-number">02</div>
                                        <h3 class="card-title">전문가에게 맡기셔야 합니다.</h3>
                                        <p class="card-text">
                                            "해당 분야에 대해서, 심도 깊게 알고 있는 전문가에게 맡기셔야 합니다."
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 인터뷰 영상 섹션 -->
            <div class="row align-items-center g-4">
                <div class="col-lg-6" data-aos="fade-right">
                    <div class="video-container mb-4">
                        <div class="ratio ratio-16x9">
                            <iframe id="videoPlayer" 
                                src="https://www.youtube.com/embed/${videoSection.videos[0].videoId}"
                                title="YouTube video player" 
                                frameborder="0" 
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                                    allowfullscreen>
                            </iframe>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6" data-aos="fade-left">
                    <div class="video-content">
                        <h3 class="text-white mb-4">${videoSection.mainTitle}</h3>
                        <div class="video-buttons">
                            <c:forEach items="${videoSection.videos}" var="video" varStatus="status">
                                <div class="video-button ${status.index == 0 ? 'active' : ''}" 
                                     data-video-id="${video.videoId}">
                                    <span class="video-number">0${status.index + 1}</span>
                                    <div class="video-info">
                                        <h4>${video.title}</h4>
                                        <p>${video.description}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 전문분야 섹션 -->
    <section id="expertise" class="py-6">
        <div class="expertise-section">
            <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.85);"></div>
            
            <div class="container position-relative">
                <!-- 섹션 헤더 -->
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <h6 class="text-primary fw-bold mb-3" 
                            style="font-family: 'GmarketSansMedium'; 
                                   letter-spacing: 2px;
                                   color: rgba(255,255,255,0.9) !important;">
                            EXPERTISE
                        </h6>
                        <h2 class="display-4 text-white mb-4" 
                            style="font-family: 'MaruBuriBold';">
                            전문분야
                        </h2>
                        <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                    </div>
                </div>

                <!-- 전문분야 카드 -->
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="expertise-card h-100">
                            <div class="text-center mb-5">
                                <div class="icon-circle mb-4">
                                    <img src="/images/금전.png" alt="금전 소송">
                                </div>
                                <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">금전 소송</h4>
                                <!-- 진행 사건 수 추 -->
                                <div class="case-count mb-4">
                                    <span class="count-number" data-count="387">0</span>
                                    <span class="count-text text-white-50 d-block">진행 사건</span>
                                </div>
                                <div class="success-rate mb-4">
                                    <span class="rate-number" data-rate="94.2">0.0%</span>
                                    <span class="rate-text text-white-50 d-block">승소율</span>
                                </div>
                            </div>
                            <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">채권 추심</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 156건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">여금 반환</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 98건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">투자금 회수</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 76건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">투자금 분쟁</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 57건</small>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- 손해배상 청구 카드 -->
                    <div class="col-md-4">
                        <div class="expertise-card h-100">
                            <div class="text-center mb-5">
                                <div class="icon-circle mb-4">
                                    <img src="/images/손해배상.png" alt="손해배상 청구">
                                </div>
                                <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">손해배상 청구</h4>
                                <!-- 진행 사건 수 추가 -->
                                <div class="case-count mb-4">
                                    <span class="count-number" data-count="312">0</span>
                                    <span class="count-text text-white-50 d-block">진행 사건</span>
                                </div>
                                <div class="success-rate mb-4">
                                    <span class="rate-number" data-rate="93.5">0.0%</span>
                                    <span class="rate-text text-white-50 d-block">승소율</span>
                                </div>
                            </div>
                            <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">계약 분쟁</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 123건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">교통사고</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 95건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">의료 사고</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 54건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">명예훼손</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 40건</small>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="expertise-card h-100">
                            <div class="text-center mb-5">
                                <div class="icon-circle mb-4">
                                    <img src="/images/부동산.png" alt="부동산 소송">
                                </div>
                                <h4 class="text-white mb-4" style="font-size: 1.8rem; font-weight: 600;">부동산 소송</h4>
                                <!-- 진행 사건 수 추가 -->
                                <div class="case-count mb-4">
                                    <span class="count-number" data-count="245">0</span>
                                    <span class="count-text text-white-50 d-block">진행 사건</span>
                                </div>
                                <div class="success-rate mb-4">
                                    <span class="rate-number" data-rate="92.8">0.0%</span>
                                    <span class="rate-text text-white-50 d-block">승소율</span>
                                </div>
                            </div>
                            <ul class="list-unstyled text-center" style="margin: 0 auto; max-width: 80%;">
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">임대차 분쟁</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 89건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">도급 소송</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 67건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">건축 분쟁</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 52건</small>
                                    </div>
                                </li>
                                <li class="mb-4 text-white">
                                    <div class="expertise-item">
                                        <span style="font-size: 1.2rem; opacity: 0.9;">재건축/재개발</span>
                                        <small class="d-block text-white-50" style="font-size: 0.8rem;">진행사건 37건</small>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    


                <!-- FAQ 섹션 -->
                <section class="faq-section">
                    <div class="container faq-container">
                        <h3 class="text-white text-center mb-5">
                            <span class="highlight-text">자주 묻는 질문</span>
                        </h3>
                        
                        <div class="faq-list">
                            <div class="faq-item">
                                <div class="faq-question">
                                    법률상담은 어떤 방식으로 진행되나요?
                                </div>
                                <div class="faq-answer">
                                    <p>초기 상담은 전화 또는 온라인으로 진행되며, 사건의 복잡성에 따라 대면 상담으로 전환될 수 있습니다. 상담 시에는 관련 서류를 준비해 주시면 더욱 정확한 상담이 가능합니다.</p>
                                </div>
                            </div>
                            
                            <!-- 추가 FAQ 항목들 -->
                            <div class="faq-item">
                                <div class="faq-question">
                                    법률비용은 어떻게 산정되나요?
                                </div>
                                <div class="faq-answer">
                                    <p>사건의 난이도, 소요시간, 중요도 등을 종합적으로 고려하여 책정됩니다. 정확한 비용은 초기 상담 후 안내해 드립니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>

    <!-- 성공 사례 및 고객 후기 섹션 -->
    <section id="cases" class="py-5" 
             style="background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.8)), url('/images/배경.jpg');
                    background-size: cover;
                    background-position: center;
                    background-attachment: fixed;
                    padding: 120px 0;">
        <div class="container">
                <!-- 섹션 헤더 -->
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <h6 class="text-primary fw-bold mb-3" 
                            style="font-family: 'GmarketSansMedium'; 
                                   letter-spacing: 2px;
                                   color: rgba(255,255,255,0.9) !important;">
                            NOTABLE ACHIEVEMENTS
                        </h6>
                        <h2 class="display-4 text-white mb-4" 
                            style="font-family: 'MaruBuriBold';">
                            주요 성공사례
                        </h2>
                        <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                    </div>
                </div>
            
            <!-- 성공 사례 카드 -->
            <div class="row g-4 mb-5">
                <!-- 사례 1 -->
                <div class="col-md-4">
                    <div class="case-card h-100" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                border-radius: 20px;
                                padding: 30px;
                                transition: all 0.3s ease;">
                        <div class="case-badge mb-3">
                            <span class="badge" 
                                  style="background-color: #4CAF50;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">승소</span>
                            <span class="badge" 
                                  style="background-color: #1a237e;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">부동산</span>
                        </div>
                        <div class="case-image-container mb-4" style="height: 200px; overflow: hidden; border-radius: 10px;">
                            <img src="/images/case1.jpg" 
                                 alt="부동산 승소사례" 
                                 style="width: 100%; 
                                        height: 100%; 
                                        object-fit: cover; 
                                        object-position: center;">
                        </div>
                        <h5 class="text-white mb-3" style="font-size: 1.4rem;">임대차보금 반환 청구 승소</h5>
                        <p class="text-white-50 mb-4" style="font-size: 1.1rem;">임대인의 보증금 반환 거부에 대해 적극 대응하여 전액 승소 판결을 이어냈습니다.</p>
                        <div class="case-info">
                            <div class="info-item text-white-50 mb-2">
                                <i class="fas fa-gavel me-2"></i>
                                <span>승소금: 3억원</span>
                            </div>
                            <div class="info-item text-white-50">
                                <i class="fas fa-calendar me-2"></i>
                                <span>소요기간: 6개월</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사례 2 -->
                <div class="col-md-4">
                    <div class="case-card h-100" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                border-radius: 20px;
                                padding: 30px;
                                transition: all 0.3s ease;">
                        <div class="case-badge mb-3">
                            <span class="badge" 
                                  style="background-color: #4CAF50;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">승소</span>
                            <span class="badge" 
                                  style="background-color: #1a237e;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">손상</span>
                        </div>
                        <div class="case-image-container mb-4" style="height: 200px; overflow: hidden; border-radius: 10px;">
                            <img src="/images/case2.jpg" 
                                 alt="교���사고 손해배상" 
                                 style="width: 100%; 
                                        height: 100%; 
                                        object-fit: cover; 
                                        object-position: center;">
                        </div>
                        <h5 class="text-white mb-3" style="font-size: 1.4rem;">교통사고 손해배상 청구</h5>
                        <p class="text-white-50 mb-4" style="font-size: 1.1rem;">험사의 부당한 보상액 산정에 대해 적극 대응하여 정당한 상을 받아냈습니다.</p>
                        <div class="case-info">
                            <div class="info-item text-white-50 mb-2">
                                <i class="fas fa-gavel me-2"></i>
                                <span>승소금액: 1억 5천만원</span>
                            </div>
                            <div class="info-item text-white-50">
                                <i class="fas fa-calendar me-2"></i>
                                <span>소요기간: 8개월</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사례 3 -->
                <div class="col-md-4">
                    <div class="case-card h-100" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                border-radius: 20px;
                                padding: 30px;
                                transition: all 0.3s ease;">
                        <div class="case-badge mb-3">
                            <span class="badge" 
                                  style="background-color: #4CAF50;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">승소</span>
                            <span class="badge" 
                                  style="background-color: #1a237e;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">금전</span>
                        </div>
                        <div class="case-image-container mb-4" style="height: 200px; overflow: hidden; border-radius: 10px;">
                            <img src="/images/case3.jpg" 
                                 alt="변호사 승소사례" 
                                 style="width: 100%; 
                                        height: 100%; 
                                        object-fit: cover; 
                                        object-position: center;">
                        </div>
                        <h5 class="text-white mb-3" style="font-size: 1.4rem;">승소사례</h5>
                        <p class="text-white-50 mb-4" style="font-size: 1.1rem;">변호사님의 승소사례를 기재할 수 있는 공간입니다.
                            더 자세한 사례는 해당 승소사례에 링크를 걸어둘 수 있습니다.
                        </p>
                        <div class="case-info">
                            <div class="info-item text-white-50 mb-2">
                                <i class="fas fa-gavel me-2"></i>
                                <span>승소금액: 2억원</span>
                            </div>
                            <div class="info-item text-white-50">
                                <i class="fas fa-calendar me-2"></i>
                                <span>소요기간: 12개월</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 사례 4 -->
                <div class="col-md-4">
                    <div class="case-card h-100" 
                            style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                border-radius: 20px;
                                padding: 30px;
                                transition: all 0.3s ease;">
                        <div class="case-badge mb-3">
                            <span class="badge" 
                                    style="background-color: #4CAF50;
                                            padding: 8px 15px;
                                            font-size: 0.9rem;">승소</span>
                            <span class="badge" 
                                    style="background-color: #1a237e;
                                            padding: 8px 15px;
                                            font-size: 0.9rem;">금전</span>
                        </div>
                        <div class="case-image-container mb-4" style="height: 200px; overflow: hidden; border-radius: 10px;">
                            <img src="/images/case4.jpg" 
                                 alt="변호사 승소사례" 
                                 style="width: 100%; 
                                        height: 100%; 
                                        object-fit: cover; 
                                        object-position: center;">
                        </div>
                        <h5 class="text-white mb-3" style="font-size: 1.4rem;">승소사례</h5>
                        <p class="text-white-50 mb-4" style="font-size: 1.1rem;">변호사님의 승소사례를 기재할 수 있는 공간입니다.</p>
                        <div class="case-info">
                            <div class="info-item text-white-50 mb-2">
                                <i class="fas fa-gavel me-2"></i>
                                <span>소금액: 2억원</span>
                            </div>
                            <div class="info-item text-white-50">
                                <i class="fas fa-calendar me-2"></i>
                                <span>소요기간: 12개월</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 사례 5 -->
                <div class="col-md-4">
                    <div class="case-card h-100" 
                         style="background: rgba(255, 255, 255, 0.05);
                                backdrop-filter: blur(10px);
                                border: 1px solid rgba(255, 255, 255, 0.1);
                                border-radius: 20px;
                                padding: 30px;
                                transition: all 0.3s ease;">
                        <div class="case-badge mb-3">
                            <span class="badge" 
                                  style="background-color: #4CAF50;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">승소</span>
                            <span class="badge" 
                                  style="background-color: #1a237e;
                                         padding: 8px 15px;
                                         font-size: 0.9rem;">금전</span>
                        </div>
                        <div class="case-image-container mb-4" style="height: 200px; overflow: hidden; border-radius: 10px;">
                            <img src="/images/case5.jpg" 
                                 alt="투자금 사기피해" 
                                 style="width: 100%; 
                                        height: 100%; 
                                        object-fit: cover; 
                                        object-position: center;">
                        </div>
                        <h5 class="text-white mb-3" style="font-size: 1.4rem;">투자금 사기 피해 구제</h5>
                        <p class="text-white-50 mb-4" style="font-size: 1.1rem;">가상화폐 투자 사기로 인한 피해금액을 전액 회수하는데 성공습니다.</p>
                        <div class="case-info">
                            <div class="info-item text-white-50 mb-2">
                                <i class="fas fa-gavel me-2"></i>
                                <span>승소금액: 2억원</span>
                            </div>
                            <div class="info-item text-white-50">
                                <i class="fas fa-calendar me-2"></i>
                                <span>소요기간: 12개월</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 고객 후기 섹션 -->
            <section class="testimonials-section">
                <div class="text-center mb-5">
                    <h6 class="text-primary">TESTIMONIALS</h6>
                    <h2 class="text-white">고객 후기</h2>
                </div>

                <!-- 메인 슬라이더 -->
                <div id="reviewCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${reviews}" var="review" varStatus="status">
                            <c:if test="${review.isActive}">
                                <div class="carousel-item ${status.first ? 'active' : ''}">
                                    <div class="review-card">
                                        <div class="d-flex align-items-center mb-3">
                                            <img src="${review.profileImage}" alt="고객 이미지" class="review-profile-img me-3">
                                            <div>
                                                <h5 class="text-white mb-1">${review.clientName}</h5>
                                                <div class="text-primary">${review.caseType}</div>
                                            </div>
                                            <div class="ms-auto text-white-50">${review.reviewDate}</div>
                                        </div>
                                        <p class="text-white-50">${review.content}</p>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    
                    <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>

                <!-- 하단 미리보기 카드들 -->
                <div class="review-preview-container">
                    <c:forEach items="${reviews}" var="review" varStatus="status">
                        <c:if test="${review.isActive}">
                            <div class="review-preview-box position-relative" style="min-height: 150px;">
                                <div class="d-flex align-items-center mb-2">
                                    <img src="${review.profileImage}" alt="고객 이미지" class="preview-img me-2">
                                    <div>
                                        <h6 class="text-white mb-0">${review.clientName}</h6>
                                        <small class="text-white-50">${review.caseType}</small>
                                    </div>
                                </div>
                                <p class="preview-text mb-4">${review.previewContent}</p>
                                <div class="review-date position-absolute" style="bottom: 15px; right: 15px; font-size: 0.85rem; color: rgba(255,255,255,0.5);">${review.reviewDate}</div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </section>
        </div>
    </section>

    <!-- 법률정보 섹션 -->
<section id="blog" class="py-5" 
         style="background: linear-gradient(rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.8)), url('/images/배경.jpg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                padding: 120px 0;
                margin-top: 80px;     /* 추가: 성공사례와 동일한 상단 여백 */
                margin-bottom: 80px;">
        <div class="container">
                <!-- 섹션 헤더 -->
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <h6 class="text-primary fw-bold mb-3" 
                            style="font-family: 'GmarketSansMedium'; 
                                   letter-spacing: 2px;
                                   color: rgba(255,255,255,0.9) !important;">
                            LEGAL INSIGHTS
                        </h6>
                        <h2 class="display-4 text-white mb-4" 
                            style="font-family: 'MaruBuriBold';">
                            법률 가이드
                        </h2>
                        <div class="divider mx-auto" style="width: 60px; height: 4px; background: #1a237e; margin-bottom: 40px;"></div>
                    </div>
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
                                     font-size: 0.9rem;">뉴스</span>
                        <h4 class="text-white mb-3" 
                            style="font-size: 1.8rem;">휴젤, 호실적에 소송리스크도 해소…주주환원 정책은</h4>
                        <p class="text-white-50 mb-4" 
                           style="font-size: 1.1rem;">이 공간은 주로 변호사님의 활동 영역을 소개하는 공간입니다.
                           변호사님과 관련된 활동들을 명시해놓고 링크로 연결시켜 놓을 수 있게 만들어 놓은 공간입니다.
                        </p>
                        <a href="https://www.bloter.net/news/articleView.html?idxno=626637" class="btn btn-outline-light" target="_blank">자세히 보기</a>
                    </div>
                </div>
            </div>

            <!-- 법률 정보 카드 -->
            <div class="row g-4">
                <!-- 법률 가이드 1 -->
                <div class="col-md-4">
                    <a href="https://www.labortoday.co.kr/news/articleView.html?idxno=223242" class="text-decoration-none" target="_blank">
                        <div class="card h-100 border-0" 
                             style="background: rgba(255, 255, 255, 0.05);
                                    backdrop-filter: blur(10px);
                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                    transition: all 0.3s ease;">
                            <div class="card-body p-4">
                                <div class="category-badge mb-3">
                                    <span class="badge" 
                                          style="background-color: #1a237e;
                                                 padding: 8px 15px;">판례리뷰</span>
                                </div>
                                <h5 class="card-title text-white mb-3" 
                                    style="font-size: 1.4rem;">무등록 건설업자에 하도급한 직상수급인 연대책임 판결</h5>
                                <p class="card-text2 text-white-50 mb-4" 
                                   style="font-size: 1.1rem;">건설현장은 발주처가 원도급사(종합건설업체·시공사)에게 건설공사 전체를 발주하면, 원도급사가 각각의 공정에 대해 하도급사(전문건설업체)에게 하도급을 주는 구조로 돼 있다.</p>
                                <div class="article-meta">
                                    <small class="text-white-50">
                                        <i class="fas fa-eye me-2"></i>매일노동뉴스
                                        <i class="fas fa-calendar ms-3 me-2"></i>2024.01.15
                                    </small>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 법률 가이드 2 (동일한 스타 적용) -->
                <div class="col-md-4">
                    <a href="https://www.labortoday.co.kr/news/articleView.html?idxno=224805" class="text-decoration-none" target="_blank">
                        <div class="card h-100 border-0" 
                            style="background: rgba(255, 255, 255, 0.05);
                                    backdrop-filter: blur(10px);
                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                    transition: all 0.3s ease;">
                            <div class="card-body p-4">
                                <div class="category-badge mb-3">
                                    <span class="badge" 
                                        style="background-color: #1a237e;
                                                padding: 8px 15px;">판리뷰</span>
                                </div>
                                <h5 class="card-title text-white mb-3" 
                                    style="font-size: 1.4rem;">통상임금 소송 참여자에 대한 차별을 부당노동위로 본 판결</h5>
                                <p class="card-text2 text-white-50 mb-4" 
                                style="font-size: 1.1rem;">전국금속노동조합은 2006년 12월께 한국지엠 소상공인 사무직원들을 대상으로 통상임금 소송 참가자를 모집했다.</p>
                                <div class="article-meta">
                                    <small class="text-white-50">
                                        <i class="fas fa-eye me-2"></i>매일노동뉴스
                                        <i class="fas fa-calendar ms-3 me-2"></i>2024.01.10
                                    </small>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- 법률 가이드 3 (동일한 스타일 적용) -->
                <div class="col-md-4">
                    <a href="https://www.labortoday.co.kr/news/articleView.html?idxno=221911" class="text-decoration-none" target="_blank">
                        <div class="card h-100 border-0" 
                            style="background: rgba(255, 255, 255, 0.05);
                                    backdrop-filter: blur(10px);
                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                    transition: all 0.3s ease;">
                            <div class="card-body p-4">
                                <div class="category-badge mb-3">
                                    <span class="badge" 
                                        style="background-color: #1a237e;
                                                padding: 8px 15px;">판례리뷰</span>
                                </div>
                                <h5 class="card-title text-white mb-3" 
                                    style="font-size: 1.4rem;">코로나19 시기 항공사 정리해고가 정당하다는 판결에 대해</h5>
                                <p class="card-text2 text-white-50 mb-4" 
                                style="font-size: 1.1rem;">이스타항공 주식회사는 2020년 10월14일에 605명의 노동자를 정리해고했다.</p>
                                <div class="article-meta">
                                    <small class="text-white-50">
                                        <i class="fas fa-eye me-2"></i>매일노동뉴스
                                        <i class="fas fa-calendar ms-3 me-2"></i>2024.06.05
                                    </small>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- 상담예약 섹션 개선 -->
    <section id="contact" class="consultation-section py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h6 class="text-primary text-uppercase fw-bold mb-3">Legal Consultation</h6>
                    <h2 class="text-white display-4 mb-4">상담 문의</h2>
                    <div class="divider mx-auto"></div>
                </div>
            </div>

            <div class="consultation-wrapper">
                <div class="row">
                    <!-- 상담 예약 폼 -->
                    <div class="col-lg-6">
                        <div class="consultation-form p-4 rounded-lg">
                            <h4 class="text-white mb-4">상담 예약하기</h4>
                            <form id="consultationForm">
                                <!-- 성함 입력 -->
                                <div class="form-group">
                                    <div class="input-group-wrapper">
                                        <label class="form-label">성함</label>
                                        <div class="input-container">
                                            <input type="text" class="form-control bg-transparent text-white" 
                                                id="name" placeholder="성함" required>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 연락처 입력 -->
                                <div class="form-group">
                                    <div class="input-group-wrapper">
                                        <label class="form-label">연락처</label>
                                        <div class="input-container">
                                            <select class="form-control bg-transparent text-white phone-select" id="phonePrefix">
                                                <option value="010" class="text-dark">010</option>
                                                <option value="011" class="text-dark">011</option>
                                                <option value="016" class="text-dark">016</option>
                                                <option value="017" class="text-dark">017</option>
                                            </select>
                                            <input type="text" class="form-control bg-transparent text-white phone-input" 
                                                id="phoneMiddle" placeholder="1234" maxlength="4" required>
                                            <input type="text" class="form-control bg-transparent text-white phone-input" 
                                                id="phoneLast" placeholder="5678" maxlength="4" required>
                                        </div>
                                    </div>
                                </div>

                                <!-- 이메일 입력 -->
                                <div class="form-group">
                                    <div class="input-group-wrapper">
                                        <label class="form-label">이메일</label>
                                        <div class="input-container">
                                            <input type="text" class="form-control bg-transparent text-white email-prefix" 
                                                id="emailPrefix" placeholder="이메일" required>
                                            <span class="input-group-text bg-transparent text-white">@</span>
                                            <select class="form-control bg-transparent text-white email-domain" id="emailDomain">
                                                <option value="naver.com" class="text-dark">naver.com</option>
                                                <option value="gmail.com" class="text-dark">gmail.com</option>
                                                <option value="daum.net" class="text-dark">daum.net</option>
                                                <option value="direct" class="text-dark">직접입력</option>
                                            </select>
                                            <input type="text" class="form-control bg-transparent text-white email-domain-direct" 
                                                id="emailDomainDirect" placeholder="도메인 입력" style="display: none;">
                                        </div>
                                    </div>
                                </div>

                                <!-- 상담 내용 -->
                                <div class="form-group">
                                    <label class="form-label mb-2">상담 내용</label>
                                    <textarea class="form-control bg-transparent text-white" 
                                            id="message" rows="4" required></textarea>
                                </div>

                                <!-- 제출 버튼 -->
                                <button type="submit" class="btn btn-primary w-100">
                                    상담 신청하기
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- 연락처 정보 -->
                    <div class="col-lg-6">
                        <div class="contact-info p-4 rounded-lg" 
                             style="background: rgba(255, 255, 255, 0.05);
                                    backdrop-filter: blur(10px);
                                    border: 1px solid rgba(255, 255, 255, 0.1);
                                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);">
                            <h4 class="text-white mb-4">연락처 안내</h4>
                            
                            <div class="row">
                                <!-- 사무실 정보 -->
                                <div class="col-md-6 mb-4">
                                    <div class="d-flex align-items-start contact-item">
                                        <div class="icon-box me-3"
                                             style="width: 40px; height: 40px;
                                            background: rgba(255, 255, 255, 0.1);
                                            border-radius: 10px;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            flex-shrink: 0;">
                                            <img src="/images/사무실아이콘.png" alt="사무실" 
                                                 style="width: 25px; height: 25px; filter: brightness(0) invert(1);">
                                        </div>
                                        <div class="contact-text">
                                            <h6 class="text-white mb-2">사무실 위치</h6>
                                            <p class="text-white-50 mb-0" style="line-height: 1.4;">서울특별시 강남구 테헤란로 123</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- 카카오톡 채널 -->
                                <div class="col-md-6 mb-4">
                                    <div class="d-flex align-items-start contact-item">
                                        <div class="icon-box me-3"
                                             style="width: 40px; height: 40px;
                                            background: rgba(255, 255, 255, 0.1);
                                            border-radius: 10px;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            flex-shrink: 0;">
                                            <img src="/images/카카오톡아이콘.png" alt="카카오톡" 
                                                 style="width: 25px; height: 25px; filter: brightness(0) invert(1);">
                                        </div>
                                        <div class="contact-text">
                                            <h6 class="text-white mb-2">카카오톡 채널</h6>
                                            <a href="https://open.kakao.com/o/s7a4oI0g" class="text-white-50 mb-0" style="line-height: 1.4;">카카오톡 채널 바로가기</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- 전화번호 -->
                                <div class="col-md-6 mb-4">
                                    <div class="d-flex align-items-start contact-item">
                                        <div class="icon-box me-3"
                                             style="width: 40px; height: 40px;
                                            background: rgba(255, 255, 255, 0.1);
                                            border-radius: 10px;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            flex-shrink: 0;">
                                            <img src="/images/전화번호아이콘.png" alt="전화번호" 
                                                 style="width: 25px; height: 25px; filter: brightness(0) invert(1);">
                                        </div>
                                        <div class="contact-text">
                                            <h6 class="text-white mb-2">전화번호</h6>
                                            <p class="text-white-50 mb-0" style="line-height: 1.4;">010-5508-4636</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- 이메일 -->
                                <div class="col-md-6 mb-4">
                                    <div class="d-flex align-items-start contact-item">
                                        <div class="icon-box me-3"
                                             style="width: 40px; height: 40px;
                                            background: rgba(255, 255, 255, 0.1);
                                            border-radius: 10px;
                                            display: flex;
                                            align-items: center;
                                            justify-content: center;
                                            flex-shrink: 0;">
                                            <img src="/images/메일아이콘.png" alt="이메일" 
                                                 style="width: 25px; height: 25px; filter: brightness(0) invert(1);">
                                        </div>
                                        <div class="contact-text">
                                            <h6 class="text-white mb-2">이메일</h6>
                                            <p class="text-white-50 mb-0" style="line-height: 1.4;">cktjsdlf4636@naver.com</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 상담시간 -->
                            <div class="business-hours mt-4">
                                <h5 class="text-white mb-4">상담시간</h5>
                                <div class="hours-item d-flex justify-content-between mb-3">
                                    <span class="text-white-50">평일</span>
                                    <span class="text-white">09:00 - 18:00</span>
                                </div>
                                <div class="hours-item d-flex justify-content-between mb-3">
                                    <span class="text-white-50">토요일</span>
                                    <span class="text-white">09:00 - 13:00</span>
                                </div>
                                <div class="hours-item d-flex justify-content-between">
                                    <span class="text-white-50">일요일/공휴일</span>
                                    <span class="text-white">휴무</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 카카오톡 버튼 -->
    <a href="https://open.kakao.com/o/s7a4oI0g" 
       target="_blank" 
       class="fixed-btn kakao-btn" 
       title="카카오톡 상담하기">
        <img src="/images/카카오톡.png" alt="카카오톡 상담" class="kakao-icon">
    </a>

    <!-- 전화 버튼 -->
    <a href="tel:1588-1588" 
       class="fixed-btn phone-btn" 
       title="전화 상담하기">
        <img src="/images/전화.png" alt="전화 상담">
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
                        최 선 변호사
                    </h5>
                    <p class="text-white-50 mb-4" style="font-size: 1.1rem; line-height: 1.8;">
                        정직과 신뢰를 바탕으로 의뢰 권리를 지키는 든든한 법률 파트너가 되겠습니다.
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
                            <a href="#about" class="text-white-50 text-decoration-none hover-effect">변호 소개</a>
                        </li>
                        <li class="mb-3">
                            <a href="#philosophy" class="text-white-50 text-decoration-none hover-effect">변호사 신조</a>
                        </li>
                        <li class="mb-3">
                            <a href="#expertise" class="text-white-50 text-decoration-none hover-effect">전문분야</a>
                        </li>
                        <li class="mb-3">
                            <a href="#cases" class="text-white-50 text-decoration-none hover-effect">성공사례</a>
                        </li>
                        <li>
                            <a href="#contact" class="text-white-50 text-decoration-none hover-effect">상담문의</a>
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
                            010-5508-4636
                        </p>
                        <p class="text-white-50 mb-3">
                            <i class="fas fa-fax me-2"></i>
                            010-5508-4636
                        </p>
                        <p class="text-white-50">
                            <i class="fas fa-envelope me-2"></i>
                            cktjsdlf4636@naver.com
                        </p>
                    </div>
                </div>

                <!-- 운영시 -->
                <div class="col-lg-3 col-md-6">
                    <h6 class="text-white mb-4" style="font-size: 1.2rem;">운영시간</h6>
                    <div class="office-hours">
                        <p class="text-white-50 mb-2">평일: 09:00 - 18:00</p>
                        <p class="text-white-50 mb-2">토요일: 09:00 - 13:00</p>
                        <p class="text-white-50 mb-4">일요일/공휴일: 휴무</p>
                        <div class="consultation-btn" style="padding: 0;">
                            <a href="#contact" 
                               class="btn btn-outline-light" 
                               style="width: 100%; 
                                      text-align: center; 
                                      padding: 10px 0;">
                                상담 예약기능
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
                        © 2024 최선 변호사. All rights reserved.
                    </p>
                </div>
                <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                    <a href="#" class="text-white-50 text-decoration-none me-4">개인정보리방침</a>
                    <a href="#" class="text-white-50 text-decoration-none me-4">이용약관</a>
                    <a href="/admin/hero-section" class="text-white-50 text-decoration-none">관리자</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/achievements.js"></script>

    <!-- 확인 모달 -->
    <div class="modal fade" id="confirmModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">상담 신청 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>입력하신 정보를 확인해주세요:</p>
                    <ul class="list-unstyled">
                        <li><strong>성함:</strong> <span id="confirmName"></span></li>
                        <li><strong>연락처:</strong> <span id="confirmPhone"></span></li>
                        <li><strong>이메일:</strong> <span id="confirmEmail"></span></li>
                    </ul>
                    <p class="text-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        예약은 시간당 3회로 제한됩니다.
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="finalSubmitBtn">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- AOS JS -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</body>
</html>
