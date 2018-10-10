
# baud_rate: u32 The baud rate in symbols-per-second
# data_bits: DataBits Number of bits used to represent a character sent on the line
# flow_control: FlowControl The type of signalling to use for controlling data transfer
# parity: Parity The type of parity to use for error checking
# stop_bits: StopBits Number of bits to use to signal the end of a character
# timeout: Duration Amount of time to wait to receive data before timing out

struct SerialSettings 
	baud_rate
	data_bits
	flow_control
	parity
	stop_bits
	timeout
end

function set_interface_attribs(port::Number, speed::Number)

end 


function set_mincount(port::Number, mcount::Number)

end

function swrite(port::Number, msg::string)

end

function sread(port)

end