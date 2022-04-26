<?php

//student_per_section_page
$db = "iub_db";
$host = "localhost";
$db_user = 'root';
$db_password = '';

$link = mysqli_connect($host, $db_user, $db_password, $db);

$json["error"] = false;
$json["errmsg"] = "";
$json["data"] = array();




$sql = "SELECT
course.School_ID,
section.SemesterNumber,
section.Year_No,
COUNT(section.Section_ID) AS Section_Count
FROM
section
INNER JOIN course ON section.Course_ID = course.Course_ID
WHERE
section.EnrolledStudents < '61' and section.Year_No='2021' and section.SemesterNumber='Spring'
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
