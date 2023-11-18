<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Retrieve the travel_id from the POST request
$travel_id = $_POST["travel_id"];

// Delete from myTravel table query
$myTravelQuery = "DELETE FROM myTravel WHERE travel_id = ?";
$myTravelStmt = mysqli_prepare($mysqli, $myTravelQuery);
mysqli_stmt_bind_param($myTravelStmt, "i", $travel_id);

// Execute the myTravel query
if (mysqli_stmt_execute($myTravelStmt)) {
    $affected_rows_myTravel = mysqli_stmt_affected_rows($myTravelStmt);

    // Check if any rows were deleted from myTravel table
    if ($affected_rows_myTravel > 0) {
        // Delete from travel table query
        $travelQuery = "DELETE FROM travel WHERE travel_id = ?";
        $travelStmt = mysqli_prepare($mysqli, $travelQuery);
        mysqli_stmt_bind_param($travelStmt, "i", $travel_id);

        // Execute the travel query
        if (mysqli_stmt_execute($travelStmt)) {
            $affected_rows_travel = mysqli_stmt_affected_rows($travelStmt);

            // Check if any rows were deleted from travel table
            if ($affected_rows_travel > 0) {
                echo "Records deleted successfully. Affected rows in myTravel: $affected_rows_myTravel, Affected rows in travel: $affected_rows_travel";
            } else {
                echo "No records deleted from travel table. Travel ID not found.";
            }
        } else {
            echo "ERROR: Could not execute travel query. " . mysqli_stmt_error($travelStmt);
        }

        mysqli_stmt_close($travelStmt);
    } else {
        echo "No records deleted from myTravel table. Travel ID not found.";
    }
} else {
    echo "ERROR: Could not execute myTravel query. " . mysqli_stmt_error($myTravelStmt);
}

mysqli_stmt_close($myTravelStmt);
mysqli_close($mysqli);

header("Location: myTravel.php");
exit(); 

?>
