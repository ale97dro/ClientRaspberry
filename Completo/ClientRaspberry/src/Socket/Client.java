package Socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import Database.Database;
import Generale.Dato;
import Generale.DatoNmap;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class Client 
{
	public static void main(String args[]) throws IOException, ParserConfigurationException, SAXException 
	{
		List<String>list=new ArrayList<String>();
		List<String>xml=new ArrayList<String>();
		try
		{
			System.out.println("Apertura connessione...");
			Socket s1=new Socket("192.168.0.10", 7777);
			
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
			
			//XML
			do
			{
				risp=dis.readLine();
				//if(risp!="!\n" && risp!="!!\n" && risp!="\n")
				if(risp.length()>0)
					if(risp.charAt(0)=='<')
						xml.add(risp);
			}
			while(!risp.equals("!!")); //doppio !! finisco tutto, solo uno creo file
			
			for(String xmlS : xml)
				System.out.println(xmlS);
			
			dis.close();
			s1.close();
			System.out.println("Chiusura connessione client effettuata");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("Errore nella connessione");
		}
			
		List<Dato> informazioni = new ArrayList<>();

		for (String x : list) {
			if (!x.equals("!"))
				informazioni.add(new Dato(x.split(" ")[0], x.split(" ")[1]));
		}

		for (Dato x : informazioni)
			System.out.println(x);

		try {
			Database.inserisciDati(informazioni);
		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
		}
		
		nmap(xml);
			
			
	}
	
	public static void nmap(List<String>xml)
	{
		for(int i=0;i<xml.size();i++)
		{
			try (BufferedWriter out = new BufferedWriter(new FileWriter("xml.xml")))
			{
				try 
				{
					if(xml.get(i).charAt(0)=='<')
						out.write(xml.get(i));
				} catch (IOException e) {
				}
			} catch (IOException e2) {
			}
			
			//qui mi lavoro xml
			DocumentBuilderFactory factory = DocumentBuilderFactory.newDefaultInstance();
			DocumentBuilder parser=null;
			try {
				parser = factory.newDocumentBuilder();
			} catch (ParserConfigurationException e2) {
			} 
			
			Document doc = null;
			try {
				doc = parser.parse("xml.xml");
			} catch (SAXException e2) {
			} catch (IOException e2) {
			}
			
			try
			{
				Node x = doc.getElementsByTagName("address").item(0);
				Element e = (Element)x;
				
				DatoNmap nmap=new DatoNmap();
				
				nmap.setIp(e.getAttribute("addr"));
				
				NodeList y = doc.getElementsByTagName("port");
				
				for(int c=0;c<y.getLength();c++)
				{
					Element e1 = (Element)y.item(c);
					
					nmap.addPorta(e1.getAttribute("portid"));
					nmap.addProtocollo(e1.getAttribute("protocol"));
				}
				
				y=doc.getElementsByTagName("service");
				
				for(int c=0;c<y.getLength();c++)
				{
					Element e1=(Element)y.item(c);
					nmap.addServizio(e1.getAttribute("name"));
				}
				
				System.out.println(nmap);
			}
			catch(Exception ex)
			{
				
			}
			//qui salvo nel db
		}
	}
}
