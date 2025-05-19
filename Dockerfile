# Python 3.9을 기반으로 함
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 패키지 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 프로젝트 전체 복사
COPY . .

# 환경 변수 예시 (실제 키는 외부에서 넣는 게 좋음)
ENV OPENAI_API_KEY=dummy_key

# 앱 실행 명령
CMD ["uvicorn", "app.main:app", "--host=0.0.0.0", "--port=8000"]
