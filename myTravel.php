<!doctype html>
<html lang="en">
<head>
<title>My Travel List</title>
<meta charset="UTF-8">
</head>
<body>
<h1>My Travel</h1>
<a href="/team18/insertTravel.php" target="_self">
        <button>Insert Travel</button>
    </a><br>
    <a href="/team18/updateTravel.php" target="_self">
        <button>Update Travel</button>
    </a><br>
    <a href="/team18/deleteTravel.php" target="_self">
        <button>Delete Travel</button>
    </a><br>
    <a href="/team18/search.html" target="_self">
        <button>Advanced Search</button>
    </a><br>
    <a href="/team18/travel.php" target="_self">
        <button>Show All Travel</button>
    </a><br>
    <a href="/team18/logout.html" target="_self">
        <button>Log out</button>
    </a><br>
                
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

    // Modified query to include travel_id
    $travelDataQuery = "
        SELECT travel_id, city.city_name, traveler_name, travel_start_date, travel_end_date
        FROM travel
        INNER JOIN city ON travel.city_id = city.city_id
        WHERE travel_id IN (" . implode(',', $travelIds) . ")";
    $travelDataResult = mysqli_query($mysqli, $travelDataQuery);

    if ($travelDataResult) {
        echo "<h2>My Travel List</h2>";
        echo "<table border='1'>";
        echo "<tr><th>Travel ID</th><th>City Name</th><th>Traveler Name</th><th>Travel Start Date</th><th>Travel End Date</th></tr>";

        while ($travelRow = mysqli_fetch_assoc($travelDataResult)) {
            echo "<tr>";
            echo "<td>" . $travelRow['travel_id'] . "</td>";
            echo "<td>" . $travelRow['city_name'] . "</td>";
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
</body>
</html>
