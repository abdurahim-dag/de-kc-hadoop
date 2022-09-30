export MR_OUTPUT=/user/ubuntu/output-data

hadoop fs -rm -r $MR_OUTPUT

export MR_OUTPUT=/user/ubuntu/home-work-result
hadoop jar "$HADOOP_MAPRED_HOME"/hadoop-streaming.jar \
-Dmapred.reduce.tasks=1 \
-D stream.map.output.field.separator=, \
-D stream.num.map.output.key.fields=2 \
-D stream.reduce.output.field.separator=, \
-D stream.num.reduce.output.key.fields=3 \
-D map.output.key.field.separator=, \
-D num.key.fields.for.partition=2 \
-D mapreduce.partition.keypartitioner.options=-k1,2 \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
-file /home/ubuntu/homewrok/mapper.py -mapper "python mapper.py" \
-file /home/ubuntu/homewrok/reducer.py -reducer "python reducer.py" \
-input /user/ubuntu/data-home-work-gzip  -output $MR_OUTPUT
