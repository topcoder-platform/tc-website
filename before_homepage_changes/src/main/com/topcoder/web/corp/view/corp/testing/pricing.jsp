<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Securely purchase a TopCoder Employment Services Testing Program online</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="testing"/>
                <jsp:param name="level2" value="pricing"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_topcoder_testing.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="7" alt="" border="0"><br>

                        <h2 class="corpHead">Pricing</h2>
                        
                        <p><strong>You can now securely purchase a Private Candidate Testing Program online.</strong> After you receive confirmation of your 
                        purchase by email, you can immediately begin setting up a session in the Management Tool. If you prefer to speak to a TopCoder representative 
                        before purchasing a program, call us toll free at <strong>866.867.2633.</strong></p>
                        
                        <div align="center">
                        
                        <table border="0" cellpadding="0" cellspacing="2">
                            <tr valign="top">
                                <td class="bodyText" width="259"><img src="/i/corp/title_6_month_program.gif" alt="6 Month Program - 50 Candidates" width="259" height="29" border="0"></td>
                                <td class="bodyText" width="10"><img src="/i/corp/spacer.gif" alt="" width="10" height="1" border="0"></td>
                                <td class="bodyText" width="259"><img src="/i/corp/title_12_month_program.gif" alt="6 Month Program - 50 Candidates" width="259" height="29" border="0"></td>
                            </tr>
                            
                            <tr valign="top">
                                <td class="bodyText" width="259"><a href="<%=request.getContextPath()+"/Tx/?&"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&pid=1"%>"><img src="/i/corp/button_select.gif" alt="Select" width="78" height="29" border="0" align="right"></a><span class="testHeadSmall">$12,500</span>&#160;&#160;Initial Price</td>
                                <td class="bodyText" width="10"><img src="/i/corp/spacer.gif" alt="" width="10" height="1" border="0"></td>
                                <td class="bodyText" width="259"><a href="<%=request.getContextPath()+"/Tx/?&"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&pid=2"%>"><img src="/i/corp/button_select.gif" alt="Select" width="78" height="29" border="0" align="right"></a><span class="testHeadSmall">$23,000</span>&#160;&#160;Initial Price</td>
                            </tr>
                            
                            <tr valign="top">
                                <td class="bodyText" width="259">That's an initial price of <strong>$250 per candidate.</strong> Additional candidates can be added for only <strong>$150 each.</strong></td>
                                <td class="bodyText" width="10"><img src="/i/corp/spacer.gif" alt="" width="10" height="1" border="0"></td>
                                <td class="bodyText" width="259">That's an initial price of <strong>$230 per candidate.</strong> Additional candidates can be added for only <strong>$150 each.</strong></td>
                            </tr>
                        </table><br>
                        
                        <img src="/i/corp/verisign_m.gif" alt="Payment Services by Verisign" width="103" height="43" border="0" vspace="20"></div>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="pricing"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
