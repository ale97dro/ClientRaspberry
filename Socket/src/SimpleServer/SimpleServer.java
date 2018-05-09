package SimpleServer;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class SimpleServer 
{
	private int port;
	private ServerSocket server;
	
	public SimpleServer(int port)
	{
		this.port=port;
		
		if(!startServer())
			System.out.println("Errore durante la creazione del server");
	}
	
	private boolean startServer()
	{
		try
		{
			server=new ServerSocket(port);
		}
		catch(IOException ex)
		{
			ex.printStackTrace();
			return false;
		}
		System.out.println("Server creato con successo");
		return true;
	}
	
	public void runServer()
	{
		while(true)
		{
			try
			{
				System.out.println("Server in attesa di richieste");
				Socket s1=server.accept();
				System.out.println("Un client si è connesso");
				
				OutputStream s1out=s1.getOutputStream();
				BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(s1out));
				
				bw.write("Benvenuto sul server!\n");
				
				bw.close();
				s1.close();
				System.out.println("Chiusura connessione effettuata");
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	public static void main(String args[])
	{
		SimpleServer ss = new SimpleServer(7777);
		ss.runServer();
	}
}
