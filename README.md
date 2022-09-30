# Практика MapReduce

## Подготовка

* создадим кластер
* установим AWS CLI на одной из машин кластера:
  ```shell
  apt install -y awscli
  ```
* скачаем тестовые данные:
  ```shell
  wget -O alice.txt https://www.gutenberg.org/files/11/11-0.txt
  wget -O frank.txt https://www.gutenberg.org/files/84/84-0.txt
  ```
* Создадим папки на HDFS:
  ```shell
  hadoop fs -mkdir /user/root
  hadoop fs -mkdir /user/root/input-data
  hadoop fs -put *.txt input-data/
  ```
## Разберем исходный код mapper и reducer
## Запустим код
* Скопируем код на кластер
  ```shell
  scp ./*.py root@84.201.188.76:/tmp/mapreduce/ && scp ./run.sh root@84.201.188.76:/tmp/mapreduce/
  ```
* Запустим код
  ```shell
  cd /tmp/mapreduce/
  chmod +x ./run.sh
  ./run.sh
  ```
* Материалы
  * https://hadoop.apache.org/docs/stable/hadoop-streaming/HadoopStreaming.html

# hadoop jar "$HADOOP_MAPRED_HOME"/hadoop-streaming.jar \
# -Dmapred.job.name='Simple streaming job reduce' \
# -Dmapred.reduce.tasks=1 \
# -file /home/ubuntu/mapper.py -mapper "python mapper.py" \
# -file /home/ubuntu/reducer.py -reducer "python reducer.py" \
# -input /user/ubuntu/gzip-data -output $MR_OUTPUT

# -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \

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

scp -i D:\YandexDisk\GB\sshKeys\private.key D:\YandexDisk\KC\spark\practice2\run.sh ubuntu@51.250.54.98:/home/ubuntu/
scp -i D:\YandexDisk\GB\sshKeys\private.key ubuntu@51.250.54.98:/home/ubuntu/yellow_tripdata_2020-04.csv D:\YandexDisk\KC\hadoop
scp -i D:\YandexDisk\GB\sshKeys\private.key D:\YandexDisk\KC\hadoop\* ubuntu@51.250.54.98:/home/ubuntu/homework
  cat .\yellow_tripdata_2020-04.csv | python mapper.py

export MR_OUTPUT=/user/ubuntu/home-work
hadoop fs -rm -r $MR_OUTPUT
hadoop jar "$HADOOP_MAPRED_HOME"/hadoop-streaming.jar \
-Dmapred.job.name='Taxi streaming job' \
-Dmapred.reduce.tasks=1 \
-file /home/ubuntu/homewrok/mapper.py -mapper "python mapper.py" \
-file /home/ubuntu/homewrok/reducer.py -reducer "python reducer.py" \
-input /user/ubuntu/data-test  -output $MR_OUTPUT
