ARG PYTHON_BASE=3.13

# === *** Build Stage *** ===

FROM python:$PYTHON_BASE AS builder

# Install PDM

RUN pip install -U pdm
ENV PDM_CHECK_UPDATE=false

# Copy source files

COPY pyproject.toml pdm.lock README.md /project/
COPY src/ /project/src

# Install dependencies

WORKDIR /project
RUN pdm install --check --prod --no-editable

# === *** Run Stage *** ===

FROM python:$PYTHON_BASE

# Retrieve packages from build stage

COPY --from=builder /project/.venv/ /project/.venv
ENV PATH="/project/.venv/bin:$PATH"

COPY src /project/src

EXPOSE 8000

CMD ["fastapi", "run", "/project/src/pdm_app_deployment_practice/main.py"]