<?php
// 데이터베이스 연결ㅋ
$mysqli = mysqli_connect("localhost", "team18", "team18", "team18");

if (!$mysqli) {
    die("Connection Failed: " . mysqli_connect_error());
}

// 선택된 국가의 정보를 가져오는 함수
function getCountryInfo($mysqli, $country_name)
{
    // 국가 이름을 이용하여 국가 ID 가져오기
    $findCountryQuery = "SELECT country_id FROM country WHERE country_name = ?";
    $stmt = $mysqli->prepare($findCountryQuery);
    $stmt->bind_param("s", $country_name);
    $stmt->execute();
    $countryResult = $stmt->get_result();

    if ($countryRow = mysqli_fetch_assoc($countryResult)) {
        $country_id = $countryRow['country_id'];

        // 환율 가져오기
        $getExchangeRateQuery = "SELECT exchange_rate FROM currency_exchange WHERE country_id = ?";
        $stmt = $mysqli->prepare($getExchangeRateQuery);
        $stmt->bind_param("i", $country_id);
        $stmt->execute();
        $exchangeRateResult = $stmt->get_result();

        if ($exchangeRateRow = mysqli_fetch_assoc($exchangeRateResult)) {
            $exchange_rate = $exchangeRateRow['exchange_rate'];

            // 언어 가져오기
            $getLanguageQuery = "SELECT language_name FROM languages WHERE country_id = ?";
            $stmt = $mysqli->prepare($getLanguageQuery);
            $stmt->bind_param("i", $country_id);
            $stmt->execute();
            $languageResult = $stmt->get_result();

            if ($languageRow = mysqli_fetch_assoc($languageResult)) {
                $language_name = $languageRow['language_name'];

                // 결과 배열 생성
                $result = array(
                    'exchange_rate' => $exchange_rate,
                    'language_name' => $language_name
                );

                return $result;
            }
        }
    }

    return null; // 데이터가 없을 경우 null 반환
}

// AJAX 요청 처리
if (isset($_GET['country_name'])) {
    $country_name = $_GET['country_name'];
    $countryInfo = getCountryInfo($mysqli, $country_name);

    if ($countryInfo) {
        // JSON 형식으로 반환
        echo json_encode($countryInfo);
    } else {
        echo json_encode(array('error' => 'Data not found'));
    }
}

mysqli_close($mysqli);
?>
