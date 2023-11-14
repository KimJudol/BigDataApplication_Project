<?php

// Connect database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");


 if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// Get city_name from City Table
$query = "SELECT * FROM travel";
$res = mysqli_query($mysqli, $query);

if ($res) {
    echo "<h1>Travel List</h1>";
    echo "<table border='1'>";
    echo "<tr><th>Travel ID</th><th>Traveler Name</th><th>Start Date</th><th>End Date</th></tr>";

    while ($row = $res->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['travel_id'] . "</td>";
        echo "<td>" . $row['traveler_name'] . "</td>";
        echo "<td>" . $row['travel_start_date'] . "</td>";
        echo "<td>" . $row['travel_end_date'] . "</td>";
        echo "</tr>";
    }
}
 else {
    printf("Could not retrieve records: %s \n", mysqli_error($mysqli));
}

mysqli_free_result($res);
mysqli_close($mysqli);

?>

