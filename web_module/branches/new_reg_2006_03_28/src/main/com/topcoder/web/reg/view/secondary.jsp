<html>
<head>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="http://www.topcoder.com/css/tcStyles.css"/>
<script>
function openWin(url, name, w, h) {
   win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
   win.location.href = url;
   win.focus();
}
</script>
</head>

<body>
secondary
<br><br>
<a href="Javascript:openWin('school.jsp','school',350,450);">school</a>
</body>
</html>