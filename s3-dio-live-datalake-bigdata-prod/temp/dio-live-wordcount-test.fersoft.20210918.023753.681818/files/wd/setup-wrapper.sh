set -e

# store $PWD
__mrjob_PWD=$PWD

# obtain exclusive file lock
exec 9>/tmp/wrapper.lock.dio-live-wordcount-test.fersoft.20210918.023753.681818
python3 -c 'import fcntl; fcntl.flock(9, fcntl.LOCK_EX)'

# setup commands
{
  export PYTHONPATH=$__mrjob_PWD/mrjob.zip:$PYTHONPATH
} 0</dev/null 1>&2

# release exclusive file lock
exec 9>&-

# run task from the original working directory
cd $__mrjob_PWD
"$@"
