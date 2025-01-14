#!/bin/bash
set -ex
for spark_version in 2.4.8 3.0.0 3.0.1 3.0.2 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.2 3.2.3 3.2.4 3.3.0 3.3.1 3.3.2 3.4.0
    do
    build_dir="/tmp/spark-testing-base-$spark_version"
    mkdir -p "${build_dir}"
    cp -af ./ "${build_dir}"
    cd ${build_dir}
    sbt  -DsparkVersion=$spark_version version clean +publishLocal +publishSigned &
    cd -
done
wait
