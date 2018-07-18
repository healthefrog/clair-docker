clair:
  database:
    type: pgsql
    options:
      source: host=$PGHOST port=5432 user=$PGUSER password=$PGPASSWORD dbname=$PGDATABASE sslmode=verify-full statement_timeout=60000
      cachesize: 16384
  api:
    addr: "0.0.0.0:6060"
    healthaddr: "0.0.0.0:6061"
    timeout: 900s
  worker:
    namespace_detectors:
      - os-release
      - lsb-release
      - apt-sources
      - alpine-release
      - redhat-release
    feature_listers:
      - apk
      - dpkg
      - rpm
  updater:
    interval: 2h
    enabledupdaters:
      - debian
      - ubuntu
      - rhel
      - oracle
      - alpine
  notifier:
    attempts: 3
    renotifyinterval: 2h
