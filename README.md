# Just3Lines

뉴스 기사를 3줄로 요약해주는 FastAPI 기반의 AI 요약 서비스입니다.  
[🔗 바로 사용해보기](https://just3lines.onrender.com)

---

## 🧠 주요 기능

- 뉴스 기사 텍스트를 3줄로 요약 (한국어 / 영어 지원)
- REST API 및 웹 UI 제공
- OpenAI GPT-3.5 기반 요약 기능

---

## ⚙️ 기술 스택

- Python 3.9+
- FastAPI
- OpenAI GPT-3.5 (API)
- Pydantic
- Jinja2 (템플릿)
- pytest (테스트)
- Docker (배포)

---

## 🔄 CI/CD

이 프로젝트는 GitHub Actions를 사용하여 CI/CD 파이프라인을 구축했습니다. 주요 기능은 다음과 같습니다.

- **코드 품질 검사 (Linting)**: `flake8`을 사용하여 Python 코드 스타일을 자동으로 검사합니다. 정해진 규칙을 위반하는 코드가 있을 경우 빌드가 실패하여 코드 품질을 일정하게 유지합니다.
- **자동화된 테스트**: 새로운 코드가 푸시될 때마다 `pytest`로 모든 테스트를 자동으로 실행하여 기능의 안정성을 보장합니다.
- **다중 Python 버전 호환성 확인**: Python 3.9 및 3.10 버전에서 모두 테스트를 수행하여 호환성을 확인합니다.
- **Docker 이미지 자동 빌드 및 푸시**: `main` 브랜치에 코드가 푸시될 때마다 최신 Docker 이미지를 빌드하고 GitHub Container Registry(GHCR)에 자동으로 푸시합니다. 이를 통해 배포 준비를 자동화합니다.

워크플로우 설정은 `.github/workflows/python-app.yml` 파일에서 확인할 수 있습니다.

---

## 📁 프로젝트 구조

```
just3lines/
├── app/
│   ├── main.py                 # FastAPI 애플리케이션 시작점
│   ├── api/routes.py           # API 라우터
│   ├── core/config.py          # 설정 및 환경변수
│   └── services/openai_service.py  # OpenAI GPT 통합
├── tests/                      # pytest 기반 테스트
├── static/                     # 정적 파일 (필요 시 사용)
├── templates/                  # HTML 템플릿
├── requirements.txt            # 패키지 목록
└── README.md
```

---

## 🚀 실행 방법

### 1. 저장소 클론

```bash
git clone https://github.com/your-username/Just3Lines.git
cd Just3Lines
```

---

### 2. 로컬 실행 (uv 사용)

[uv](https://github.com/astral-sh/uv)는 Python 환경 및 의존성 관리를 빠르게 해주는 최신 도구입니다.

#### 📦 uv 설치

```bash
# macOS
curl -LsSf https://astral.sh/uv/install.sh | sh

# Windows (PowerShell)
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
```

#### ▶ 가상환경 생성 및 패키지 설치

```bash
uv venv
uv pip install -r requirements.txt
```

#### 🔐 환경변수 설정

루트 디렉토리에 `.env` 파일을 생성 후 다음 내용을 작성하세요:

```
OPENAI_API_KEY=your_api_key_here
```

#### ▶ 앱 실행

```bash
uvicorn app.main:app --reload
```

접속:

- http://localhost:8000 (웹 인터페이스)
- http://localhost:8000/docs (Swagger 문서)

---

### 3. Docker 실행 (선택 사항)

```bash
docker build -t just3lines .
docker run -p 8000:8000 --env-file .env just3lines
```

---

## 📡 API 사용 방법

### ✨ 요약 API

- **엔드포인트:** `POST /summarize`
- **요청 예시:**

```json
{
  "content": "요약할 뉴스 기사 내용",
  "language": "korean" // 또는 "english"
}
```

- **응답 예시:**

```json
{
  "summary": ["첫 번째 요약 줄", "두 번째 요약 줄", "세 번째 요약 줄"]
}
```

---

## 🧪 테스트

```bash
pytest tests/
```

> OpenAI 호출은 mocking 되어 있으므로 실제 API 키 없이도 테스트가 가능합니다.

---

## 🌐 배포 주소

프로젝트는 Render를 통해 배포되어 있습니다:

🔗 https://just3lines.onrender.com

- 웹 UI: `/`
- API 문서: `/docs`

---

## 🪪 라이선스

이 프로젝트는 [MIT License](LICENSE)를 따릅니다.  
자유롭게 수정 및 사용하실 수 있습니다.
