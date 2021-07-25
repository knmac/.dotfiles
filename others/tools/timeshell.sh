timeshell() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do
    /usr/bin/time -f "\t%E real,\t%U user,\t%S sys" $shell -i -c exit;
  done
}
