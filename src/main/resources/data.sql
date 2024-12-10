-- ########################################################## hero_section ##########################################################

-- 히어로 섹션 데이터 테이블(없을때만 생성)
CREATE TABLE IF NOT EXISTS hero_section (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subtitle VARCHAR(200),       -- 서브타이틀 ("내 일"이라고 생각하고 "내 일"처럼 하겠습니다)
    lawyer_name VARCHAR(50),     -- 변호사 이름
    profile_image VARCHAR(255),  -- 프로필 이미지 경로
    university_logo VARCHAR(255),-- 대학 로고 이미지 경로
    company_logo VARCHAR(255),   -- 회사 로고 이미지 경로
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 초기 데이터 삽입
INSERT INTO hero_section (
    id, 
    subtitle,
    lawyer_name, 
    profile_image, 
    university_logo, 
    company_logo
) 
SELECT 1, 
       '"내 일"이라고 생각하고 "내 일"처럼 하겠습니다.',
       '최선 변호사', 
       '/images/변호사.png', 
       '/images/대학로고투명.png', 
       '/images/회사로고.png'
WHERE NOT EXISTS (
    SELECT 1 FROM hero_section WHERE id = 1
);

-- ########################################################## about_section ##########################################################

-- 변호사 기본 정보 테이블
CREATE TABLE lawyer_profile (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    profile_image VARCHAR(255) NOT NULL,
    subtitle1 VARCHAR(100) NOT NULL,
    subtitle2 VARCHAR(100) NOT NULL,
    greeting_content TEXT NOT NULL,
    signature_name VARCHAR(50) NOT NULL,
    signature_image VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 변호사 경력 테이블
CREATE TABLE lawyer_career (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    lawyer_id BIGINT NOT NULL,
    career_title VARCHAR(100) NOT NULL,
    period VARCHAR(50) NOT NULL,
    display_order INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (lawyer_id) REFERENCES lawyer_profile(id)
);

-- ########################################################## review_section ##########################################################

CREATE TABLE IF NOT EXISTS review_section (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50) NOT NULL DEFAULT '김** 의뢰인',
    case_type VARCHAR(100) NOT NULL DEFAULT '투자사기 피해구제',
    review_date VARCHAR(20) NOT NULL DEFAULT '2024.03.10',
    content TEXT NOT NULL,
    preview_content VARCHAR(500) NOT NULL,
    profile_image VARCHAR(255) NOT NULL DEFAULT '/images/고객1번.jpg',
    display_order INT NOT NULL DEFAULT 1 CHECK (display_order BETWEEN 1 AND 6),
    is_active TINYINT(1) NOT NULL DEFAULT 0
);

DELIMITER //
CREATE TRIGGER before_review_insert
BEFORE INSERT ON review_section
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM review_section) >= 6 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '최대 6개의 리뷰만 등록할 수 있습니다.';
    END IF;
END;//
DELIMITER ;

-- 초기 데이터 삽입
INSERT INTO review_section (
    client_name, 
    case_type, 
    review_date, 
    content, 
    preview_content,
    profile_image, 
    display_order, 
    is_active
) VALUES 
('최** 의뢰인', 
 '임대차보증금 반환청구', 
 '2024.01.15', 
 '임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다. 특히 임대차보호법에 대한 깊은 이해를 바탕으로 법리 검토와 증거자료 수집 과정에서 세세한 부분까지도 꼼꼼하게 챙겨주셨고, 법원 조정 과정에서도 임대인 측의 부당한 주장에 대해 명확한 반박과 함께 저희의 입장을 강력하게 대변해주셨습니다. 결과적으로 보증금 전액과 지연이자까지 받아낼 수 있었고, 이 과정에서 변호사님의 전문성과 성실함을 직접 경험할 수 있었습니다.', 
 '임대인의 보증금 반환 거부로 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다...', 
 '/images/고객1번.jpg', 
 1, 
 1),
('박** 의뢰인', 
 '교통사고 손해배상', 
 '2024.02.20', 
 '보험사의 부당한 합의 종용과 낮은 보상액 제시로 어려움을 겪던 중 변호사님을 만나게 되었습니다. 의료기록과 사고 정황에 대한 철저한 분석을 통해 과실비율을 조정받았고, 향후치료비와 휴업손해 등 보험사가 누락했던 항목들까지 꼼꼼하게 산정하여 청구해주셨습니다. 결과적으로 당초 보험사 제시액의 3배 이상을 받을 수 있었고, 치료에만 전념할 수 있도록 도와주셔서 정말 감사드립니다.', 
 '보험사의 부당한 합의 종용과 낮은 보상액 제시로 어려움을 겪던 중 변호사님을 만나게 되었습니다...', 
 '/images/고객2번.jpg', 
 2, 
 1),
('김** 의뢰인', 
 '투자사기 피해구제', 
 '2024.03.10', 
 '가상화폐 투자를 빙자한 사기로 큰 피해를 입어 절망적인 상황이었습니다. 변호사님께서는 피해자 모임을 조직하고 수사기관과의 긴밀한 협조를 통해 가해자들의 은닉재산을 추적하는데 성공하셨습니다. 강제집행과 형사절차를 병행하며 전략적으로 대응해주신 결과, 피해금액의 상당부분을 회수할 수 있었습니다. 포기하지 않고 끝까지 최선을 다해주신 변호사님께 진심으로 감사드립니다.', 
 '가상화폐 투자를 빙자한 사기로 큰 피해를 입어 절망적인 상황이었습니다...', 
 '/images/고객3번.jpg', 
 3, 
 1);

-- ########################################################## video_section ##########################################################

CREATE TABLE IF NOT EXISTS video_section (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    main_title VARCHAR(100) NOT NULL DEFAULT '대표 영상'
);

-- 비디오 테이블 생성
CREATE TABLE IF NOT EXISTS video (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    number INT NOT NULL,
    video_id VARCHAR(50) NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    video_section_id BIGINT,
    FOREIGN KEY (video_section_id) REFERENCES video_section(id)
);

-- 초기 데이터 삽입
INSERT INTO video_section (id, main_title) 
SELECT 1, '대표 영상'
WHERE NOT EXISTS (
    SELECT 1 FROM video_section WHERE id = 1
);

-- 기본 비디오 데이터 삽입
INSERT INTO video (number, video_id, title, description, video_section_id)
SELECT 1, 'dqv9xBRx0Vc', '민사소송 진행 절차 안내', '많은 분들이 어려워하시는 민사소송의 진행 절차를 안내해드립니다.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM video WHERE number = 1 AND video_section_id = 1
);

INSERT INTO video (number, video_id, title, description, video_section_id)
SELECT 2, 'A1nSgoamcJQ', '해결 사례', '실제 해결된 사례를 소개합니다.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM video WHERE number = 2 AND video_section_id = 1
);

INSERT INTO video (number, video_id, title, description, video_section_id)
SELECT 3, 'io7Hp4ikYGI', '채권추심 성공 노하우', '효과적인 채권추심을 위한 법적 절차와 노하우를 공유합니다.', 1
WHERE NOT EXISTS (
    SELECT 1 FROM video WHERE number = 3 AND video_section_id = 1
);

-- ########################################################## success_cases ##########################################################

CREATE TABLE IF NOT EXISTS success_cases (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    image_url VARCHAR(255),
    detail_link VARCHAR(255),
    result_title VARCHAR(255),
    result_content VARCHAR(255),
    display_order INT,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS case_categories (
    case_id BIGINT,
    category VARCHAR(50),
    FOREIGN KEY (case_id) REFERENCES success_cases(id)
);

INSERT INTO success_cases (
    id,
    title, 
    content, 
    image_url, 
    result_title, 
    result_content, 
    display_order, 
    is_active
) VALUES 
(1, '임대차보증금 반환 청구 승소',
 '임대인의 보증금 반환 거부에 대해 적극 대응하여 전액 승소 판결을 이어냈습니다.',
 '/images/case1.jpg',
 '결과: 전액 승소 판결',
 '의뢰인 권리 100% 회복',
 1, true),
 
(2, '교통사고 손해배상 청구',
 '보험사의 부당한 보상액 산정에 대해 적극 대응하여 정당한 보상을 받아냈습니다.',
 '/images/case2.jpg',
 '결과: 합의금 증액 성공',
 '보험사 제시액의 3배 승소',
 2, true),
 
(3, '임금체불 청구 승소',
 '변호사님의 승소사례를 기재할 수 있는 공간입니다. 더 자세한 사례는 해당 승소사례에 링크를 걸어둘 수 있습니다.',
 '/images/case3.jpg',
 '결과: 체불임금 전액 지급',
 '지연이자 포함 완전 승소',
 3, true),
 
(4, '건설하자 손해배상 승소',
 '변호사님의 승소사례를 기재할 수 있는 공간입니다.',
 '/images/case4.jpg',
 '결과: 하자보수 완료',
 '추가 배상금 확보',
 4, true),
 
(5, '투자금 사기 피해 구제',
 '가상화폐 투자 사기로 인한 피해금액을 전액 회수하는데 성공했습니다.',
 '/images/case5.jpg',
 '결과: 피해금액 전액 회수',
 '형사처벌 및 배상 완료',
 5, true);

-- 카테고리 데이터 삽입
INSERT INTO case_categories (case_id, category) VALUES 
(1, '민사소송'), (1, '임대차분쟁'), (1, '보증금반환'),
(2, '손해배상'), (2, '교통사고'), (2, '상해보상'),
(3, '노동사건'), (3, '임금체불'), (3, '퇴직금'),
(4, '건설소송'), (4, '하자보수'), (4, '손해배상'),
(5, '형사소송'), (5, '투자사기'), (5, '피해구제');

-- ########################################################## legal_guides ##########################################################

-- 법률 가이드 테이블 생성
CREATE TABLE IF NOT EXISTS legal_guides (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    source VARCHAR(100),
    date DATE,
    link VARCHAR(255),
    is_highlighted BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    display_order INT
);

-- 샘플 데이터 삽입
INSERT INTO legal_guides (
    category,
    title,
    content,
    source,
    date,
    link,
    is_highlighted,
    is_active,
    display_order
) VALUES 
(
    '뉴스',
    '휴젤, 호실적에 소송리스크도 해소…주주환원 정책은',
    '이 공간은 주로 변호사님의 활동 영역을 소개하는 공간입니다. 변호사님과 관련된 활동들을 명시해놓고 링크로 연결시켜 놓을 수 있게 만들어 놓은 공간입니다.',
    '블로터',
    '2024-01-15',
    'https://www.bloter.net/news/articleView.html?idxno=626637',
    TRUE,
    TRUE,
    1
),
(
    '판례리뷰',
    '무등록 건설업자에 하도급한 직상수급인 연대책임 판결',
    '건설현장은 발주처가 원도급사(종합건설업체·시공사)에게 건설공사 전체를 발주하면, 원도급사가 각각의 공정에 대해 하도급사(전문건설업체)에게 하도급을 주는 구조로 돼 있다.',
    '매일노동뉴스',
    '2024-01-15',
    'https://www.labortoday.co.kr/news/articleView.html?idxno=223242',
    FALSE,
    TRUE,
    2
),
(
    '판례리뷰',
    '통상임금 소송 참여자에 대한 차별을 부당노동위로 본 판결',
    '전국금속노동조합은 2006년 12월께 한국지엠 소상공인 사무직원들을 대상으로 통상임금 소송 참가자를 모집했다.',
    '매일노동뉴스',
    '2024-01-10',
    'https://www.labortoday.co.kr/news/articleView.html?idxno=224805',
    FALSE,
    TRUE,
    3
),
(
    '판례리뷰',
    '코로나19 시기 항공사 정리해고가 정당하다는 판결에 대해',
    '이스타항공 주식회사는 2020년 10월14일에 605명의 노동자를 정리해고했다.',
    '매일노동뉴스',
    '2024-06-05',
    'https://www.labortoday.co.kr/news/articleView.html?idxno=221911',
    FALSE,
    TRUE,
    4
);

-- ########################################################## career_categories ##########################################################

-- 경력 카테고리 테이블
CREATE TABLE IF NOT EXISTS career_categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    icon VARCHAR(50) NOT NULL,
    display_order INT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 경력 테이블 수정
CREATE TABLE IF NOT EXISTS careers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT NOT NULL,
    start_year VARCHAR(10) NOT NULL,
    end_year VARCHAR(10),
    organization VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    display_order INT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES career_categories(id) ON DELETE CASCADE
);

-- 카테고리 기본 데이터
INSERT INTO career_categories (name, icon, display_order) VALUES 
('학술활동', 'fas fa-university', 1),
('자문위원회', 'fas fa-balance-scale', 2),
('공공기관', 'fas fa-landmark', 3);

-- 경력 기본 데이터
INSERT INTO careers (category_id, start_year, end_year, organization, position, display_order) 
SELECT 
    (SELECT id FROM career_categories WHERE name = '학술활동'),
    '2022', NULL, '한국민사WBC법학회', '이사', 1
UNION ALL SELECT 
    (SELECT id FROM career_categories WHERE name = '학술활동'),
    '2021', NULL, '한국부동산규율센터', '상임이사', 2
UNION ALL SELECT 
    (SELECT id FROM career_categories WHERE name = '자문위원회'),
    '2023', NULL, '대한상사의탁원', '중재인', 3
UNION ALL SELECT 
    (SELECT id FROM career_categories WHERE name = '자문위원회'),
    '2022', NULL, '금융감독실행원', '법률자문위원', 4
UNION ALL SELECT 
    (SELECT id FROM career_categories WHERE name = '공공기관'),
    '2023', NULL, '서울중앙한국법원', '조정위원', 5
UNION ALL SELECT 
    (SELECT id FROM career_categories WHERE name = '공공기관'),
    '2022', NULL, '법무사령부', '민사법 개정위원회 자문위원', 6;