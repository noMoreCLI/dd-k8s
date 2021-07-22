FROM sashaz/java-services:v5 

#RUN apt update && apt -y upgrade 
RUN addgroup --gid 999 appgroup 
#RUN adduser --uid 999 --shell /bin/bash --ingroup appgroup --disabled-password appuser 
RUN useradd -g 999 -u 999 -s /bin/bash --home-dir /home/newuser --create-home appuser

RUN mkdir -p /app
RUN mv java-services.jar /app
RUN rm /startup.sh
WORKDIR /app
USER appuser:appgroup
COPY startup.sh /app/startup.sh
USER root
RUN chown -R appuser:appgroup /app
RUN chmod +x /app/startup.sh

USER appuser:appgroup
CMD /bin/bash
ENTRYPOINT [ "/bin/bash", "/app/startup.sh" ]