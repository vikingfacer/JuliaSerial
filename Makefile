
includes = "JuliaSerial.h"
complier = "gcc"

test: juliaSerialTest.o juliaSerial.h juliaSerial.o
	$(complier) $^ -o $@

%.o: %.c $(includes)
	$(complier) -c -o $@ $^ 

juliaSerialTest.o: juliaSerialTest.c  

juliaSerial.o: juliaSerial.c

.phony: clean 

clean:
	rm *.o test