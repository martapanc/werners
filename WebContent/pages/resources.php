<!DOCTYPE html>
<html> 
 <body>
  <?php	
  
   mysql_connect("localhost","root","123")
   or die("Couldn't connect to server.\n"); 
   mysql_select_db("wpbdb")
   or die("Couldn't open the database.\n");
   
   //get the start and end parameters
   $start = $_GET['start'];
   $end = $_GET['end'];
   
  //create the query
  $sql=mysql_query("select id from room_table"); 

  //Get array from sql query
  $i = 0;
  while($row=mysql_fetch_assoc($sql)){
    	//put into output variable
    	$output[$i]=$row;
    	$i = $i + 1;
    }
    //return the json object
    echo json_encode($output); 
  //close the connection
  mysql_close();
    ?>
</body>
</html>