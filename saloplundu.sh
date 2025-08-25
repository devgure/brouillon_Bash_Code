
# Root directory name
ROOT_DIR="match"

# Create root directory
mkdir -p "$ROOT_DIR"

# Create apps/ structure
mkdir -p "$ROOT_DIR/apps/web/public"
mkdir -p "$ROOT_DIR/apps/web/src"{/components,/pages,/hooks,/services,/store,/routes,/assets}
touch "$ROOT_DIR/apps/web/src/App.tsx"

mkdir -p "$ROOT_DIR/apps/mobile"{/components,/hooks,/navigation,/screens,/services,/utils,/assets}
touch "$ROOT_DIR/apps/mobile/screens/"{MatchScreen.tsx,ChatScreen.tsx,VideoCallScreen.tsx,ProfileScreen.tsx}
touch "$ROOT_DIR/apps/mobile/app.json"
touch "$ROOT_DIR/apps/mobile/App.tsx"

mkdir -p "$ROOT_DIR/apps/admin/src/pages"
touch "$ROOT_DIR/apps/admin/src/pages/"{Users.tsx,Revenue.tsx,Moderation.tsx}

mkdir -p "$ROOT_DIR/apps/desktop"
touch "$ROOT_DIR/apps/desktop/main.js"

# Create packages/ structure
mkdir -p "$ROOT_DIR/packages/api-gateway/src"{/middleware}
touch "$ROOT_DIR/packages/api-gateway/src/server.ts"
touch "$ROOT_DIR/packages/api-gateway/Dockerfile"

mkdir -p "$ROOT_DIR/packages/microservices/"{auth-service,user-service,match-service,chat-service,payment-service,location-service,ai-service,recommendation-service,content-service,i18n-service,analytics-service,reputation-service}

mkdir -p "$ROOT_DIR/packages/shared/"{dto,interfaces,utils}
mkdir -p "$ROOT_DIR/packages/config/env"
touch "$ROOT_DIR/packages/config/env/".env.{development,production,example}
touch "$ROOT_DIR/packages/config/nginx.conf"

# Create infra/ structure
mkdir -p "$ROOT_DIR/infra/k8s/"{deployments,services}
touch "$ROOT_DIR/infra/k8s/ingress.yaml"
mkdir -p "$ROOT_DIR/infra/scripts"
touch "$ROOT_DIR/infra/scripts/"{setup-ubuntu.sh,seed-db.js,ssl-setup.sh}
mkdir -p "$ROOT_DIR/infra/caddy"
touch "$ROOT_DIR/infra/docker-compose.yml"

# Create notebooks/
mkdir -p "$ROOT_DIR/notebooks"
touch "$ROOT_DIR/notebooks/"{train_face_recognition.ipynb,ai_match_model.ipynb}

# Create docs/
mkdir -p "$ROOT_DIR/docs"
touch "$ROOT_DIR/docs/"{openapi.yaml,ARCHITECTURE.md,DEPLOYMENT.md}

# Create tests/
mkdir -p "$ROOT_DIR/tests/"{unit,integration,e2e}
touch "$ROOT_DIR/tests/unit/auth.service.test.ts"
touch "$ROOT_DIR/tests/integration/"{chat.spec.js,payment.webhook.test.ts}
touch "$ROOT_DIR/tests/e2e/login-flow.spec.js"

# Create .github/
mkdir -p "$ROOT_DIR/.github/workflows"
touch "$ROOT_DIR/.github/workflows/"{ci.yml,cd.yml}

# Root-level files
touch "$ROOT_DIR/"{Dockerfile.*,docker-compose.yml,package.json,tsconfig.json,README.md}

echo "✅ Empty 'match/' project structure created successfully."
