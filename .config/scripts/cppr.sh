# C++ runner 
# $1 - filename
# $2 - use type (3: gdb, 2: valgrind, 1: normal) 
# $3 - CFLAGS

start_time=$SECONDS
export LESS=-FX # paging using less
#CC=g++ # clang++ also works
CC=${CXX:-clang++}

time_cmd="/usr/bin/time -f \"\n\nTime Taken: %E\nCPU Usage: %P\nMemory: %K\"" # for measuring time

if [ $# -eq 0 ]; then
    echo -e "USAGE:\n$0 <file>.cpp/cc <run type> <Optional CFLAGS>"
    echo -e "Run Types:\n\t1 - Normal with optinal CFLAGS enabled\
        \n\t2 - run using valgrind with optional CFLAGS enabled\
        \n\t3 - run using gdb with optional CFLAGS enabled"
            exit 1
fi

if [ "$2" != "" ]; then # check if run type is given
    if [ $2 -eq 2 ]; then # use valgrind
        CFLAGS="-Wall -Wextra -g $3"
        compile="${CC} ${CFLAGS} $1"
        run="valgrind ./a.out"
    elif [ $2 -eq 3 ]; then # use gdb
        CFLAGS="-Wall -Wextra -g $3"
        compile="${CC} ${CFLAGS} $1"
        run="gdb ./a.out"
    elif [ $2 -eq 1 ]; then # normal run with extra compiler flags
        CFLAGS="-Wall -Wextra $3"
        compile="${CC} ${CFLAGS} $1"
        run="./a.out"
    fi
else # default run
    CFLAGS="-Wall -Wextra "
    compile="g++ ${CFLAGS} $1"
    run="./a.out"
fi

echo -e "Compiling \"$1\" with flags \"${CFLAGS}\""

echo -e "\nCompiler Output:"
echo "--------------------------------------------"
eval "$time_cmd script -q /dev/null -c '$compile' > $1.log" # script preserves output color
if [ -f "$1.log" ]; then
    eval "less -R $1.log"
fi
echo "--------------------------------------------"

echo -e "\n\nCommand output: "
echo "--------------------------------------------"
if [ -f "./a.out" ]; then
    eval "$time_cmd $run"
else
    echo "Error: Failed to compile"
fi

echo -e "\n--------------------------------------------"
eval "rm -f $1.log"
eval "rm -f a.out"

elapsed=$(( SECONDS - start_time ))
echo -e "\nTotal Time taken: ${elapsed}second(s)"
