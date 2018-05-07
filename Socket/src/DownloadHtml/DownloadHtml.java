package DownloadHtml;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

class URLClient
{
	private String strUrl;
	
	public URLClient(String strUrl)
	{
		this.strUrl=strUrl;
	}
	
	public String retrievePage()
	{
		StringBuffer document = new StringBuffer();
		
		try
		{
			URL url=new URL(strUrl);
			URLConnection conn = url.openConnection();
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line=null;
			
			while((line=reader.readLine())!=null)
					document.append(line+"\n");
			
			reader.close();
		}
		catch (MalformedURLException e) {
			System.out.println("MalformedException durante la connessione");
			  }
			  catch (IOException e) 
			{
			   System.out.println("IOException durante la connessione");
			  }
		
		return document.toString();
	}
}


public class DownloadHtml 
{
	public static void main(String[] args)
	{
		URLClient client=new URLClient("http://www.html.it");
		String webPage=client.retrievePage();
		
		try
		{
			FileWriter out = new FileWriter("htmlit.html");
			out.write(webPage);
			out.close();
		}
		catch(Exception ex)
		{
			
		}
	}
}
