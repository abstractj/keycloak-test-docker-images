FROM jboss/keycloak

RUN $JBOSS_HOME/bin/add-user-keycloak.sh -u test -p password --roles create-realm
RUN echo "Server started at port `ip addr`"
