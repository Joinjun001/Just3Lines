# Just3Lines

뉴스 기사를 3줄로 요약해주는 API 서비스입니다.

## 기능

- 뉴스 기사 텍스트를 3줄로 요약
- 한국어/영어 지원
- FastAPI 기반의 REST API
- 웹 인터페이스 제공

## 기술 스택

- Python 3.9+
- FastAPI
- OpenAI GPT-3.5
- Pydantic
- Jinja2
- pytest

## 프로젝트 구조

```
just3lines/
├── app/
│   ├── __init__.py
│   ├── main.py        # FastAPI 애플리케이션
│   ├── api/
│   │   ├── __init__.py
│   │   └── routes.py  # API 엔드포인트
│   ├── core/
│   │   ├── __init__.py
│   │   └── config.py  # 설정 관리
│   └── services/
│       ├── __init__.py
│       └── openai_service.py  # OpenAI 통합
├── tests/
│   ├── __init__.py
│   ├── conftest.py
│   └── test_app.py
├── static/
├── templates/
├── requirements.txt
└── README.md
```

## 설치 및 실행 방법

1. 저장소 클론

```bash
git clone https://github.com/hanip-devops/Just3Lines.git
cd Just3Lines
```

## 🔧 로컬 실행 방법 (uv를 사용한 방법, Docker로 실행하실 분들은 아래를 참고해주세요. 그리고 Docker 사용을 추천드립니다!!)

2. uv (파이썬 관리 툴 설치, 편하게 사용하기 위해 전역으로 설치하길 추천드립니다.)

# 맥

curl -LsSf https://astral.sh/uv/install.sh | sh

# 윈도우

powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

3. 가상 환경 생성 및 패키지 설치

```bash
uv venv
uv pip install -r requirements.txt
```

4. 환경 변수 설정
   `.env` 파일을 생성하고 OpenAI API 키를 설정합니다:

.env :

```
OPENAI_API_KEY=your_api_key_here
```

개발 서버 실행:

```bash
uvicorn app.main:app --reload
```

## 🐳 Docker 실행 방법

1. Docker 이미지 빌드

```bash
docker build -t just3lines .
```

2. 컨테이너 실행 (로컬 포트 8000 사용)

```bash
docker run -p 8000:8000 --env-file .env just3lines
```

서버가 실행되면 다음 URL에서 접근 가능합니다:

- API 문서: http://localhost:8000/docs
- 웹 인터페이스: http://localhost:8000

## API 사용 방법

### 요약 API

**엔드포인트:** `POST /summarize`

**요청 본문:**

```json
{
  "content": "요약할 뉴스 기사 내용",
  "language": "korean" // 또는 "english"
}
```

**응답:**

```json
{
  "summary": ["첫 번째 요약 줄", "두 번째 요약 줄", "세 번째 요약 줄"]
}
```

## 테스트

테스트 실행:

```bash
pytest tests/
```

## 라이선스

MIT License
