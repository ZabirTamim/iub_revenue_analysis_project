<?php

//unused resources page
$db = "iub_db";
$host = "localhost";
$db_user = 'root';
$db_password = '';

$link = mysqli_connect($host, $db_user, $db_password, $db);

$json["error"] = false;
$json["errmsg"] = "";
$json["data"] = array();


$sql = "SELECT
Course.School_ID,section.Year_No,section.SemesterNumber,
(
    SUM(section.EnrolledStudents) / COUNT(section.Section_ID)
) AS AVG_ENROLLED,
(
    SUM(section.Capacity) / COUNT(section.Section_ID)
) AS AVG_Room,
(
    (
        SUM(section.Capacity) / COUNT(section.Section_ID)
    ) -(
        SUM(section.EnrolledStudents) / COUNT(section.Section_ID)
    )
) AS Unused,
(
    (
        (
            SUM(section.Capacity) / COUNT(section.Section_ID)
        ) -(
            SUM(section.EnrolledStudents) / COUNT(section.Section_ID)
        )
    ) / (
    SUM(section.Capacity) / COUNT(section.Section_ID)
)*100
) AS Unused_percent
FROM
section
INNER JOIN course ON section.Course_ID = course.Course_ID
WHERE
(section.Year_No BETWEEN 2020 and 2021) AND (section.SemesterNumber BETWEEN 'Autumn'AND'Summer')
GROUP BY
course.School_ID,
section.SemesterNumber,
section.Year_No;";


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
