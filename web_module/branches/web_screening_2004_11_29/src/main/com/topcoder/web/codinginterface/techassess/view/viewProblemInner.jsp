<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<tc-webtag:useBean id="prob" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.problem.Problem" scope="page" property="problem"/>
<tc-webtag:useBean id="language" name="<%=Constants.PROBLEM%>" type="com.topcoder.shared.language.Language" scope="page" property="language"/>
<tc-webtag:useBean id="languages" name="<%=Constants.LANGUAGES%>" type="java.util.List" scope="page" />


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
            <td class=bodyT>&#160;</td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- CONTENT --%>
            <td class=bodyContent>

            <table cellspacing=0 cellpadding=0 border=0 width="100%">
               <tr>
                  <td align=left><span class=bodySmallTitle>Problem Statement</span></td>
                  <td align=right>
                  Choose your language:
                  <tc-webtag:listIterator id="language" list="languages" type="com.topcoder.shared.language.Language">
                    <input type="radio" name="<%=Constants.LANGUAGE_ID%>" value="<jsp:getProperty name="language" property="id"/>">&#160;<jsp:getProperty name="language" property="name"/>&#160;
                  </tc-webtag:listIterator>
                  </td>
               </tr>
            </table>

            <iframe src="/i/corp/screening/probState.html" width="100%" height="200px" scrolling="auto" frameborder="1">
            [Your user agent does not support frames or is currently configured not to display frames. However, you may visit <a href="/i/corp/screening/probState.html" target="_top">the related document.</a>]
            </iframe>

            <br/><br/>
            <p class=pL><span class=bodySmallTitle>Input Area</span></p>
            <textarea class=codingArea name="code" rows="20" cols="40" wrap="off">
              <tc-webtag:problemStatement problem="<%=prob%>" language="<%=language.getName()%>"/>
            </textarea>

            <br /><br />

            <table cellspacing=0 cellpadding=0 border=0 class=codingButtons>
               <tr>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonResize.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonFind.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonGoTo.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonSave.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonCompile.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonTest.gif" alt="" /></a></td>
                  <td><a href="/mockup/codingRoom.jsp" target="_top"><img src="/i/corp/screening/buttonClear.gif" alt="" /></a></td>
                  <td><a href="/mockup/exampleDirections.jsp" target="_top"><img src="/i/corp/screening/buttonClose.gif" alt="" /></a></td>
                  <td><a href="/mockup/exampleDirections.jsp" target="_top"><img src="/i/corp/screening/buttonSubmit.gif" alt="" /></a></td>
               </tr>
            </table>

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