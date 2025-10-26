
### Added
- Initial **Spring Boot** service for OrderDesk.
- **Maven** build support (`mvn clean package`) with reproducible builds.
- **Multi-stage Dockerfile**:
  - Stage 1: Build JAR using Maven.
  - Stage 2: Run using a slim non-root image.
- **.dockerignore** file to reduce image size and exclude local artifacts.
- **docker-compose.yml** for local orchestration:
  - `db` (PostgreSQL 15)
  - `app` (Spring Boot service)
  - `nginx` (reverse proxy)
- **Flyway database migrations** applied automatically at startup.
- **NGINX reverse proxy** configuration for routing `/` and `/orders/**`.
- **Optional HTTPS** support via self-signed certificates.
- **Scaling support** via `docker compose up --scale app=2`.
- **Health endpoint** (`/actuator/health`) and API verification commands.
- **README.md** with complete Quickstart, setup, and validation guide.

### Fixed
- ClassCastException in `StatsService` by correcting data type conversion.
- Docker Compose compatibility (removed deprecated `version` key).

### Changed
- Refactored application packaging and directory structure:
  - Centralized infra files (Docker, Compose, NGINX, etc.) at repo root.

---

## Versioning
This project uses **Semantic Versioning (SemVer)**:  
`MAJOR.MINOR.PATCH`

---

## Tags
```bash
git tag -a v0.1.0 -m "Initial Dockerized release v0.1.0"
git push origin --tags
git tag -n

