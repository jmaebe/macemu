#!/bin/bash -e

#
# run_gencomp_for_xcode.sh
#
# Generates files for 68k emulation, via UAE's virtual cpu, for use on Mac OS X hosts
#

if [ ! "$BUILT_PRODUCTS_DIR" ] || [ ! "$PROJECT_DIR" ]; then
	echo "ERROR: $(basename $0) must be run from an Xcode 'External Build System' target"
	exit 1
fi

# Log some debugging information
echo "1=$1"
echo "BUILT_PRODUCTS_DIR=$BUILT_PRODUCTS_DIR"
echo "PROJECT_DIR=$PROJECT_DIR"

# Perform actions, given the passed-in build step
case "$1" in
	"clean")
		echo "Cleaning gencomp output(s)"
		rm -rf "$BUILT_PRODUCTS_DIR/gencomp_output"
		;;
	"")
		if [ ! -d "$BUILT_PRODUCTS_DIR" ]; then
			echo "No built products directory"
			exit 1
		fi
		echo "Running gencomp"
		cd "$BUILT_PRODUCTS_DIR"
		mkdir -p gencomp_output
		cd gencomp_output
		"$BUILT_PRODUCTS_DIR/gencomp"
		ls -al
		;;
esac
