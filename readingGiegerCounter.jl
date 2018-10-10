include("Serial.jl")


port = open_port("/dev/ttyUSB1")
set_attrs(port, 9600)


while true 
	sleep(.40)
	reading = sread(port)
	if reading[1] != 0
		println(reading[2])
	end
end