#include <iostream>
#include <unistd.h>
#include <sstream>
#include <string>
#include <fstream>
#include <vector>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

using namespace std;

/*il file scriviFile.cpp è un programmino cpp che abbiamo utilizzato per testare il sistema in maniera più veloce
* ping.txt e arp.txt sono i file utilizzati per ricavare le informazioni da inviare
* xml.xml è il file con il risultato di nmap
 */
//per compilare: g++ sniffer.cpp -o sniffer
//per lanciare il programma: ./sniffer

struct Informazione {
	string ip, mac;
	Informazione(string ip, string mac=""){
		this->ip = ip;
		this->mac = mac;
	}

};

vector<Informazione> indirizziAttivi;
vector<Informazione> indirizziReali;


void error(const char *msg){
	perror(msg);
	exit(1);
}

void server(int porta){
	int sockId, newSockId;
	socklen_t clilen;
	char buffer[256];
	struct sockaddr_in serv_addr, cli_addr;
	int n;
	//creo un socket
	sockId = socket(AF_INET, SOCK_STREAM, 0);
	if (sockId < 0)
		error("Errore in apertura del socket!");
	//svuoto per sicurezza la struttura dell'indirizzo
	bzero((char *) &serv_addr, sizeof(serv_addr));

	//preparo la struct dell'indirizzo dell'host per darla alla funzione bind()
	serv_addr.sin_family = AF_INET;
	//in questo modo ricava l'indirizzo ip della macchina su cui giace il server
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	//converto il valore in network byte order
	serv_addr.sin_port = htons(porta);

	if (bind(sockId, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0)
		error("Errore nel binding!");

	//rimane in attesa con una coda di 5 richieste
	listen(sockId, 5);

	clilen = sizeof(cli_addr);

	newSockId = accept(sockId, (struct sockaddr *) &cli_addr, &clilen);
	if (newSockId < 0)
		error("Errore nell'accept!");
	
	printf("Connessione col client stabilita\n");
	//ciclo per inviare tutti i singoli indirizzi contenuti nel vettore
	for (Informazione i : indirizziReali){
		string daInviare;
		daInviare = i.ip + " " + i.mac + "\n";
		send(newSockId, daInviare.c_str(), daInviare.size(), 0);
	}
	//carattere finale di terminazione dell'invio dati
	string carStop = "!\n";
	send(newSockId, carStop.c_str(), carStop.size(), 0);



	//parte di nmap: recupero i dati e li invio
	for(Informazione i : indirizziReali)
	{
		stringstream comando;
		comando <<"nmap "<<i.ip<<" -oX xml.xml";
		system(comando.str().c_str());

		ifstream input;
		input.open("xml.xml");
		string riga;
		while(getline(input, riga))
		{
			send(newSockId, riga.c_str(), riga.size(), 0);
		}
		input.close();
		string stopSingolo="\n!\n";
		send(newSockId, stopSingolo.c_str(), stopSingolo.size(), 0);
	}

	string doppioStop="\n!!\n";
	send(newSockId, doppioStop.c_str(), doppioStop.size(), 0);

	close(newSockId);
	close(sockId);
}

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

	if (buff!= "")
		v.push_back(buff);
	return v;
}

void ricavaInfoPing(){
	ifstream input;
	input.open("ping.txt");
	string riga;
	vector<string> lettura;
	while(getline(input, riga)){
		lettura = split(riga, ' ');
		if (lettura.at(0) == "0"){
			Informazione info{lettura.at(1)};
			indirizziAttivi.push_back(info);
		}
	}

	input.close();
}

void ricavaInfoArp(){
 	ifstream input;
	input.open("arp.txt");
	string riga;
	vector<string> lettura;
	string ip = "192.168.";
	while(getline(input, riga)){
		stringstream ip_stream;
		ip_stream<<ip;
		lettura = split(riga, ' ');
		for (int i=9; i<lettura.at(1).size(); i++){
			if (lettura.at(1)[i]!=')'){
				ip_stream<<lettura.at(1)[i];
			}
		}
		for (Informazione i : indirizziAttivi)
		 {
			if (i.ip == ip_stream.str()){
				i.mac = lettura.at(3);
				indirizziReali.push_back(i);
			}
		}
	}

	input.close();
}


int main(){

	const string indirizzoPartenza = "192.168.";
	for (int i=0; i<256; i++){
		for (int j=0;<256; j++){
			stringstream indirizzo;
			indirizzo << indirizzoPartenza << i << "." << j;
			string comando = "./ping.sh " + indirizzo.str();
			system(comando.c_str());
		}
		ricavaInfoPing();
	}
	system("arp -a >> arp.txt");
	ricavaInfoArp();
	//viene richiamata la funzione che fa partire il server, passandogli la porta 7777 che usa il client
 
	printf("Avvio server...\n");
	server(7777);
	printf("\n\n\n\n\n...Connessione chiusa\n\n\n\n\n\n\n\n\n\n");
	return 0;


}
