#!/usr/bin/env bash
###############################################################################
# scaffold-sparta.sh – scaffold the entire empty folder / file tree for sparta/
###############################################################################

set -euo pipefail

ROOT="sparta"

###############################################################################
# 1. Create directories
###############################################################################
mkdir -p "$ROOT"/{\
apps/{\
web/{public,src/{components,pages,hooks,services,store,routes,assets}},\
mobile/{components,hooks,navigation,screens,services,utils,assets},\
admin/src/pages,\
desktop\
},\
packages/{\
api-gateway/src/{middleware},\
microservices/{auth-service,user-service,match-service,chat-service,payment-service,location-service,ai-service,recommendation-service,content-service,i18n-service,analytics-service,reputation-service},\
shared/{dto,interfaces,utils},\
config/{env}\
},\
infra/{k8s/{deployments,services},scripts,caddy},\
notebooks,\
docs,\
tests/{unit,integration,e2e},\
.github/workflows\
}

###############################################################################
# 2. Create empty files
###############################################################################
# apps
touch "$ROOT"/apps/{web/src/App.tsx,mobile/{screens/{MatchScreen.tsx,ChatScreen.tsx,VideoCallScreen.tsx,ProfileScreen.tsx},app.json,App.tsx},admin/src/pages/{Users.tsx,Revenue.tsx,Moderation.tsx},desktop/main.js}

# packages
touch "$ROOT"/packages/api-gateway/{Dockerfile,src/server.ts}
touch "$ROOT"/packages/config/{env/{.env.development,.env.production,.env.example},nginx.conf}
# microservice dockerfiles
for svc in auth user match chat payment location ai recommendation content i18n analytics reputation; do
  touch "$ROOT/packages/microservices/${svc}-service"/Dockerfile
done

# infra
touch "$ROOT"/infra/{docker-compose.yml,k8s/ingress.yaml}
touch "$ROOT"/infra/scripts/{setup-ubuntu.sh,seed-db.js,ssl-setup.sh}

# notebooks
touch "$ROOT"/notebooks/{train_face_recognition.ipynb,ai_match_model.ipynb}

# docs
touch "$ROOT"/docs/{openapi.yaml,ARCHITECTURE.md,DEPLOYMENT.md}

# tests
touch "$ROOT"/tests/unit/{auth.service.test.ts}
touch "$ROOT"/tests/integration/{chat.spec.js,payment.webhook.test.ts}
touch "$ROOT"/tests/e2e/login-flow.spec.js

# CI
touch "$ROOT"/.github/workflows/{ci.yml,cd.yml}

# root
touch "$ROOT"/{package.json,tsconfig.json,README.md,docker-compose.yml}
for svc in auth user match chat payment location ai recommendation content i18n analytics reputation; do
  touch "$ROOT/Dockerfile.${svc}"
done

echo "✅  Empty sparta/ skeleton created under ./$ROOT/"
