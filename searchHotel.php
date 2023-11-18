<?php

// MySQL 데이터베이스에 연결
$mysqli = mysqli("localhost", "team18", "team18", "team18");

// 연결 오류 확인
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// 검색어 처리
$search = isset($_GET['search']) ? $_GET['search'] : '';
$search = mysqli_real_escape_string($mysqli, $search);

// 검색 결과를 가져오는 쿼리
$sql = "SELECT hotel.hotel_id, hotel.hotel_name, hotel.price, hotel.accomodation_number, hotel_discount.discount_id, hotel_discount.discount_status, hotel_discount.discount_amount, hotel_discount.validity_period
        FROM hotel
        LEFT JOIN hotel_discount ON hotel.hotel_id = hotel_discount.hotel_id
        WHERE hotel.hotel_name LIKE '%$search%'
        ORDER BY hotel.hotel_name";

$res = mysqli_query($mysqli, $sql);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Hotel</title>
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
                <th width="70">Hotel ID</th>
                <th width="300">Hotel Name</th>
                <th width="120">Price</th>
                <th width="120">Capacity</th>
                <th width="120">Discount Status</th>
                <th width="120">Discount Amount</th>
                <th width="120">Validity Period</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = mysqli_fetch_assoc($res)) {
            ?>
                <tr align="center">
                    <td><?php echo $row['hotel_id']; ?></td>
                    <td><?php echo $row['hotel_name']; ?></td>
                    <td><?php echo $row['price']; ?></td>
                    <td><?php echo $row['accomodation_number']; ?></td>
                    <td><?php echo $row['discount_status']; ?></td>
                    <td><?php echo $row['discount_amount']; ?></td>
                    <td><?php echo $row['validity_period']; ?></td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>

    <div class="search">
        <form method="get" action="searchHotel.php">
            <label for="search_box">Search:</label>
            <input type="text" id="search_box" name="search" placeholder="Enter hotel name" value="<?= $search ?>">
            <input type="submit" value="Search">
        </form>
    </div>
</body>

</html>
