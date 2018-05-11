package Socket;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Database.Database;
import Generale.Dato;

public class Client 
{
	public static void main(String args[]) 
	{
		List<String>list=new ArrayList<String>();
		try
		{
			System.out.println("Apertura connessione...");
			Socket s1=new Socket("192.168.17.10", 7777);
			
			InputStream is=s1.getInputStream();
			BufferedReader dis=new BufferedReader(new InputStreamReader(is));
			
			System.out.println("Connessione aperta");
			String risp;
			do
			{
				risp=dis.readLine();
				list.add(risp);
			}
			while(!risp.equals("!"));
			
			dis.close();
			s1.close();
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("Errore nella connessione");
		}
			
			List<Dato>informazioni=new ArrayList<>();
			
			for(String x : list)
			{
				if(!x.equals("!"))
				informazioni.add(new Dato(x.split(" ")[0], x.split(" ")[1]));
			}
			
			for(Dato x : informazioni)
				System.out.println(x);
			
			try
			{
				Database.inserisciDati(informazioni);
			} catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			}
			
			System.out.println("Chiusura connessione client effettuata");
	}
}
