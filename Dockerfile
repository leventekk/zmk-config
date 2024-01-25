FROM docker.io/zmkfirmware/zmk-build-arm:stable

WORKDIR /app

COPY config/west.yml config/west.yml

RUN west init -l config &&\
    west update &&\
    west zephyr-export

COPY bin/build.sh ./

CMD ["./build.sh"]
