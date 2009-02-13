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
                    <jsp:param name="selectedTab" value="advancers"/>
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

                <span class="bigBluetitle">Advancers</span>

                <br><br>

                <table class="box" cellpadding="5" cellspacing="2" border="0" width="400">
                    <tr>
                        <td class="boxTitle" width="35%">Round</td>
                        <td class="boxTitle" align="right" width="65%">Advancers</td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?&module=Static&d1=google06&d2=advQual" class="topLink">Qualification
                            Round</a></td>
                        <td class="boxText" align="right"><a href="/pl/?&module=Static&d1=google06&d2=advQual">100</a>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?&module=Static&d1=google06&d2=advRd1" class="topLink">Online
                            Round 1</a></td>
                        <td class="boxText" align="right"><a href="/pl/?&module=Static&d1=google06&d2=advRd1">50</a>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound"><a href="/pl/?&module=Static&d1=google06&d2=advRd2" class="topLink">Online
                            Round 2</a></td>
                        <td class="boxText" align="right"><a href="/pl/?&module=Static&d1=google06&d2=advRd2">25</a>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="advancersRound">
                            <a href="/pl/?&module=Static&d1=google06&d2=advWinners" class="topLink">Final Round</a></td>
                        <td class="boxText" align="right"><a href="/pl/?&module=Static&d1=google06&d2=advWinners">Winners</a>
                        </td>
                    </tr>
                </table>


                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                To find out more detailed information about the Google&#153; Code Jam 2006 Employee Competition, please read the
                <a href="/pl/?&module=Static&d1=google06&d2=emp_rules">Terms and Conditions</a>.
                <br><br>
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