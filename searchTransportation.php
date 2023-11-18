<?php

$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

if (!$mysqli) {
    die("연결 실패: " . mysqli_connect_error());
}

// Check if the city_name is set in the GET parameters
if (isset($_GET['city_name'])) {
    $city_name = $_GET['city_name'];

    // Query to find the country_id for the given city
    $findCountryIdQuery = "SELECT country_id 
                           FROM country 
                           WHERE country_name = '$city_name'";
    $resultCountryId = mysqli_query($mysqli, $findCountryIdQuery);

    // Check if the country_id is found
    if ($row = mysqli_fetch_assoc($resultCountryId)) {
        $countryId = $row['country_id'];

        // Query to get transportation information for the selected country
        $getTransportationInfoQuery = "SELECT method, price
                                       FROM transportation 
                                       WHERE country_id = '$countryId'";
        $resultTransportationInfo = mysqli_query($mysqli, $getTransportationInfoQuery);

        // Check if there is transportation information available
        if (mysqli_num_rows($resultTransportationInfo) > 0) {
            echo "<h1>$city_name Transportation Prices</h1>";
            
            // Display transportation information in a table
            echo "<table border='1' style='margin:auto;'>";
            echo "<tr><th>Transportation Method</th><th>Price</th></tr>";

            // Display all transportation data in the table
            while ($rowInfo = mysqli_fetch_assoc($resultTransportationInfo)) {
                echo "<tr><td>{$rowInfo['method']}</td><td>{$rowInfo['price']}</td></tr>";
            }

            echo "</table>";

            // Query to find the cheapest transportation method
            $getCheapestTransportationQuery = "SELECT method, MIN(price) as min_price
                                               FROM transportation 
                                               WHERE country_id = '$countryId'";
            $resultCheapestTransportation = mysqli_query($mysqli, $getCheapestTransportationQuery);

            // Display information about the cheapest transportation method
            if ($cheapestTransportation = mysqli_fetch_assoc($resultCheapestTransportation)) {
                echo "<br>Cheapest Transportation Method: " . $cheapestTransportation['method'] . " (Price: " . $cheapestTransportation['min_price'] . ")<br>";
            } else {
                echo "<br>Cannot find information on the cheapest transportation method.<br>";
            }
        } else {
            echo "<h2>No transportation information available for this city.</h2>";
        }
    } else {
        echo "<h2>Cannot find information for the selected city.</h2>";
    }

    mysqli_close($mysqli);
} else {
    // 국가 목록을 가져오는 쿼리
    $query = "SELECT * FROM country";
    $result1 = mysqli_query($mysqli, $query);

    if (!$result1) {
        die("쿼리 실행에 실패했습니다: " . mysqli_error($mysqli));
    }

    // HTML for the front end
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

            #transportationInfo {
                text-align: center;
                margin-top: 20px;
            }
        </style>
        <script>
            // JavaScript function to fetch and display transportation information
            function showTransportationInfo() {
                var selectedCity = document.querySelector('select').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("transportationInfo").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "searchTransportation.php?city_name=" + selectedCity, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
    <h1>Transportation Information</h1>
    <p>Select the city you plan to visit:</p>

    <select>
        <?php while ($row1 = mysqli_fetch_array($result1)):; ?>
            <option><?php echo $row1['country_name']; ?></option>
        <?php endwhile ?>
    </select>
    <!-- Button to trigger the showTransportationInfo function -->
    <input type="button" value="Submit" onclick="showTransportationInfo()">

    <!-- Container to display transportation information -->
    <div id="transportationInfo"></div>
        <br><a href="/team18/search.html">
        <button>Back</button>
    </a><br>
    </body>
    </html>
    <?php
}
?>
