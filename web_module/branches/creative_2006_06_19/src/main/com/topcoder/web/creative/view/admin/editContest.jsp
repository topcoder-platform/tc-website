<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Creative</title>
</head>

<body>
<div>
    This is the creative edit contest page

    <div id="startTimeCalendar">

    </div>

    <div id="endTimeCalendar">

    </div>

    <script type="text/javascript">
        function dateChanged(calendar) {
            // Beware that this function is called even if the end-user only
            // changed the month/year.  In order to determine if a date was
            // clicked you can use the dateClicked property of the calendar:
            if (calendar.dateClicked) {
                // OK, a date was clicked, redirect to /yyyy/mm/dd/index.php
                var y = calendar.date.getFullYear();
                var m = calendar.date.getMonth();
                // integer, 0..11
                var d = calendar.date.getDate();
                // integer, 1..31
                // redirect...
                alert(y + "/" + m + "/" + d);
            }
        };

        Calendar.setup(
        {
            flat         : "startTimeCalendar", // ID of the parent element
            flatCallback : dateChanged           // our callback function
        }
                );
        Calendar.setup(
        {
            flat         : "endTimeCalendar", // ID of the parent element
            flatCallback : dateChanged           // our callback function
        }
                );
    </script>


</div>
</body>
</html>