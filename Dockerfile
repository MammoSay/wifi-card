FROM mhart/alpine-node:14 as builder

WORKDIR /tmp
COPY . .

RUN npx prettier --check ./src
RUN yarn && yarn build

###
# production image
FROM nginx:mainline-alpine
COPY --from=builder /tmp/build /usr/share/nginx/html
