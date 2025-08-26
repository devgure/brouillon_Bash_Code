#!/bin/bash

# =============================================================================
# Project Skeleton Generator: "encore"
# Creates full directory and file structure for a scalable matching platform
# =============================================================================

set -euo pipefail  # Exit on errors and undefined vars

PROJECT_NAME="encore"
echo "🚀 Creating project skeleton: $PROJECT_NAME/"

# Create project root
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Helper function to create a file with optional content
create_file() {
    local path="$1"
    local content="${2:-}"
    mkdir -p "$(dirname "$path")"
    : > "$path"  # Create empty file
    if [[ -n "$content" ]]; then
        echo "$content" > "$path"
    fi
}

# =============================================================================
# CLIENT
# =============================================================================
echo "📁 Creating client/ structure..."

# mobile/
mkdir -p client/mobile/src/{auth,profile,discovery,chat,components,hooks,navigation,services,i18n,utils}
create_file client/mobile/App.tsx "// Mobile App Entry (React Native + TypeScript)"
create_file client/mobile/index.js "// React Native entry point"

# web-mobile/ (PWA)
mkdir -p client/web-mobile/public
mkdir -p client/web-mobile/src/{pages,components,services,i18n}
create_file client/web-mobile/src/App.tsx "<App />"
create_file client/web-mobile/index.html "<title>Encore Mobile Web</title>"
create_file client/web-mobile/public/robots.txt ""

# web-desktop/ (SPA)
mkdir -p client/web-desktop/public
mkdir -p client/web-desktop/src/{layouts,pages,components}
create_file client/web-desktop/src/App.tsx "<App />"
create_file client/web-desktop/index.html "<title>Encore Desktop</title>"

# =============================================================================
# GATEWAY
# =============================================================================
echo "📁 Creating gateway/ structure..."

mkdir -p gateway/src/{routes,middleware,services}
create_file gateway/src/app.ts "// Express/Fastify main app"
create_file gateway/src/routes/auth.route.ts "export const authRouter = ...;"
create_file gateway/src/routes/user.route.ts "export const userRouter = ...;"
create_file gateway/src/routes/match.route.ts "export const matchRouter = ...;"
create_file gateway/src/routes/chat.route.ts "export const chatRouter = ...;"
create_file gateway/src/middleware/auth.middleware.ts "// JWT verification"
create_file gateway/src/middleware/rate-limit.ts "// Rate limiting middleware"
create_file gateway/src/middleware/cors.ts "// CORS setup"
create_file gateway/src/services/authService.ts "// Auth service client"
create_file gateway/src/services/matchService.ts "// Match service client"
create_file gateway/src/kong-config.yaml "# Kong API Gateway config"
create_file gateway/docker-compose.yml "# Dev orchestration for gateway + services"

# =============================================================================
# SERVICES
# =============================================================================
echo "📁 Creating services/ structure..."

# auth-service
mkdir -p services/auth-service/src/{auth,user}
create_file services/auth-service/src/main.ts "// Auth service bootstrap"
create_file services/auth-service/Dockerfile "# FROM node:18\n# Auth service container"

# profile-service
mkdir -p services/profile-service/src/{profile,media,facial-recognition}
create_file services/profile-service/Dockerfile "# Profile service Dockerfile"

# discovery-service
mkdir -p services/discovery-service/src/{location,search,redis-cache}
create_file services/discovery-service/Dockerfile "# Discovery service container"

# match-service
mkdir -p services/match-service/src/{swipe,match,queue}
create_file services/match-service/Dockerfile "# Match logic with queue"

# chat-service
mkdir -p services/chat-service/src/{chat,websocket,notifications}
create_file services/chat-service/Dockerfile "# WebSocket + chat logic"

# notification-service
mkdir -p services/notification-service/src/{fcm,email,templates}
create_file services/notification-service/Dockerfile "# Push, email, SMS"

# analytics-service
mkdir -p services/analytics-service/src/{events,reporting}
create_file services/analytics-service/Dockerfile "# Event tracking & reporting"

# admin-service
mkdir -p services/admin-service/src/admin/{users,reports,revenue}
create_file services/admin-service/src/main.ts "// Admin service entry"
create_file services/admin-service/Dockerfile "# Admin service container"

# media-service
mkdir -p services/media-service/src/controllers services/media-service/src/utils services/media-service/src/workers
create_file services/media-service/src/controllers/media.js "// Handle uploads"
create_file services/media-service/src/utils/s3Uploader.js "// S3 upload utility"
create_file services/media-service/src/workers/moderationWorker.js "// NSFW worker"
create_file services/media-service/Dockerfile "# Media service with S3"

# billing-service
mkdir -p services/billing-service/src/controllers services/billing-service/src/utils services/billing-service/src/models
create_file services/billing-service/src/controllers/checkout.js "// Stripe checkout handler"
create_file services/billing-service/src/utils/stripeWebhook.js "// Webhook processor"
create_file services/billing-service/src/models/Subscription.js "// Subscription schema"
create_file services/billing-service/Dockerfile "# Billing with Stripe"

# =============================================================================
# AI-ENGINE
# =============================================================================
echo "📁 Creating ai-engine/ structure..."

# recommendation-engine
mkdir -p ai-engine/recommendation-engine/models ai-engine/recommendation-engine/api
create_file ai-engine/recommendation-engine/models/collaborative_filtering.py "# Collaborative filtering model"
create_file ai-engine/recommendation-engine/models/content_based.py "# Content-based recommendations"
create_file ai-engine/recommendation-engine/api/server.py "# FastAPI server"
create_file ai-engine/recommendation-engine/requirements.txt "fastapi\nscikit-learn\nnumpy"

# nlp-analyzer
mkdir -p ai-engine/nlp-analyzer/nlp
create_file ai-engine/nlp-analyzer/nlp/sentiment.py "# Sentiment analysis"
create_file ai-engine/nlp-analyzer/nlp/icebreaker.py "# Generate icebreakers"
create_file ai-engine/nlp-analyzer/nlp/moderation.py "# Toxicity detection"
create_file ai-engine/nlp-analyzer/app.py "# NLP FastAPI app"

# image-moderation
mkdir -p ai-engine/image-moderation/detector
create_file ai-engine/image-moderation/detector/nsfw.py "# NSFW detection"
create_file ai-engine/image-moderation/detector/face_validator.py "# Face validation"
create_file ai-engine/image-moderation/api.py "# Image moderation API"

# behavioral-predictor
mkdir -p ai-engine/behavioral-predictor
create_file ai-engine/behavioral-predictor/churn_model.py "# Churn prediction"
create_file ai-engine/behavioral-predictor/swipe_predictor.py "# Predict swipe behavior"

# =============================================================================
# DATA
# =============================================================================
echo "📁 Creating data/ structure..."

# docker/
mkdir -p data/docker/{mongodb,redis,elasticsearch,minio}

# kubernetes/
mkdir -p data/kubernetes/deployments data/kubernetes/services data/kubernetes/ingress data/kubernetes/helm-charts
create_file data/kubernetes/deployments/auth-deployment.yaml "# Auth deployment"
create_file data/kubernetes/deployments/chat-deployment.yaml "# Chat deployment"
create_file data/kubernetes/deployments/... "# Placeholder for others"
create_file data/kubernetes/services/service.yaml "# K8s service"
create_file data/kubernetes/ingress/ingress.yaml "# Ingress rule"
create_file data/kubernetes/helm-charts/Chart.yaml "# Helm chart metadata"

# terraform/
mkdir -p data/terraform/aws
create_file data/terraform/aws/vpc.tf "# VPC setup"
create_file data/terraform/aws/eks.tf "# EKS cluster"
create_file data/terraform/aws/rds.tf "# RDS for analytics"
create_file data/terraform/aws/s3.tf "# S3 for media"
create_file data/terraform/variables.tf "# Terraform variables"

# =============================================================================
# MONITORING
# =============================================================================
echo "📁 Creating monitoring/ structure..."

mkdir -p monitoring/prometheus monitoring/grafana/dashboards monitoring/logging/fluentd monitoring/logging/elasticsearch-kibana
create_file monitoring/prometheus/prometheus.yml "# scrape_configs: []"
create_file monitoring/grafana/dashboards/system.json "{}"
create_file monitoring/logging/fluentd/fluent.conf "# Log collector"
create_file monitoring/sentry.config.js "// Sentry DSN and config"

# =============================================================================
# SCRIPTS
# =============================================================================
echo "📁 Creating scripts/ structure..."

mkdir -p scripts
create_file scripts/deploy.sh "#!/bin/bash\n# Deploy to staging/prod"
create_file scripts/migrate-db.sh "#!/bin/bash\n# DB migration script"
create_file scripts/seed-data.js "// Seed database with test users"
chmod +x scripts/*.sh

# =============================================================================
# DOCS
# =============================================================================
echo "📁 Creating docs/ structure..."

mkdir -p docs
create_file docs/API.md "# API Endpoints\n- `POST /auth/login`"
create_file docs/ARCHITECTURE.md "# System Architecture\n![C4 Model](diagram.png)"
create_file docs/i18n-guidelines.md "# i18n Guidelines\nUse react-i18next with JSON bundles"

# =============================================================================
# ROOT FILES
# =============================================================================
echo "📄 Creating root configuration files..."

create_file docker-compose.yml "# Orchestrate services in development"
create_file Makefile "
build:
\t@echo 'Build all services'

up:
\tdocker-compose up -d
"

create_file .env.example "
NODE_ENV=development
JWT_SECRET=supersecret
MONGODB_URI=mongodb://localhost:27017/encore
STRIPE_KEY=pk_test_...
"

create_file README.md "# Encore\n> Scalable Matching Platform\n\n## 📁 Structure\n- **client/** — Multi-platform UIs\n- **gateway/** — BFF & API Gateway\n- **services/** — Microservices\n- **ai-engine/** — Recommendation & NLP\n- **data/** — Infrastructure as Code\n\n## 🚀 Quick Start\n\`\`\`bash\nmake up\n\`\`\`"

# =============================================================================
# FINAL MESSAGE
# =============================================================================
echo ""
echo "✅ Project skeleton created: ./$PROJECT_NAME/"
echo "📦 Folders: 10+ modules | 15+ services | Full DevOps & AI layers"
echo "💡 Next: cd encore && git init && code ."
echo "✨ Happy coding!"
