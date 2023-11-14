<?php

// Connect database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");


 if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
$travel_id = $_POST["travel_id"];

//insert travel query
$query = "DELETE FROM travel WHERE travel_id=?";

// prepare statement
if($stmt = mysqli_prepare($mysqli, $query)){
   mysqli_stmt_bind_param($stmt, "i", $travel_id);

// execute prepared statement
if(mysqli_stmt_execute($stmt)){
   echo "Records deleted successfully.";
}else {
   echo "ERROR: Could not execute query: $sql. " . mysqli_error($mysqli);
}
}else {
   echo "ERROR: Could not prepare query: $sql. " . mysqli_error($mysqli);
}

mysqli_stmt_close($stmt);
mysqli_close($mysqli);
?>
