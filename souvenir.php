<?php
// MySQL 데이터베이스에 연결
$mysqli = new mysqli("localhost", "team18", "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 검색어 처리
$search = isset($_GET['search']) ? $_GET['search'] : '';
$search = mysqli_real_escape_string($mysqli, $search);

// 검색 결과를 가져오는 쿼리
$sql = "SELECT souvenir.souvenir_id, souvenir.souvenir_name, souvenir.price, city.city_name
        FROM souvenir
        INNER JOIN city ON souvenir.city_id = city.city_id
        WHERE city.city_name LIKE '%$search%'
        ORDER BY souvenir.souvenir_name";

$res = mysqli_query($mysqli, $sql);

// 체크박스 선택된 가격 합계 계산
$totalPrice = 0;
if (isset($_POST['selectedSouvenirs'])) {
    foreach ($_POST['selectedSouvenirs'] as $selectedSouvenir) {
        $totalPrice += $selectedSouvenir;
    }
}
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
                <th width="70">Souvenir ID</th>
                <th width="300">Souvenir Name</th>
                <th width="120">Price</th>
                <th width="150">City</th>
                <th width="150">Select</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($res)) {
            ?>
                <tr align="center">
                    <td><?php echo $row['souvenir_id']; ?></td>
                    <td><?php echo $row['souvenir_name']; ?></td>
                    <td><?php echo $row['price']; ?></td>
                    <td><?php echo $row['city_name']; ?></td>
                    <td><input type="checkbox" name="selectedSouvenirs[]" value="<?php echo $row['price']; ?>"></td>
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

    <div>
        <form method="post" action="">
            <label for="totalPrice">Total Price:</label>
            <input type="text" id="totalPrice" name="totalPrice" value="<?= $totalPrice ?>" readonly>
            <input type="submit" value="Calculate Total Price">
        </form>
    </div>
</body>

</html>
