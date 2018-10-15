include("Serial.jl")


port = open_port("/dev/ttyUSB0")
set_attrs(port, 96000)

sample = ""
try
	while true 
		sleep(.40)
		reading = sread(port)


		if reading[1] != 0
			# print(reading[2])
			# println(typeof(reading[2]))
			if reading[2][end] == '\n'
				sample = reading[2]
				print(sample)
			else
				println("triggered")
				sample = string(sample, reading[2], "\0")
			end

		end
	end


catch e
	println(e)

end
close_port(port)