<!doctype html>
<html lang="en">
<head>
<title>Insert Travel</title>
<meta charset="UTF-8">
    <style>
        select#city {
            width: 100px;
        }
    </style>
</head>
<body>
<form action="insertTravelQuery.php" method="POST">
Select City<br>
<select name='city' id='city'>
    <?php include("getCityList.php"); ?>
</select>
<br><br>Traveler name<br>
<input type="text" name="travelerName" size="50">
<br><br>Travel Start Date<br>
<input type="date" name="startDate" size="50">
<br><br>Travel End Date<br>
<input type="date" name="endDate" size="50">
<br><br><input type="submit" name="submit" value="Submit"> 
</form>
<button onclick="history.back()">Back</button>
</body>
</html>
