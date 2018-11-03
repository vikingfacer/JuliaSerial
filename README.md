# JuliaSerial

This is a basic library that opens closes reads, writes. It can sets the mincount, and the speed.

# How to use it
This module requires the clibrary folder to be located directly next to it inorder to function correctly. 
In this folder compile the c files with the makefile or with 
```makefile
gcc -shared -fPIC juliaSerial.c -o juliaSerial.so
```

Once the clibrary is compiled the julia module should run
a serial device can be opened with the string of the device `open_port("/dev/ttyUSB0")` 
or by created the `struct sPort(<device name>)`
```julia
    open_serial = open_port("/dev/ttyUSB0")
    or 
    port = sPort("/dev/ttyUSB0")
    open_port(port)
```

Once the device is open it can read or write
```julia 
port = serial.open_port("/dev/ttyUSB0")
serial.set_attrs(port, 1152000)

function test()
    for i=1:10
    	@show serial.swrite(port, "Hello\n")
    	sleep(.5)
    	@show serial.sread(port)
    end
    serial.close_port(port)
end 

test()
```
this example is in testSerial