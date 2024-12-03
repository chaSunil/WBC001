# 내가 꼭 기억해야 할 것

1. Spring Boot + JSP + Docker 설정 시 주의점
- Spring Boot 버전 3.2.2 (3.3.2 아님!!!)
- JSP 경로는 무조건 /WEB-INF/views/
- WAR 파일로 패키징 필수

2. Dockerfile 기본 설정
- JSP 파일 경로 주의
- WORKDIR /app 설정
- WAR 파일 복사 위치 정확히

3. docker-compose.yml
- MySQL 볼륨 설정만 하면 됨
- JSP 볼륨 설정 필요 없음 (WAR에 포함)
- 네트워크 설정 필수 (app-network)
- MySQL 환경변수 정확히 설정

4. 실수하지 말 것!!!
- 복잡하게 생각하지 말기
- 기본에 충실하기
- 확실하지 않으면 다시 이 메모 보기
- 경로 설정 시 특히 주의

5. 배포 전 체크리스트
- WAR 파일 정상 생성 확인
- Docker 이미지 빌드 확인
- 컨테이너 로그 확인
- 포트 설정 확인