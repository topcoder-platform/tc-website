<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%@ page errorPage="/errorPage.jsp" %>

<html>

<head>

<title>Testing Environment</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

</head>

<body id="testApplet" onLoad="focus()">

<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td rowspan="2"><img border="0" height="54" width="10" src="/i/testHeadTopLeft.gif" alt=""></td>
        <td id="testHead"><img alt="0" border="0" height="36" width="114" src="/images/clear.gif"></td>
        <td id="testHead" width="100%"><img alt="0" border="0" height="36" width="10" src="/images/clear.gif"></td>
        <td align="right"><img border="0" height="36" width="171" src="/i/testHeadTCLogo.gif" alt="TopCoder"></td>
        <td rowspan="2"><img alt="0" border="0" height="54" width="10" src="/i/testHeadTopRight.gif" alt=""></td>
      </tr>

    <tr>
        <td align="left"><img border="0" height="18" width="114" src="/i/testHeadTabLeft.gif" alt=""></td>
        <td width="100%"><img border="0" alt="" height="18" width="10" src="/images/clear.gif"></td>
        <td align="right"><img src="/images/clear.gif" height="18" width="171" alt="" border="0"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/testTitleLeft.gif" alt=""></td>
        <td background="/i/testTitleBkgd.gif"><img alt="Help Manual" border="0" height="45" width="155" src="/i/testHelpManual.gif"></td>
        <td background="/i/testTitleBkgd.gif" width="100%"><img alt="0" border="0" height="45" width="10" src="/images/clear.gif"></td>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/testTitleRight.gif" alt=""></td>
      </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td><img border="0" alt="" height="15" width="10" src="/images/clear.gif"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%" id="testBody">
    <tr>
        <td><img src="/i/testBodyTopLeft.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td background="/i/testBodyTop.gif" width="100%"><img src="/i/clear.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td><img src="/i/testBodyTopRight.gif" alt="" width="10" height="10" alt="0" border="0"></td>
    </tr>
      
    <tr>
        <td background="/i/testBodyLeft.gif" width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" align="center">
            <table border="0" cellpadding="0" cellspacing="10" width="25%" align="left">
                <tr>
                    <td class="helpNav">

<!-- Help Nav begins -->
                        <jsp:include page="helpLeft.jsp" >
                            <jsp:param name="selected" value="testingApp"/>
                        </jsp:include>
<!-- Help Nav ends -->

                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="10" width="75%">
                <tr>
                    <td class="bodyText">
                        <h1 class="bodyTitle">Loading the Testing Application</h1>
                        
                        <p>The Testing Application is a Java Applet that requires the Java 1.4 runtime to be installed on your machine.  Load the 
                        application by using the URL that has been provided to you.  Once you click on the URL, you will be notified if you need to 
                        upgrade your Java runtime.  If so, please follow the steps of the installation wizard to upgrade your system.  If an upgrade 
                        is not required, the application will load automatically and present you with an orange <strong>Launch Testing Application</strong> button.</p>
                        
                        <p>Get further information on <a href="http://java.sun.com/products/plugin/" target="_blank">Java 1.4 runtime</a></p>

                    </td>
                </tr>
            </table>
        </td>
        <td  background="/i/testBodyRight.gif" width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
    </tr>
      
    <tr>
        <td width="10"><img src="/i/testBodyBottomLeft.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" background="/i/testBodyBottom.gif"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="10"><img src="/i/testBodyBottomRight.gif" alt="" width="10" height="10" border="0"></td>
    </tr>
</table>
      
</div>

</body>
</html>
