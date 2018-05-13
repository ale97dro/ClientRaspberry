<HTML>
<HEAD>
<?php
	session_start();
	echo "Scegli cosa visualizzare:";
	echo "<form name ='scelta' action=".$_SERVER['PHP_SELF']." method='post'>
			 <select name='dati'>
			   <option value='mac_address'>Indirizzi MAC</option>
			   <option value='ip_address'>Indirizzi IP</option>
			   <option value='combinazione'>IP+MAC</option>
			   <option value='nmap'>Nmap</option>
			 </select>
			 <input type='submit' value='Visualizza' >
			</form>";
	if($_POST){
		$servername = "localhost";
		$username = "paolo";
		$password = "password";
		$db = "prova";

		// Create connection
		$conn = new mysqli($servername, $username, $password, $db);

		// Check connection
		if ($conn->connect_error) {
		    die("Connection failed: " . $conn->connect_error);
		} 

		$scelta;
		//echo"scelta fatta";
		if($_POST['dati']=="ip_address")
		{
			
			echo"<br/>hai scelto gli ip<br/><br/>";
			$scelta="IP";
		}
		else
		{
			if($_POST['dati']=="mac_address")
			{
				echo"<br/>hai scelto i mac<br/><br/>";
				$scelta="MAC";
			}
			else
			{
				if($_POST['dati']=="combinazione")
				{
					echo"<br/>hai scelto ip+mac<br/><br/>";
					$scelta="MAC, IP";
				}
				else
				{
					if($_POST['dati']=="nmap")
					{
						echo "<br/>Hai scelto Nmap";
						$scelta="nmap";
					}
				}
			}
		}
		//Lancio la query
		//$query=$conn->query("SELECT $scelta FROM DATI ");
		
		if($scelta!="nmap")
		{
			$sql="SELECT $scelta FROM DATI";
			
			$result=mysqli_query($conn,$sql);
			
			echo "<table border=\"2\"";
			
				while($row = mysqli_fetch_assoc($result)) 
				{
					if($scelta=="MAC, IP")
					{
						echo "<tr>";
						echo "<td>".$row["MAC"]."</td><td>".$row["IP"]."</td></tr>";
					}
					else
					{
						echo "<tr><td>";
						echo $row[$scelta]."</td></tr>";
					}
				}
				$conn->close();
			
			
			echo "</table>";
		}
		else 
			if($scelta=="nmap")
			{
				$sql="select ip, porta, servizio, protocollo from dati_nmap";
				$result=mysqli_query($conn, $sql);
				
				echo "<table border='2'";
				
				while($row=mysqli_fetch_assoc($result))
				{
					echo "<tr>";
					echo "<td>".$row["ip"]."</td>";
					echo "<td>".$row["protocollo"]."</td>";
					echo "<td>".$row["porta"]."</td>";
					echo "<td>".$row["servizio"]."</td>";
					echo "</tr>";
				}
				
				echo "</table>";
			}
	}
?>
</HEAD>
</HTML>