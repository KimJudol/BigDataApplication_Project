<?php

// Connect database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");


 if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

//
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
$res = mysqli_query($mysqli, $query);

if ($res) {
    echo "<table border='1'>";
    echo "<tr><th>Country Name</th><th>Average Budget per Day(₩)</th></tr>";

    while ($row = mysqli_fetch_assoc($res)) {
        echo "<tr>";
        echo "<td>" . $row['country_name'] . "</td>";
        echo "<td>" . $row['average_budget_per_traveler_per_day'] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
}
 else {
    printf("Could not retrieve records: %s \n", mysqli_error($mysqli));
}

mysqli_free_result($res);
mysqli_close($mysqli);

?>
