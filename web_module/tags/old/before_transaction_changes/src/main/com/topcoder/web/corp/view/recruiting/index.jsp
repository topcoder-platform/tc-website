<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>

<!-- Left Column Begins -->
        <td width="170" valign="top" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="recruiting"/>
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <table border="0" width="100%">
                <tr>
                    <td class="bodyText" width="100%">
                        <h1 class="testHead">Overview</h1>
                        <p>TopCoder is a company with one major objective&#151;to identify the best programmers in the world. TopCoder has conducted 
                        hundreds of online and offline contests to objectively and systematically quantify the skills of thousands of programmers. 
                        Already our clients, including the FBI, NVIDIA and Microsoft, have experienced the difference in the quality of our candidates.</p>
                        
                        <p><br/></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
