<?php

// MySQL 데이터베이스에 연결
$mysqli = new mysqli("localhost", "team18" "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 검색어 처리
$search = isset($_GET['search']) ? $_GET['search'] : '';
$search = mysqli_real_escape_string($mysqli, $search);

// 검색 결과를 가져오는 쿼리
$sql = "SELECT city.city_id, city.city_name, weather.date, weather.temperature, weather.conditions 
        FROM city
        INNER JOIN weather ON city.city_id = weather.city_id
        WHERE city.city_name LIKE '%$search%'
        ORDER BY weather.date DESC";

$res = mysqli_query($mysqli, $sql);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Weather</title>
    <style>
        body {
            font-family: Consolas, monospace;
            font-size: 12px;
        }

        table {
            width: 100%;
        }

        th,
        td {
            padding: 10px;
            border-bottom: 1px solid #dadada;
        }
    </style>
</head>

<body>
    <div class="head">검색결과 | <?= $search ?></div>

    <table style="width:1000px;" class="middle">
        <thead>
            <tr align="center">
                <th width="70">City ID</th>
                <th width="200">City Name</th>
                <th width="150">Date</th>
                <th width="120">Temperature</th>
                <th width="120">Conditions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($res)) {
            ?>
                <tr align="center">
                    <td><?php echo $row['city_id']; ?></td>
                    <td><?php echo $row['city_name']; ?></td>
                    <td><?php echo $row['date']; ?></td>
                    <td><?php echo $row['temperature']; ?></td>
                    <td><?php echo $row['conditions']; ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>

    <div class="search">
        <form method="get" action="searchWeather.php">
            <label for="search_box">Search:</label>
            <input type="text" id="search_box" name="search" placeholder="Enter city name" value="<?= $search ?>">
            <input type="submit" value="Search">
        </form>
    </div>
</body>

</html>
