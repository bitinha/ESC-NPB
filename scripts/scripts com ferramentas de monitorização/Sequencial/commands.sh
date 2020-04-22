pid=$!
    
top -d 2 -b -p $pid > $1_top_$2 &
pidstat 2 -p $pid > $1_pidstat_$2 &
pidstat 2 -d -p $pid > $1_pidstat_d_$2 &
mpstat 2 > $1_mpstat_$2 &
iostat -t 2 > $1_iostat_$2 &
lsof -r 2 -p $pid > $1_lsof_$2 &
free -ms 2 > $1_free_$2 &
vmstat 2 > $1_vmstat_$2 &
ps -p $pid -o pid,%mem,%cpu > $1_ps_$2 &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
pkill free
pkill vmstat
pkill ps
