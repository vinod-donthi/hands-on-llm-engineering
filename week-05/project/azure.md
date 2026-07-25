# Production AI Stack — Azure Container Apps

> Week 5 Project · **Optional** — not required for exit · [← Docker](docker.md)

Deploy the same container images from Compose to **Azure Container Apps** with managed Redis.

## Prerequisites

- Azure subscription
- `az` CLI logged in
- Container image in Azure Container Registry (ACR)

## Step-by-step

### 1. Resource group and environment

```bash
export RG=rg-production-ai-stack
export LOC=eastus
export CAE=cae-production-ai

az group create -n $RG -l $LOC
az containerapp env create -n $CAE -g $RG -l $LOC
```

### 2. Azure Cache for Redis (recommended)

```bash
az redis create \
  -n redis-production-ai -g $RG -l $LOC \
  --sku Basic --vm-size c0
```

Note connection string for `REDIS_URL` (SSL port 6380 in prod).

### 3. Build and push image

```bash
export ACR=acrproductionai
az acr create -n $ACR -g $RG --sku Basic
az acr build -r $ACR -t production-ai-api:latest ./backend
```

### 4. Deploy API container app

```bash
az containerapp create \
  -n production-ai-api -g $RG \
  --environment $CAE \
  --image $ACR.azurecr.io/production-ai-api:latest \
  --registry-server $ACR.azurecr.io \
  --target-port 8000 \
  --ingress external \
  --min-replicas 1 --max-replicas 3 \
  --secrets openai-key="$OPENAI_API_KEY" langfuse-secret="$LANGFUSE_SECRET_KEY" \
  --env-vars \
    REDIS_URL=secretref:redis-url \
    OPENAI_API_KEY=secretref:openai-key \
    LANGFUSE_SECRET_KEY=secretref:langfuse-secret \
    LANGFUSE_PUBLIC_KEY="$LANGFUSE_PUBLIC_KEY" \
    LANGFUSE_HOST=https://cloud.langfuse.com
```

Add `redis-url` secret separately from Azure Redis connection string.

### 5. Deploy worker (internal)

```bash
az containerapp create \
  -n production-ai-worker -g $RG \
  --environment $CAE \
  --image $ACR.azurecr.io/production-ai-api:latest \
  --command "arq" "app.worker.WorkerSettings" \
  --ingress internal \
  --min-replicas 1 --max-replicas 2 \
  --env-vars REDIS_URL=secretref:redis-url OPENAI_API_KEY=secretref:openai-key
```

### 6. Verify

```bash
export FQDN=$(az containerapp show -n production-ai-api -g $RG \
  --query properties.configuration.ingress.fqdn -o tsv)
curl -s "https://$FQDN/ready" | jq .
```

## Scale rule (HTTP)

```bash
az containerapp update -n production-ai-api -g $RG \
  --scale-rule-name http-scale \
  --scale-rule-type http \
  --scale-rule-http-concurrency 50
```

## Cost control

- Set `--min-replicas 0` for dev sandboxes (accept cold starts)
- Tear down: `az group delete -n $RG --yes --no-wait`
- Use Azure OpenAI with quota limits for prod pilots

## Optional AKS note

If your org standardizes on Kubernetes, the same images deploy as:

- `Deployment` + `Service` for `api`
- `Deployment` for `worker` (no ingress)
- `HorizontalPodAutoscaler` on CPU or custom metric `http_requests`

See [azure-deployment.md](../theory/azure-deployment.md) — **not exit criteria**.

## Next

[Acceptance criteria](acceptance-criteria.md) · [Day 7 playbook](../daily/day-07.md)
