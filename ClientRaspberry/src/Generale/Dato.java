package Generale;

public class Dato 
{
	private final String ip;
	private final String mac;
	
	public Dato(String ip, String mac)
	{
		this.ip=ip;
		this.mac=mac;
	}
	
	public String getIp()
	{
		return ip;
	}
	
	public String getMac()
	{
		return mac;
	}
	
	@Override
	public String toString()
	{
		return ip+" "+mac+"\n";
	}
}
