
module serial

const path = string(pwd(),"/clibrary/juliaSerial")

# this is so the channel can be set 
mutable struct portNumber
	pn::Union{Number,Nothing}
	portNumber(pn=nothing) = new(pn)
end

# struct for the string and port
struct sPort
	device::String 
	channel::portNumber
	sPort(dev::String) = new(dev, portNumber(nothing))
	sPort(dev::sPort) = new(dev.device,dev.channel)
end

# open functions
function open_port(dev::sPort)
	port = ccall((:open_port, path), Cint, (Ptr{UInt8},), dev.device)
	if port != -1
	    nPort.channel.pn = port
	end
	return dev
end

function open_port(dev::String)
	nPort = sPort(dev)
	port = ccall((:open_port, path), Cint, (Ptr{UInt8},), dev) 
	if port != -1
	    nPort.channel.pn = port
	end
	return nPort
end

function close_port(port::sPort) 
	p = ccall((:close, path), Cint, (Cint,), port.channel.pn)
	if p != -1
		port.channel.pn = p
	end
	return p
end

function set_attrs(port::sPort, speed::Number)
	# return of 0 is good 
	# int set_interface_attribs(int port, int speed)
	return ccall((:set_interface_attribs, path), Cint, (Cint, Cint,), Cint(port.channel.pn), Cint(speed))
end

function set_mincount(port::sPort, mcount::Number)
	# void set_mincount(int port, int mcount)
	return ccall((:set_mincount, path), Cvoid, (Cint, Cint,), Cint(port.channel.pn), Cint(mcount))
end

function swrite(port::sPort, msg::String)
	# int swrite(int port, char* msg, const int size)
	return ccall((:swrite, path), Cint, (Cint, Cstring, Cint), Cint(port.channel.pn), msg, Cint(sizeof(msg)))
end

function sread(port::sPort)
	# int sread(const int port, char* msg, const int size)
	msg = Vector{UInt8}(undef, 255)
	bytes = ccall((:sread, path), Cint, (Cint, Ptr{UInt8}, Cint), Cint(port.channel.pn), msg, Cint(sizeof(msg)))
    msg[end] = 0; # ensure null-termination
    return (bytes, String(unsafe_string(pointer(msg))))
end

end  # end of module 