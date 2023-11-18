<?php
// Connect to database
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");


if (!$mysqli) {
   die("Connection Failed: " . mysqli_connect_error());
}


// Check if the country is selected
if (isset($_GET['country_name'])) {
   $country_name = $_GET['country_name'];


   // bring the country_id from the database
   $findCountryQuery = "SELECT country_id FROM country WHERE country_name = '$country_name'";
   $countryResult = mysqli_query($mysqli, $findCountryQuery);


   if ($countryRow = mysqli_fetch_assoc($countryResult)) {
       $country_id = $countryRow['country_id'];
   }
}


//bring the exchange_rate from the currency_exchange table at database through country_id 
   $getExchangeRateQuery = "SELECT exchange_rate FROM currency_exchange WHERE country_id = '$country_id'";
   $exchangeRateResult = mysqli_query($mysqli, $getExchangeRateQuery);


   if ($exchangeRateRow = mysqli_fetch_assoc($exchangeRateResult)) {
       $exchange_rate = $exchangeRateRow['exchange_rate'];}




// bring language_name from the languages table country_id at database through country_id
$getLanguageQuery = "SELECT language_name FROM languages WHERE country_id = '$country_id'";
$languageResult = mysqli_query($mysqli, $getLanguageQuery);


if ($languageRow = mysqli_fetch_assoc($languageResult)) {
   $language_name = $languageRow['language_name'];
  
   mysqli_close($mysqli);
} else {
   echo "Select Country.";
}


