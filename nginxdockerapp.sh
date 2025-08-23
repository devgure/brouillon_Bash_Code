!/usr/bin/env bash
#
# generate-swipesphere.sh
# Creates the entire empty folder & file tree for swipesphere/
# Run from repo root.

REPO="swipesphere"

# ------------------------------------------------------------
# Helpers
# ------------------------------------------------------------
mk_dirs() {
  for d in "$@"; do
    mkdir -p "${REPO}/${d}"
  done
}

touch_file() {
  f="${REPO}/$1"
  mkdir -p "$(dirname "$f")"
  [ ! -f "$f" ] && touch "$f"
}

# ------------------------------------------------------------
# 1. apps/mobile
# ------------------------------------------------------------
mk_dirs \
  apps/mobile/assets \
  apps/mobile/components \
  apps/mobile/navigation \
  apps/mobile/screens \
  apps/mobile/services \
  apps/mobile/hooks

touch_file "apps/mobile/App.tsx"
touch_file "apps/mobile/app.json"
touch_file "apps/mobile/components/CardSwipe.tsx"
touch_file "apps/mobile/components/PhotoUploader.tsx"
touch_file "apps/mobile/components/ChatBubble.tsx"
touch_file "apps/mobile/navigation/AppNavigator.tsx"
touch_file "apps/mobile/screens/OnboardingScreen.tsx"
touch_file "apps/mobile/screens/SwipeScreen.tsx"
touch_file "apps/mobile/screens/ChatScreen.tsx"
touch_file "apps/mobile/screens/ProfileScreen.tsx"
touch_file "apps/mobile/services/api.ts"
touch_file "apps/mobile/services/auth.ts"
touch_file "apps/mobile/services/socket.ts"
touch_file "apps/mobile/hooks/useAuth.ts"

# ------------------------------------------------------------
# 2. apps/web
# ------------------------------------------------------------
mk_dirs \
  apps/web/public \
  apps/web/src/pages \
  apps/web/src/components \
  apps/web/src/store \
  apps/web/src/services

touch_file "apps/web/src/App.tsx"
touch_file "apps/web/index.html"
touch_file "apps/web/src/pages/.gitkeep"
touch_file "apps/web/src/components/.gitkeep"
touch_file "apps/web/src/store/.gitkeep"
touch_file "apps/web/src/services/.gitkeep"

# ------------------------------------------------------------
# 3. apps/desktop
# ------------------------------------------------------------
mk_dirs apps/desktop
touch_file "apps/desktop/main.js"
touch_file "apps/desktop/package.json"

# ------------------------------------------------------------
# 4. apps/admin
# ------------------------------------------------------------
mk_dirs \
  apps/admin/src/pages \
  apps/admin/src/components

touch_file "apps/admin/src/pages/Users.tsx"
touch_file "apps/admin/src/pages/Reports.tsx"
touch_file "apps/admin/src/pages/Revenue.tsx"
touch_file "apps/admin/src/pages/Moderation.tsx"
touch_file "apps/admin/src/components/DataTable.tsx"
touch_file "apps/admin/src/App.tsx"
touch_file "apps/admin/package.json"

# ------------------------------------------------------------
# 5. services/gateway
# ------------------------------------------------------------
mk_dirs \
  services/gateway/src

touch_file "services/gateway/src/main.ts"
touch_file "services/gateway/src/app.controller.ts"
touch_file "services/gateway/src/app.module.ts"
touch_file "services/gateway/Dockerfile"
touch_file "services/gateway/nest-cli.json"

# ------------------------------------------------------------
# 6. services/auth-service
# ------------------------------------------------------------
mk_dirs \
  services/auth-service/src/strategies

touch_file "services/auth-service/src/auth.controller.ts"
touch_file "services/auth-service/src/auth.service.ts"
touch_file "services/auth-service/src/strategies/jwt.strategy.ts"
touch_file "services/auth-service/src/strategies/google.strategy.ts"
touch_file "services/auth-service/Dockerfile"

# ------------------------------------------------------------
# 7. services/user-service
# ------------------------------------------------------------
mk_dirs \
  services/user-service/src/dto

touch_file "services/user-service/src/user.controller.ts"
touch_file "services/user-service/src/user.service.ts"
touch_file "services/user-service/Dockerfile"

# ------------------------------------------------------------
# 8. services/match-service  (empty stub)
# ------------------------------------------------------------
mk_dirs services/match-service
touch_file "services/match-service/.gitkeep"

# ------------------------------------------------------------
# 9. services/chat-service
# ------------------------------------------------------------
mk_dirs services/chat-service/src
touch_file "services/chat-service/src/chat.gateway.ts"
touch_file "services/chat-service/src/chat.service.ts"
touch_file "services/chat-service/Dockerfile"

# ------------------------------------------------------------
# 10. services/payment-service
# ------------------------------------------------------------
mk_dirs services/payment-service/src
touch_file "services/payment-service/src/stripe.controller.ts"
touch_file "services/payment-service/src/stripe.webhook.ts"
touch_file "services/payment-service/Dockerfile"

# ------------------------------------------------------------
# 11. services/ai-service
# ------------------------------------------------------------
mk_dirs \
  services/ai-service/models \
  services/ai-service/notebooks

touch_file "services/ai-service/main.py"
touch_file "services/ai-service/models/facial_recognition_model.py"
touch_file "services/ai-service/notebooks/train_face_model.ipynb"
touch_file "services/ai-service/requirements.txt"
touch_file "services/ai-service/Dockerfile"

# ------------------------------------------------------------
# 12. shared/
# ------------------------------------------------------------
mk_dirs \
  shared/dto \
  shared/types \
  shared/utils

touch_file "shared/dto/user.dto.ts"
touch_file "shared/types/index.ts"
touch_file "shared/utils/validators.ts"

# ------------------------------------------------------------
# 13. infra/
# ------------------------------------------------------------
mk_dirs \
  infra/docker \
  infra/nginx \
  infra/scripts \
  infra/k8s

touch_file "infra/docker/docker-compose.yml"
touch_file "infra/nginx/default.conf"
touch_file "infra/scripts/seed-db.ts"
touch_file "infra/scripts/test-stripe-webhook.ts"
touch_file "infra/k8s/deployment.yaml"

# ------------------------------------------------------------
# 14. docs/
# ------------------------------------------------------------
mk_dirs docs
touch_file "docs/openapi.yaml"
touch_file "docs/DEPLOYMENT.md"
touch_file "docs/OAUTH_SETUP.md"

# ------------------------------------------------------------
# 15. tests/
# ------------------------------------------------------------
mk_dirs \
  tests/unit \
  tests/integration

touch_file "tests/unit/auth.service.spec.ts"
touch_file "tests/unit/user.controller.spec.ts"
touch_file "tests/integration/stripe.webhook.spec.ts"
touch_file "tests/jest.config.js"

# ------------------------------------------------------------
# 16. .github/workflows/
# ------------------------------------------------------------
mk_dirs .github/workflows
touch_file ".github/workflows/ci-cd.yml"

# ------------------------------------------------------------
# 17. prisma/
# ------------------------------------------------------------
mk_dirs prisma
touch_file "prisma/schema.prisma"

# ------------------------------------------------------------
# 18. public/
# ------------------------------------------------------------
mk_dirs public/swagger-ui
touch_file "public/swagger-ui/.gitkeep"

# ------------------------------------------------------------
# 19. Root-level files
# ------------------------------------------------------------
touch_file "firebase.json"
touch_file "package.json"
touch_file "docker-compose.yml"
touch_file "README.md"
touch_file ".env.example"

echo "✅  swipesphere/ directory & file structure generated."
