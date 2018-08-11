all: main conf

# ld by .a
#main: hello
#	gcc -fPIC ./src/main.c -o ./tests/main -L./lib -lhello

# ld by .so
main: hello
	gcc -fPIC ./src/main.c -o ./tests/main -L./lib -lhello

hello: 
	gcc -c -fPIC ./src/hello.c -o ./out/hello.o
	ar cr ./lib/libhello.a ./out/hello.o
	gcc -shared -fPIC -o ./lib/libhello.so ./out/hello.o
	cp ./lib/libhello.a /usr/lib
	cp ./lib/libhello.so /usr/lib


conf:
	export LD_LIBRARY_PATH=/usr/lib:$(LD_LIBRARY_PATH)
	@echo $(LD_LIBRARY_PATH)

.PHONY: conf
