<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%@ page errorPage="/errorPage.jsp" %>

<html>

<head>

<title>Testing Environment</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

</head>

<body id="testApplet" onLoad="focus()">

<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td rowspan="2"><img border="0" height="54" width="10" src="/i/testHeadTopLeft.gif" alt=""></td>
        <td id="testHead"><img alt="0" border="0" height="36" width="114" src="/images/clear.gif"></td>
        <td id="testHead" width="100%"><img alt="0" border="0" height="36" width="10" src="/images/clear.gif"></td>
        <td align="right"><img border="0" height="36" width="171" src="/i/testHeadTCLogo.gif" alt="TopCoder"></td>
        <td rowspan="2"><img alt="0" border="0" height="54" width="10" src="/i/testHeadTopRight.gif" alt=""></td>
      </tr>

    <tr>
        <td align="left"><img border="0" height="18" width="114" src="/i/testHeadTabLeft.gif" alt=""></td>
        <td width="100%"><img border="0" alt="" height="18" width="10" src="/images/clear.gif"></td>
        <td align="right"><img src="/images/clear.gif" height="18" width="171" alt="" border="0"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/testTitleLeft.gif" alt=""></td>
        <td background="/i/testTitleBkgd.gif"><img alt="Help Manual" border="0" height="45" width="155" src="/i/testHelpManual.gif"></td>
        <td background="/i/testTitleBkgd.gif" width="100%"><img alt="0" border="0" height="45" width="10" src="/images/clear.gif"></td>
        <td background="/i/testTitleBkgd.gif"><img border="0" height="45" width="10" src="/i/testTitleRight.gif" alt=""></td>
      </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td><img border="0" alt="" height="15" width="10" src="/images/clear.gif"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%" id="testBody">
    <tr>
        <td><img src="/i/testBodyTopLeft.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td background="/i/testBodyTop.gif" width="100%"><img src="/i/clear.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td><img src="/i/testBodyTopRight.gif" alt="" width="10" height="10" alt="0" border="0"></td>
    </tr>
      
    <tr>
        <td background="/i/testBodyLeft.gif" width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" align="center">
            <table border="0" cellpadding="0" cellspacing="10" width="25%" align="left">
                <tr>
                    <td class="helpNav">

<!-- Help Nav begins -->
                        <jsp:include page="helpLeft.jsp" >
                            <jsp:param name="selected" value="steps"/>
                        </jsp:include>
<!-- Help Nav ends -->

                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="10" width="75%">
                <tr>
                    <td class="bodyText">
                        <h1 class="bodyTitle">Perform the Following Steps</h1>
                        
                        <p>This section outlines the steps that you need to perform in order to access and use the Testing Application.  Please use these 
                        steps to guide you through the process.  Additional information about specific area in the Testing Application can be found later 
                        in the manual.</p>

                        <p><strong>Step 1 – Loading the Application</strong></p>
                        <ul>
                            <li>Load the Testing Application by going to the URL provided in the email from the Employer.  For more information click here.</li>
                        </ul>
                        
                        <p><strong>Step 2 – Launching the Application</strong></p>
                        <ul>
                            <li>Click on the Launch Testing Application button.
                                <ul>
                                    <li>If a button that says Launch Testing Application does not appear, then you do not have the Java 1.4 runtime installed.  For 
                                    additional information on installing the Java 1.4 runtime, click here.</li>
                                </ul>
                            </li>
                        </ul>
                        
                        <p><strong>Step 3 - Login</strong></p>
                        <ul>
                            <li>Login using the login name and password provided to you in the email from the Employer.</li>
                        </ul>
                        
                        <p><strong>Step 4 – Welcome Screen</strong></p>
                        <ul>
                            <li>The Welcome Screen of the Testing Application contains explanatory information about each phase of the Application.  
                            Please read it thoroughly.</li>
                        </ul>
                        
                        <p><strong>Step 5 – Example Problem Set</strong></p>
                        <ul>
                            <li>Start with the Example Problem.</li>
                            <li>Click on the button labeled “Enter” next to the Example Set in the lower part of your screen.</li>
                            <li>Read through the introductory text on the screen.</li>
                            <li>Next, click the “Open” button next to the Problem Name.
                                <ul>
                                    <li>Once you click the “Open” button, a coding window will pop up on your screen.  For additional information on the coding 
                                    window, click here.</li>
                                    <li>Solving the example problem will provide you with an opportunity to acclimate yourself with how the Application works 
                                    and what you’ll be asked to do during the two testing phases.</li>
                                </ul>
                            </li>
                            <li>Once you are comfortable with the system functionality, click the “Continue” button at the bottom of the screen.
                                <ul>
                                    <li>Clicking “Continue” will be move you to the first portion of the test – Test Set A.  Clicking the “Main” button on the 
                                    menu, then Test Set A from the Main page will also bring you to Test Set A.</li>
                                </ul>
                            </li>
                        </ul>
                        
                        <p><strong>Step 6 – Test Set A</strong></p>
                        <ul>
                            <li>Test Set A marks the start of your test.</li>
                            <li>The problems in this test will be similar in nature to the example problem.</li>
                            <li>Test Set A is made up of 3 algorithmic problems for you to solve in 75 minutes. 
                                <ul>
                                    <li>The objective of this test is to submit accurate solutions as quickly as possible.</li>
                                </ul>
                            </li>
                            <li>Once you open one of the problems the Timer will start counting down.</li>
                            <li>Proceed to Test Set B by clicking the “Continue” button when one of the following is true:
                                <ul>
                                    <li>You have submitted solution to all 3 problems in Test Set A.</li>
                                    <li>You feel as though you have solved as many problems as possible.</li>
                                    <li>Your 75 minutes have expired.</li>
                                </ul>
                            </li>
                        </ul>
                        
                        <p><strong>Step 7 – Test Set B (if presented)</strong></p>
                        <ul>
                            <li>Test Set B is an optional Test that the Employer may or may not have assigned for you to take.  If you do not see Test Set B 
                            on the Main page, then proceed to Step 8.</li>
                            <li>Test Set B contains at least one algorithmic problem that you are asked to solve.</li>
                            <li>You have 60 minutes to solve each problem presented in Test Set B. 
                                <ul>
                                    <li>The object of this test is to submit accurate solutions while focusing on code readability and style.</li>
                                </ul>
                            </li>
                            <li>Click the “Continue” button when one of the following is true:
                                <ul>
                                    <li>You have submitted all of the problems presented in Test Set B.</li>
                                    <li>You feel as though you have solved as many problems as possible.</li>
                                    <li>Your allotted time has expired.</li>
                                </ul>
                            </li>
                        </ul>
                        
                        <p><strong>Step 8 – Finishing Up</strong></p>
                        <ul>
                            <li>Congratulations!  You are done! Once you have completed all sections of the Application, you can logout.</li>
                        </ul>
                    </td>
                </tr>
            </table>
        </td>
        <td  background="/i/testBodyRight.gif" width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
    </tr>
      
    <tr>
        <td width="10"><img src="/i/testBodyBottomLeft.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" background="/i/testBodyBottom.gif"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="10"><img src="/i/testBodyBottomRight.gif" alt="" width="10" height="10" border="0"></td>
    </tr>
</table>
      
</div>

</body>
</html>
