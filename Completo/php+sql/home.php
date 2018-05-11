<?php
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

	$nome=$_POST['n'];
	$pass=md5($_POST['p']);

	//Inizializzo la query
	$query=$conn->query("SELECT * FROM UTENTI WHERE NOME='$nome' AND PASSWORD='$pass'");
	if ($query->num_rows > 0) {
	    $conn->close();
	    //Utenza trovata
	    echo"Benvenuto nell'area riservata, puoi proseguire!";
	    echo "<form name='prosegui' action='visualizza.php' method='post'>
			   <br/> <br/>
			   <input type='submit' value='Avanti'  >
			  </form>";
		echo "<form name='indietro' action='login.php' method='pre'>
			   <input type='submit' value='Indietro'  >
			  </form>";

	} else {
		//Password e/o utenza non trovati
	    echo "Non ti è permesso proseguire";
	    echo "<form name='indietro' action='login.php'>
			   <br/> <br/>
			   <input type='submit' value='Indietro'  >
			  </form>";
	}
?>