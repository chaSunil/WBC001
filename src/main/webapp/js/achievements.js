function toggleAchievement(id) {
    const content = document.getElementById(id);
    const icon = document.getElementById(id + '-icon');
    const header = content.previousElementSibling;
    const item = content.closest('.achievement-item');
    
    // 같은 행에 있지 않은 다른 모든 섹션 닫기
    const allItems = document.querySelectorAll('.achievement-item');
    const currentRow = Math.floor([...allItems].indexOf(item) / 2);
    
    allItems.forEach((otherItem, index) => {
        const otherRow = Math.floor(index / 2);
        if (otherRow !== currentRow) {
            const otherContent = otherItem.querySelector('.achievement-content');
            const otherId = otherContent.id;
            const otherIcon = document.getElementById(otherId + '-icon');
            
            otherContent.classList.remove('active');
            otherIcon?.classList.remove('active');
        }
    });
    
    // 현재 섹션 토글
    content.classList.toggle('active');
    icon.classList.toggle('active');
    
    // 같은 행의 다른 섹션이 열려있으면 닫기
    const siblingItem = item.nextElementSibling || item.previousElementSibling;
    if (siblingItem && Math.floor([...allItems].indexOf(siblingItem) / 2) === currentRow) {
        const siblingContent = siblingItem.querySelector('.achievement-content');
        const siblingIcon = document.getElementById(siblingContent.id + '-icon');
        
        if (content.classList.contains('active')) {
            siblingContent.classList.remove('active');
            siblingIcon?.classList.remove('active');
        }
    }
}

// AOS 초기화
document.addEventListener('DOMContentLoaded', function() {
    AOS.init({
        duration: 800,
        once: true,
        offset: 100
    });
}); 