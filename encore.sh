#!/usr/bin/env bash
# mkrepo.sh – create empty BuildBrain-OS repo skeleton
# usage:  ./mkrepo.sh   (run inside the repo root)

set -euo pipefail

# ---------- helper ----------------------------------------------------------
mkdir_touch(){
  # $1 = dir path,  $2 = file name (optional)
  mkdir -p "$1"
  [[ -n "${2:-}" ]] && touch "$1/$2"
}

# ---------- root level ------------------------------------------------------
mkdir_touch "" ".gitignore"
mkdir_touch "" "README.md"
mkdir_touch "" "Makefile"
mkdir_touch "" "docker-compose.yml"

# ---------- client ----------------------------------------------------------
mkdir_touch "client/mobile" "app.json"
mkdir_touch "client/mobile" "App.tsx"
mkdir_touch "client/mobile/components"
mkdir_touch "client/mobile/screens" "Dashboard.tsx"
mkdir_touch "client/mobile/screens/Projects"
mkdir_touch "client/mobile/screens" "BlueprintViewer.tsx"
mkdir_touch "client/mobile/screens" "SafetyInspection.tsx"
mkdir_touch "client/mobile/screens" "BidMarketplace.tsx"
mkdir_touch "client/mobile/lib/database"
mkdir_touch "client/mobile/lib/location"
mkdir_touch "client/mobile/lib/voice"
mkdir_touch "client/mobile/assets"
mkdir_touch "client/mobile/hooks"
mkdir_touch "client/mobile/navigation"
mkdir_touch "client/mobile/services" "api.ts"
mkdir_touch "client/mobile/i18n"

mkdir_touch "client/web-mobile/public"
mkdir_touch "client/web-mobile/src/components"
mkdir_touch "client/web-mobile/src/pages"
mkdir_touch "client/web-mobile/src/hooks"
mkdir_touch "client/web-mobile/src/services" "api.ts"
mkdir_touch "client/web-mobile/src/i18n"
mkdir_touch "client/web-mobile/src" "App.tsx"
mkdir_touch "client/web-mobile" "vite.config.ts"

mkdir_touch "client/web-desktop/public"
mkdir_touch "client/web-desktop/src/components"
mkdir_touch "client/web-desktop/src/pages"
mkdir_touch "client/web-desktop/src/layout"
mkdir_touch "client/web-desktop/src/services" "api.ts"
mkdir_touch "client/web-desktop/src/i18n"
mkdir_touch "client/web-desktop/src" "App.tsx"
mkdir_touch "client/web-desktop" "next.config.js"

# ---------- gateway ---------------------------------------------------------
mkdir_touch "gateway" "server.js"
mkdir_touch "gateway/routes" "auth.js"
mkdir_touch "gateway/routes" "projects.js"
mkdir_touch "gateway/routes" "agents.js"
mkdir_touch "gateway/middleware" "auth.js"
mkdir_touch "gateway/graphql" "schema.graphql"
mkdir_touch "gateway" "docker-compose.yml"
mkdir_touch "gateway" "Dockerfile"

# ---------- services --------------------------------------------------------
for svc in auth-service user-service project-service document-service \
           compliance-service marketplace-service notification-service \
           analytics-service shared-types; do
  mkdir_touch "services/$svc/src/controllers"
done

mkdir_touch "services/auth-service/src" "main.ts"
mkdir_touch "services/auth-service/src/models" "user.entity.ts"
mkdir_touch "services/auth-service/src/services" "auth.service.ts"
mkdir_touch "services/auth-service" "package.json"
mkdir_touch "services/auth-service" "Dockerfile"
mkdir_touch "services/auth-service/k8s" "deployment.yaml"

mkdir_touch "services/user-service/src/controllers" "user.controller.ts"
mkdir_touch "services/user-service/src/models" "user.entity.ts"
mkdir_touch "services/user-service" "Dockerfile"

mkdir_touch "services/project-service/src/controllers" "project.controller.ts"
mkdir_touch "services/project-service/src/models" "project.entity.ts"
mkdir_touch "services/project-service" "Dockerfile"

mkdir_touch "services/document-service/src/controllers" "document.controller.ts"
mkdir_touch "services/document-service/src/services" "pdf.extractor.ts"
mkdir_touch "services/document-service" "Dockerfile"

mkdir_touch "services/compliance-service/src/controllers" "compliance.controller.ts"
mkdir_touch "services/compliance-service/src/services" "ocr.validator.ts"
mkdir_touch "services/compliance-service" "Dockerfile"

mkdir_touch "services/marketplace-service/src/controllers" "marketplace.controller.ts"
mkdir_touch "services/marketplace-service/src/models" "bid.entity.ts"
mkdir_touch "services/marketplace-service" "Dockerfile"

mkdir_touch "services/notification-service/src/services" "twilio.service.ts"
mkdir_touch "services/notification-service" "Dockerfile"

mkdir_touch "services/analytics-service/src/controllers" "analytics.controller.ts"
mkdir_touch "services/analytics-service" "Dockerfile"

mkdir_touch "services/shared-types/src/types" "user.interface.ts"
mkdir_touch "services/shared-types/src/types" "project.interface.ts"
mkdir_touch "services/shared-types/src/types" "ai-agent.interface.ts"
mkdir_touch "services/shared-types" "package.json"

# ---------- ai-agents -------------------------------------------------------
for ag in blueprint-agent safety-agent compliance-ocr-agent bid-scraper-agent scheduler-agent; do
  mkdir_touch "ai-agents/$ag" "app.py"
  mkdir_touch "ai-agents/$ag" "requirements.txt"
  mkdir_touch "ai-agents/$ag" "Dockerfile"
done
mkdir_touch "ai-agents/blueprint-agent/models" "blueprint_analyzer.py"
mkdir_touch "ai-agents/safety-agent/models" "safety_detector.py"
mkdir_touch "ai-agents/compliance-ocr-agent/models" "coi_validator.py"
mkdir_touch "ai-agents/bid-scraper-agent" "scraper.py"
mkdir_touch "ai-agents/bid-scraper-agent/models" "bid_matcher.py"
mkdir_touch "ai-agents/scheduler-agent/models" "scheduler.py"

# ---------- orchestration ---------------------------------------------------
mkdir_touch "orchestration/workflows" "rfi_workflow.py"
mkdir_touch "orchestration/workflows" "sub_onboarding.py"
mkdir_touch "orchestration/workflows" "safety_alert.py"
mkdir_touch "orchestration/activities" "send_sms.py"
mkdir_touch "orchestration/activities" "validate_insurance.py"
mkdir_touch "orchestration/activities" "extract_blueprint.py"
mkdir_touch "orchestration" "docker-compose.yml"
mkdir_touch "orchestration" "Dockerfile"

# ---------- data ------------------------------------------------------------
mkdir_touch "data/mongodb" "schema.prisma"
mkdir_touch "data/mongodb/migrations"
mkdir_touch "data/mongodb" "seed.ts"
mkdir_touch "data/qdrant" "config.yaml"
mkdir_touch "data/qdrant/collections" "buildbrain.yaml"
mkdir_touch "data" "redis.conf"
mkdir_touch "data/neo4j" "constraints.cql"

# ---------- infra ------------------------------------------------------------
mkdir_touch "infra/k8s" "namespace.yaml"
mkdir_touch "infra/k8s" "ingress.yaml"
mkdir_touch "infra/k8s" "postgres-deployment.yaml"
mkdir_touch "infra/k8s" "mongodb-statefulset.yaml"
mkdir_touch "infra/k8s" "redis-deployment.yaml"
mkdir_touch "infra/k8s" "kustomization.yaml"
mkdir_touch "infra/docker" "docker-compose.yml"
mkdir_touch "infra/terraform" "main.tf"
mkdir_touch "infra/terraform" "variables.tf"
mkdir_touch "infra/terraform" "eks-cluster.tf"

# ---------- monitoring -------------------------------------------------------
mkdir_touch "monitoring" "prometheus.yml"
mkdir_touch "monitoring/grafana/dashboards" "buildbrain.json"
mkdir_touch "monitoring/elasticsearch" "logstash.conf"
mkdir_touch "monitoring" "sentry.config.js"

# ---------- admin-dashboard --------------------------------------------------
mkdir_touch "admin-dashboard/src/pages" "Users.tsx"
mkdir_touch "admin-dashboard/src/pages" "Reports.tsx"
mkdir_touch "admin-dashboard/src/pages" "Analytics.tsx"
mkdir_touch "admin-dashboard/src/pages" "Settings.tsx"
mkdir_touch "admin-dashboard/src/services" "adminApi.ts"
mkdir_touch "admin-dashboard/src/layout"
mkdir_touch "admin-dashboard" "Dockerfile"

# ---------- tests ------------------------------------------------------------
mkdir_touch "tests/unit" "auth.test.ts"
mkdir_touch "tests/unit" "project.test.ts"
mkdir_touch "tests/integration" "match.integration.test.ts"
mkdir_touch "tests/e2e" "mobile.test.js"
mkdir_touch "tests/e2e" "web.test.js"

# ---------- scripts ----------------------------------------------------------
mkdir_touch "scripts" "deploy.sh"
mkdir_touch "scripts" "migrate-db.js"
mkdir_touch "scripts" "seed-ai-models.py"

echo "✅  BuildBrain-OS skeleton created."
