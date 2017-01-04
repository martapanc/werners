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
  $sql=mysql_query("select R.guest_user_id, R.start_date, R.end_date, R.comment, T.id
  					from reservation R
  					inner join room_table__reservation RT on RT.reservation_id = R.id
  					inner join room_table T on RT.room_table_id = T.id
  					where R.start_date >= '" . 
  					$start . "' and R.end_date <= '" . $end . "'"); 

  //Get array from sql query
  $i = 0;
  while($row=mysql_fetch_assoc($sql)){
    	//put into output variable
    	$output[$i]=$row;
    	$i += 1;
    }
    //return the json object
    echo json_encode($output); 
  //close the connection
  mysql_close();
    ?>
</body>
</html>