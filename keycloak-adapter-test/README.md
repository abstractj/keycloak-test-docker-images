# Keycloak and FreeIPA initial integration tests

### Before you get started

1. Make sure that the folders `/var/lib/ipa-data` and `/var/lib/ipa-client` are empty.

2. Install [Docker compose](https://docs.docker.com/compose/install/)

### Starting the integration tests

1. Clone the repository

  ```
  git clone https://github.com/abstractj/docker.git && cd docker/keycloak-sssd-integration-tests
  ```

2. Edit the `integration-tests.env` file

  ```
  # Password you would like to be used for IPA server
  IPA_PASSWORD=my_password

  # Path where the Git keycloak repository is located
  KEYCLOAK_REPO=/path/to/my/keycloak-repository/

  # Path where the Mavne repository is located
  M2_PATH=/path/to/my/.m2

  # Increase Docker compose timeout, because it gonna take a long time
  COMPOSE_HTTP_TIMEOUT=600
  ```

3. Rename `integration-tests.env` to `.env`

4. Build and start the containers

  ```
  docker-compose up
  ```

This will bring up IPA server and start another container to run the integration tests. For getting access to Shell after the startup execute:

  ```
  docker exec -ti keycloak-sssd-test-container /bin/zsh
  ```

### Help

* [User Mailing List](https://lists.jboss.org/mailman/listinfo/keycloak-user) - Mailing list to ask for help and general questions about Keycloak

### Known bug

Docker compose has a [known bug](https://github.com/docker/compose/issues/2338) when `tty` is enabled. To overcome that, pass `-d` on startup. Example:

  ```
  docker-compose up -d && docker-compose logs
  ```



