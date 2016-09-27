#!/bin/sh

DOMAIN=test.local
IPA=ipa.$DOMAIN

/opt/jboss/scripts/ipa-client-enroll
while [ $? -eq 1 ]
do
  sleep 1
  /opt/jboss/scripts/ipa-client-enroll
done
echo "-------------------------------------" &&
echo "IPA server is up and client enrolled!" &&
echo "-------------------------------------" &&
/opt/jboss/scripts/ipa-populate-data &&
/opt/jboss/scripts/ipa-sssd-setup &&
/opt/jboss/scripts/keycloak-integration-tests && /bin/zsh
