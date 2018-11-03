
include("Serial.jl")

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