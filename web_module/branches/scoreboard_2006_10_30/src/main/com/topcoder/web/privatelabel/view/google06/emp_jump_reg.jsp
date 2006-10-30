<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006 Employee Competition, Powered by TopCoder</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center">
                    <img border="0" src="/i/events/google2006/codejamLogo_emp.gif" alt="Google Code Jam Employee Competition"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
</tr>

<!-- Tab bar links-->
<tr>
    <td>
        <div align="center">
            <jsp:include page="emp_links.jsp">
                <jsp:param name="selectedTab" value="registration"/>
            </jsp:include>
            <br/>
        </div>
    </td>
</tr>

<tr>

    <!-- content -->
    <td>
        <div align="center">
        <div class="pageLayout" align="left">
         <span valign="top">
         <jsp:include page="emp_right.jsp"/>
         </span>

            <span class="bigBluetitle">Registration</span>

            <br><br>
            <span class="bigRed">
            You are now leaving the Employee Competition site in order to complete registration through the Google Code Jam Competitor site.
            </span>
            <br><br>
            <span class="bigRed">Employees and interns MUST register with your "@google.com" email address in order to be considered part 
            of the employee track of the Google Code Jam. This is how you will be identified as a Google Employee. 
            You should only use the TopCoder account conversion if your TopCoder account is currently set up with a 
            "@google.com" email address.</span>
            <br><br>
            <A href="/pl/?module=Static&d1=google06&d2=login">Register</A>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>
</td>
</tr>
<tr>
	<td>
		<div align="center">
			<jsp:include page="foot.jsp"/>
		</div>
	</td>
</tr>

</table>
</body>
</html>