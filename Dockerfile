FROM registry.cn-hangzhou.aliyuncs.com/acs/maven

# Rocketmq version
ENV ROCKETMQ_VERSION rocketmq-all-4.1.0-incubating

# Rocketmq home
ENV ROCKETMQ_HOME  /opt/rocketmq/distribution

COPY rocketmq/ /opt/rocketmq/
COPY entrypoint.sh /root/entrypoint.sh
COPY portcheck /root/portcheck
RUN chmod +x /root/portcheck

RUN mkdir -p \
		/opt/logs \
	    /opt/store

RUN chmod +x /root/entrypoint.sh

ENV ROCKETMQ_HOME  /opt/rocketmq/distribution/target/apache-rocketmq
WORKDIR  ${ROCKETMQ_HOME}

ENV JAVA_OPT " -Duser.home=/opt"

CMD ["/root/entrypoint.sh"]
