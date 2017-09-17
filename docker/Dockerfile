FROM ubuntu:17.10

RUN apt-get update
RUN apt-get install -y bash python python-setuptools build-essential cmake git

RUN useradd -ms /bin/bash dev

RUN mkdir -p /home/dev/bin /opt

ADD entrypoint.bash /home/dev/bin

RUN chown dev /home/dev/bin/entrypoint.bash
RUN chmod ug+x /home/dev/bin/entrypoint.bash

ADD builder-0.0.1-py2.7.egg  /opt/
RUN easy_install /opt/builder-0.0.1-py2.7.egg

USER dev
WORKDIR /home/dev

ENTRYPOINT [ "/home/dev/bin/entrypoint.bash" ]
CMD [ "run" ]
