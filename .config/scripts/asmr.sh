#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

ERROR() {
  echo -e "${RED}ERROR:${NC} $@"
}

ASM=nasm
LINKER=ld

ASMFLAGS="-f elf64"
LINKERFLAGS="-m elf_x86_64"

if [ "$2" != "" ]; then
  if [ $2 = "32" ]; then
    ASMFLAGS="-f elf32"
    LINKERFLAGS="-m elf_i386"
  fi
fi

fullname=$(basename -- "$1")
extension="${fullname##*.}"
filename="${fullname%.*}"

ASM_CMD="${ASM} ${ASMFLAGS} ${fullname} -o '${filename}.o' && ${LINKER} ${LINKERFLAGS} '${filename}.o' -o '${filename}'"

echo -e "${GREEN}Command:${NC} ${ASM_CMD}"
#eval "${ASM} ${ASMFLAGS} ${fullname} -o '${filename}.o' && ${LINKER} ${LINKERFLAGS} '${filename}.o' -o '${filename}'"
eval "${ASM_CMD}"

CMD=""

if [ -f "${filename}.o" ]; then
  CMD="rm -f ${filename}.o"
  if [ -f "${filename}" ]; then
    CMD="${CMD} && ./${filename}"
  else
    ERROR "Failed to make executable"
  fi
else 
  ERROR "Failed to generate object file"
fi

if [ "$CMD" = "" ]; then
  ERROR "Command failed"
fi
eval "${CMD}"
