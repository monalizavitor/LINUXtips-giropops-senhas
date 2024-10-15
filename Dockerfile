FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

FROM cgr.dev/chainguard/python:latest
COPY --from=builder /home/nonroot/.local/ /home/nonroot/.local/
ENV PATH=PATH:/home/nonroot/.local/bin/
COPY . .
EXPOSE 5000
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
