<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="/css/screening.css" >
</head>
<body>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<table class=bodyCenter cellspacing=0 cellpadding=0>
   <tr>
      <td align=center>

<%-- TITLE/CLOCK --%>
      <jsp:include page="time.jsp" >
         <jsp:param name="timer" value="off"/>
      </jsp:include>

      <table cellspacing=0 cellpadding=0 class=bodyTable>
         <tr>
            <td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
            <td class=bodyT colspan=2><img src="/i/corp/screening/clear.gif" alt=""/></td>
            <td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
         </tr>
         <tr>
            <td class=bodyL>&#160;</td>
<%-- LEFT NAV --%>
            <td class=bodyNav>
            <jsp:include page="helpLeft.jsp" >
                <jsp:param name="selected" value="steps"/>
            </jsp:include>
            </td>

<%-- CONTENT --%>
            <td class=bodyContent>

            <p class=pL>
            <span class=bodyBigTitle>Perform the Following Steps</span>
            <br /><br />

                        This section outlines the steps that you need to perform in order to access and use the Technical Assessment Application.  Please use these
                        steps to guide you through the process.  Additional information about specific areas in the Technical Assessment Application can be found later
                        in the manual.
                        <br><br>

                        <span class="bodySmallTitle"><strong>Step 1 - Loading the Application</strong></span><br>
                        <ul>
                            <li>Load the Technical Assessment Application by going to the URL provided in the email from the Employer.</li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 2 - Login</strong></span><br>
                        <ul>
                            <li>Login using the login name and password provided to you in the email from the Employer.</li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 3 - Welcome Screen</strong></span><br>
                        <ul>
                            <li>The Welcome Screen of the Technical Assessment Application contains explanatory information about each phase of the Application.
                            Please read it thoroughly.</li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 4 - Example Problem Set</strong></span><br>
                        <ul>
                            <li>Start with the Example Problem.</li>
                            <li>Click on the button labeled <strong>Enter</strong> next to the Example Set in the lower part of your screen.</li>
                            <li>Read through the introductory text on the screen.</li>
                            <li>Next, click the <strong>Open</strong> button next to the Problem Name.
                                <ul>
                                    <li>Once you click the <strong>Open</strong> button, a <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=codingWindow">coding window</a> will pop up on your screen.</li>
                                    <li>Solving the example problem will provide you with an opportunity to acclimate yourself with how the Application works
                                    and what you'll be asked to do during the two testing phases.</li>
                                </ul>
                            </li>
                            <li>Once you are comfortable with the system functionality, click the <strong>Continue</strong> button at the bottom of the screen, which
                            will move you to the live portion of the test.</li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 5 - Test Set A (if presented)</strong></span><br>
                        <ul>
                            <li>The problems in this test will be similar in nature to the example problem.</li>
                            <li>Test Set A is made up of 3 algorithmic problems for you to solve in 75 minutes.
                                <ul>
                                    <li>The objective of this test is to submit accurate solutions as quickly as possible.</li>
                                </ul>
                            </li>
                            <li>Once you open one of the problems the <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=Static&d1=help&d2=timer">Timer</a> will start counting down.</li>
                            <li>Proceed to Test Set B (if presented) by clicking the <strong>Continue</strong> button when one of the following is true:
                                <ul>
                                    <li>You have submitted solutions to all 3 problems in Test Set A.</li>
                                    <li>You feel as though you have solved as many problems as possible.</li>
                                    <li>Your 75 minutes have expired.</li>
                                </ul>
                            </li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 6 - Test Set B (if presented)</strong></span><br>
                        <ul>
                            <li>Test Set B contains at least one algorithmic problem that you are asked to solve.</li>
                            <li>You are given 60 minutes to complete each problem in this set. For example, if there are 3 problems
                             assigned, you have a total of 180 minutes to solve all 3 problems, but you must solve each problem within 60 minutes.
                                <ul>
                                    <li>The object of this test is to submit accurate solutions while focusing on code readability and style.</li>
                                </ul>
                            </li>
                            <li>Click the <strong>Continue</strong> button when one of the following is true:
                                <ul>
                                    <li>You have submitted solutions to all of the problems presented in Test Set B.</li>
                                    <li>You feel as though you have solved as many problems as possible.</li>
                                    <li>Your allotted time has expired.</li>
                                </ul>
                            </li>
                        </ul>

                        <span class="bodySmallTitle"><strong>Step 7 - Finishing Up</strong></span><br>
                        <ul>
                            <li>Congratulations!  You are done! Once you have completed all sections of the Application, you can logout.</li>
                        </ul>
            </p>

            </td>
            <td class=bodyR>&#160;</td>
         </tr>
         <tr>
            <td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
            <td class=bodyB colspan=2>&#160;</td>
            <td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
         </tr>
      </table>


      </td>
   </tr>
</table>

</body>
</html>