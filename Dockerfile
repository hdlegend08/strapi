FROM node:12.16.0

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV TZ=Asia/Ho_Chi_Minh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /usr/src/app

COPY . .
#RUN cp .env.production .env
#RUN yarn global add @nestjs/cli
RUN yarn install
RUN yarn build

EXPOSE 1337
CMD ["yarn", "start" ]
