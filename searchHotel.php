<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search City</title>
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
    <div class="search">
        <form method="POST" action="searchHotelQuery.php">
            Select City<br><br>
            <select name='city_name' id='city'>
                <?php include("getCityList.php"); ?>
            </select>
            <input type="submit" value="Search">
        </form>
    </div>
  <button onclick="history.back()">Back</button>
</body>

</html>
