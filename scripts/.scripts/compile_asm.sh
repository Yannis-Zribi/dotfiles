#!/bin/bash
nasm -f elf64 -o "$(echo $1).o" "$(echo $1).s" && ld -o $1 "$(echo $1).o";
