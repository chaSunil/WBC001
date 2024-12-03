// 통합된 컨트롤러 객체들
const videoController = {
    changeVideo: function(videoId, button) {
        document.querySelectorAll('.video-button').forEach(btn => {
            btn.classList.remove('active');
        });
        button.classList.add('active');
        const videoPlayer = document.getElementById('videoPlayer');
        if (videoPlayer) {
            videoPlayer.src = `https://www.youtube.com/embed/${videoId}?rel=0&autoplay=1`;
        }
    },

    init: function() {
        document.querySelectorAll('.video-button').forEach(button => {
            button.addEventListener('click', function() {
                const videoId = this.getAttribute('data-video-id');
                videoController.changeVideo(videoId, this);
            });
        });
    }
};

const scrollController = {
    handleScroll: function() {
        const mainNav = document.getElementById('mainNav');
        if (window.scrollY > 50) {
            mainNav.classList.add('navbar-shrink', 'navbar-scrolled');
        } else {
            mainNav.classList.remove('navbar-shrink', 'navbar-scrolled');
        }
    },

    init: function() {
        window.addEventListener('scroll', () => this.handleScroll());
    }
};

const animationController = {
    animateValue: function(element, start, end, duration, isRate = false) {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const actualDuration = isRate ? duration / 3 : duration;
            const progress = Math.min((timestamp - startTimestamp) / actualDuration, 1);
            
            if (element.classList.contains('rate-number')) {
                element.textContent = (progress * (end - start) + start).toFixed(1) + '%';
            } else {
                element.textContent = Math.floor(progress * (end - start) + start);
            }

            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);
    },

    init: function() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                    const countElement = entry.target.querySelector('.count-number');
                    const rateElement = entry.target.querySelector('.rate-number');
                    
                    if (countElement) {
                        const targetCount = parseInt(countElement.getAttribute('data-count'));
                        this.animateValue(countElement, 0, targetCount, 2000, false);
                    }
                    if (rateElement) {
                        const targetRate = parseFloat(rateElement.getAttribute('data-rate'));
                        this.animateValue(rateElement, 0, targetRate, 2000, true);
                    }
                    entry.target.classList.add('counted');
                }
            });
        }, {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        });

        document.querySelectorAll('.expertise-card').forEach(card => observer.observe(card));

        // 철학 섹션 애니메이션 추가
        this.initPhilosophyAnimation();
    },

    initPhilosophyAnimation: function() {
        const philosophySection = document.querySelector('#philosophy');
        const philosophyCards = document.querySelectorAll('.philosophy-card');
        
        // 초기 상태 설정
        philosophyCards.forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(50px)';
            card.style.transition = 'all 0.8s ease-out';
        });

        // 스크롤 이벤트 핸들러
        const handleScroll = () => {
            const sectionTop = philosophySection.offsetTop;
            const sectionHeight = philosophySection.offsetHeight;
            const scrollPosition = window.scrollY + window.innerHeight;

            if (scrollPosition > sectionTop + 100) {  // 섹션이 화면에 보이기 시작할 때
                philosophyCards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, index * 200);  // 카드마다 0.2초 간격으로 애니메이션 시작
                });
                
                // 이벤트 리스너 제거 (애니메이션이 한 번만 실행되도록)
                window.removeEventListener('scroll', handleScroll);
            }
        };

        window.addEventListener('scroll', handleScroll);
        // 페이지 로드 시 이미 해당 섹션이 보이는 경우를 위한 초기 체크
        handleScroll();
    }
};

const heroController = {
    init: function() {
        // 히어로 섹션 요소들
        const heroContent = document.querySelector('.hero-content');
        const heroTitle = document.querySelector('.hero-title');
        const subtitle = window.innerWidth > 768 ? 
            document.querySelector('.hero-subtitle') : 
            document.querySelector('.mobile-subtitle');
        
        // 컨텐츠 전체 애니메이션만 적용
        if (heroContent) {
            heroContent.style.opacity = '0';
            heroContent.style.transform = 'translateX(-30px)';
            
            setTimeout(() => {
                heroContent.style.transition = 'all 1.2s ease-out';
                heroContent.style.opacity = '1';
                heroContent.style.transform = 'translateX(0)';
            }, 100);
        }

        // 서브타이틀 초기 표시 설정
        if (subtitle) {
            subtitle.style.display = 'block';
        }

        // 불필요한 요소 숨기기
        const unusedSubtitle = window.innerWidth > 768 ? 
            document.querySelector('.mobile-subtitle') : 
            document.querySelector('.hero-subtitle');
        if (unusedSubtitle) {
            unusedSubtitle.style.display = 'none';
        }
    }
};

// mailController 객체 수정
const mailController = {
    init: function() {
        const form = document.getElementById('consultationForm');
        if (!form) {
            console.error('consultationForm을 찾을 수 없습니다');
            return;
        }
        
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            // 이메일과 전화번호 처리 부분은 동일
            const emailPrefix = document.getElementById('emailPrefix').value;
            const emailDomain = document.getElementById('emailDomain');
            const emailDomainDirect = document.getElementById('emailDomainDirect');
            const emailDomainValue = emailDomain.value === 'direct' ? emailDomainDirect.value : emailDomain.value;
            
            const phonePrefix = document.getElementById('phonePrefix').value;
            const phoneMiddle = document.getElementById('phoneMiddle').value;
            const phoneLast = document.getElementById('phoneLast').value;
            
            const formData = {
                name: document.getElementById('name').value,
                phone: `${phonePrefix}-${phoneMiddle}-${phoneLast}`,
                email: `${emailPrefix}@${emailDomainValue}`,
                message: document.getElementById('message').value
            };
            
            if (!this.validateForm(formData)) {
                return;
            }

            // 확인 메시지 표시
            const confirmMessage = `성함: ${formData.name}\n연락처: ${formData.phone}\n이메일 주소: ${formData.email}\n\n입력하신 정보가 맞는지 다시 한 번 확인해주세요.\n(하루 최대 3회까지 예약 가능합니다)`;
            
            if (!confirm(confirmMessage)) {
                return;
            }

            try {
                const response = await fetch('/api/consultation/submit', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(formData)
                });
                
                const result = await response.json();
                console.log('서버 응답:', result);
                
                if (response.ok) {
                    alert('상담 신청이 완료되었습니다.');
                    form.reset();
                    
                    // 직접입력 필드 초기화
                    if (emailDomainDirect) {
                        emailDomainDirect.style.display = 'none';
                        emailDomain.style.display = 'block';
                        emailDomain.value = 'naver.com';
                    }
                } else {
                    alert(result.error || '상담 신청 중 오류가 발생했습니다.');
                }
            } catch (error) {
                console.error('에러 발생:', error);
                alert('상담 신청 중 오류가 발생했습니다.');
            }
        });
    },

    validateForm: function(formData) {
        if (!formData.name.trim()) {
            alert('이름을 입력해주세요.');
            return false;
        }

        const phonePattern = /^\d{3}-\d{4}-\d{4}$/;
        if (!phonePattern.test(formData.phone)) {
            alert('올바른 전화번호 형식이 아닙니다.');
            return false;
        }

        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(formData.email)) {
            alert('올바른 이메일 형식이 아닙니다.');
            return false;
        }

        if (!formData.message.trim()) {
            alert('상담 내용을 입력해주세요.');
            return false;
        }

        return true;
    }
};

// FAQ 컨트롤러 추가
const faqController = {
    init: function() {
        document.querySelectorAll('.faq-question').forEach(question => {
            question.addEventListener('click', () => {
                const answer = question.nextElementSibling;
                const isActive = question.classList.contains('active');
                
                // 다른 모든 FAQ 닫기
                document.querySelectorAll('.faq-question').forEach(q => {
                    q.classList.remove('active');
                    q.nextElementSibling.classList.remove('active');
                });
                
                // 클릭된 FAQ 토글
                if (!isActive) {
                    question.classList.add('active');
                    answer.classList.add('active');
                }
            });
        });
    }
};

const carouselController = {
    init: function() {
        const carousel = new bootstrap.Carousel(document.getElementById('reviewCarousel'), {
            interval: 5000,
            keyboard: true,
            pause: 'hover',
            wrap: true,
            touch: true
        });

        // 미리보기 박스 클릭 이벤트 수정
        document.querySelectorAll('.review-preview-box').forEach((box, index) => {
            box.addEventListener('click', () => {
                const carouselElement = document.getElementById('reviewCarousel');
                const currentIndex = [...carouselElement.querySelectorAll('.carousel-item')].findIndex(item => 
                    item.classList.contains('active')
                );
                
                if (currentIndex !== index) {
                    carousel.to(index);
                }
            });
        });

        // 터치 스와이프 감도 개선
        const carouselElement = document.getElementById('reviewCarousel');
        let touchStartX = 0;
        let touchEndX = 0;
        const swipeThreshold = 50;  // 스와이프 감지 임계값

        carouselElement.addEventListener('touchstart', e => {
            touchStartX = e.changedTouches[0].screenX;
        }, { passive: true });

        // touchmove 이벤트 리스너 제거됨

        carouselElement.addEventListener('touchend', e => {
            touchEndX = e.changedTouches[0].screenX;
            const swipeDistance = touchEndX - touchStartX;
            
            if (Math.abs(swipeDistance) > swipeThreshold) {
                if (swipeDistance < 0) {
                    carousel.next();
                } else {
                    carousel.prev();
                }
            }
        }, { passive: true });

        // 슬라이드 전환 시 페이드 효과
        carouselElement.addEventListener('slide.bs.carousel', function (e) {
            const activeItem = e.relatedTarget;
            activeItem.style.opacity = '0';
            setTimeout(() => {
                activeItem.style.opacity = '1';
            }, 100);
        });
    }
};

// 철학 섹션 애니메이션 컨트롤러
const philosophyController = {
    init: function() {
        const observer = new IntersectionObserver(
            (entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const cards = entry.target.querySelectorAll('.philosophy-card');
                        cards.forEach((card, index) => {
                            setTimeout(() => {
                                card.classList.add('animate');
                            }, index * 200); // 각 카드마다 0.2초 딜레이
                        });
                        // 한 번 애니메이션이 실행된 후에는 관찰 중단
                        observer.unobserve(entry.target);
                    }
                });
            },
            {
                threshold: 0.2 // 20% 정도 보일 때 실행
            }
        );

        // 철학 섹션 관찰 시작
        const philosophySection = document.querySelector('.philosophy-cards');
        if (philosophySection) {
            observer.observe(philosophySection);
        }
    }
};
// CSS 스타일을 동적으로 추가
const style = document.createElement('style');
style.textContent = `
    .philosophy-card {
        opacity: 0;
        transform: translateY(50px);
        transition: all 0.8s ease-out;
    }

    .philosophy-card.animate {
        opacity: 1;
        transform: translateY(0);
    }
`;
document.head.appendChild(style);

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', () => {

    // 모바일 네비게이션 메뉴 닫기
    const navLinks = document.querySelectorAll('.navbar-collapse .nav-link');
    const navbarCollapse = document.querySelector('.navbar-collapse');

    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            if (navbarCollapse.classList.contains('show')) {
                new bootstrap.Collapse(navbarCollapse).toggle();
            }
        });
    });

    videoController.init();
    scrollController.init();
    animationController.init();
    heroController.init();
    mailController.init();
    faqController.init();
    carouselController.init();
    philosophyController.init(); // 철학 섹션 컨트롤러 초기화 추가
});

// 이메일 도메인 직접 입력 처리
document.getElementById('emailDomain').addEventListener('change', function() {
    const directInput = document.getElementById('emailDomainDirect');
    if (this.value === 'direct') {
        this.style.display = 'none';
        directInput.style.display = 'block';
        directInput.required = true;
        directInput.focus();
    }
});

// 직접 입력 필드에서 포커스를 잃었을 때 빈 값이면 select로 돌아가기
document.getElementById('emailDomainDirect').addEventListener('blur', function() {
    if (!this.value) {
        this.style.display = 'none';
        this.required = false;
        const select = document.getElementById('emailDomain');
        select.style.display = 'block';
        select.value = 'naver.com';
    }
});

