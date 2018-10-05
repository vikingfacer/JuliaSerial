
includes = "JuliaSerial.h"
complier = "gcc"
flags = "-shared -fPIC"

lib: juliaSerial.so

test: juliaSerialTest.o juliaSerial.o
	$(complier) -l $(flags) $^ -o $@

%.so: %.c 
	$(complier) $(flags) $^ -o $@

%.o: %.c $(includes)
	$(complier) -l $(flags)-c $^  -o $@ 

juliaSerialTest.o: juliaSerialTest.c  

juliaSerial.o: juliaSerial.c

.phony: clean 

clean:
	rm *.o test


# new command 	# gcc -shared -fPIC -dynamiclib juliaSerial.c -o juliaSerial.so 
