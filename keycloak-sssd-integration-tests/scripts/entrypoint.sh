#!/bin/sh

set -e

DOMAIN=test.local
IPA=ipa.$DOMAIN

until /opt/jboss/scripts/ipa-client-enroll; do
  >&2
  echo "-------------------------------------"
  echo "FreeIPA is unavailable - sleeping"
  echo "-------------------------------------"
  sleep 1
done

echo "-------------------------------------" &&
echo "IPA server is up and client enrolled!" &&
echo "-------------------------------------" &&
/opt/jboss/scripts/ipa-populate-data &&
/opt/jboss/scripts/ipa-sssd-setup &&
/opt/jboss/scripts/keycloak-integration-tests
