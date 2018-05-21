#include <iostream>
#include <string>
#include <fstream>
#include <sstream>

using namespace std;

int main(){
	string ipPartenza = " 192.168.";
	ofstream output;
	output.open("ping.txt");
	int n = 0;
	for (int i=17; i<18; i++){
		for (int j=100; j<110; j++){
			stringstream ip, stampa;
			ip << ipPartenza << i << "." << j;
			if (i % 2 == 0)
				n = 1;
			else
				n = 0;
			stampa << n << ip.str();
			output << stampa.str() << endl;
			output.flush();
		}
	}
	output.close();
	return 0;
}
