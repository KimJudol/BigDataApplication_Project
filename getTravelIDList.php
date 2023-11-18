<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Query to retrieve travel IDs from the Travel table
$query = "SELECT travel_id FROM myTravel ORDER BY travel_id";
$res = mysqli_query($mysqli, $query);

// Print travel IDs as options within a loop
if ($res) {
    // Iterate through the result set
    while ($row = mysqli_fetch_assoc($res)) {
        // Output an HTML option tag with the travel ID as the value and text
        echo '<option value="' . $row['travel_id'] . '">' . $row['travel_id'] . '</option>';
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
