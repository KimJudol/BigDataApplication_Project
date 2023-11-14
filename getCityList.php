<?php

// Connect database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");


 if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Get city_name from City Table
$query = "SELECT city_name FROM city";
$res = mysqli_query($mysqli, $query);

// Print city name by loop
if ($res) {
   while ($row = mysqli_fetch_assoc($res)){
        echo '<option value="' . $row['city_name'] . '">' . $row['city_name']; 
}
}
 else {
    printf("Could not retrieve records: %s \n", mysqli_error($mysqli));
}

mysqli_free_result($res);
mysqli_close($mysqli);

?>

