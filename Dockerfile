FROM nginx:1.18.0 

COPY . /usr/share/nginx/html/

RUN \mv /usr/share/nginx/html/nginx.conf /etc/nginx/nginx.conf \
    && apt-get update --fix-missing \
    && apt-get install --no-install-recommends -y tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone