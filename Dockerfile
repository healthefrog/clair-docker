FROM quay.io/coreos/clair

RUN apk add --no-cache gettext
ADD files /

ENTRYPOINT ["/entry.sh"]
CMD ["/clair", "-config", "/config.yaml"]
