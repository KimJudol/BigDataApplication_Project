<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// SQL query to retrieve average budget per traveler per day for each country
$query = "
    SELECT
        country.country_name,
        ROUND(SUM(expense.budget) / SUM(expense.number_of_travelers) / DATEDIFF(travel_end_date, travel_start_date)) AS average_budget_per_traveler_per_day
    FROM
        travel
    JOIN
        city ON travel.city_id = city.city_id
    JOIN
        country ON city.country_id = country.country_id
    LEFT JOIN
        expense ON travel.travel_id = expense.travel_id
    GROUP BY
        country.country_id;
";

// Execute the query
$res = mysqli_query($mysqli, $query);

// Check if the query was successful
if ($res) {
    // Output an HTML table structure
    echo "<table border='1'>";
    echo "<tr><th>Country Name</th><th>Average Budget per Day(₩)</th></tr>";

    // Iterate through the result set
    while ($row = mysqli_fetch_assoc($res)) {
        // Output a table row with country name and average budget per traveler per day
        echo "<tr>";
        echo "<td>" . $row['country_name'] . "</td>";
        echo "<td>" . $row['average_budget_per_traveler_per_day'] . "</td>";
        echo "</tr>";
    }

    // Close the table structure
    echo "</table>";
}
else {
    // Output an error message if the query fails
    printf("Could not retrieve records: %s \n", mysqli_error($mysqli));
}

// Free up the result set
mysqli_free_result($res);

// Close the database connection
mysqli_close($mysqli);

?>
