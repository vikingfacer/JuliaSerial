
include("Serial.jl")

n =0

port = open_port("/dev/ttyUSB0")

set_attrs(port, 1152000)
function test()
for i=1:10
	@show swrite(port, "Hello\n")
	sleep(.5)
	@show sread(port)
	sflush(port)
end

end 

test()