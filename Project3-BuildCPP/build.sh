#!/bin/bash

usage() {	
	echo "Usage: build.sh [OPTION] [FILE]"	
	echo "Options: -b to build; -t to test; -c to clean; -i to install"
	exit
}

build() {
	g++ $INFILE -o $OUTFILE &&
	echo "Successfully built executable '$OUTFILE'"
}

test_build() {
	build &&
	OUTPUT=$($PWD/$OUTFILE)
	echo "Expect output: Hello World"
	echo "Actual output: $OUTPUT" 
	if [[ "Hello World" == "$OUTPUT" ]]; then
		echo "Test passed"
	else
		echo "Test failed"
	fi
}

clean() {
	if [[ -e $OUTFILE ]]; then
		rm $OUTFILE && 
		echo "Successfully removed '$OUTFILE'"
	else
		echo "No binary to remove"
	fi
}

install() {
	BINPATH=$HOME/bin
	if [[ ! -d $BINPATH ]]; then
		mkdir $BINPATH &&
		echo "export PATH=\"\$PATH:$BINPATH\"" >> ~/.bashrc &&
		echo "Successfully created directory '$BINPATH' and added it to PATH"
	fi
	build &&
	mv $OUTFILE $BINPATH &&
	echo "Successfully moved '$OUTFILE' to '$BINPATH'" 
}

if [[ "$#" -ne 2 || ! -f "$2" ]]; then
	usage
fi

INFILE=$2
OUTFILE=$(echo "$2" | cut -f 1 -d '.')

case "$1" in 
	-b)
		build;;
	-t)
		test_build;;
	-c)
		clean;;
	-i)
		install;;
	*)
		usage;;
esac

