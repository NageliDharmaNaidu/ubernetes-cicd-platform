# Kubernetes CI/CD Resume Project

A starter DevOps project: a tiny HTTP service, container image, Kubernetes deployment, and GitHub Actions build/smoke-check pipeline. It is designed to run locally with Docker and `kind`, with no cloud account required.

## Requirements

- Docker Desktop (or Docker Engine)
- `kubectl`
- `kind`

## Run the app in Docker

```sh
docker build -t resume-devops-app:local .
docker run --rm -p 8080:8080 resume-devops-app:local
```

In another terminal, check `http://localhost:8080/health`.

## Deploy to a local Kubernetes cluster

```sh
kind create cluster --name devops-demo
docker build -t resume-devops-app:local .
kind load docker-image resume-devops-app:local --name devops-demo
kubectl apply -f k8s/app.yaml
kubectl rollout status deployment/resume-devops-app
kubectl port-forward service/resume-devops-app 8080:8080
```

Then visit `http://localhost:8080/health`. Clean up with `kind delete cluster --name devops-demo`.

## CI

The GitHub Actions workflow builds the image for pushes to `main` and pull requests, then starts it and checks `/health`. It does not publish an image yet; registry publishing and automated cluster deployment are planned next steps.

## Next improvements

1. Add automated app tests and vulnerability scanning.
2. Publish images to GitHub Container Registry.
3. Add Helm packaging and deploy through CI.
4. Add Prometheus/Grafana monitoring and document a sample release.

## Resume bullet (after you run and extend it)

Built a containerized HTTP service and Kubernetes deployment with health probes, resource limits, non-root security, and a GitHub Actions image build and smoke check.
