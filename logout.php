<?php
// 데이터베이스 연결
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

//로그아웃버튼을 눌렀는지 확인
if (!mysqli_select_db($mysqli, $databaseName)) {
    die("데이터베이스 선택 실패: " . mysqli_error($mysqli));
}

// 세션을 파기하여 사용자 로그아웃
session_destroy();

// 로그인 페이지로 리디렉션
header("Location: login.php");
exit();
?>
