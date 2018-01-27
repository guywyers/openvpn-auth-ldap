#! /bin/bash

[[ -z "$TRAVIS_BUILD_NUMBER" ]] && ITERATION='1' || ITERATION="$TRAVIS_BUILD_NUMBER"

apt-get install -y ruby ruby-dev rubygems build-essential
gem install --no-ri --no-rdoc fpm

mkdir -p /tmp/openvpn-auth-ldap-build/usr/lib/openvpn
mv /usr/local/lib/openvpn-auth-ldap.so /tmp/openvpn-auth-ldap-build/usr/lib/openvpn

fpm -s dir -C /tmp/openvpn-auth-ldap-build -t deb --name openvpn-auth-ldap-snowrider311 \
  --version $PACKAGE_VERSION --iteration $ITERATION --depends openvpn --depends gnustep-base-runtime \
  --depends libc6 --depends libgnustep-base1.24 --depends libldap-2.4-2 --depends libobjc4
