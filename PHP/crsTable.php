<?php

//classroom requirment summery
$db = "iub_db";
$host = "localhost";
$db_user = 'root';
$db_password = '';

$link = mysqli_connect($host, $db_user, $db_password, $db);

$json["error"] = false;
$json["errmsg"] = "";
$json["data"] = array();


$sql = "(
    SELECT
        section.Capacity AS Class_Size,
        (
            section.Capacity * COUNT(section.Capacity)
        ) AS Capacity_i,
        (
            (
                section.Capacity * COUNT(section.Capacity)
            ) /(7 * 2)
        ) AS ClassRoom_7,
        (
            (
                section.Capacity * COUNT(section.Capacity)
            ) /(8 * 2)
        ) AS ClassRoom_8
    FROM
        section
    GROUP BY
        section.Capacity
);
";


$res = mysqli_query($link, $sql);
$numrows = mysqli_num_rows($res);
if ($numrows > 0) {
    $namelist = array();

    while ($array = mysqli_fetch_assoc($res)) {
        array_push($json["data"], $array);
    }
} else {
    $json["error"] = true;
    $json["errmsg"] = "No any data to show.";
}

mysqli_close($link);

header('Content-Type: application/json');
echo json_encode($json);
