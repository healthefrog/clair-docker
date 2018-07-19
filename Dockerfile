FROM quay.io/coreos/clair

ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /tmp/rds-ca/aws-rds-ca-bundle.pem

RUN apk add --no-cache gettext && \
    cd /tmp/rds-ca && cat aws-rds-ca-bundle.pem | awk 'split_after==1{n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1} {print > "cert" n ""}' \
    && for CERT in /tmp/rds-ca/cert*; do mv $CERT /usr/local/share/ca-certificates/aws-rds-ca-$(basename $CERT).crt; done \
    && rm -rf /tmp/rds-ca \
    && update-ca-certificates

ADD files /

ENTRYPOINT ["/entry.sh"]
CMD ["/clair", "-config", "/config.yaml"]
