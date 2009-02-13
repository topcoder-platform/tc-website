<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 com.topcoder.web.codinginterface.techassess.model.ProblemSetInfo"%>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
<jsp:include page="problemSetTimer.jsp"/>
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<tc-webtag:useBean id="problemSets" name="<%=Constants.PROBLEM_SETS%>" type="java.util.List" toScope="page" />

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
         <jsp:param name="tabLev1" value="index"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="current"/>
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
            <p class=pL>
            <span class=bodyBigTitle>Welcome to the Testing Application.</span>
            <br /><br />
            This is the main room containing a number of problem sets as can be seen in the table below. Each problem set contains a number of problems for you to solve. For each problem set, you are given a certain amount of time, as can be seen in the Time Available column below.
            <br /><br />
            <span class=bodySmallTitle>Example Test</span><br />
            The first problem is presented as an example. The purpose of this problem is to acquaint you with the Testing Application. It is suggested that you start with this problem. The results of the example problem will not count toward your overall results.
            <br /><br />
            <span class=bodySmallTitle>Test Set A</span><br />
            (if presented) You have a total of 75 minutes to complete this set of 3 problems. Since your solution submissions will be timed, accuracy and speed are your main objectives.
            <br /><br />
            <span class=bodySmallTitle>Test Set B</span><br />
            (if presented) The total time allotted for this problem set can be seen in the Time Available column below. Although your solution submissions will be timed, accuracy and style are your main objectives.
            <br /><br />
            Click on an Enter button to open a problem set.
            <br /><br />
            </p>
            <table width="100%" cellspacing=0 cellpadding=0 class=tableFrame>
               <tr>
                  <td class=tableHeader>&#160;</td>
                  <td class=tableHeader>Tests</td>
                  <td class=tableHeader align=center>Complete/Quantity</td>
                  <td class=tableHeader>Description</td>
                  <td class=tableHeader>Test Status</td>
                  <td class=tableHeader align=right>Time Available</td>
               </tr>
               <tc-webtag:listIterator id="problem" list="problemSets">
                   <tr>
                      <td class=tableTextOdd><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_PROBLEM_SET%>&<%=Constants.PROBLEM_TYPE_ID%>=<jsp:getProperty name="problem" property="typeId"/>" target="_top"><img src="/i/corp/screening/buttonEnter.gif" alt="" /></a></td>
                      <td class=tableTextOdd><jsp:getProperty name="problem" property="name"/></td>
                      <td class=tableTextOdd align=center><jsp:getProperty name="problem" property="completedCount"/>/<jsp:getProperty name="problem" property="problemCount"/></td>
                      <td class=tableTextOdd><jsp:getProperty name="problem" property="description"/></td>
                      <td class=tableTextOdd><jsp:getProperty name="problem" property="status"/></td>
                      <td class=tableTextOdd align=right><span id="problemTimer<%=((ProblemSetInfo)problem).getProblems()[0].getComponentID()%>">Initializing</span></td>
                   </tr>
               </tc-webtag:listIterator>
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