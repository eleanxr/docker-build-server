FROM ubuntu:17.10

RUN apt-get update
RUN apt-get install -y bash build-essential cmake git

RUN useradd -ms /bin/bash dev

RUN mkdir /home/dev/bin

ADD entrypoint.bash /home/dev/bin

RUN chown dev /home/dev/bin/entrypoint.bash
RUN chmod ug+x /home/dev/bin/entrypoint.bash

USER dev
WORKDIR /home/dev

ENTRYPOINT [ "/home/dev/bin/entrypoint.bash" ]
CMD []
