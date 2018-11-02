#include "juliaSerial.h"
#include <time.h>

int main(int argc, char const *argv[])
{
	

	int port = open_port(argv[1]);
	if (set_interface_attribs(port, B115200) == 0)
	{
		printf("everything is gucci\n");
	}

	set_mincount(port, 1);

	int n = 0;
	char buf[255];
	char msg[] = "this is a message did you get it?";
	// while(1){
	if(swrite(port, msg, sizeof(msg)) == -1){
		printf("this is messed up\n" );
	}
	// 	sleep(1);
	// 	memset(buf, '\0', sizeof(buf));
	// 	sread(port, buf, 255);
	// 	printf("%s\n", buf);
	// }

	sread(port, buf, 255);


	printf("%s\n",buf );

	return 0;
}