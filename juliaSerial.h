#include <stdio.h>   /* Standard input/output definitions */
#include <string.h>  /* String function definitions */
#include <unistd.h>  /* UNIX standard function definitions */
#include <fcntl.h>   /* File control definitions */
#include <errno.h>   /* Error number definitions */
#include <termios.h> /* POSIX terminal control definitions */

int open_port(char* str);

int set_interface_attribs(int port, int speed);

void set_mincount(int port, int mcount);

int swrite(int port, char* msg, const int size);

int sread(const int port, char* msg, const int size);

