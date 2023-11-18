<?php
// 데이터베이스 연결 정보
$servername = "localhost";
$username = "your_username"; // MySQL 사용자 이름
$password = "your_password"; // MySQL 비밀번호
$dbname = "test"; // 사용할 데이터베이스 이름

// MySQL 데이터베이스에 연결
$conn = new mysqli($servername, $username, $password, $dbname);

// 연결 오류 확인
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// 검색어 처리
$search = isset($_GET['search']) ? $_GET['search'] : '';
$search = mysqli_real_escape_string($conn, $search);

// 검색 결과를 가져오는 쿼리
$sql = "SELECT city.city_name, souvenir.souvenir_id, souvenir.souvenir_name, 
               SUM(souvenir.price) AS total_price
        FROM souvenir
        INNER JOIN city ON souvenir.city_id = city.city_id
        WHERE city.city_name LIKE '%$search%'
        GROUP BY city.city_name, souvenir.souvenir_id WITH ROLLUP";

$res = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Souvenir</title>
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
                <th width="150">City</th>
                <th width="70">Souvenir ID</th>
                <th width="300">Souvenir Name</th>
                <th width="120">Total Price</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($res)) {
            ?>
                <tr align="center">
                    <td><?php echo $row['city_name']; ?></td>
                    <td><?php echo $row['souvenir_id']; ?></td>
                    <td><?php echo $row['souvenir_name']; ?></td>
                    <td><?php echo isset($row['total_price']) ? $row['total_price'] : 'Grand Total'; ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>

    <div class="search">
        <form method="get" action="searchSouvenir.php">
            <label for="search_box">Search:</label>
            <input type="text" id="search_box" name="search" placeholder="Enter city name" value="<?= $search ?>">
            <input type="submit" value="Search">
        </form>
    </div>
</body>

</html>
