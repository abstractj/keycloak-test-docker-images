#!/bin/sh

DOMAIN=test.local
IPA=ipa.$DOMAIN

/opt/jboss/scripts/wait-for-it.sh --timeout=0 $IPA:53 --strict -- echo "IPA server is up!" &&
/opt/jboss/scripts/ipa-client-enroll &&
/opt/jboss/scripts/ipa-populate-data &&
/opt/jboss/scripts/ipa-sssd-setup &&
/opt/jboss/scripts/keycloak-integration-tests && /bin/zsh
