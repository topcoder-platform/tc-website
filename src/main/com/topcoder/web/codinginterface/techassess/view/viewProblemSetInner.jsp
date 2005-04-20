<%@ page import="com.topcoder.web.codinginterface.techassess.Constants,
                 java.util.List,
                 java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
<jsp:include page="problemTimer.jsp">
  <jsp:param name="countDown" value="false"/>
</jsp:include>
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<tc-webtag:useBean id="probs" name="<%=Constants.PROBLEMS%>" type="java.util.List" toScope="page" />
<tc-webtag:useBean id="problemType" name="<%=Constants.PROBLEM_TYPE_ID%>" type="java.lang.Integer" toScope="page" />
<tc-webtag:useBean id="continueLink" name="<%=Constants.CONTINUE_LINK%>" type="java.lang.String" toScope="page" />
<tc-webtag:useBean id="continueDesc" name="<%=Constants.CONTINUE_DESC%>" type="java.lang.String" toScope="page" />

<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>


<%-- TABS --%>
      <jsp:include page="tabs.jsp" >
         <jsp:param name="tabLev1" value="viewProblemSet"/>
      </jsp:include>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="set_remaining"/>
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
            <% if (problemType.intValue()==Constants.TEST_SET_A_ID) { %>
                <p class=pL>
                <span class=bodyBigTitle>Test Set A Directions</span>
                <br /><br />
                <span class=bodySmallTitle>Test Set A Problem</span><br />
                   In the table below, there is a list of problems. The list is
                   sorted according to difficulty, starting with the easiest.
                   Your objective is to solve each problem as quickly as possible.
                   The maximum time for this problem set is displayed as Time Remaining
                   at the top right corner of this window.
                <br /><br />
                <b>The time starts ticking when you open a problem in this problem set!</b>
                <br /><br />
                   Time is also tracked by problem. The timer will start when the problem is opened
                   and it will stop when the solution is submitted.  Clicking an Open button will
                   display a window containing the problem description and an editor.
                <br /><br />
                   Once you've opened a problem, if a specific language is not mandated, choose the
                   language that you will use to code your solution. Once you choose the language, read through
                   the problem statement and begin coding your solution.
                <br /><br />
                   When you have completed Test Set A, either click the Main button at the top of this
                   window to return to the Main room or click the Continue button at the bottom of
                   the window to proceed to Test Set B. For more help, click the Help button at the top of this window.
                <br /><br />

            <% } else if (problemType.intValue()==Constants.TEST_SET_B_ID) { %>

                <p class=pL>
                <span class=bodyBigTitle>Test Set B Directions</span>
                <br /><br />
                <span class=bodySmallTitle>Test Set B Problem</span><br />
                   In the table below there is a list of problems.  The total time allotted
                   for this problem set can be seen in the Time Remaining box in the upper
                   right corner of this screen.  Although your solution submissions will
                   be timed, accuracy and style are your main objectives.
                <br /><br />
                <b>The time starts ticking when you open a problem in this problem set!</b>
                <br /><br />
                   Time is also tracked by problem. The timer will start when the problem
                   is opened and it will stop when the solution is submitted.  Clicking
                   an Open button will display a window containing the problem description and an editor.
                <br /><br />
                   Once you've opened a problem, if a specific language is not mandated, choose the
                   language that you will use to code your solution. Once you choose the language, read through
                   the problem statement and begin coding your solution.
                <br /><br />
                   When you have completed Test Set B, either click the Main button at the top of this window
                   to return to the Main room, or click the Logout Button at the top of this window if you
                   have completed all portions of the Testing Application.  For more help, click the
                   Help Manual button at the top of this window.
                <br /><br />

            <% } else if (problemType.intValue()==Constants.EXAMPLE_ID) { %>
                <p class=pL>
                <span class=bodyBigTitle>Example Directions</span>
                <br /><br />
                <span class=bodySmallTitle>Example Problem</span><br />
                In the table below there is an example problem. The example problem is designed to acclimate you with the system. Your solution to the example problem will not count toward your final results. You should open the problem statement and code, compile and test your solution. The purpose of this problem is to familiarize yourself with the Testing Application and its different options. Please be sure to submit your solution when it is complete.
                <br /><br />
                Clicking the Open button will display a window containing the problem description and an editor.
                <br /><br />
                Once you've opened a problem, if a specific language is not mandated, choose the language that you will use to code your solution. Once you choose the language, read through the problem statement and begin coding your solution.
                <br /><br />
                When you are finished with this problem, either click the Main button at the top of this window to return to the Main room or click the Continue button at the bottom of the window to proceed to the next assigned Test Set. For more help, click the Help Manual button at the top of this window.
                <br /><br />
            <% } %>



            <table width="100%" cellspacing=0 cellpadding=0 class=tableFrame>
               <tr>
                  <td class=tableHeader>&#160;</td>
                  <td class=tableHeader50>Problem</td>
                  <td class=tableHeader50>Coding Status</td>
                  <td class=tableHeader align=center>Coding Time</td>
               </tr>
               <tc-webtag:listIterator id="problem" list="probs">
                   <tr>
                      <td class=tableTextOdd><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=<%=Constants.RP_VIEW_PROBLEM%>&<%=Constants.PROBLEM_TYPE_ID%>=<%=problemType%>&<%=Constants.COMPONENT_ID%>=<jsp:getProperty name="problem" property="componentId"/>" target="_top"><img src="/i/corp/screening/buttonOpen.gif" alt="" /></a></td>
                      <td class=tableTextOdd><jsp:getProperty name="problem" property="className"/></td>
                      <td class=tableTextOdd><jsp:getProperty name="problem" property="statusDesc"/></td>
                      <td class=tableTextOdd align=center><span class=bigRed id="problemTimer<jsp:getProperty name="problem" property="componentId"/>">Initializing</span></td>
                   </tr>
                </tc-webtag:listIterator>
            </table>
            <br>

<%-- IF LAST PROBLEM SET, "CONTINUE" GOES TO MAIN, OTHERWISE IT GOES TO NEXT SET --%>
            <table width="100%" cellspacing=0 cellpadding=0>
               <tr>
                  <td class=bodyCell100 align=right>Click the continue button to <%=continueDesc%>&#160;&#160;</td>
                  <td align=right><a href="<%=continueLink%>" target="_top"><img src="/i/corp/screening/buttonContinue.gif" alt=""/></a></td>
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