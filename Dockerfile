# Start from an existing image
FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

# Install a new library
RUN pip install faster_whisper flask

# Copy files from your local system into the Docker image
COPY ./ /whisper-server

WORKDIR /whisper-server

RUN python -c "from faster_whisper import WhisperModel; model = WhisperModel('large-v2', device='cuda', compute_type='float16')"

CMD ["python", "main.py"]

EXPOSE 5000
