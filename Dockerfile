FROM node:18.20-alpine

RUN apk update && apk upgrade --no-cache \
    && apk add --no-cache openssl curl

RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

ENV NODE_ENV=production

COPY package.json pnpm-lock.yaml* ./

RUN pnpm install --frozen-lockfile --prod

RUN pnpm remove @shopify/cli || true

COPY . .

RUN pnpm run build

EXPOSE 3000

CMD ["pnpm", "run", "docker-start"]
