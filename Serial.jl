

function open_port(dev::String)
	port = ccall((:open_port, "./juliaSerial"), Cint, (Ptr{UInt8},), dev)
	return port
end

function set_attrs(port::Number, speed::Number)
	# int set_interface_attribs(int port, int speed)
	return ccall((:set_interface_attribs, "./juliaSerial"), Cint, (Cint, Cint,), Cint(port), Cint(speed))
end

function set_mincount(port::Number, mcount::Number)
	# void set_mincount(int port, int mcount)
	return ccall((:set_mincount, "./juliaSerial"), Cvoid, (Cint, Cint,), Cint(port), Cint(mcount))
end

function swrite(port::Number, msg::String)
	# int swrite(int port, char* msg, const int size)
	return ccall((:swrite, "./juliaSerial"), Cint, (Cint, Cstring, Cint), Cint(port), Cstring(msg), Cint(length(msg)+1))
end

function sread(port::Number)
	# int sread(const int port, char* msg, const int size)
	msg = Vector{UInt8}(undef, 255)
	ccall((:sread, "./juliaSerial"), Cint, (Cint, Ptr{UInt8}, Cint), Cint(port), msg, Cint(sizeof(msg)))
    msg[end] = 0; # ensure null-termination
    return unsafe_string(pointer(msg))
end
