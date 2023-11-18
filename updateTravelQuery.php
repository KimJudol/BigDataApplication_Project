<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Retrieve the city_id based on the provided city name from the POST request
$city_name = $_POST["city"];
$getIdQuery = "SELECT city_id FROM city WHERE city_name = ?";

// Prepare the SQL query to retrieve city_id
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
            mysqli_stmt_close($stmt);
            mysqli_close($mysqli);
        }
    } else {
        echo "Error executing the query: " . mysqli_error($mysqli);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Error preparing the query: " . mysqli_error($mysqli);
}

// Check if the traveler exists in the travel table
$traveler_name = $_POST["travelerName"];
$checkTravelerQuery = "SELECT COUNT(*) FROM travel WHERE traveler_name = ?";

if ($stmt = mysqli_prepare($mysqli, $checkTravelerQuery)) {
    mysqli_stmt_bind_param($stmt, "s", $traveler_name);

    // Execute the query
    if (mysqli_stmt_execute($stmt)) {
        // Bind the result
        mysqli_stmt_bind_result($stmt, $count);

        // Fetch the result
        if (mysqli_stmt_fetch($stmt)) {
            if ($count > 0) {
                // Traveler exists, continue with the update
            } else {
                echo "Traveler not found.";
                mysqli_stmt_close($stmt);
                mysqli_close($mysqli);
            }
        } else {
            echo "Error fetching the result: " . mysqli_error($mysqli);
        }
    } else {
        echo "Error executing the query: " . mysqli_error($mysqli);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Error preparing the query: " . mysqli_error($mysqli);
}

// Update travel record query
$query = "UPDATE travel SET city_id=?, travel_start_date=?, travel_end_date=? WHERE traveler_name=?";

// Prepare the statement
if ($stmt = mysqli_prepare($mysqli, $query)) {
    // Bind parameters for the prepared statement
    mysqli_stmt_bind_param($stmt, "isss", $city, $travel_start_date, $travel_end_date, $traveler_name);

    // Set parameter values
    $city = $city_id;
    $traveler_name = $_POST['travelerName'];
    $travel_start_date = $_POST['startDate'];
    $travel_end_date = $_POST['endDate'];

    // Execute the prepared statement
    if (mysqli_stmt_execute($stmt)) {
        echo "Records updated successfully.";
    } else {
        echo "ERROR: Could not execute query: $sql. " . mysqli_error($mysqli);
    }
} else {
    echo "ERROR: Could not prepare query: $sql. " . mysqli_error($mysqli);
}

mysqli_stmt_close($stmt);
mysqli_close($mysqli);

header("Location: myTravel.php");
exit(); 

?>
