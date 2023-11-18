<?php
$servername = "localhost";      
$username = "localhost";      
$dbname = "test";   

// Database Connection
$connect = new mysqli($servername, $username, $password, $dbname);

if (!$connect) {
    die("연결 실패: " . mysqli_connect_error());
}

if (isset($_GET['restaurant_id'])) {
    $restaurantId = $_GET['restaurant_id'];

    // Query to get reviews for the specified restaurant
    $getReviewsQuery = "SELECT restaurant_review 
                        FROM restaurant_rating 
                        WHERE restaurant_id = $restaurantId";

    $result = mysqli_query($connect, $getReviewsQuery);

    if ($result) {
        echo "<h2>리뷰 목록</h2>";
        echo "<ul>";

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<li>{$row['restaurant_review']}</li>";
        }

        echo "</ul>";
    } else {
        echo "리뷰를 가져오는 데 실패했습니다.";
    }
}
mysqli_close($connect);
?>
