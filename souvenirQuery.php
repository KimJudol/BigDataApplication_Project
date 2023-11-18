<?php
// Connect to the MySQL database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// Check for connection errors
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Receive user input
$city_name = isset($_POST['city']) ? $_POST['city'] : ''; // Use isset to check for the existence of the variable

// Execute SQL query
$sql = "
    SELECT 
        COALESCE(city.city_name, 'ALL') AS city_name,
        souvenir.souvenir_name,
        SUM(souvenir.price * souvenir.sale) AS total_price
    FROM 
        souvenir
    JOIN 
        city ON souvenir.city_id = city.city_id
    WHERE 
        city.city_name = '$city_name'
    GROUP BY 
        city.city_name, souvenir.souvenir_name WITH ROLLUP
    HAVING 
        city.city_name IS NOT NULL OR (city.city_name IS NULL AND souvenir.souvenir_name IS NOT NULL);
";

$result = $mysqli->query($sql);

// Start HTML table
echo "<table border='1'>";
echo "<h1>Souvenir Sales</h1>";
echo "<tr>
        <th>City Name</th>
        <th>Souvenir Name</th>
        <th>Total Sales(₩)</th>
      </tr>";

// Output results
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Add a row
        echo "<tr>
                <td>" . $row["city_name"] . "</td>
                <td>" . $row["souvenir_name"] . "</td>
                <td>" . $row["total_price"] . "</td>
              </tr>";
    }
} else {
    echo "<tr><td colspan='3'>No results found.</td></tr>";
}

// End HTML table
echo "</table>";


echo "<button onclick="history.back()">Back</button>";

// Close MySQL connection
$mysqli->close();
?>
