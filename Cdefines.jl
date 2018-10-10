# /* termios type and macro definitions.  Linux version.
#    Copyright (C) 1993-2017 Free Software Foundation, Inc.
#    This file is part of the GNU C Library.
#    The GNU C Library is free software; you can redistribute it and/or
#    modify it under the terms of the GNU Lesser General Public
#    License as published by the Free Software Foundation; either
#    version 2.1 of the License, or (at your option) any later version.
#    The GNU C Library is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#    Lesser General Public License for more details.
#    You should have received a copy of the GNU Lesser General Public
#    License along with the GNU C Library; if not, see
#    <http://www.gnu.org/licenses/>.  */

# these are being added because termios does not exist 
#ifndef _TERMIOS_H
# error "Never include <bits/termios.h> directly; use <termios.h> instead."
# #endif

# typedef unsigned char        cc_t;
# typedef unsigned int        speed_t;
# typedef unsigned int        tcflag_t;



#define NCCS 32
mutable struct termios

    c_iflag::Cuint     #/* tcflag_t input mode flags */
    c_oflag::Cuint     #/* tcflag_t output mode flags */
    c_cflag::Cuint     #/* tcflag_t control mode flags */
    c_lflag::Cuint     #/* tcflag_t local mode flags */
    c_line::Cuchar         #/* cc_t line discipline */
    c_cc::Ptr{UInt8} #/* cc_t control characters */
    c_ispeed::Cint      #/* speed_t input speed */
    c_ospeed::Cint      #/* speed_t output speed */
#define _HAVE_STRUCT_TERMIOS_C_ISPEED 1
#define _HAVE_STRUCT_TERMIOS_C_OSPEED 1
end


@enum c_cc begin
# /* c_cc characters */
VINTR = Cuchar(0)
VQUIT = Cuchar(1)
VERASE = Cuchar(2)
VKILL = Cuchar(3)
VEOF = Cuchar(4)
VTIME = Cuchar(5)
VMIN = Cuchar(6)
VSWTC = Cuchar(7)
VSTART = Cuchar(8)
VSTOP = Cuchar(9)
VSUSP = Cuchar(10)
VEOL = Cuchar(11)
VREPRINT = Cuchar(12)
VDISCARD = Cuchar(13)
VWERASE = Cuchar(14)
VLNEXT = Cuchar(15)
VEOL2 = Cuchar(16)
end 


# /* c_iflag bits Cunit*/
IGNBRK = Cuint(0o0000001)
BRKINT = Cuint(0o0000002)
IGNPAR = Cuint(0o0000004)
PARMRK = Cuint(0o0000010)
INPCK = Cuint(0o0000020)
ISTRIP = Cuint(0o0000040)
INLCR = Cuint(0o0000100)
IGNCR = Cuint(0o0000200)
ICRNL = Cuint(0o0000400)
IUCLC = Cuint(0o0001000)
IXON = Cuint(0o0002000)
IXANY = Cuint(0o0004000)
IXOFF = Cuint(0o0010000)
IMAXBEL = Cuint(0o0020000)
IUTF8 = Cuint(0o0040000)


# /* c_oflag bits tcflag_t*/
OPOST = Cuint(0000001)
OLCUC = Cuint(0000002)
ONLCR = Cuint(0000004)
OCRNL = Cuint(0000010)
ONOCR = Cuint(0000020)
ONLRET = Cuint(0000040)
OFILL = Cuint(0000100)
OFDEL = Cuint(0000200)
# not sure what to do with these
#if defined __USE_MISC || defined __USE_XOPEN
# define NLDLY        0000400
# define   NL0        0000000
# define   NL1        0000400
# define CRDLY        0003000
# define   CR0        0000000
# define   CR1        0001000
# define   CR2        0002000
# define   CR3        0003000
# define TABDLY        0014000
# define   TAB0        0000000
# define   TAB1        0004000
# define   TAB2        0010000
# define   TAB3        0014000
# define BSDLY        0020000
# define   BS0        0000000
# define   BS1        0020000
# define FFDLY        0100000
# define   FF0        0000000
# define   FF1        0100000
#endif
VTDLY = Cuint(0o0040000)
VT0 = Cuint(0o0000000)
VT1 = Cuint(0o0040000)
#ifdef __USE_MISC
# define XTABS        0014000
#endif


# /* c_cflag bit meaning Cunit*/
#ifdef __USE_MISC
# define CBAUD        0010017
#endif

B0     = Cuint(0o0000000)   #/* hang up */
B50    = Cuint(0o0000001)
B75    = Cuint(0o0000002)
B110   = Cuint(0o0000003)
B134   = Cuint(0o0000004)
B150   = Cuint(0o0000005)
B200   = Cuint(0o0000006)
B300   = Cuint(0o0000007)
B600   = Cuint(0o0000010)
B1200  = Cuint(0o0000011)
B1800  = Cuint(0o0000012)
B2400  = Cuint(0o0000013)
B4800  = Cuint(0o0000014)
B9600  = Cuint(0o0000015)
B19200 = Cuint(0o0000016)
B38400 = Cuint(0o0000017)
# these are all higher speeds they may not be needed
#ifdef __USE_MISC
# define EXTA B19200
# define EXTB B38400
#endif
CSIZE  = Cuint(0o0000060)
CS5    = Cuint(0o0000000)
CS6    = Cuint(0o0000020)
CS7    = Cuint(0o0000040)
CS8    = Cuint(0o0000060)
CSTOPB = Cuint(0o0000100)
CREAD  = Cuint(0o0000200)
PARENB = Cuint(0o0000400)
PARODD = Cuint(0o0001000)
HUPCL  = Cuint(0o0002000)
CLOCAL = Cuint(0o0004000)
#ifdef __USE_MISC
# define CBAUDEX 0010000
#endif

B57600   = Cuint(0o0010001)
B115200  = Cuint(0o0010002)
B230400  = Cuint(0o0010003)
B460800  = Cuint(0o0010004)
B500000  = Cuint(0o0010005)
B576000  = Cuint(0o0010006)
B921600  = Cuint(0o0010007)
B1000000 = Cuint(0o0010010)
B1152000 = Cuint(0o0010011)
B1500000 = Cuint(0o0010012)
B2000000 = Cuint(0o0010013)
B2500000 = Cuint(0o0010014)
B3000000 = Cuint(0o0010015)
B3500000 = Cuint(0o0010016)
B4000000 = Cuint(0o0010017)
#define __MAX_BAUD B4000000
#ifdef __USE_MISC
# define CIBAUD          002003600000                /* input baud rate (not used) */
# define CMSPAR   010000000000                /* mark or space (stick) parity */
# define CRTSCTS  020000000000                /* flow control */
#endif

# /* c_lflag bits */
ISIG = Cuint(0o0000001)
ICANON = Cuint(0o0000002)
#if defined __USE_MISC || (defined __USE_XOPEN && !defined __USE_XOPEN2K)
# define XCASE        0000004
#endif
ECHO   = Cuint(0o0000010)
ECHOE  = Cuint(0o0000020)
ECHOK  = Cuint(0o0000040)
ECHONL = Cuint(0o0000100)
NOFLSH = Cuint(0o0000200)
TOSTOP = Cuint(0o0000400)
#ifdef __USE_MISC
# define ECHOCTL 0001000
# define ECHOPRT 0002000
# define ECHOKE         0004000
# define FLUSHO         0010000
# define PENDIN         0040000
#endif
IEXTEN = Cuint(0o0100000)
#ifdef __USE_MISC
# define EXTPROC 0200000
#endif

# /* tcflow() and TCXONC use these */
TCOOFF = Cuint(0)
TCOON = Cuint(1)
TCIOFF = Cuint(2)
TCION = Cuint(3)

# /* tcflush() and TCFLSH use these */
TCIFLUSH= Cuint(0)
TCOFLUSH= Cuint(1)
TCIOFLUSH= Cuint(2)

# /* tcsetattr uses these */
TCSANOW = Cuint(0)
TCSADRAIN = Cuint(1)
TCSAFLUSH = Cuint(2)

#define _IOT_termios /* Hurd ioctl type field.  */ \
  # _IOT (_IOTS (cflag_t), 4, _IOTS (cc_t), NCCS, _IOTS (speed_t), 2)
