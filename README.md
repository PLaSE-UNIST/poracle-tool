# How to run the example (Patch 27)
## Build the image
```bash
$ docker build -t [image_name] .
```
## Run the container
```bash
$ docker run -it [image_name]
```
## Make the environment
```bash
$ cd /poracle-tool && source activate
```
## Compile the example
```bash
$ cd /poracle-tool/modules/JQF/src/test/resources/patches/Patch27/Math2b && defects4j compile
```
```bash
$ cd /poracle-tool/modules/JQF/src/test/resources/patches/Patch27/Math2p && defects4j compile
```
## Run the fuzzer
```bash
$ cd /poracle-tool/modules/JQF/bin && zest --target org/apache/commons/math3/distribution/AbstractIntegerDistribution.java:138 \
--logdir ./src/test/resources/log --seed 885441 --max-corpus-size 10 \
--max-mutations 200 --duration 10s --exploreDuration 1m --widening-plateau-threshold 50 \
-o ../src/test/resources/fuzz-results-patch ../src/test/resources/patches/Patch27/Math2b/target/test-classes:../src/test/resources/patches/Patch27/Math2b/target/classes \
../src/test/resources/patches/Patch27/Math2p/target/test-classes:../src/test/resources/patches/Patch27/Math2p/target/classes \
org.apache.commons.math3.distribution.JQF_HypergeometricDistributionTest testMath1021
```
This will run the fuzzer for 10 seconds.
