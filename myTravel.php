<!doctype html>
<html lang="en">
<head>
<title>My Travel List</title>
<meta charset="UTF-8">
</head>
<body>
    <?php

    // Connect to the database
    $mysqli = mysqli_connect("localhost", "team18", "team18", "team18");
    
    // Check if the connection was successful
    if ($mysqli === false) {
        die("ERROR: Could not connect. " . mysqli_connect_error());
    }
    
    // Query to retrieve all columns from the Travel table
    $query = "SELECT travel_id FROM myTravel";
    $res = mysqli_query($mysqli, $query);
    
    // Check if the query was successful
    if ($res) {
        $travelIds = [];
        while ($row = mysqli_fetch_assoc($res)) {
            $travelIds[] = $row['travel_id'];
        }
    
        $travelDataQuery = "SELECT city_id, traveler_name, travel_start_date, travel_end_date FROM travel WHERE travel_id IN (" . implode(',', $travelIds) . ")";
        $travelDataResult = mysqli_query($mysqli, $travelDataQuery);
    
        if ($travelDataResult) {
            echo "<h2>My Travel List</h2>";
            echo "<table border='1'>";
            echo "<tr><th>City ID</th><th>Traveler Name</th><th>Travel Start Date</th><th>Travel End Date</th></tr>";
    
            while ($travelRow = mysqli_fetch_assoc($travelDataResult)) {
                echo "<tr>";
                echo "<td>" . $travelRow['city_id'] . "</td>";
                echo "<td>" . $travelRow['traveler_name'] . "</td>";
                echo "<td>" . $travelRow['travel_start_date'] . "</td>";
                echo "<td>" . $travelRow['travel_end_date'] . "</td>";
                echo "</tr>";
            }
    
            echo "</table>";
            echo "<br><br>";
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
    <a href="/team18/insertTravel.html" target="_blank">
        <button>Insert Travel</button>
    </a><br>
    <a href="/team18/updateTravel.html" target="_blank">
        <button>Update Travel</button>
    </a><br>
    <a href="/team18/deleteTravel.html" target="_blank">
        <button>Delete Travel</button>
    </a><br>
    <a href="/team18/searchTravel.html" target="_blank">
        <button>Search</button>
    </a><br>
    <a href="/team18/travel.html" target="_blank">
        <button>Show All Travel</button>
    </a><br>
    <a href="/team18/expense.html" target="_blank">
        <button>Show Expense</button>
    </a><br>
</body>
</html>