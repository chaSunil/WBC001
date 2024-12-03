-- ########################################################## hero_section ##########################################################

-- 히어로 섹션 데이터 테이블(없을때만 생성)
CREATE TABLE IF NOT EXISTS hero_section (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),           -- 메인 타이틀 (민사변호사 전문 50년 경력)
    subtitle_line1 VARCHAR(100),  -- 서브타이틀 첫째줄 ("내 일"이라고 생각하고)
    subtitle_line2 VARCHAR(100),  -- 서브타이틀 둘째줄 ("내 일"처럼 하겠습니다)
    lawyer_name VARCHAR(50),      -- 변호사 이름
    profile_image VARCHAR(255),   -- 프로필 이미지 경로
    university_logo VARCHAR(255), -- 대학 로고 이미지 경로
    company_logo VARCHAR(255),    -- 회사 로고 이미지 경로
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- src/main/resources/data.sql
INSERT INTO hero_section (
    id, 
    title, 
    subtitle_line1, 
    subtitle_line2, 
    lawyer_name, 
    profile_image, 
    university_logo, 
    company_logo
) 
SELECT 1, '민사변호사 전문 50년 경력', '"내 일"이라고 생각하고', '"내 일"처럼 하겠습니다.',
       '최선 변호사', '/images/변호사.png', '/images/대학로고투명.png', '/images/회사로고.png'
WHERE NOT EXISTS (
    SELECT 1 FROM hero_section WHERE id = 1
);

-- ########################################################## about_section ##########################################################

CREATE TABLE IF NOT EXISTS about_section (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    lawyer_name VARCHAR(100),
    specialty VARCHAR(100),
    association VARCHAR(100),
    greeting TEXT,
    profile_image VARCHAR(255),
    signature_image VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS career (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    about_section_id BIGINT,
    title VARCHAR(200),
    period VARCHAR(100),
    FOREIGN KEY (about_section_id) REFERENCES about_section(id)
);

DROP TABLE IF EXISTS review_section;

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
 '임대인의 보증금 반환 거부에 힘들었던 상황에서, 변호사님의 전문적인 조언과 적극적인 대응이 큰 도움이 되었습니다. 특히 임대차보호법에 대한 깊은 이해를 바탕으로 법리 검토와 증거자료 수집 과정에서 세세한 부분까지 꼼꼼하게 챙겨주셨고, 법원 조정 과정에서도 임대인 측의 부당한 주장에 대해 명확한 반박과 함께 저희의 입장을 강력하게 대변해주셨습니다. 결과적으로 보증금 전액과 지연이자까지 받아낼 수 있었고, 이 과정에서 변호사님의 전문성과 성실함을 직접 경험할 수 있었습니다.', 
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