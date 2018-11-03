#include "juliaSerial.h"
/*
 * 'open_port()' - Open serial port 1.
 *
 * Returns the file descriptor on success or -1 on error.
 */


// this needs flush commands 

int open_port(char* str)
{
  int fd; /* File descriptor for the port */


  fd = open(str, O_RDWR | O_NOCTTY | O_NDELAY);
  if (fd == -1)
  {
   /*
    * Could not open the port.
    */
    char msg[100] = {0};
    snprintf(msg, sizeof(msg), "open_port: Unable to open %s - %s", str, strerror(errno));
    perror("open_port: Unable to open /dev/ttyUSB0 - ");
  }
  else
    fcntl(fd, F_SETFL, 0);

  return (fd);
}



int set_interface_attribs(int port, int speed)
{
    struct termios tty = {0};

    if (tcgetattr(port, &tty) < 0) {
        printf("Error from tcgetattr: %s\n", strerror(errno));
        return -1;
    }

    cfsetospeed(&tty, (speed_t)speed);
    cfsetispeed(&tty, (speed_t)speed);

    tty.c_cflag |= (CLOCAL | CREAD);    /* ignore modem controls */
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;         /* 8-bit characters */
    tty.c_cflag &= ~PARENB;     /* no parity bit */
    tty.c_cflag &= ~CSTOPB;     /* only need 1 stop bit */
    tty.c_cflag &= ~CRTSCTS;    /* no hardware flowcontrol */

    /* setup for non-canonical mode */
    tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON);
    tty.c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
    tty.c_oflag &= ~OPOST;

    /* fetch bytes as they become available */
    tty.c_cc[VMIN] = 0;
    tty.c_cc[VTIME] = 0;

    if (tcsetattr(port, TCSANOW, &tty) != 0) {
        printf("Error from tcsetattr: %s\n", strerror(errno));
        return -1;
    }
    return 0;
}


void set_mincount(int port, int mcount)
{
    struct termios tty = {0};

    if (tcgetattr(port, &tty) < 0) {
        printf("Error tcgetattr: %s\n", strerror(errno));
        return;
    }

    tty.c_cc[VMIN] = mcount ? 1 : 0;
    tty.c_cc[VTIME] = 5;        /* half second timer */

    if (tcsetattr(port, TCSANOW, &tty) < 0)
        printf("Error tcsetattr: %s\n", strerror(errno));
}

int swrite(int port, char* msg, const int size)
{
	int n = 0;
	if( n = write(port, msg, size) > 0)
	{
		tcdrain(port);  // delay for output
		return n;
	}else
	{
		perror("write");
		return -1;	
	}
}

int sread(const int port, char* msg, const int size)
{
    // this should read till the end or till a certain amount is read 
	int total = 0, n = 0;
    char temp[255] = {0};
    memset(temp, '\0', 255);
    	if ((n = read(port, msg, size - 1)) < 0)
    	{
    		perror("read");
    		total = -1;
    	}
        total = n;
    return total;
}
