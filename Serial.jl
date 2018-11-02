const path = string(pwd(),"/clibrary/juliaSerial")

function open_port(dev::String)
	port = ccall((:open_port, path), Cint, (Ptr{UInt8},), dev)
	return port
end

function close_port(port::Number) 
	return ccall((:close, path), Cint, (Cint,), port)
end

function set_attrs(port::Number, speed::Number)
	# int set_interface_attribs(int port, int speed)
	return ccall((:set_interface_attribs, path), Cint, (Cint, Cint,), Cint(port), Cint(speed))
end

function set_mincount(port::Number, mcount::Number)
	# void set_mincount(int port, int mcount)
	return ccall((:set_mincount, path), Cvoid, (Cint, Cint,), Cint(port), Cint(mcount))
end

function swrite(port::Number, msg::String)
	# int swrite(int port, char* msg, const int size)
	return ccall((:swrite, path), Cint, (Cint, Cstring, Cint), Cint(port), msg, Cint(sizeof(msg)))
end

function sread(port::Number)
	# int sread(const int port, char* msg, const int size)
	msg = Vector{UInt8}(undef, 255)
	bytes = ccall((:sread, path), Cint, (Cint, Ptr{UInt8}, Cint), Cint(port), msg, Cint(sizeof(msg)))
    msg[end] = 0; # ensure null-termination
    return (bytes, String(unsafe_string(pointer(msg))))
end
