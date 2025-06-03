FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    wget unzip git ffmpeg libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN wget https://github.com/invoke-ai/InvokeAI/releases/download/v5.6.0/InvokeAI-installer-v5.6.0.zip && \
    unzip InvokeAI-installer-v5.6.0.zip && \
    rm InvokeAI-installer-v5.6.0.zip

COPY start.sh /workspace/start.sh
RUN chmod +x /workspace/start.sh

EXPOSE 9090

CMD ["/workspace/start.sh"]
