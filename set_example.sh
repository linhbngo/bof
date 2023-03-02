#!/bin/bash

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

random() {
  cp stack.c.template stack.c
  bufsize=$((4 + $RANDOM % 200))
  sed -i "s/BUF_SIZE/${bufsize}/g" stack.c
}

small() {
  cp stack.c.template stack.c
  sed -i "s/BUF_SIZE/10/g" stack.c
}

generate() {
  touch badfile
  gcc -m32 -o stack -z execstack -fno-stack-protector stack.c
  gcc -m32 -g -o gdb_stack -z execstack -fno-stack-protector stack.c
}

clean() {
  rm -Rf stack.c
  rm -Rf stack
  rm -Rf gdb_stack
  rm -Rf badfile
}

case "$1" in
  'small')
    small
    ;;
  'random')
    random
    ;;
  'clean')
    clean
    ;;
  *)
    log_info "Usage: $0 { small | random | clean }"
    exit 1
    ;;
esac
