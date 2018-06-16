FROM nginx:1.15
ARG WEB_USER_ID
ARG WEB_USER_GROUP_ID

RUN groupadd --gid $WEB_USER_GROUP_ID web \
        && useradd --uid $WEB_USER_ID --gid $WEB_USER_GROUP_ID --create-home web

COPY conf.additional /etc/nginx/

