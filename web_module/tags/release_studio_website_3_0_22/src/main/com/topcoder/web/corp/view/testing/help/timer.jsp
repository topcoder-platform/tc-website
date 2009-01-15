<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Technical Assessment Environment</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

</head>

<body id="testApplet" onLoad="focus()">

<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td rowspan="2"><img border="0" height="54" width="10" src="/i/corp/testHeadTopLeft.gif" alt=""></td>
        <td id="testHead"><img alt="0" border="0" height="36" width="114" src="/i/corp/clear.gif"></td>
        <td id="testHead" width="100%"><img alt="0" border="0" height="36" width="10" src="/i/corp/clear.gif"></td>
        <td align="right"><img border="0" height="36" width="171" src="/i/corp/testHeadTCLogo.gif" alt="TopCoder"></td>
        <td rowspan="2"><img alt="0" border="0" height="54" width="10" src="/i/corp/testHeadTopRight.gif" alt=""></td>
      </tr>

    <tr>
        <td align="left"><img border="0" height="18" width="114" src="/i/corp/testHeadTabLeft.gif" alt=""></td>
        <td width="100%"><img border="0" alt="" height="18" width="10" src="/i/corp/clear.gif"></td>
        <td align="right"><img src="/i/corp/clear.gif" height="18" width="171" alt="" border="0"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/corp/testTitleLeft.gif" alt=""></td>
        <td background="/i/testTitleBkgd.gif"><img alt="Help Manual" border="0" height="45" width="155" src="/i/corp/testHelpManual.gif"></td>
        <td background="/i/testTitleBkgd.gif" width="100%"><img alt="0" border="0" height="45" width="10" src="/i/corp/clear.gif"></td>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/corp/testTitleRight.gif" alt=""></td>
      </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td><img border="0" alt="" height="15" width="10" src="/i/corp/clear.gif"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%" id="testBody">
    <tr>
        <td><img src="/i/corp/testBodyTopLeft.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td background="/i/testBodyTop.gif" width="100%"><img src="/i/corp/clear.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td><img src="/i/corp/testBodyTopRight.gif" alt="" width="10" height="10" alt="0" border="0"></td>
    </tr>

    <tr>
        <td background="/i/testBodyLeft.gif" width="10"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" align="center">
            <table border="0" cellpadding="0" cellspacing="10" width="25%" align="left">
                <tr>
                    <td class="helpNav">

<!-- Help Nav begins -->
                        <jsp:include page="helpLeft.jsp" >
                            <jsp:param name="selected" value="timer"/>
                        </jsp:include>
<!-- Help Nav ends -->

                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="10" width="75%">
                <tr>
                    <td class="bodyText">
                        <h1 class="bodyTitle">The Timer</h1>

                        <p>The timer in the coding window will be always counting down to the end of the current testing phase.  Remember that there
                        is variable latency between your computer and our servers.  For that reason, it is ALWAYS best to perform any submissions
                        with at least 30 seconds left on the timer.</p>

                    </td>
                </tr>
            </table>
        </td>
        <td  background="/i/testBodyRight.gif" width="10"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
    </tr>

    <tr>
        <td width="10"><img src="/i/corp/testBodyBottomLeft.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" background="/i/testBodyBottom.gif"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="10"><img src="/i/corp/testBodyBottomRight.gif" alt="" width="10" height="10" border="0"></td>
    </tr>
</table>

</div>

</body>
</html>
