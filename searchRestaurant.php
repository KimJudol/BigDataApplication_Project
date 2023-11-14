<?php
$hostname = "localhost:3306";
$username = "root";
$password = "";
$databaseName = "team18";

// 데이터베이스 연결
$connect = mysqli_connect($hostname, $username, $password, $databaseName);

if (!$connect) {
    die("연결 실패: " . mysqli_connect_error());
}

// 도시 또는 국가가 선택되었는지 확인
if (isset($_GET['city_name']) || isset($_GET['country_name'])) {
    if (isset($_GET['city_name'])) {
        $city_name = $_GET['city_name'];

        // 선택된 도시의 city_id 찾기
        $findCityQuery = "SELECT city_id FROM city WHERE city_name = '$city_name'";
        $cityResult = mysqli_query($connect, $findCityQuery);

        if ($cityRow = mysqli_fetch_assoc($cityResult)) {
            $city_id = $cityRow['city_id'];

            // 선택된 도시의 레스토랑 및 할인율 정보 가져오기
            $findRestaurantQuery = "SELECT r.restaurant_id, r.restaurant_name, r.cuisine_type, r.address, c.country_name, rd.restaurant_discount_rate 
                                    FROM restaurant r
                                    JOIN country c ON r.country_id = c.country_id
                                    LEFT JOIN restaurant_discount rd ON r.restaurant_id = rd.restaurant_id
                                    WHERE r.city_id = $city_id";

            $result = mysqli_query($connect, $findRestaurantQuery);

            if ($row = mysqli_fetch_assoc($result)) {
                $countryName = $row['country_name'];
                echo "<h1>$countryName, $city_name 식당 리스트</h1>";

                // 레스토랑 정보 및 리뷰보기 버튼 표시
                echo "<table border='1' style='margin:auto;'>";
                echo "<tr><th>식당 이름</th><th>음식 종류</th><th>주소</th><th>할인율</th><th>리뷰보기</th></tr>";

                do {
                    echo "<tr><td>{$row['restaurant_name']}</td><td>{$row['cuisine_type']}</td><td>{$row['address']}</td><td>{$row['restaurant_discount_rate']}%</td>";

                    // 리뷰보기 버튼 추가
                    echo "<td><button onclick=\"showReviews({$row['restaurant_id']})\">리뷰보기</button></td></tr>";
                } while ($row = mysqli_fetch_assoc($result));

                echo "</table>";
            } else {
                echo "<h2>해당 도시의 식당 정보를 찾을 수 없습니다.</h2>";
            }
        } else {
            echo "<h2>해당 도시의 정보를 찾을 수 없습니다.</h2>";
        }
    } elseif (isset($_GET['country_name'])) {
        $country_name = $_GET['country_name'];

        // 선택된 국가의 레스토랑 정보 가져오기
        $findCountryRestaurantQuery = "SELECT r.restaurant_id, r.restaurant_name, r.cuisine_type, r.address, c.country_name, rd.restaurant_discount_rate 
                                    FROM restaurant r
                                    JOIN country c ON r.country_id = c.country_id
                                    LEFT JOIN restaurant_discount rd ON r.restaurant_id = rd.restaurant_id
                                    WHERE c.country_name = '$country_name'";

        $countryResult = mysqli_query($connect, $findCountryRestaurantQuery);

        if ($countryRow = mysqli_fetch_assoc($countryResult)) {
            echo "<h1>$country_name 식당 리스트</h1>";

            // 레스토랑 정보 및 리뷰보기 버튼 표시
            echo "<table border='1' style='margin:auto;'>";
            echo "<tr><th>식당 이름</th><th>음식 종류</th><th>주소</th><th>할인율</th><th>리뷰보기</th></tr>";

            do {
                echo "<tr><td>{$countryRow['restaurant_name']}</td><td>{$countryRow['cuisine_type']}</td><td>{$countryRow['address']}</td><td>{$countryRow['restaurant_discount_rate']}%</td>";

                // 리뷰보기 버튼 추가
                echo "<td><button onclick=\"showReviews({$countryRow['restaurant_id']})\">리뷰보기</button></td></tr>";
            } while ($countryRow = mysqli_fetch_assoc($countryResult));

            echo "</table>";
        } else {
            echo "<h2>해당 국가의 식당 정보를 찾을 수 없습니다.</h2>";
        }
    }

    // 데이터베이스 연결 종료
    mysqli_close($connect);
} else {
    // 국가 목록 가져오기
    $query = "SELECT * FROM country";
    $result1 = mysqli_query($connect, $query);

    if (!$result1) {
        die("쿼리 실행에 실패했습니다: " . mysqli_error($connect));
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
            // 도시 목록 표시 함수
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
            function showRestaurantInfo1() {
                var selectedCountry = document.querySelector('#countryDrilldown').value;

                // Check if either city or country is selected
                if (selectedCountry) {
                    // 도시 또는 국가 선택 시
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
                    // 도시와 국가 모두 선택되지 않은 경우
                    document.getElementById("restaurantInfo").innerHTML = "<h2>국가 또는 도시를 선택하세요.</h2>";
                }
            }
            // 레스토랑 정보 표시 함수
            function showRestaurantInfo() {
                var selectedCity = document.querySelector('#cityDrilldown').value;
                var selectedCountry = document.querySelector('#countryDrilldown').value;

                // Check if either city or country is selected
                if (selectedCity || selectedCountry) {
                    // 도시 또는 국가 선택 시
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
                    // 도시와 국가 모두 선택되지 않은 경우
                    document.getElementById("restaurantInfo").innerHTML = "<h2>국가 또는 도시를 선택하세요.</h2>";
                }
            }

            // 리뷰 표시 함수
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
    <h1>도시 선택</h1>
    <p>방문하려는 국가를 선택하세요:</p>
    <!-- 국가 선택 드릴다운 -->
    <select id="countryDrilldown" onchange="showCities()">
        <?php while ($row1 = mysqli_fetch_array($result1)):; ?>
            <option><?php echo $row1['country_name']; ?></option>
        <?php endwhile ?>
    </select>
    <input type="button" value="제출" onclick="showRestaurantInfo1()">
    
    <p>방문하려는 도시를 선택하세요:</p>  

    <!-- 도시 선택 드릴다운 -->
    <select id="cityDrilldown"></select>

    <input type="button" value="제출" onclick="showRestaurantInfo()">

    <!-- 레스토랑 정보 표시 -->
    <div id="restaurantInfo"></div>
    </body>
    </html>
    <?php
}
?>
