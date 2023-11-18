<?php
// Get the city name from the POST data
$city_name = $_POST["city_name"];

// Display the heading with the selected city name
echo "<h1>" . $city_name . " Hotel List</h1>";

// SQL query execution
$sql = "
    SELECT 
        h.hotel_id, 
        h.hotel_name, 
        h.price, 
        h.accommodation_number, 
        hd.hotel_discount_id, 
        hd.hotel_discount_rate, 
        hd.hotel_discount_period
    FROM 
        hotel h
    JOIN 
        city c ON h.city_id = c.city_id
    JOIN 
        hotel_discount hd ON h.hotel_id = hd.hotel_id
    WHERE 
        c.city_name = '$city_name';
";

// Execute the SQL query
$result = $mysqli->query($sql);
