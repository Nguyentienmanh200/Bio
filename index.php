<?php

require_once 'config/database.php';

$stmt = $pdo->query("SELECT * FROM profile LIMIT 1");
$profile = $stmt->fetch(PDO::FETCH_ASSOC);

$ip = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';
$userAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';

$device = "Desktop";

if(preg_match('/mobile/i',$userAgent)){
    $device = "Mobile";
}

$browser = "Unknown";

if(stripos($userAgent,'Chrome') !== false){
    $browser = "Chrome";
}
elseif(stripos($userAgent,'Safari') !== false){
    $browser = "Safari";
}
elseif(stripos($userAgent,'Firefox') !== false){
    $browser = "Firefox";
}

$os = "Unknown";

if(stripos($userAgent,'Windows') !== false){
    $os = "Windows";
}
elseif(stripos($userAgent,'Android') !== false){
    $os = "Android";
}
elseif(stripos($userAgent,'iPhone') !== false){
    $os = "iOS";
}

$country = "Unknown";
$city = "Unknown";

$insert = $pdo->prepare("
INSERT INTO visits
(ip,country,city,device,browser,os)
VALUES
(?,?,?,?,?,?)
");

$insert->execute([
    $ip,
    $country,
    $city,
    $device,
    $browser,
    $os
]);

?>
<!DOCTYPE html>
<html lang="vi
