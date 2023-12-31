<?php

$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

if (!$mysqli) {
    die("연결 실패: " . mysqli_connect_error());
}

if (isset($_GET['country_name'])) {
    $country_name = $_GET['country_name'];

    // Query to get cities for the selected country
    $getCitiesQuery = "SELECT city_name 
                       FROM city 
                       WHERE country_id = (SELECT country_id FROM country WHERE country_name = '$country_name')";

    $result = mysqli_query($mysqli, $getCitiesQuery);

    if ($result) {
        while ($row = mysqli_fetch_array($result)) {
            echo "<option>{$row['city_name']}</option>";
        }
    } else {
        echo "도시를 불러올 수 없습니다.";
    }

    mysqli_close($mysqli);
} else {
    echo "국가를 선택하세요.";
}
?>
