FROM mhart/alpine-node:14 as builder

WORKDIR /tmp
COPY . .

RUN npx prettier --check ./src
RUN yarn && yarn build

###
# production image
FROM nginx:1.26.1-alpine3.19
COPY --from=builder /tmp/build /usr/share/nginx/html
