<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../../script.jsp" />
    <jsp:include page="../../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>
<h2>Registration for the Software Symposium at the 2008 TopCoder Open</h2>
<center>

<table cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td>Given Name:</td>
        <td><tc-webtag:textInput name="gn" size="15" maxlength="64" editable="true"/></td>
    </tr>
</tbody>
</table>

</center>
<jsp:include page="../../../foot.jsp" />

</body>

</html>