#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <limits.h>
#include <termios.h>
#include <string.h>

int main() {
	
    int ioptr[2], nmax = 80, k0;
    char device0[80], device1[80], stringa[80];
    int err;
    pid_t pid;
    int status1, status2;

    pid = fork();
    if (pid < 0) {
        perror ("Errore in fork!\n");
        return -1;
    }
    else if (pid == 0){
		status1 = execl("/usr/bin/xterm", "xterm", "-im",  "-bg", "red", "-e", "/home/eleadmin/Documents/Per_Ale/try.sh", (char*)NULL);
		if(status1 < 0){
			perror("errore execl");
			return (-1);
			}
    }
    else{
		//secondo fork
		pid = fork();
        if (pid < 0){
			perror ("Errore in fork!\n");
			return -1;
    }
		else if (pid == 0){
			//figlio 2
			status2 = execl("/usr/bin/xterm", "xterm", "-bg", "blue", "-hold", "-e", "/home/eleadmin/Documents/Per_Ale/try.sh",(char*)NULL);
			if(status2 < 0){
				perror("errore execl");
				return (-1);
			}
    }
		else{
			//padre
			     
			write(STDOUT_FILENO, "primo device", 12);
			//controllo errori
			if(errno){
				perror("errno");
				return (-1);
			}
			err=read(STDIN_FILENO, device0, 80);
			if (err < 0)
				perror("errore di lettura");
			
			device0[err-1] = '\0';
			ioptr[0] = open(device0, O_RDWR);
			//controllo errori
			if (errno) { 
				perror("Errore nell'apertura della linea"); 
				return(-1);
			}
    
			write(STDOUT_FILENO, "secondo device", 14);
			if(errno){
				perror("errno");
				return (-1);
			}
			//controllo errori
			err=read(STDIN_FILENO, device1, 80);
			if (err < 0)
				perror("errore di lettura");
			
			device1[err-1] = '\0';
			ioptr[1] = open(device1, O_WRONLY); //apro in modalità  write, bloccante(default)
			if (errno) { 
				perror("Errore nell'apertura della linea"); 
				return(-1);
			}
			while(1) {
				k0 = read(ioptr[0], stringa, nmax);
				stringa[k0-1] = '\0';
				write(ioptr[1], "\n", 2);
				if(k0 > 0)
					write(ioptr[1], stringa, k0);
				if((strcmp(stringa,"exit")) == 0){
					write(STDOUT_FILENO, "exiting...", 10);
					return 0;
				}
				
			}

		}
	}
return 0;	
}
    
    
