<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>The TopCoder Technical Assessment Program allows companies to test the technical abilities of candidates during the interview process</title>

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
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h1 class="testHead">TopCoder Technical Assessment Tool</h1>

                        <p><img src="/i/corp/testing_image.jpg" width="300" height="221" alt="" border="0" align="right" style="margin-left: 10px; margin-top: 0px; margin-right: 0px; margin-bottom: 10px;">Do you often hear yourself thinking, "If only I had better developers, this job would be getting
                        done on time? If only I had better developers, this job wouldn't be costing so much? If only I had
                        better developers, I could actually be satisfying my customers?"</p>

						<p>If only you had better developers - what a radical concept! The fact is, no single
						factor impacts your business - in a time when everything depends on automation - more
						than the quality of your development staff. But how can you evaluate who the best programmer
						is before you make a hiring decision?</br> <strong><font color="#CC0000"><a href="/corp/?module=Static&d1=corp&d2=testing&d3=testing_attributes">Click here to see how TopCoder can integrate into your recruitment process.</a></font></strong></p>


                        <div align="center"><a href="/corp/?module=Static&d1=corp&d2=testing&d3=demo"><img src="/i/corp/testing_demo.gif" width="265" height="98" alt="" border="0" align="center"/></a></div>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="overview"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
