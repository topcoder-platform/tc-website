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
                <jsp:param name="level2" value="candidateID"/>
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
                        <h1 class="testHead">Candidate Identification</h1>
                        <p>We provide employers with innovative programs designed to attract, identify, and evaluate collegiate candidates and 
                        experienced professionals for full time employment consideration.  With a member base in excess of 20,000&#151;including 
                        more than 12,000 students from over 750 schools&#151;employers obtain objective measurement detail about candidates, 
                        including code samples and statistics, that is not found elsewhere.</p>
                        
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
