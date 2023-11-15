<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Retrieve the city name from the POST request
$city_name = $_POST["city"];
$getIdQuery = "SELECT city_id FROM city WHERE city_name = ?";

// Prepare the SQL query
if ($stmt = mysqli_prepare($mysqli, $getIdQuery)) {
    // Bind the parameter for the city name
    mysqli_stmt_bind_param($stmt, "s", $city_name);

    // Execute the query
    if (mysqli_stmt_execute($stmt)) {
        // Bind the result
        mysqli_stmt_bind_result($stmt, $find_id);

        // Fetch the result
        if (mysqli_stmt_fetch($stmt)) {
            // Save the city_id value to a variable
            $city_id = $find_id;
        } else {
            echo "City not found.";
        }
    } else {
        echo "Error executing the query: " . mysqli_error($mysqli);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Error preparing the query: " . mysqli_error($mysqli);
}

// Insert travel record query
$query = "INSERT INTO travel (city_id, traveler_name, travel_start_date, travel_end_date) VALUES (?, ?, ? ,?)";

// Prepare the statement
if ($stmt = mysqli_prepare($mysqli, $query)) {
    // Bind parameters for the prepared statement
    mysqli_stmt_bind_param($stmt, "isss", $city, $traveler_name, $travel_start_date, $travel_end_date);

    // Set parameter values
    $city = $city_id;
    $traveler_name = $_POST['travelerName'];
    $travel_start_date = $_POST['startDate'];
    $travel_end_date = $_POST['endDate'];

    // Execute the prepared statement
    if (mysqli_stmt_execute($stmt)) {
        // Insert into myTravel table with the same travel_id
        $myTravelQuery = "INSERT INTO myTravel (travel_id) VALUES (?)";
        $myTravelStmt = mysqli_prepare($mysqli, $myTravelQuery);
        mysqli_stmt_bind_param($myTravelStmt, "i", $myTravelTravelId);
        $myTravelTravelId = mysqli_insert_id($mysqli);

        if (mysqli_stmt_execute($myTravelStmt)) {
            echo "Records inserted successfully.";
        } else {
            echo "ERROR: Could not execute myTravel query: $myTravelQuery. " . mysqli_error($mysqli);
        }

        mysqli_stmt_close($myTravelStmt);
    } else {
        echo "ERROR: Could not execute travel query: $query. " . mysqli_error($mysqli);
    }
} else {
    echo "ERROR: Could not prepare travel query: $query. " . mysqli_error($mysqli);
}

mysqli_stmt_close($stmt);
mysqli_close($mysqli);

header("Location: myTravel.php");
exit(); 

?>