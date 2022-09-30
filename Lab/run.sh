export MR_OUTPUT=/user/ubuntu/output-data

hadoop fs -rm -r $MR_OUTPUT

hadoop jar "$HADOOP_MAPRED_HOME"/hadoop-streaming.jar \
-Dmapred.job.name='Simple streaming job reduce' \
-Dmapred.reduce.tasks=1 \
-file /home/ubuntu/mapper.py -mapper "python mapper.py" \
-file /home/ubuntu/reducer.py -reducer "python reducer.py" \
-input /user/ubuntu/gzip-data -output $MR_OUTPUT

-inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \

# -Dmapred.reduce.tasks=1 \
#-Dmapreduce.input.lineinputformat.linespermap=1000 \
#-inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \


#-Dmapred.job.name='Simple streaming job' \
#-Dmapred.reduce.tasks=1 -Dmapreduce.input.lineinputformat.linespermap=1000 \
#-inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \


# -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat -Dmapreduce.input.lineinputformat.linespermap=1000 \

## s3
# -Dfs.s3a.endpoint=s3.amazonaws.com -Dfs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.AnonymousAWSCredentialsProvider


#hadoop fs -rm -r taxi-output
#
hadoop jar "$HADOOP_MAPRED_HOME"/hadoop-streaming.jar \
-Dmapred.job.name='Taxi streaming job' \
-Dmapred.reduce.tasks=1 \
-Dmapreduce.map.memory.mb=1024 \
-file /home/ubuntu/mapper.py -mapper "python mapper.py" \
-file /home/ubuntu/reducer.py -reducer "python reducer.py" \
-input /user/ubuntu/2020/2020  -output $MR_OUTPUT
