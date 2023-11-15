<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Query to retrieve city names from the City table
$query = "SELECT city_name FROM city";
$res = mysqli_query($mysqli, $query);

// Print city names using a loop
if ($res) {
    // Iterate through the result set
    while ($row = mysqli_fetch_assoc($res)) {
        // Output an HTML option tag with the city name as the value and text
        echo '<option value="' . $row['city_name'] . '">' . $row['city_name'] . '</option>';
    }
} else {
    // Output an error message if the query fails
    printf("Could not retrieve records: %s \n", mysqli_error($mysqli));
}

// Free up the result set
mysqli_free_result($res);

// Close the database connection
mysqli_close($mysqli);

?>

