#!/usr/bin/env bash
###############################################################################
# scaffold-match.sh – scaffold the entire empty folder / file tree for match/
###############################################################################

set -euo pipefail

ROOT="match"

###############################################################################
# 1. Create all directories
###############################################################################
mkdir -p "$ROOT"/{\
clients/{\
mobile/{src/{screens,components,navigation,services,i18n,utils}},\
web-mobile/{public,src/{pages,components,hooks,services,i18n}},\
web-desktop/src/{layouts,pages},\
shared/{types,constants,utils,i18n}\
},\
gateway/{src/{routes,middleware,services}},\
services/{\
auth-service/{src/{controllers,routes,services,models}},\
profile-service/{src/{dto,validators}},\
match-service/{src/{algorithms,controllers}},\
chat-service/{src/{websocket,repositories}},\
discovery-service/{src/{geolocation}},\
notification-service/{src/{providers}},\
media-service/{src/{upload,moderation}},\
analytics-service/{src/{collectors}}\
},\
ai-engine/{\
recommendation/{src/{models,api,data}},\
nlp-analyzer/{src},\
image-moderation/{src},\
behavioral-predictor/{src}\
},\
data/{\
mongodb/{schemas},\
redis,\
elasticsearch/mappings,\
minio\
},\
infra/{\
k8s/{deployments,services,ingress},\
terraform/{modules/{eks-cluster,s3-bucket}}\
},\
monitoring/{\
grafana/dashboards,\
prometheus,\
logging,\
sentry\
},\
scripts,\
.github/workflows,\
docs\
}

###############################################################################
# 2. Create empty files
###############################################################################
# clients
touch "$ROOT"/clients/{mobile/{App.tsx,app.config.js,package.json},web-mobile/{vite.config.ts,index.html},web-desktop/package.json}
touch "$ROOT"/clients/shared/utils/helpers.ts

# gateway
touch "$ROOT"/gateway/{Dockerfile,package.json,server.ts}
touch "$ROOT"/gateway/src/routes/{auth.route.ts,user.route.ts,match.route.ts}
touch "$ROOT"/gateway/src/middleware/{auth.middleware.ts,rateLimit.middleware.ts,logging.middleware.ts}
touch "$ROOT"/gateway/src/services/{authServiceClient.ts,matchServiceClient.ts}

# services
for svc in auth profile match chat discovery notification media analytics; do
  touch "$ROOT/services/${svc}-service"/{package.json,Dockerfile,server.ts}
done
touch "$ROOT/services/auth-service"/src/models/User.ts
touch "$ROOT/services/match-service"/src/algorithms/matcher.ts
touch "$ROOT/services/match-service"/src/controllers/match.controller.ts
touch "$ROOT/services/chat-service"/src/websocket/socketServer.ts
touch "$ROOT/services/discovery-service"/src/geolocation/geoEngine.ts
touch "$ROOT/services/notification-service"/src/providers/{fcm.ts,ses.ts}
touch "$ROOT/services/media-service"/src/upload/s3Uploader.ts
touch "$ROOT/services/media-service"/src/moderation/awsRekognition.ts
touch "$ROOT/services/analytics-service"/src/collectors/eventTracker.ts

# ai-engine
for ai in recommendation nlp-analyzer image-moderation behavioral-predictor; do
  touch "$ROOT/ai-engine/$ai"/{Dockerfile,requirements.txt}
done
touch "$ROOT/ai-engine/recommendation"/src/{models/{collaborative_filtering.py,content_based.py},api/server.py}
touch "$ROOT/ai-engine/nlp-analyzer"/src/{tone_detector.py,safety_filter.py,app.py}
touch "$ROOT/ai-engine/image-moderation"/src/{nsfw_detector.py,face_validator.py,api.py}
touch "$ROOT/ai-engine/behavioral-predictor"/src/{churn_model.py,swipe_predictor.py}

# data
touch "$ROOT"/data/mongodb/{schemas/{User.schema.json,Match.schema.json},init.js}
touch "$ROOT"/data/redis/config.js
touch "$ROOT"/data/elasticsearch/mappings/user-profile.json
touch "$ROOT"/data/minio/setup-buckets.sh

# infra
touch "$ROOT"/infra/{docker-compose.yml,k8s/deployments/{auth-deployment.yaml,gateway-deployment.yaml},k8s/namespace.yaml}
touch "$ROOT"/infra/terraform/{main.tf,variables.tf}

# monitoring
touch "$ROOT"/monitoring/{prometheus/prometheus.yml,logging/fluentd-config.conf,sentry/sentry.properties}
touch "$ROOT"/monitoring/grafana/dashboards/.gitkeep

# scripts, docs, CI
touch "$ROOT"/scripts/{deploy-all.sh,seed-dev-data.js}
touch "$ROOT"/.github/workflows/ci-cd.yml
touch "$ROOT"/docs/{API.md,ARCHITECTURE.md}

# root
touch "$ROOT"/{package.json,pnpm-workspace.yaml,README.md}

echo "✅  Empty match/ skeleton created under ./$ROOT/"
