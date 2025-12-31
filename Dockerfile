FROM python:3.11-slim

WORKDIR /app

# Install system dependencies for audio processing
RUN apt-get update && apt-get install -y --no-install-recommends \
    libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# Install base requirements (do this BEFORE copying source files so it's cached)
RUN pip install --no-cache-dir flask

# Install optional TTS dependencies (won't fail if not used)
RUN pip install --no-cache-dir kokoro>=0.9.2 soundfile || true

# Create ai_voice directory (will be mounted if model exists)
RUN mkdir -p /app/ai_voice

# Copy source files LAST so changes don't invalidate pip cache
COPY app.py .
COPY templates templates/

EXPOSE 5000

CMD ["python", "app.py"]
