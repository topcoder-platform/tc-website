<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder - Competition Instructions</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><a href="http://www.verizon.com/"><A href="http://www.verizon.com"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></A></a></td>
        <td class="red"><a name="top"><img alt="" src="/images/spacer.gif" width="1" height="37"></a></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Challenge" border="0"></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><A href="http://www.topcoder.com"><img src="/i/events/verizon2003/pbtc_secondary2.gif" width="134" height="37" alt="Contest Powered by TopCoder" border="0"></A></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/images/spacer.gif" width="10" height="1"></td>
   </tr>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="146" class="white" align="center"><img src="/i/events/verizon2003/ps_banner.jpg" width="146" height="61" border="0" alt="Verizon Coding Challenge">

                        <jsp:include page="verizon_links_secondary.jsp" />

                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" width="579"><img src="/i/clear.gif" width="574" height="10" border="0"/><br />
            <table width="427" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="427" class="bodyCopy">

<!-- Overview -->
                        <img src="../images/spacer.gif" width="425" height="4" alt><br/>
                        <a href="#contest" class="sidebarHeadLink">About the Contest</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#prizes" class="sidebarHeadLink">About the Prizes</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#conditions" class="sidebarHeadLink">Conditions of Participation</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="#other" class="sidebarHeadLink">Other</a>

                        <h2 class="pgTitle">Competition Instructions</h2>
            
                        

                        <p><strong>Loading the Competition Arena</strong><br/>
                        The Competition Arena is a Java Applet that requires the Java 1.4 runtime to be installed on your machine.  Load the application by clicking the 
                        Compete Now button at <a href="http//:www.topcoder.com">www.topcoder.com/verizon</a>.  Once you click the button, you will be notified if 
                        you need to upgrade your Java runtime.  
                        If so, please follow the steps of the installation wizard to upgrade your system.  If an upgrade is not required, the application will load automatically 
                        and present you with a red "Launch Competition Arena" button.</p>
                        
                        <p><strong>Logging in to the Competition Arena</strong><br/>
                        Once the Competition Arena launches, you will be presented with a login screen.  From here, you need simply type in your handle and the password that 
                        you chose during the registration process.  Once you log in, you will initially be placed in the main chat lobby.  Move to your assigned competition room as follows:
                        <ul>
                        <li>Click on the "Active Contests" menu item.</li>
                        <li>Select Verizon Coding Contest.</li></ul>
                        </p>

                        
                        <p><strong>The Competition Room</strong><br/>
                        From within the competition room, you will access the problem statements that you will attempt to solve during the Coding Phase. </p>
                        
                        
                        <p><strong>Coding Phase</strong><br/>
                        The Coding Phase is the period during which each contestant attempts to create solutions to three problem statements.  
                        In all rounds of the Verizon Coding Challenge, the Coding Phase will last 75 minutes.  When the competition begins, you may view the problem statements as follows:
                        <ul>
                        <li> Click on the drop-down box labeled "Select one"</li>
                        <li>Select the point value of the problem that you wish to solve</li></ul>
                        </p>
       
                        
                        <p>The higher the point value assigned, the more difficult the problem will be.  You may open the problems in any order.  You may have all 
                        problems open at the same time Ð but keep in mind that the timers for each problem will be counting down independent of other problems that 
                        may be open.  The points that you receive when you submit a problem are calculated based on elapsed coding time.  The faster that you can submit 
                        a solution for a problem, the more point you will receive.</p>
                        
                        <p>The Coding Phase will allow you to submit a problem more than once.  If you've already submitted a problem and you choose to submit again, 
                        your score for that submission will be adjusted to account for the additional lapsed time, as well as an additional penalty of 10% of the maximum 
                        point value for the problem.</p>
                        
                        <p>During the Coding Phase, the timer in the competition room window and the coding window will represent the amount of time left in the Coding Phase.</p>
                        
                        <p><strong>The Coding Window</strong><br/>
                        The coding window is the most important part of the Competition Arena.  It is in the coding window that the problem statement is shown, and the 
                        solutions are coded, compiled, tested, and submitted.</p>
                        
                        <dl>
                        <dt>The Problem Statement</dt>
                        <dd>The top pane of the coding window contains the problem statement in its entirety.  The problem statement explains exactly what it is that you are 
                        attempting to accomplish.  It includes an explanation of the task, the class and method definitions that your solution must adhere to, all of the constraints 
                        for any input parameters, and examples to help clarify the statement. </dd>
                        
                        <dt>Choosing a Language</dt>
                        <dd>The Verizon Coding Challenge allows coders to utilize Java, C++, C#, or VB.NET as a competition programming language.  You have the option to 
                        choose a programming language on a problem-by-problem basis.  It is legal for you to use two different programming languages to solve different 
                        problems in a single competition.  For this reason, you have the option of choosing the programming language from within the coding window.  You can 
                        find the language selection area in the upper right area of the coding window Ð under "Choose your language". Remember to select the appropriate language 
                        before you attempt to compile your code.  Strange compilation results can be a symptom of having the wrong language selected.</dd>
                        
                        <dt>Creating a Solution</dt>
                           <dd>The solution class you create and all of its members must be defined as public in order for the TopCoder servers to have access to your class members 
                           and invoke the appropriate methods.  Below you will find code templates for Java, C++, C# and VB.NET:</dd>
                           
                           <dt>Java Code Template</dt>
                           </dl>

                        


                        <p><img src="/i/clear.gif" width="427" height="20" border="0"/></p>
                    </td>
                    
<!-- Gutter Begins -->
                    <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <jsp:include page="verizon_right.jsp" />
<!-- Right Column Ends -->

                </tr>
            </table>
        </td>
   </tr>
</table>

<!-- Footer Begins -->
    <jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>
