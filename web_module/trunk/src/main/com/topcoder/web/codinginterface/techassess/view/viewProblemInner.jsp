<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.codinginterface.CodingInterfaceConstants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/WEB-INF/codinginterface.tld" prefix="ci" %>
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >

<SCRIPT type="text/javascript">
    function doSubmit(module) {
      document.problemForm.<%=Constants.MODULE%>.value=module;
      document.problemForm.submit();
    }
    function clear(inputItem) {
      inputItem.value='';
    }
</SCRIPT>

<jsp:include page="problemTimer.jsp">
  <jsp:param name="countDown" value="true"/>
</jsp:include>
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" toScope="page" property="problem"/>
<tc-webtag:useBean id="problemInfo" name="<%=Constants.PROBLEM%>" type="com.topcoder.web.codinginterface.techassess.model.ProblemInfo" toScope="page" />
<tc-webtag:useBean id="language" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" toScope="page" property="language"/>
<tc-webtag:useBean id="languages" name="<%=Constants.LANGUAGES%>" type="java.util.List" toScope="page" />

<SCRIPT type="text/javascript">
    var windowHandle = null;
    function openTestingWindow() {
      if(windowHandle && !windowHandle.closed) {
        windowHandle.focus();
        return;
      }
      var w = 500;
      var h = 300;
      var left = (screen.availWidth - w) / 2;
      var top = (screen.availHeight - h) / 2;
      windowHandle = window.open("<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_TEST_WINDOW%>&<%=Constants.COMPONENT_ID%>=<jsp:getProperty name="problemInfo" property="componentId"/>&<%=Constants.PROBLEM_TYPE_ID%>=<jsp:getProperty name="problemInfo" property="problemTypeId"/>", "", "statusbar=no,menubar=no,scrollbars=yes,resizable=yes,status=no,toolbar=no,width=" + w + ",height=" + h + ",screenX=" + left + ",screenY=" + top);
    }
</SCRIPT>


<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
         <jsp:param name="tabLev1" value="viewProblem"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="remaining"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT><img src="/i/corp/screening/clear.gif" alt=""/></td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>

                <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="post" name="problemForm" target="_top">
                    <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE%>"/>
                    <tc-webtag:hiddenInput name="<%=Constants.COMPONENT_ID%>" value="<%=String.valueOf(problemInfo.getComponentId())%>"/>
                    <tc-webtag:hiddenInput name="<%=Constants.PROBLEM_TYPE_ID%>" value="<%=String.valueOf(problemInfo.getProblemTypeId())%>"/>
                    <ci:argumentIterator problem="<%=prob%>" language="language">
                      <input type="hidden" name="<%=CodingInterfaceConstants.TEST_ARGUMENT+argumentIndex%>" value="" />
                    </ci:argumentIterator>

                    <table cellspacing=0 cellpadding=0 border=0 width="100%">
                       <tr>
                          <td align=left><span class=bodySmallTitle>Problem Statement</span></td>
                          <td align=right>
                          <strong>Choose your language:</strong>
                          <tc-webtag:listIterator id="language" list="languages" type="com.topcoder.shared.language.Language">
                            <tc-webtag:radioButton name="<%=Constants.LANGUAGE_ID%>" value="<%=String.valueOf(language.getId())%>" onClick='<%="JavaScript:doSubmit('"+Constants.RP_SAVE+"')"%>'/>&#160;<jsp:getProperty name="language" property="name"/>&#160;
                          </tc-webtag:listIterator>
                          </td>
                       </tr>
                    </table>
                           <br>

                    <table cellspacing=0 cellpadding=0 border=0 width="100%">
                       <tr>
                          <td align=left nowrap="nowrap"><strong>Class Name:&#160;&#160;</strong></td>
                          <td align=left width="50%"><jsp:getProperty name="problemInfo" property="className"/></td>
                          <td align=left nowrap="nowrap"><strong>Return Type:&#160;&#160;</strong></td>
                          <td align=left width="50%"><%=StringUtils.htmlEncode(problemInfo.getReturnType())%></td>
                       </tr>
                       <tr>
                          <td align=left nowrap="nowrap"><strong>Method Name:&#160;&#160;</strong></td>
                          <td align=left><jsp:getProperty name="problemInfo" property="methodName"/></td>
                          <td align=left nowrap="nowrap"><strong>Arg Types:&#160;&#160;</strong></td>
                          <td align=left><%=StringUtils.htmlEncode(problemInfo.getArguments())%></td>
                       </tr>
                    </table>
                           <br>

                    <iframe src="<jsp:getProperty name="sessionInfo" property="absoluteServletPath"/>?module=<%=Constants.RP_PROBLEM_STATEMENT%>&<%=Constants.MESSAGE_ID%>=<%=request.getParameter(Constants.MESSAGE_ID)%>" width="100%" height="200px" scrolling="auto" frameborder="1">
                    [Your user agent does not support frames or is currently configured not to display frames. However, you may visit <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=<%=Constants.RP_PROBLEM_STATEMENT%>&<%=Constants.MESSAGE_ID%>=<%=request.getParameter(Constants.MESSAGE_ID)%>" target="_top">the related document.</a>]
                    </iframe>

                    <br/><br/>
                    <p class=pL><span class=bigRed><%=StringUtils.checkNull((String)request.getAttribute(Constants.MESSAGE))%></span></p>
                    <p class=pL><span class=bodySmallTitle>Input Area</span></p>
                    <textarea class=codingArea name="<%=Constants.CODE%>" rows="20" cols="40" wrap="off"><jsp:getProperty name="problemInfo" property="code"/></textarea>

                    <br /><br />

                    <table cellspacing=0 cellpadding=0 border=0 class=codingButtons>
                       <tr>
<%--
                          <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonResize.gif" alt="" /></a></td>
                          <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonFind.gif" alt="" /></a></td>
                          <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonGoTo.gif" alt="" /></a></td>
--%>
                          <td><a href="JavaScript:doSubmit('<%=Constants.RP_SAVE%>')"><img src="/i/corp/screening/buttonSave.gif" alt="" /></a></td>
                          <td><a href="JavaScript:doSubmit('<%=Constants.RP_COMPILE%>')"><img src="/i/corp/screening/buttonCompile.gif" alt="" /></a></td>
                          <td><a href="JavaScript:openTestingWindow();"><img src="/i/corp/screening/buttonTest.gif" alt="" /></a></td>
                          <td><a href="JavaScript:clear(document.problemForm.<%=Constants.CODE%>);"><img src="/i/corp/screening/buttonClear.gif" alt="" /></a></td>
                          <td><a href="JavaScript:doSubmit('<%=Constants.RP_VIEW_PROBLEM_SET%>')"><img src="/i/corp/screening/buttonClose.gif" alt="" /></a></td>
                          <td><a href="JavaScript:doSubmit('<%=Constants.RP_SUBMIT%>')"><img src="/i/corp/screening/buttonSubmit.gif" alt="" /></a></td>
                       </tr>
                    </table>
                </form>
            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>