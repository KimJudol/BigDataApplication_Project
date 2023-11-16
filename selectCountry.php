//Purpose: Displays the exchange rate and language of the selected country

<?php
$hostname = "localhost:3306";
$username = "team18";
$password = "";
$databaseName = "team18";

// 데이터베이스 연결
$connect = mysqli_connect("localhost", "team18", "team18", "team18");

if (!$connect) {
    die("연결 실패: " . mysqli_connect_error());
}

// 국가가 선택되었는지 확인
if (isset($_GET['country_name'])) {
    $country_name = $_GET['country_name'];

    // 선택된 도시의 country_id 가져오기
    $findCountryQuery = "SELECT country_id FROM country WHERE country_name = '$country_name'";
    $countryResult = mysqli_query($connect, $findCountryQuery);

    if ($countryRow = mysqli_fetch_assoc($countryResult)) {
        $country_id = $countryRow['country_id'];
    }
}

//선택된 국가의 exchange_rate 데이터베이스 currency_exchange에서 country_id 통해서 가져오기
    $getExchangeRateQuery = "SELECT exchange_rate FROM currency_exchange WHERE country_id = '$country_id'";
    $exchangeRateResult = mysqli_query($connect, $getExchangeRateQuery);

    if ($exchangeRateRow = mysqli_fetch_assoc($exchangeRateResult)) {
        $exchange_rate = $exchangeRateRow['exchange_rate'];}


// 선택된 국가의 language_name 데이터베이스 languages에서 country_id 통해서 가져오기
$getLanguageQuery = "SELECT language_name FROM languages WHERE country_id = '$country_id'";
$languageResult = mysqli_query($connect, $getLanguageQuery);

if ($languageRow = mysqli_fetch_assoc($languageResult)) {
    $language_name = $languageRow['language_name'];
    
    mysqli_close($connect);
} else {
    echo "국가를 선택하세요.";
}





