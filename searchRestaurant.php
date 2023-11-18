<?php
$servername = "localhost:3306";
$username = "root";
$password = "";
$dbname = "team18";  

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch countries from the database
$countries_query = "SELECT country_id, country_name FROM country";
$countries_result = $conn->query($countries_query);

// Check if there are countries
if ($countries_result->num_rows > 0) {
    echo "<form method='post' action=''>"; // Start form

    // Country drill down
    echo "Select a country: <select name='selected_country' onchange='this.form.submit()'>";
    echo "<option value=''>-- Select Country --</option>"; // Default option

    // Output options for the select box
    while ($country_row = $countries_result->fetch_assoc()) {
        $country_id = $country_row["country_id"];
        $country_name = $country_row["country_name"];
        $selected = ($_POST["selected_country"] == $country_id) ? "selected" : "";
        echo "<option value='$country_id' $selected>$country_name</option>";
    }

    echo "</select>";

    // City drill-down
    if (!empty($_POST["selected_country"])) {
        $selected_country_id = $_POST["selected_country"];

        // Fetch cities based on the selected country
        $cities_query = "SELECT city_id, city_name FROM city WHERE country_id = $selected_country_id";
        $cities_result = $conn->query($cities_query);

        // Check if there are cities
        if ($cities_result->num_rows > 0) {
            echo "Select a city: <select name='selected_city'>";
            echo "<option value=''>-- Select City --</option>"; // Default option

            // Output options for the city drill down
            while ($city_row = $cities_result->fetch_assoc()) {
                $city_id = $city_row["city_id"];
                $city_name = $city_row["city_name"];
                $selected = (isset($_POST["selected_city"]) && $_POST["selected_city"] == $city_id) ? "selected" : "";
                echo "<option value='$city_id' $selected>$city_name</option>";
            }

            echo "</select>";
        }
    } else {
        // If country is not selected, set a default value for city dropdown
        echo "Select a city: <select name='selected_city' disabled>";
        echo "<option value=''>-- Select Country First --</option>";
        echo "</select>";
    }

    echo "<input type='submit' value='Submit'>";
    echo "</form><br>";

    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["selected_country"])) {
        // Get the selected country and city IDs from the form submission
        $selected_country_id = $_POST["selected_country"];
        $selected_city_id = isset($_POST["selected_city"]) ? $_POST["selected_city"] : null;

        // Query to retrieve information from restaurant, restaurant_discount, and restaurant_rating tables
        $query = "
            SELECT r.restaurant_name, r.cuisine_type, r.address, rd.restaurant_discount_rate, rr.restaurant_review
            FROM restaurant r
            LEFT JOIN restaurant_discount rd ON r.restaurant_id = rd.restaurant_id
            LEFT JOIN restaurant_rating rr ON r.restaurant_id = rr.restaurant_id
            WHERE r.country_id = $selected_country_id
        ";

        // Include the city condition if a specific city is selected
        if ($selected_city_id !== null) {
            $query .= " AND r.city_id = $selected_city_id";
        }

        $result = $conn->query($query);

        if ($result->num_rows > 0) {
            echo "<h2>Restaurant Information</h2>";
            // Output data in a table
            echo "<table border='1'>";
            echo "<tr><th>Restaurant Name</th><th>Cuisine Type</th><th>Address</th><th>Discount Rate</th><th>Review</th></tr>";

            // Output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["restaurant_name"] . "</td>";
                echo "<td>" . $row["cuisine_type"] . "</td>";
                echo "<td>" . $row["address"] . "</td>";
                echo "<td>" . $row["restaurant_discount_rate"] . "%"."</td>";
                echo "<td>" . $row["restaurant_review"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No results found for the selected country and city.";
        }
    }
    echo "<br><button onclick='goBack()'>Back</button>";

    // Add the following JavaScript function at the end of your PHP code
    echo "<script>
        function goBack() {
            window.location.href = '/team18/search.html';
        }
    </script>";

} else {
    echo "No countries found.";
}

// Close connection
$conn->close();
?>s