<?php

// Connect database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");


 if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
$city_name = $_POST["city"];
$getIdQuery = "SELECT city_id FROM city WHERE city_name = ?";

// SQL 쿼리를 준비
if ($stmt = mysqli_prepare($mysqli, $getIdQuery)) {
    // 매개변수를 도시 이름으로 바인딩
    mysqli_stmt_bind_param($stmt, "s", $city_name);

    // 쿼리 실행
    if (mysqli_stmt_execute($stmt)) {
        // 결과 저장
        mysqli_stmt_bind_result($stmt, $find_id);

        // 결과 검색
        if (mysqli_stmt_fetch($stmt)) {
            // city_id 값을 변수에 저장
            $city_id = $find_id;
        } else {
            echo "City not found.";
        }
    } else {
        echo "Error executing the query: " . mysqli_error($mysqli);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Error preparing the query: " . mysqli_error($mysqli);
}

// check traveler exists
$traveler_name = $_POST["travelerName"]; 
$checkTravelerQuery = "SELECT COUNT(*) FROM travel WHERE traveler_name = ?";

if ($stmt = mysqli_prepare($mysqli, $checkTravelerQuery)) {
    mysqli_stmt_bind_param($stmt, "s", $traveler_name);

    // execute query
    if (mysqli_stmt_execute($stmt)) {
        mysqli_stmt_bind_result($stmt, $count);
        if (mysqli_stmt_fetch($stmt)) {
            if ($count > 0) {
            } else {
                echo "Traveler not found.";
                mysqli_stmt_close($stmt);
                mysqli_close($mysqli);
            }
        } else {
            echo "Error fetching the result: " . mysqli_error($mysqli);
        }
    } else {
        echo "Error executing the query: " . mysqli_error($mysqli);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Error preparing the query: " . mysqli_error($mysqli);
}



//insert travel query
$query = "UPDATE travel SET city_id=?, travel_start_date=?, travel_end_date=? WHERE  traveler_name=?";

// prepare statement
if($stmt = mysqli_prepare($mysqli, $query)){
   mysqli_stmt_bind_param($stmt, "isss", $city, $travel_start_date, $travel_end_date, $traveler_name);
$city = $city_id;
$traveler_name = $_POST['travelerName'];
$travel_start_date= $_POST['startDate'];
$travel_end_date = $_POST['endDate'];

// execute prepared statement
if(mysqli_stmt_execute($stmt)){
   echo "Records updated successfully.";
}else {
   echo "ERROR: Could not execute query: $sql. " . mysqli_error($mysqli);
}
}else {
   echo "ERROR: Could not prepare query: $sql. " . mysqli_error($mysqli);
}

mysqli_stmt_close($stmt);
mysqli_close($mysqli);
?>
