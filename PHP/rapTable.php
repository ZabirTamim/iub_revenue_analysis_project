<?php

//revenue_analysis_page
$db = "iub_db";
$host = "localhost";
$db_user = 'root';
$db_password = '';

$link = mysqli_connect($host, $db_user, $db_password, $db);

$json["error"] = false;
$json["errmsg"] = "";
$json["data"] = array();


$sql = "SELECT
section.SemesterName,course.School_ID,section.SemesterNumber,section.Year_No,
SUM(X.total_number_of_credit) AS Revenue
FROM
(
SELECT
    (
        course.CreditHour * (section.EnrolledStudents)
    ) AS total_number_of_credit
FROM
    section
INNER JOIN course ON section.Course_ID = course.Course_ID 


) AS X,
section
INNER JOIN course ON section.Course_ID = course.Course_ID
GROUP BY
section.Year_No,course.School_ID,section.SemesterNumber;";


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
