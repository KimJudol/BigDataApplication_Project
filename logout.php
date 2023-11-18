<?php
// 세션을 시작
session_start();

// 데이터베이스 연결
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

// 데이터베이스 연결 오류를 확인
if (!$mysqli) {
    die("데이터베이스 연결 실패: " . mysqli_connect_error());
}

// 세션을 파기하여 사용자 로그아웃
session_destroy();

// 로그인 페이지로 리디렉션
header("Location: login.html");
exit();
?>
