<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Query to retrieve all columns from the Travel table
$query = "SELECT * FROM travel";
$res = mysqli_query($mysqli, $query);

// Check if the query was successful
if ($res) {
    // Output a heading for the travel list
    echo "<h1>Travel List</h1>";
    
    // Output an HTML table structure
    echo "<table border='1'>";
    echo "<tr><th>Travel ID</th><th>Traveler Name</th><th>Start Date</th><th>End Date</th></tr>";

    // Iterate through the result set
    while ($row = $res->fetch_assoc()) {
        // Output a table row with travel information
        echo "<tr>";
        echo "<td>" . $row['travel_id'] . "</td>";
        echo "<td>" . $row['traveler_name'] . "</td>";
        echo "<td>" . $row['travel_start_date'] . "</td>";
        echo "<td>" . $row['travel_end_date'] . "</td>";
        echo "</tr>";
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
