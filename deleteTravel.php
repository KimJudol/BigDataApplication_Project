<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Retrieve the travel_id from the POST request
$travel_id = $_POST["travel_id"];

// Delete travel record query
$query = "DELETE FROM travel WHERE travel_id=?";

// Prepare the statement
if ($stmt = mysqli_prepare($mysqli, $query)) {
    // Bind parameter for the prepared statement
    mysqli_stmt_bind_param($stmt, "i", $travel_id);

    // Execute the prepared statement
    if (mysqli_stmt_execute($stmt)) {
        echo "Records deleted successfully.";
    } else {
        echo "ERROR: Could not execute query: $sql. " . mysqli_error($mysqli);
    }
} else {
    echo "ERROR: Could not prepare query: $sql. " . mysqli_error($mysqli);
}

mysqli_stmt_close($stmt);
mysqli_close($mysqli);

?>
