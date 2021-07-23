FROM bellsoft/liberica-openjdk-debian:8u202

#
# Building a simple Java App running on BellSoft JVM
# Running an unprivileged user
#

#RUN apt update && apt -y upgrade 
RUN addgroup --gid 999 appgroup 
#RUN adduser --uid 999 --shell /bin/bash --ingroup appgroup --disabled-password appuser 
RUN useradd -g 999 -u 999 -s /bin/bash --home-dir /home/newuser --create-home appuser

RUN mkdir -p /app

WORKDIR /app
RUN chown -R appuser:appgroup /app
USER appuser:appgroup
COPY startup.sh /app/startup.sh
COPY java-services.jar /app/java-services.jar
USER root
RUN chmod +x /app/startup.sh

USER appuser:appgroup
CMD /bin/bash
ENTRYPOINT [ "/bin/bash", "/app/startup.sh" ]