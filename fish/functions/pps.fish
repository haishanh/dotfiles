function pps
  ps -eo pid,%cpu,command $argv
end
