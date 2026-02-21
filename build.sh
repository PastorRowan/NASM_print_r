
#!/bin/bash

FNAME="index"
SRC="${FNAME}.asm"
OBJ="${FNAME}.o"
OUT="${FNAME}"
externalModulePaths=""

# Produce expanded asm
nasm -E index.asm > index_expanded.asm

# Assemble
nasm -f elf64 -g -F dwarf "$SRC" -o "$OBJ"

# Link
ld "$OBJ" -o "$OUT"

./"$OUT"

# Run
# gdb ./"$OUT"

# do this afterwards
#break _start
#run
