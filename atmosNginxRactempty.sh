#!/usr/bin/env bash
# init-sparkr.sh – bootstrap an empty sparkr-app monorepo

set -euo pipefail

ROOT_DIR="sparkr-app"
[ -d "$ROOT_DIR" ] || mkdir "$ROOT_DIR"
cd "$ROOT_DIR"

##############################################################################
# Helper: create empty file(s) (including parent dirs)
##############################################################################
touchf() { mkdir -p "$(dirname "$1")" && touch "$1"; }

##############################################################################
# apps/
##############################################################################
touchf apps/mobile/App.tsx
touchf apps/mobile/assets/.gitkeep
touchf apps/mobile/components/CardSwipe.tsx
touchf apps/mobile/components/PhotoUploader.tsx
touchf apps/mobile/components/ChatBubble.tsx
touchf apps/mobile/hooks/useAuth.ts
touchf apps/mobile/hooks/useMatches.ts
touchf apps/mobile/navigation/AppNavigator.tsx
touchf apps/mobile/screens/LoginScreen.tsx
touchf apps/mobile/screens/SwipeScreen.tsx
touchf apps/mobile/screens/ChatScreen.tsx
touchf apps/mobile/screens/ProfileScreen.tsx
touchf apps/mobile/services/api.ts
touchf apps/mobile/services/auth.ts
touchf apps/mobile/utils/i18n.ts
touchf apps/mobile/utils/biometrics.ts
touchf apps/mobile/app.json

touchf apps/web/public/index.html
touchf apps/web/src/pages/Home.tsx
touchf apps/web/src/pages/Pricing.tsx
touchf apps/web/src/pages/Chat.tsx
touchf apps/web/src/components/.gitkeep
touchf apps/web/src/services/.gitkeep
touchf apps/web/src/store/.gitkeep
touchf apps/web/src/App.tsx
touchf apps/web/Dockerfile

touchf apps/admin/src/pages/Users.tsx
touchf apps/admin/src/pages/Reports.tsx
touchf apps/admin/src/pages/Revenue.tsx
touchf apps/admin/src/pages/Moderation.tsx
touchf apps/admin/src/components/.gitkeep
touchf apps/admin/src/retool-config.json
touchf apps/admin/Dockerfile

touchf apps/bff/src/app.module.ts
touchf apps/bff/src/main.ts
touchf apps/bff/src/swagger.ts
touchf apps/bff/Dockerfile

##############################################################################
# services/
##############################################################################
touchf services/auth-service/src/auth.controller.ts
touchf services/auth-service/src/auth.service.ts
touchf services/auth-service/src/jwt.guard.ts
touchf services/auth-service/src/dto/login.dto.ts
touchf services/auth-service/Dockerfile

touchf services/user-service/src/user.controller.ts
touchf services/user-service/src/user.service.ts
touchf services/user-service/src/dto/create-user.dto.ts
touchf services/user-service/Dockerfile

touchf services/match-service/src/match.controller.ts
touchf services/match-service/src/ai.matching.service.ts
touchf services/match-service/Dockerfile

touchf services/chat-service/src/chat.gateway.ts
touchf services/chat-service/src/chat.service.ts
touchf services/chat-service/src/e2ee.service.ts
touchf services/chat-service/Dockerfile

touchf services/payment-service/src/stripe.controller.ts
touchf services/payment-service/src/stripe.webhook.ts
touchf services/payment-service/src/checkout.modal.tsx
touchf services/payment-service/Dockerfile

touchf services/location-service/src/location.service.ts
touchf services/location-service/Dockerfile

##############################################################################
# ai/
##############################################################################
touchf ai/facial-recognition/main.py
touchf ai/facial-recognition/requirements.txt
touchf ai/facial-recognition/Dockerfile
touchf ai/notebooks/train-facial-model.ipynb

##############################################################################
# packages/
##############################################################################
touchf packages/db/prisma/schema.prisma
touchf packages/db/prisma/seed.ts
touchf packages/db/prisma/prisma.service.ts
touchf packages/db/index.ts

touchf packages/api/types.ts

touchf packages/config/eslint.config.js
touchf packages/config/tsconfig.json

touchf packages/utils/i18n.ts
touchf packages/utils/crypto.ts

##############################################################################
# infra/
##############################################################################
touchf infra/docker-compose.yml
touchf infra/nginx.conf
mkdir -p infra/certs

##############################################################################
# docs/
##############################################################################
touchf docs/openapi.yaml

##############################################################################
# tests/
##############################################################################
touchf tests/unit/payment.webhook.spec.ts
touchf tests/e2e/chat.cy.ts

##############################################################################
# .github/
##############################################################################
mkdir -p .github/workflows
touch .github/workflows/ci.yml

##############################################################################
# root files
##############################################################################
touch turbo.json
touch package.json
touch pnpm-lock.yaml
touch README.md

echo "✅ Empty sparkr-app project scaffold created in ./$ROOT_DIR"
