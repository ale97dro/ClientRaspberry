package Database;

import Generale.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Database 
{
	public static final String driver="com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/prova";
	public static final String username="paolo";
	public static final String password="password";
	
	public static void inserisciDati(List<Dato>dati) throws SQLException, ClassNotFoundException
	{
		Class.forName(driver);
		try (Connection conn=DriverManager.getConnection(url, username, password))
		{
			conn.setAutoCommit(false);
			
			try (PreparedStatement stmt = conn.prepareStatement(
					"insert into dati (IP, MAC) values(?, ?);"
					))
			{
				for(Dato d : dati)
				{
					stmt.setString(1,  d.getIp());
					stmt.setString(2, d.getMac());
					stmt.executeUpdate();
				}
				
				conn.commit();
			}
		}
	}
		
		public static void inserisciDato(Dato d) throws ClassNotFoundException
		{
			Class.forName(driver);
			try (Connection conn=DriverManager.getConnection(url, username, password))
			{
				conn.setAutoCommit(false);
				
				try (PreparedStatement stmt = conn.prepareStatement(
						"insert into dati (IP, MAC) values(?, ?);"
						))
				{
						stmt.setString(1,  d.getIp());
						stmt.setString(2, d.getMac());
						stmt.executeUpdate();
						
						conn.commit();
						
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
}
