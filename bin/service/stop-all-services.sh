#!/bin/bash

cd $PIPELINE_HOME

echo '...Stopping Kafka...'
kafka-server-stop 

echo '...Stopping Schema Registry...'
schema-registry-stop 

echo '...Stopping Kafka REST Proxy...'
kafka-rest-stop 

echo '...Stopping Zeppelin...'
$ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop 

echo '...Stopping Spark Master...'
$SPARK_HOME/sbin/stop-master.sh --webui-port 6060 

echo '...Stopping Spark Worker...'
$SPARK_HOME/sbin/stop-slave.sh --webui-port 6061

echo '...Starting Spark External Shuffle Service...'
$SPARK_HOME/sbin/stop-shuffle-service.sh

echo '...Stopping Long-Running Spark JDBC ODBC Hive ThriftServer...'
$SPARK_HOME/sbin/stop-thriftserver.sh  

echo '...Stopping Flink...'
stop-local.sh
ps -aef | grep "JobManager" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Redis...'
redis-cli shutdown

echo '...Stoping Webdis...'
ps -aef | grep "webdis" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping ZooKeeper...'
zookeeper-server-stop 

echo '...Stopping Cassandra...'
pkill -f CassandraDaemon

echo '...Stopping Apache2 Httpd...'
service apache2 stop

echo '...Stopping Ganglia...'
service gmetad stop
service ganglia-monitor stop

echo '...Stopping MySQL...'
service mysql stop

echo '...Stopping Kibana...'
jps | grep "Main" | cut -d " " -f "1" | xargs kill -KILL
ps -aef | grep "kibana" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Logstash...'
ps -aef | grep "logstash" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Jupyter...'
ps -aef | grep "jupyter" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Jupyter Hub...'
ps -aef | grep "jupyter" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Nifi...'
nifi.sh stop

echo '...Stopping Airflow...'
ps -aef | grep "airflow" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL
ps -aef | grep "airflow" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Presto...'
nohup launcher stop

echo '...Stopping Hive Metastore...'
ps -aef | grep "RunJar" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Titan...'
jps | grep "GremlinServer" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping ElasticSearch...'
jps | grep "Elasticsearch" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Long-Running Spark Job (1)...'
jps | grep "SparkSubmit" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Long-Running Spark Job (2)...'
jps | grep "SparkSubmit" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Long-Running Spark Job (3)...'
jps | grep "SparkSubmit" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Long-Running Spark Job (4)...'
jps | grep "SparkSubmit" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping TensorFlow Serving Inception Service...'
#jps | grep "bazel" | cut -d " " -f "1" | xargs kill -KILL
ps -aef | grep "inception_inference.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping TensorFlow Serving MNIST Service...'
#jps | grep "bazel" | cut -d " " -f "1" | xargs kill -KILL
ps -aef | grep "mnist_inference_2.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping TensorFlow Inception Client...'
ps -aef | grep "inception_client.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping TensorFlow MNIST Client...'
ps -aef | grep "mnist_client.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Spark History Server...'
$SPARK_HOME/sbin/stop-history-server.sh

echo '...Stopping Kafka Ratings Feeder...'
jps | grep "feeder" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Flask-based Recommendation/Prediction Service...'
ps -aef | grep "recommendation-service.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Flask-based Image Classification Service...'
ps -aef | grep "image-classification-service.py" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping Finagle-based Recommendation/Prediction Service...'
jps | grep "finagle" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping Model Watcher Service...'
jps | grep "watcher" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stopping SBT Runtime...'
ps -aef | grep "Nailgun" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stop sbt-launch.jar Processes...'
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL
jps | grep "sbt-launch" | cut -d " " -f "1" | xargs kill -KILL

echo '...Stop TensorBoard...'
ps -aef | grep "tensorboard" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stop Hystrix Dashboard...'
ps -aef | grep "hystrix-dashboard" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stop Jenkins...'
service jenkins stop

echo '...Stop Dynomite...'
ps -aef | grep "dynomite" | tr -s ' ' | cut -d ' ' -f2 | xargs kill -KILL

echo '...Stopping SSH...'
service ssh stop

echo '...IGNORE ANY ERRORS ON SHUTDOWN ABOVE AS THESE ARE OK...'
