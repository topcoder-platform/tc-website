<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder | Activation</title>

<jsp:include page="../script.jsp" />
</head>

<body>

<!-- Top begins -->
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="login"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="recover_password"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" class="bodyText" align="center">

         <div class="myTCBody">

         <jsp:include page="../page_title.jsp" >
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="Activation"/>
         </jsp:include>

         <div align="center"><A href="/tc?module=TCO05AlgorithmTerms"><img src="/i/registration/tco05_reg.gif" alt="TCO05 Registration" border="0" /></A></div>
         <p>
         <span class="bodySubtitle">Your account has been successfully activated. Thank You!</span>
         <br><br>
         <A HREF="/tc?&module=Login&<%=BaseServlet.NEXT_PAGE_KEY%>=/" class="bodyText">Click here</A> to login to your account, or check some of the great services that we offer to TopCoder members:
         <br>
         </p>
         
            <table border=0 cellpadding=5 cellspacing=0 width="100%">
                <tr>
                    <td class="bodyText" valign="top" width="150"><A href="/tc?module=Static&d1=contracting&d2=index"><img src="/i/registration/icon_emp_opps.gif" border=0/></A></td>
                    <td class="bodyText" valign="top"><A href="/tc?module=Static&d1=contracting&d2=index">Register here</A> to enroll in <strong>TopCoder Employment Opportunities</strong>.  Whether you're looking for just a couple days of work or a full-time permanent position, TopCoder can help set you up with work that matches both your skills and availability.</td>
                </tr>
                <tr>
                    <td class="bodyText" valign="top" width="150"><A href="/tc?module=Static&d1=contracting&d2=index"><img src="/i/registration/icon_components.gif" border=0/></A></td>
                    <td class="bodyText" valign="top"><A href="/?t=development&c=index">Compete</A> in <strong>Software Component Competitions</strong> and get paid for what you build! You can also earn money by <A href="/?t=development&c=index">reviewing</A> software components.</td>
                </tr>
                <tr>
                    <td class="bodyText" valign="top" width="150"><A href="/tc"><img src="/i/registration/icon_algorithm.gif" border=0/></A></td>
                    <td class="bodyText" valign="top">How do you match up among your peers? <A href="/tc">Compete</A> in our <strong>Algorithm competitions</strong>.</td>
                </tr>
            </table>
         <p><br></p>
         </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>