<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.career-preview {
    padding: 2rem;
    background: #2A2A2A;
    border-radius: 10px;
}

.career-categories {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem;
}

.career-category {
    background: #333;
    border-radius: 20px;
    padding: 2rem;
    position: relative;
}

.category-icon {
    width: 60px;
    height: 60px;
    background: #1a237e;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 1rem;
    transform: rotate(-10deg);
}

.category-icon i {
    font-size: 1.8rem;
    color: white;
}

.category-title {
    color: white;
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
    border-bottom: 2px solid #1a237e;
    padding-bottom: 0.5rem;
}

.career-item {
    background: #404040;
    border-radius: 10px;
    padding: 1rem;
    margin-bottom: 1rem;
    border-left: 3px solid #1a237e;
}

.career-item .year-badge {
    background: #1a237e;
    color: white;
    padding: 0.3rem 0.8rem;
    border-radius: 5px;
    font-size: 0.9rem;
    display: inline-block;
    margin-bottom: 0.5rem;
}

.career-content h5 {
    color: white;
    font-size: 1rem;
    margin: 0.5rem 0;
}

.career-content p {
    color: #aaa;
    font-size: 0.9rem;
    margin: 0;
}

@media (max-width: 992px) {
    .career-categories {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .career-categories {
        grid-template-columns: 1fr;
    }
}
</style>

<div class="career-preview">
    <div class="career-categories">
        <c:forEach items="${careersByCategory}" var="entry">
            <div class="career-category">
                <div class="category-icon">
                    <i class="${entry.key.icon}"></i>
                </div>
                <h4 class="category-title">${entry.key.name}</h4>
                <div class="career-items">
                    <c:forEach items="${entry.value}" var="career">
                        <c:if test="${career.isActive}">
                            <div class="career-item">
                                <div class="year-badge">
                                    ${career.startYear} - ${empty career.endYear ? '현재' : career.endYear}
                                </div>
                                <div class="career-content">
                                    <h5>${career.organization}</h5>
                                    <p>${career.position}</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
</div> 