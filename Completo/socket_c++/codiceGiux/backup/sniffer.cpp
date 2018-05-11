#include <iostream>
#include <unistd.h>
#include <sstream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

struct Informazione {
	string ip, mac;
	Informazione(string ip, string mac=""){
		this->ip = ip;
		this->mac = mac;
	}
};

vector<Informazione> indirizziAttivi;

vector<string> split(const string& stringa, const char& c){
	string buff( "" );
	vector<string> v;
	for (auto n : stringa){
		if (n != c)
			buff += n;
		if ((n == c) && (buff != "")){
			v.push_back(buff);
			buff = "";
		}
	}
	
	if (buff!= ""){
		v.push_back(buff);
	return v;
}

void ricavaInfoPing(){
	ifstream input;
	input.open("ping.txt");
	string riga;
	vector<string> lettura;
	Informazione info;
	while(getline(input, riga)){
		lettura = split(riga, " ");
		if (lettura.at(0) == 0){
			info = new Informazione(lettura.at(1));
			indirizziAttivi.push_back(info);
		}
	}
}

void ricavaInfoArp(){
	ifstream input;
	input.open("arp.txt");
	string riga;
	vector<string> lettura;
	string ip = "192.196.";
	while(getline(input, riga)){
		lettura = split(riga, " ");
		for (int i=9; i<lettura.at(1).size(); i++){
			if (lettura.at(1)[i]!=')'){
				ip+=lettura.at(1)[i];
			}
		}
		int conta=0;
		for (Informazione i : indirizziAttivi) {
			if (i.ip == ip){
				i.mac = lettura.at(3);
			}
			else{
				indirizziAttivi.erase(indirizziAttivi.begin() + conta);
			}
		}
	}
}

int main(){

	//int status = execl("/usr/bin/bash", "bash", "-im",  "-bg", "red", "-e", "/home/pi/Desktop/socket_c++/codiceGiux/ping.sh", (char*)NULL);
	//if(status < 0){
		//cout << "Errore!" << flush;
		//return (-1);
	//}
	const string indirizzoPartenza = "192.168.";
	for (int i=0; i<256; i++){
		for (int j=1; j<255; j++){
			stringstream indirizzo;
			indirizzo << indirizzoPartenza << i << "." << j;
			string comando = "./ping.sh " + indirizzo.str();
			system(comando.c_str());
		}
		ricavaInfoPing();
		ricavaInfoArp();
	}
	system("arp -a >> arp.txt");
	
	return 0;


}
