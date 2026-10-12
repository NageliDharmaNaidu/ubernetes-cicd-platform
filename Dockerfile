FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PORT=8080
WORKDIR /app
RUN useradd --system --uid 10001 appuser
COPY app/server.py .
USER 10001
EXPOSE 8080
CMD ["python", "server.py"]
