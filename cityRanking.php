<?php
// 데이터베이스 연결 정보
 // MySQL 서버 주소
$username = "localhost";       // MySQL 사용자 이름
      // MySQL 비밀번호
$dbname = "test";    // 사용할 데이터베이스 이름

// MySQL 데이터베이스에 연결
$conn = new mysqli($servername, $username, $password, $dbname);

// 연결 오류 확인
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// 도시 랭킹을 가져오는 쿼리
$sql = "SELECT city_name, city_rating FROM city
        INNER JOIN city_rating ON city.city_id = city_rating.city_id
        ORDER BY city_rating DESC";

$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>City Ranking</title>
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
    $conn->close();
    ?>

</body>
</html>
