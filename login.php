
<?php

// Connect to the database
$mysqli = mysqli_connect("localhost", "team18", "team18", "Team18");

// Check if the connection was successful
if ($mysqli === false) {
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// if the user's password and id matches it will connect to myTravel.php
// if the condition is not met it will display an error message
if (isset($_POST['submit'])) {
    $id = $_POST['id'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE id='$id' AND password='$password'";
    $result = mysqli_query($mysqli, $sql);
    $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
        header("location: myTravel.php");
    } else {
        echo "Your Login Name or Password is invalid";
    }
}
?>

// Path: Login/login.php/login.php



