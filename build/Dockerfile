FROM redhat/ubi9:latest

# Install the `tail` command (if not pre-installed in ubi8)
RUN yum update
RUN yum install -y coreutils --allowerasing -y
COPY ttyd.arm /usr/local/bin/ttyd
COPY tini-arm64 /usr/local/bin/tini
COPY kubectl /usr/local/bin/kubectl
COPY k9s /usr/local/bin/k9s
COPY generate_kubeconfig.sh /tmp
COPY bootstrap.sh /tmp

WORKDIR /usr/local/bin
RUN chmod +x ttyd
RUN chmod +x tini
RUN chmod +x kubectl
RUN chmod +x k9s

WORKDIR /tmp
RUN chmod +x generate_kubeconfig.sh
RUN chmod +x bootstrap.sh

EXPOSE 7681
ENTRYPOINT ["/usr/local/bin/tini", "--"]
CMD ["sh", "bootstrap.sh"]
