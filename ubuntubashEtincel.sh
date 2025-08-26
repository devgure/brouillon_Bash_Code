###!/bin/bash

# Project Skeleton Generator for "matchly"
# Creates full directory structure and placeholder files

set -e  # Exit on any error

echo "🚀 Creating Matchly Project Skeleton..."

PROJECT_ROOT="matchly"
mkdir -p "$PROJECT_ROOT"
cd "$PROJECT_ROOT"

# Helper function to create a file with optional content
create_file() {
    local path="$1"
    local content="$2"
    mkdir -p "$(dirname "$path")"
    echo "$content" > "$path"
}

# ==============================================================================
# CLIENT
# ==============================================================================
echo "📁 Creating client/ structure..."

# mobile-native (React Native)
mkdir -p client/mobile-native/src/{auth,profile,discovery,chat,components}
create_file client/mobile-native/src/App.js "// React Native App Entry"
create_file client/mobile-native/package.json "{}"
create_file client/mobile-native/metro.config.js "// Metro config for React Native"

# mobile-web (PWA with React + Vite)
mkdir -p client/mobile-web/public
mkdir -p client/mobile-web/src/{pages,hooks,services}
create_file client/mobile-web/src/services/api.js "// API service for PWA"
create_file client/mobile-web/src/App.jsx "<App />"
create_file client/mobile-web/vite.config.js "// Vite config"
create_file client/mobile-web/manifest.json "{}"

# desktop-web (React SPA)
mkdir -p client/desktop-web/src/{routes,views,store}
create_file client/desktop-web/src/main.jsx "// Desktop main entry"
create_file client/desktop-web/index.html "<title>Matchly Desktop</title>"

# ==============================================================================
# GATEWAY (API Gateway / BFF)
# ==============================================================================
echo "📁 Creating gateway/ structure..."

mkdir -p gateway/routes gateway/middleware gateway/services gateway/graphql
create_file gateway/server.js "// Express/Fastify gateway server"
create_file gateway/routes/auth.js "router.post('/login', ...)"
create_file gateway/routes/user.js "// User routes"
create_file gateway/routes/match.js "// Match routes"
create_file gateway/routes/chat.js "// Chat routes"
create_file gateway/middleware/auth.js "// Auth middleware"
create_file gateway/middleware/rateLimit.js "// Rate limiting"
create_file gateway/middleware/logger.js "// Request logger"
create_file gateway/services/authServiceClient.js "// gRPC or HTTP client to auth-service"
create_file gateway/services/matchServiceClient.js "// Client for match-service"
create_file gateway/services/chatServiceClient.js "// Client for chat-service"
create_file gateway/graphql/schema.graphql "# schema { query: Query }"
create_file gateway/docker-compose.yml "# For local dev orchestration"

# ==============================================================================
# SERVICES
# ==============================================================================
echo "📁 Creating services/ structure..."

# auth-service
mkdir -p services/auth-service/src/controllers services/auth-service/src/models services/auth-service/src/utils
create_file services/auth-service/src/controllers/auth.js "// Auth logic"
create_file services/auth-service/src/models/User.js "// User model"
create_file services/auth-service/src/utils/jwt.js "// JWT helpers"
create_file services/auth-service/package.json "{}"
create_file services/auth-service/Dockerfile "# Dockerfile for auth-service"

# profile-service
mkdir -p services/profile-service/src/controllers services/profile-service/src/models services/profile-service/src/middleware
create_file services/profile-service/src/controllers/profile.js "// Profile controller"
create_file services/profile-service/src/models/Profile.js "// Profile model"
create_file services/profile-service/src/middleware/i18n.js "// i18n setup"
create_file services/profile-service/Dockerfile "# Dockerfile for profile-service"

# discovery-service
mkdir -p services/discovery-service/src/controllers services/discovery-service/src/utils
create_file services/discovery-service/src/controllers/discovery.js "// Discovery logic"
create_file services/discovery-service/src/utils/geolocation.js "// Redis-backed geolocation"
create_file services/discovery-service/src/redisClient.js "// Redis connection"
create_file services/discovery-service/Dockerfile "# Dockerfile for discovery-service"

# match-service
mkdir -p services/match-service/src/controllers services/match-service/src/models services/match-service/src/events
create_file services/match-service/src/controllers/match.js "// Swipe & match logic"
create_file services/match-service/src/models/Match.js "// Match model"
create_file services/match-service/src/events/kafkaProducer.js "// Kafka producer"
create_file services/match-service/Dockerfile "# Dockerfile for match-service"

# chat-service
mkdir -p services/chat-service/src services/chat-service/src/db
create_file services/chat-service/src/server.js "// Socket.IO server"
create_file services/chat-service/src/controllers/chat.js "// Chat controller"
create_file services/chat-service/src/db/mongo.js "// MongoDB connection"
create_file services/chat-service/Dockerfile "# Dockerfile for chat-service"

# media-service
mkdir -p services/media-service/src/controllers services/media-service/src/utils services/media-service/src/workers
create_file services/media-service/src/controllers/media.js "// Upload & serve media"
create_file services/media-service/src/utils/s3Uploader.js "// S3 upload logic"
create_file services/media-service/src/workers/moderationWorker.js "// NSFW detection worker"
create_file services/media-service/Dockerfile "# Dockerfile for media-service"

# notification-service
mkdir -p services/notification-service/src/services services/notification-service/src/routes
create_file services/notification-service/src/services/fcm.js "// Firebase Cloud Messaging"
create_file services/notification-service/src/services/email.js "// Email service (e.g., SendGrid)"
create_file services/notification-service/src/routes/webhook.js "// Webhook handler"
create_file services/notification-service/Dockerfile "# Dockerfile for notification-service"

# analytics-service
mkdir -p services/analytics-service/src/routes services/analytics-service/src services/analytics-service/src/db
create_file services/analytics-service/src/routes/events.js "// Track user events"
create_file services/analytics-service/src/kafkaConsumer.js "// Consume events from Kafka"
create_file services/analytics-service/src/db/bigquery.js "// Google BigQuery integration"
create_file services/analytics-service/Dockerfile "# Dockerfile for analytics-service"

# billing-service
mkdir -p services/billing-service/src/controllers services/billing-service/src/utils services/billing-service/src/models
create_file services/billing-service/src/controllers/checkout.js "// Stripe checkout"
create_file services/billing-service/src/utils/stripeWebhook.js "// Handle Stripe webhooks"
create_file services/billing-service/src/models/Subscription.js "// Subscription model"
create_file services/billing-service/Dockerfile "# Dockerfile for billing-service"

# ==============================================================================
# AI-ENGINE
# ==============================================================================
echo "📁 Creating ai-engine/ structure..."

# recommendation-engine
mkdir -p ai-engine/recommendation-engine/models
create_file ai-engine/recommendation-engine/app.py "# FastAPI app"
create_file ai-engine/recommendation-engine/models/collaborative.py "# Collaborative filtering"
create_file ai-engine/recommendation-engine/models/content.py "# Content-based filtering"
create_file ai-engine/recommendation-engine/Dockerfile "# Dockerfile for recommendation-engine"

# nlp-analyzer
mkdir -p ai-engine/nlp-analyzer/models ai-engine/nlp-analyzer/utils
create_file ai-engine/nlp-analyzer/app.py "# NLP FastAPI server"
create_file ai-engine/nlp-analyzer/models/toxicity.py "# Hugging Face Transformers"
create_file ai-engine/nlp-analyzer/utils/icebreaker_suggestions.py "# Generate openers"
create_file ai-engine/nlp-analyzer/Dockerfile "# Dockerfile for nlp-analyzer"

# image-moderation
mkdir -p ai-engine/image-moderation/models ai-engine/image-moderation/utils
create_file ai-engine/image-moderation/app.py "# Image moderation API"
create_file ai-engine/image-moderation/models/facenet.py "# Face validation"
create_file ai-engine/image-moderation/models/nsfw.py "# NSFW detection"
create_file ai-engine/image-moderation/utils/best_photo_suggest.py "# Suggest best profile pic"
create_file ai-engine/image-moderation/Dockerfile "# Dockerfile for image-moderation"

# behavioral-predictor
mkdir -p ai-engine/behavioral-predictor
create_file ai-engine/behavioral-predictor/app.py "# Prediction API"
create_file ai-engine/behavioral-predictor/models/churn_model.pkl ""  # Placeholder binary
create_file ai-engine/behavioral-predictor/predict.py "# Inference script"
create_file ai-engine/behavioral-predictor/Dockerfile "# Dockerfile for behavioral-predictor"

# ==============================================================================
# DATA
# ==============================================================================
echo "📁 Creating data/ structure..."

mkdir -p data/mongodb data/redis/config data/elasticsearch
create_file data/docker-compose-db.yml "# MongoDB, Redis, ES, MinIO"
create_file data/mongodb/init.js "// Seed users, profiles"
create_file data/redis/config/redis.conf "# Redis config"
create_file data/elasticsearch/mappings/users.json "{ mappings: { properties: {} } }"

# ==============================================================================
# INFRA
# ==============================================================================
echo "📁 Creating infra/ structure..."

# k8s
mkdir -p infra/k8s/deployments infra/k8s/services infra/k8s/ingress
create_file infra/k8s/deployments/auth-deployment.yaml "# K8s deployment for auth"
create_file infra/k8s/deployments/match-deployment.yaml "# Match service deployment"
create_file infra/k8s/deployments/gateway-deployment.yaml "# Gateway deployment"
create_file infra/k8s/services/nodeport-service.yaml "# Expose services"
create_file infra/k8s/ingress/kong-ingress.yaml "# Kong ingress controller"

# terraform
mkdir -p infra/terraform
create_file infra/terraform/main.tf "# Terraform: main resources"
create_file infra/terraform/eks-cluster.tf "# EKS cluster module"
create_file infra/terraform/s3-bucket.tf "# S3 for media backup"

# cicd
mkdir -p infra/cicd/github-actions
create_file infra/cicd/docker-build.sh "#!/bin/bash\n# Build all Docker images"
chmod +x infra/cicd/docker-build.sh
create_file infra/cicd/github-actions/test.yml "# GitHub Actions: test pipeline"
create_file infra/cicd/github-actions/deploy-services.yml "# Deploy to staging"

# monitoring
mkdir -p infra/monitoring
create_file infra/monitoring/prometheus.yml "# Prometheus scrape config"
create_file infra/monitoring/grafana-dashboard.json "{}"
create_file infra/monitoring/sentry.config.js "// Sentry error tracking"

# ==============================================================================
# ADMIN-DASHBOARD
# ==============================================================================
echo "📁 Creating admin-dashboard/ structure..."

mkdir -p admin-dashboard/src/pages admin-dashboard/src/services
create_file admin-dashboard/src/pages/Users.js "// Admin: User management"
create_file admin-dashboard/src/pages/Reports.js "// Report moderation"
create_file admin-dashboard/src/pages/Analytics.js "// View analytics"
create_file admin-dashboard/src/services/apiClient.js "// Admin API client"
create_file admin-dashboard/package.json "{}"
create_file admin-dashboard/Dockerfile "# Dockerize admin dashboard"

# ==============================================================================
# SHARED
# ==============================================================================
echo "📁 Creating shared/ structure..."

mkdir -p shared/config shared/utils shared/kafka shared/types
create_file shared/utils/logger.js "// Centralized logger"
create_file shared/kafka/kafkaClient.js "// Kafka producer/consumer wrapper"
create_file shared/types/user.interface.ts "// TypeScript interface for User"
create_file shared/config/.env.example "NODE_ENV=development"

# ==============================================================================
# ROOT FILES
# ==============================================================================
echo "📄 Creating root files..."

create_file .gitignore "
node_modules/
.env
*.log
dist/
build/
.DS_Store
"

create_file README.md "# Matchly\n> Scalable Matching Platform\n\n## Structure\nSee project tree.\n"

create_file docker-compose.yml "# Orchestrate gateway + services in dev"

# ==============================================================================
# FINAL MESSAGE
# ==============================================================================
echo ""
echo "✅ Project skeleton created at ./$PROJECT_ROOT/"
echo "📦 Total: 7 main modules, 15+ microservices, full DevOps & AI layers"
echo "💡 Next: cd matchly && git init && code ."
