<?php
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

if (!$mysqli) {
    die("연결 실패: " . mysqli_connect_error());
}

// 도시 이름이 설정되어 있는지 확인
if (isset($_GET['city_name'])) {
    $city_name = $_GET['city_name'];

    // 선택한 도시의 country_id를 찾기
    $findCountryIdQuery = "SELECT country_id 
                           FROM country 
                           WHERE country_name = '$city_name'";
    $resultCountryId = mysqli_query($mysqli, $findCountryIdQuery);

    if ($row = mysqli_fetch_assoc($resultCountryId)) {
        $countryId = $row['country_id'];

        // 선택한 country_id에 대한 교통수단 정보를 가져오기
        $getTransportationInfoQuery = "SELECT method, price
                                       FROM transportation 
                                       WHERE country_id = '$countryId'";
        $resultTransportationInfo = mysqli_query($mysqli, $getTransportationInfoQuery);

        if (mysqli_num_rows($resultTransportationInfo) > 0) {
            echo "<h1>$city_name 교통수단 가격</h1>";
            
            // 교통수단 정보를 테이블로 표시
            echo "<table border='1' style='margin:auto;'>";
            echo "<tr><th>교통수단</th><th>가격</th></tr>";

            // 모든 교통수단에 대한 데이터를 표시
            while ($rowInfo = mysqli_fetch_assoc($resultTransportationInfo)) {
                echo "<tr><td>{$rowInfo['method']}</td><td>{$rowInfo['price']}</td></tr>";
            }

            echo "</table>";

            // 가장 저렴한 교통수단에 대한 데이터를 표시
            $getCheapestTransportationQuery = "SELECT method, MIN(price) as min_price
                                               FROM transportation 
                                               WHERE country_id = '$countryId'";
            $resultCheapestTransportation = mysqli_query($mysqli, $getCheapestTransportationQuery);

            if ($cheapestTransportation = mysqli_fetch_assoc($resultCheapestTransportation)) {
                echo "<br>가장 저렴한 교통수단: " . $cheapestTransportation['method'] . " (가격: " . $cheapestTransportation['min_price'] . ")<br>";
            } else {
                echo "<br>가장 저렴한 교통수단 정보를 찾을 수 없습니다.<br>";
            }
        } else {
            echo "<h2>해당 도시의 교통 정보를 찾을 수 없습니다.</h2>";
        }
    } else {
        echo "<h2>선택한 도시의 정보를 찾을 수 없습니다.</h2>";
    }

    mysqli_close($mysqli);
} else {
    // 국가 목록을 가져오는 쿼리
    $query = "SELECT * FROM country";
    $result1 = mysqli_query($mysqli, $query);

    if (!$result1) {
        die("쿼리 실행에 실패했습니다: " . mysqli_error($mysqli));
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

            #transportationInfo {
                text-align: center;
                margin-top: 20px;
            }
        </style>
        <script>
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
    <h1>교통수단 정보</h1>
    <p>당신이 방문하려는 도시를 선택하세요:</p>

    <select>
        <?php while ($row1 = mysqli_fetch_array($result1)):; ?>
            <option><?php echo $row1['country_name']; ?></option>
        <?php endwhile ?>
    </select>
    <input type="button" value="제출" onclick="showTransportationInfo()">

    <!-- 교통 정보를 표시할 <div> 요소 -->
    <div id="transportationInfo"></div>
    </body>
    </html>
    <?php
}
?>
