<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.TCCC06LogoSubmit"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>2006 TopCoder Collegiate Challenge - Logo Design Contest</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<style type="text/css">
.pageSpacer
{
   width: 510px;
   padding: 15px 0px 10px 0px;
   text-align: left;
}
.logoBox {
   text-align: center;
}

</style>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180"><jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="topcoder_tournaments"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%" align="center">

         <div class="pageSpacer">

            <div class="logoBox"><img src="/i/tournament/tccc06/logo_logo.gif" alt="TCCC06 Logo Contest" border="0"/></div><br>
            <div align="center">
            <jsp:include page="logo_links.jsp" >
            <jsp:param name="selectedTab" value="submit"/>
            </jsp:include>
            </div>

            <br><br>
            <span class="bodySubtitle">Logo submission</span><br>
            Thank you for accepting the terms of the TCCC06 Logo Contest. Please use the form below to attach your logo submission:
            <br><br>

            <% int submissionCount = ((Integer)request.getAttribute("submissionCount")).intValue();
                if (submissionCount == new TCCC06LogoSubmit().getMaxSubmissions()-1) { %>
                <span class="bigReg">Please be aware that this will be your final submission.</span>
                <% } %>
            <br /><br />
            <span class="bigRed">The maximum file size per submission is 2.0 MB.</span>
            <br><br>
         <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="logoSubmission" enctype="multipart/form-data">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="TCCC06LogoSubmit"/>
            <b>Logo:</b><br><input type="file" name="<%=Constants.LOGO%>">
            </form>
            <A href="javascript:document.logoSubmission.submit();"><img src="/i/submit.gif" alt="Submit" border="0" /></A>

         </div>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>