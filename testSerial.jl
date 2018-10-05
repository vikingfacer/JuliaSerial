
include("Serial.jl")

n =0

port = open_port("/dev/ttyUSB0")

set_attrs(port, 1152000)

for i=1:10
	@show swrite(port, "Hello\n")

	@show sread(port)
end