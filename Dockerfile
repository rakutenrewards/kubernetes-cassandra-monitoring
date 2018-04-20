FROM cassandra:3.11.2

RUN apt-get update && apt-get install -y --no-install-recommends wget curl vim && rm -rf /var/lib/apt/lists/*

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.1.0/jmx_prometheus_javaagent-0.1.0.jar
ADD ./prometheus-cassandra.yaml .
RUN echo 'JVM_OPTS="$JVM_OPTS -javaagent:'$PWD/jmx_prometheus_javaagent-0.1.0.jar=7070:$PWD/prometheus-cassandra.yaml'"' >> $CASSANDRA_CONFIG/cassandra-env.sh
