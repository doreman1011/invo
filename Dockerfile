FROM python:3.10-slim

# Install required packages
RUN apt-get update && apt-get install -y \
    wget unzip git ffmpeg libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /workspace

# Download and unzip installer
RUN wget https://github.com/invoke-ai/InvokeAI/releases/download/v5.6.0/InvokeAI-installer-v5.6.0.zip && \
    unzip InvokeAI-installer-v5.6.0.zip && \
    rm InvokeAI-installer-v5.6.0.zip

# Copy automation script
COPY start.sh /workspace/start.sh
RUN chmod +x /workspace/start.sh

CMD ["/workspace/start.sh"]
