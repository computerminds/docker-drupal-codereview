FROM composer/composer:1.0.0

RUN composer global require 'drupal/coder:8.2.5'

ENTRYPOINT ["phpcs", "-p", "--standard=/root/composer/vendor/drupal/coder/coder_sniffer/Drupal"]
