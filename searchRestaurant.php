<?php
$hostname = "localhost:3306";
$username = "root";
$password = "";
$databaseName = "team18";

// Database Connection
$connect = mysqli_connect($hostname, $username, $password, $databaseName);

if (!$connect) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if a city or country is selected
if (isset($_GET['city_name']) || isset($_GET['country_name'])) {
    if (isset($_GET['city_name'])) {
        $city_name = $_GET['city_name'];

        // Find city_id for the selected city
        $findCityQuery = "SELECT city_id FROM city WHERE city_name = '$city_name'";
        $cityResult = mysqli_query($connect, $findCityQuery);

        if ($cityRow = mysqli_fetch_assoc($cityResult)) {
            $city_id = $cityRow['city_id'];

            // Retrieve restaurant and discount information for the selected city
            $findRestaurantQuery = "SELECT r.restaurant_id, r.restaurant_name, r.cuisine_type, r.address, c.country_name, rd.restaurant_discount_rate 
                                    FROM restaurant r
                                    JOIN country c ON r.country_id = c.country_id
                                    LEFT JOIN restaurant_discount rd ON r.restaurant_id = rd.restaurant_id
                                    WHERE r.city_id = $city_id";

            $result = mysqli_query($connect, $findRestaurantQuery);

            if ($row = mysqli_fetch_assoc($result)) {
                $countryName = $row['country_name'];
                echo "<h1>$countryName, $city_name Restaurant List</h1>";

                // Display restaurant information and a button to view reviews
                echo "<table border='1' style='margin:auto;'>";
                echo "<tr><th>Restaurant Name</th><th>Cuisine Type</th><th>Address</th><th>Discount Rate</th><th>View Reviews</th></tr>";

                do {
                    echo "<tr><td>{$row['restaurant_name']}</td><td>{$row['cuisine_type']}</td><td>{$row['address']}</td><td>{$row['restaurant_discount_rate']}%</td>";

                    // Add a button to view reviews
                    echo "<td><button onclick=\"showReviews({$row['restaurant_id']})\">View Reviews</button></td></tr>";
                } while ($row = mysqli_fetch_assoc($result));

                echo "</table>";
            } else {
                echo "<h2>No restaurant information found for the selected city.</h2>";
            }
        } else {
            echo "<h2>No information found for the selected city.</h2>";
        }
    } elseif (isset($_GET['country_name'])) {
        $country_name = $_GET['country_name'];

        // Retrieve restaurant information for the selected country
        $findCountryRestaurantQuery = "SELECT r.restaurant_id, r.restaurant_name, r.cuisine_type, r.address, c.country_name, MAX(rd.restaurant_discount_rate) AS max_discount_rate
                                FROM restaurant r
                                JOIN country c ON r.country_id = c.country_id
                                LEFT JOIN restaurant_discount rd ON r.restaurant_id = rd.restaurant_id
                                WHERE c.country_name = '$country_name'
                                GROUP BY r.restaurant_id, r.restaurant_name, r.cuisine_type, r.address, c.country_name";

        $countryResult = mysqli_query($connect, $findCountryRestaurantQuery);

        if ($countryRow = mysqli_fetch_assoc($countryResult)) {
            echo "<h1>$country_name Restaurant List</h1>";

            // Display restaurant information and a button to view reviews
            echo "<table border='1' style='margin:auto;'>";
            echo "<tr><th>Restaurant Name</th><th>Cuisine Type</th><th>Address</th><th>Discount Rate</th><th>View Reviews</th></tr>";

            do {
                echo "<tr><td>{$countryRow['restaurant_name']}</td><td>{$countryRow['cuisine_type']}</td><td>{$countryRow['address']}</td><td>{$countryRow['max_discount_rate']}%</td>";
    
                // Add a button to view reviews
                echo "<td><button onclick=\"showReviews({$countryRow['restaurant_id']})\">View Reviews</button></td></tr>";
            } while ($countryRow = mysqli_fetch_assoc($countryResult));

            echo "</table>";
        } else {
            echo "<h2>No restaurant information found for the selected country.</h2>";
        }
    }

    // Close the database connection
    mysqli_close($connect);
} else {
    // Get the list of countries
    $query = "SELECT * FROM country";
    $result1 = mysqli_query($connect, $query);

    if (!$result1) {
        die("Query failed: " . mysqli_error($connect));
    }

    // HTML
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <style>
            select {
                width: 200px;
                height: 30px;
                font-size: 16px;
            }

            #restaurantInfo {
                text-align: center;
                margin-top: 20px;
            }
        </style>
        <script>
            // Function to display city list
            function showCities() {
                var selectedCountry = document.querySelector('#countryDrilldown').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("cityDrilldown").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "getCities.php?country_name=" + selectedCountry, true);
                xhttp.send();
            }

            // Function to display restaurant information for a selected country
            function showRestaurantInfo1() {
                var selectedCountry = document.querySelector('#countryDrilldown').value;

                // Check if either city or country is selected
                if (selectedCountry) {
                    // When a city or country is selected
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            document.getElementById("restaurantInfo").innerHTML = this.responseText;
                        }
                    };

                    // Adjust the URL based on the selection
                    var url;
                    url = "searchRestaurant.php?country_name=" + selectedCountry;

                    xhttp.open("GET", url, true);
                    xhttp.send();
                } else {
                    // When neither a city nor a country is selected
                    document.getElementById("restaurantInfo").innerHTML = "<h2>Please select a country or city.</h2>";
                }
            }

            // Function to display restaurant information
            function showRestaurantInfo() {
                var selectedCity = document.querySelector('#cityDrilldown').value;
                var selectedCountry = document.querySelector('#countryDrilldown').value;

                // Check if either city or country is selected
                if (selectedCity || selectedCountry) {
                    // When a city or country is selected
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            document.getElementById("restaurantInfo").innerHTML = this.responseText;
                        }
                    };

                    // Adjust the URL based on the selection
                    var url;
                    if (selectedCity) {
                        url = "searchRestaurant.php?city_name=" + selectedCity;
                    } else {
                        url = "searchRestaurant.php?country_name=" + selectedCountry;
                    }

                    xhttp.open("GET", url, true);
                    xhttp.send();
                } else {
                    // When neither a city nor a country is selected
                    document.getElementById("restaurantInfo").innerHTML = "<h2>Please select a country or city.</h2>";
                }
            }

            // Function to display reviews
            function showReviews(restaurantId) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("restaurantInfo").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "getRestaurantReviews.php?restaurant_id=" + restaurantId, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
    <h1>City Selection</h1>
    <p>Select the country you want to visit:</p>
    <!-- Country Selection Dropdown -->
    <select id="countryDrilldown" onchange="showCities()">
        <?php while ($row1 = mysqli_fetch_array($result1)):; ?>
            <option><?php echo $row1['country_name']; ?></option>
        <?php endwhile ?>
    </select>
    <input type="button" value="Submit" onclick="showRestaurantInfo1()">
    
    <p>Select the city you want to visit:</p>  

    <!-- City Selection Dropdown -->
    <select id="cityDrilldown"></select>

    <input type="button" value="Submit" onclick="showRestaurantInfo()">

    <!-- Display Restaurant Information -->
    <div id="restaurantInfo"></div>
    </body>
    </html>
    <?php
}
?>
