<?php
// MySQL 데이터베이스에 연결
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 레스토랑 랭킹을 가져오는 쿼리 (상위 20개)
$sql = "SELECT restaurant_name, restaurant_rating FROM restaurant
        INNER JOIN restaurant_rating ON restaurant.restaurant_id = restaurant_rating.restaurant_id
        ORDER BY restaurant_rating DESC
        LIMIT 20";

$result = $mysqli->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Ranking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        table {
            width: 50%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <div>
        <a href="ranking.php" class="icon">🏠</a>
        <h1>Restaurant Ranking</h1>
    </div>
    <table>
        <thead>
            <tr>
                <th>Restaurant Name</th>
                <th>Restaurant Rating</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // 결과를 반복하여 출력
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr><td>" . $row["restaurant_name"] . "</td><td>" . $row["restaurant_rating"] . "</td></tr>";
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

</body>
</html>
