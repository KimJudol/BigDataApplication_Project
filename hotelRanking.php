<?php
// MySQL 데이터베이스에 연결
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 호텔 랭킹을 가져오는 쿼리
$sql = "SELECT hotel.hotel_name, hotel_rating.hotel_rating FROM hotel
        INNER JOIN hotel_rating ON hotel.hotel_id = hotel_rating.hotel_id
        ORDER BY hotel_rating DESC";

$result = $mysqli->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Ranking</title>
</head>
<body>

    <div>
        <h1>Hotel Ranking</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>Hotel Name</th>
                <th>Hotel Rating</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // 결과를 반복하여 출력
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr><td>" . $row["hotel_name"] . "</td><td>" . $row["hotel_rating"] . "</td></tr>";
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
