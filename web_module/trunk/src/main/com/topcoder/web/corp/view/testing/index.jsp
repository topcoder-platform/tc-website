<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="testing"/>
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%" colspan="3">
                        <h1 class="testHead">Candidate Evaluation Application</h1>
                    </td>
                <tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <p>The TopCoder Testing Program allows companies to test the technical abilities of candidates during the interview process, thereby 
                        reducing the time incurred by in-house engineers.  Employers can choose problem sets to test candidates' problem solving skills 
                        with scenarios that mirror on-the-job issues. <font color="#CC0000"><strong><em>Instead of only assessing an employee's skills 
                        months after the hire date, detailed statistics and all submitted code are released to the employers during the interview process as a 
                        way to measure and compare candidates. This information drastically reduces the time and effort it takes to identify proven  
                        developers.</em></strong></font></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

                    <td width="244" align ="left">
                        <a href="<%=request.getContextPath()+"/Tx/?"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&back-to="+request.getAttribute(Constants.KEY_LINK_PREFIX)+"&prod-id=1"%>"><img src="/i/buy_now.gif" alt="Buy Now" width="192" height="52" border="0"></a>
                    </td>
                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
