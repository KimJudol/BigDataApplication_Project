<?php
// MySQL 데이터베이스에 연결
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 도시 랭킹을 가져오는 쿼리
$sql = "SELECT city_name, city_rating FROM city
        INNER JOIN city_rating ON city.city_id = city_rating.city_id
        ORDER BY city_rating DESC";

$result = $mysqli->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>City Ranking</title>
</head>
<body>

    <div>
        <a href="./ranking.php" class="icon">🏠</a>
        <h1>City Ranking</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>City Name</th>
                <th>City Rating</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // 결과를 반복하여 출력
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr><td>" . $row["city_name"] . "</td><td>" . $row["city_rating"] . "</td></tr>";
                }
            } else {
                echo "<tr><td colspan='2'>No data available</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <?php
    // 데이터베이스 연결 종료
    $mysqli->close();
    ?>
<br><a href="/team18/ranking.html" target="_blank">
        <button>Back</button>
    </a><br>
</body>
</html>
