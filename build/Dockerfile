FROM redhat/ubi9:latest

# Install the `tail` command (if not pre-installed in ubi8)
RUN yum update -y
RUN yum install -y coreutils --allowerasing -y
COPY binaries/* /usr/local/bin/
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
