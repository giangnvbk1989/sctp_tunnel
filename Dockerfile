FROM gcc:7
COPY . /usr/src/sctp_tunnel
WORKDIR /usr/src/sctp_tunnel
RUN apt-get update
RUN apt-get install -y libsctp-dev
RUN ./build.sh
ENV TUNNEL_IP "0.0.0.0"
ENV TUNNEL_PORT 5000
# These should be replaced if used in a Kubernetes container
ENV SCTP_IP "192.168.0.1"
ENV SCTP_PORT 5000
CMD ./server $TUNNEL_IP $TUNNEL_PORT $SCTP_IP $SCTP_PORT

