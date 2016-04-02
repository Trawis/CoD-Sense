default:
	mkdir -p bin
	mkdir -p out && rm -f out/*
	ln src/cpp/* ./out
	bison -d src/gsc.ypp
	flex  src/gsc.l #--header-file="lex.yy.h"
	mv -f -t out/ *.cpp *.c *.hpp *.h 2>/dev/null; true
	cd out
	g++ -Wall -g -o bin/parser out/*.cpp out/*.c

test:
	make
	gnome-terminal -x ./bin/parser

test-file:
	make
	gnome-terminal -x ./bin/test.sh
	
	