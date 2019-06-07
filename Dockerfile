FROM node:4.5.0 AS NPM
WORKDIR /npm
COPY package.json .
RUN npm install

FROM curator-processing-base
WORKDIR /processing
COPY . .
COPY --from=NPM /npm/node_modules ./node_modules
EXPOSE 3006
CMD ["node", "index.js"]
