package Generale;

import java.util.ArrayList;
import java.util.List;

public class DatoNmap 
{
	private String ip;
	private List<String> porta;
	private List<String> servizio;
	private List<String> protocollo;
	
	public DatoNmap()
	{
		this.porta=new ArrayList<String>();
		this.servizio=new ArrayList<String>();
		this.protocollo=new ArrayList<String>();
	}
	
	public DatoNmap(String ip, String porta, String servizio, String protocollo)
	{
	}
	
	public String getip()
	{
		return ip;
	}
	
	public void setIp(String ip)
	{
		this.ip=ip;
	}
	
	public List<String> getporta()
	{
		return porta;
	}
	
	public void addPorta(String porta)
	{
		this.porta.add(porta);
	}
	
	public List<String> getservizio()
	{
		return servizio;
	}
	
	public void addServizio(String servizio)
	{
		this.servizio.add(servizio);
	}
	
	public List<String> getprotocollo()
	{
		return protocollo;
	}
	
	public void addProtocollo(String protocollo)
	{
		this.protocollo.add(protocollo);
	}
	
	@Override
	public String toString()
	{
		return ip+" "+porta+" "+protocollo+" "+servizio;
	}
}
