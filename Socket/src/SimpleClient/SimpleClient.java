package SimpleClient;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;

public class SimpleClient 
{
	public static void main(String args[]) 
	{
		try
		{
			System.out.println("Apertura connessione...");
			Socket s1=new Socket("127.0.0.1", 7777);
			
			InputStream is=s1.getInputStream();
			BufferedReader dis=new BufferedReader(new InputStreamReader(is));
			
			//System.out.println("Risposta del server: "+dis.readLine());
			String risp=dis.readLine();
			
			dis.close();
			s1.close();
			System.out.println("Chiusura connessione client effettuata");
			System.out.println(risp);
		}
		catch(Exception ex)
		{
			System.out.println("Errore nella connessione");
		}
	}
}
