<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rating</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .icon {
            font-size: 24px;
            cursor: pointer;
        }
        .title {
            margin-top: 20px;
        }
        .buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        button {
            font-size: 18px;
            padding: 10px 20px;
        }
    </style>
</head>
<body>

    <div>
        <h1 class="title">Ranking</h1>
    </div>

    <div class="buttons">
        <button onclick="navigate('city')">City</button>
        <button onclick="navigate('restaurant')">Restaurant</button>
        <button onclick="navigate('hotel')">Hotel</button>
    </div>

    <script>
        function navigate(category) {
            if (category === 'city') {
                window.location.href = 'cityRanking.php';
            }
            else if (category === 'restaurant') {
                window.location.href = 'restaurantRanking.php';
            }
            else if (category === 'hotel') {
                window.location.href = 'hotelRanking.php';
            }
            else {
                // 다른 카테고리의 동작을 추가할 수 있습니다.
                alert('이 버튼은 ' + category + '를 나타냅니다.');
            }
        }
    </script>

</body>
</html>
