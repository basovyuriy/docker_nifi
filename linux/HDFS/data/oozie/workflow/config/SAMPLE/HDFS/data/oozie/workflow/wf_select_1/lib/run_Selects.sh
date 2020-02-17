#!/bin/sh
set -x -e

cluster_name=$1
if [ "$cluster_name" = "" ]; then
  echo "Usage: ./run_selects.sh <cluster_name>" 1>&2
fi

rm -f ./wf_select_1.properties

rm -f ./hbaseselect-1.0.0-jar-with-dependencies.jar

spark2-submit \
  --files ./wf_select_1.properties \
  --name "hbaseselect" \
  --master yarn \
  --deploy-mode client \
  --num-executors "2" \
  --executor-cores "2" \
  --conf spark.yarn.appMasterEnv.migrationParams="./wf_select_1.properties" \
  --conf spark.yarn.maxAppAttempts=1 \
  --conf spark.executor.memory=4G \
  --conf spark.driver.memory=4G \
  --conf spark.driver.userClassPathFirst=false \
  --conf spark.executor.userClassPathFirst=false \
  --conf spark.yarn.submit.waitAppCompletion=true \
  --conf spark.dynamicAllocation.enabled=false \
  --jars hbaseselect-1.0.0-jar-with-dependencies \
  hbaseselect-1.0.0-jar-with-dependencies[A[C[C[C[C[C[C[C.jar[B[D[D[D[D[D[D[D[D[D[D[D[D[C.jar ./wf_select_1.properties
