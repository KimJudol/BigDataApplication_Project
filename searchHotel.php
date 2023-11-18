    <?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    // MySQL 데이터베이스에 연결
    $mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

    // 연결 오류 확인
    if ($mysqli->connect_error) {
        die("Connection failed: " . $mysqli->connect_error);
    }

    $city_name = $_POST["city_name"];
    echo "<h1>".$city_name." Hotel List</h1>";

    // SQL 쿼리 실행
    $sql = "
        SELECT 
            h.hotel_id, 
            h.hotel_name, 
            h.price, 
            h.accomodation_number, 
            hd.hotel_discount_Id, 
            hd.hotel_discount_available, 
            hd.hotel_discount_rate, 
            hd.hotel_discount_period
        FROM 
            hotel h
        JOIN 
            city c ON h.city_id = c.city_id
        JOIN 
            hotel_discount hd ON h.hotel_id = hd.hotel_id
        WHERE 
            c.city_name = '$city_name';
    ";

    $result = $mysqli->query($sql);

    // HTML 테이블 시작
    echo "<table border='1'>";
    echo "<tr>
            <th>Hotel ID</th>
            <th>Hotel Name</th>
            <th>Price</th>
            <th>Accommodation Number</th>
            <th>Discount ID</th>
            <th>Discount Available</th>
            <th>Discount Rate</th>
            <th>Discount Period</th>
        </tr>";

    // 결과 출력
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            // 행 추가
            echo "<tr>
                    <td>" . $row["hotel_id"] . "</td>
                    <td>" . $row["hotel_name"] . "</td>
                    <td>" . $row["price"] . "</td>
                    <td>" . $row["accomodation_number"] . "</td>
                    <td>" . $row["hotel_discount_Id"] . "</td>
                    <td>" . $row["hotel_discount_available"] . "</td>
                    <td>" . $row["hotel_discount_rate"] . "</td>
                    <td>" . $row["hotel_discount_period"] . "</td>
                </tr>";
        }
    } else {
        echo "<tr><td colspan='8'>No results found.</td></tr>";
    }

    // HTML 테이블 종료
    echo "</table>";

    // MySQL 연결 종료
    $mysqli->close();
    ?>