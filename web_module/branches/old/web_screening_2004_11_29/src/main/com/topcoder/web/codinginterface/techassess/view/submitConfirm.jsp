<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
<SCRIPT type="text/javascript">
    function doSubmit(module) {
      document.submitForm.<%=Constants.MODULE%>.value=module;
      document.submitForm.submit();
    }
</SCRIPT>

</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
      <jsp:param name="tabLev1" value="submitConfirm"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
      <jsp:param name="timer" value="off"/>
      </jsp:include>

        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post" name="submitForm" target="_top">
            <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.MODULE%>" value="<%=Constants.RP_SUBMIT%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.COMPONENT_ID%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.PROBLEM_TYPE_ID%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.SUBMIT_FLAG%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.LANGUAGE_ID%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.CODE%>"/>
              <table cellspacing=0 cellpadding=0 class=bodyTable>
                 <tr>
                    <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
                    <td class=bodyT>&#160;</td>
                    <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
                 </tr>
                 <tr>
                    <td class=bodyL>&#160;</td>
                    <td class=bodyContent>


                        <p class=pL>
                        <span class=bodyBigTitle>Submit Confirmation</span>
                        <br /><br />

                        <tc-webtag:errorIterator id="err" name="<%=Constants.CODE%>"><%=err%><br/></tc-webtag:errorIterator>


                        <a href="JavaScript:doSubmit('<%=Constants.RP_SUBMIT%>')">Yes</a> <a href="JavaScript:doSubmit('<%=Constants.RP_VIEW_PROBLEM%>')">No</a>
                        </p>

                    </td>
                    <td class=bodyR>&#160;</td>
                 </tr>
                 <tr>
                    <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
                    <td class=bodyB>&#160;</td>
                    <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
                 </tr>
              </table>
      </form>


      </td>
   </tr>
</table>

</body>
</html>