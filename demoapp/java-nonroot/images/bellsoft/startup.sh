#!/bin/bash

echo "Welcome to JavaServices"
id
JAVA_OPTS="$JAVA_OPTS -Xms64m -Xmx512m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true"
JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"

java $JAVA_OPTS -jar /app/java-services.jar

