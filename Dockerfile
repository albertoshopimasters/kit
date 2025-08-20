FROM node:18-alpine

RUN apk add --no-cache openssl curl && \
    corepack enable && \
    corepack prepare pnpm@10.14.0 --activate

EXPOSE 3000

WORKDIR /app

ENV NODE_ENV=production

COPY package.json pnpm-lock.yaml* ./

RUN pnpm install --frozen-lockfile --prod

RUN pnpm remove @shopify/cli || true

COPY . .

RUN pnpm run build

CMD ["pnpm", "run", "docker-start"]
