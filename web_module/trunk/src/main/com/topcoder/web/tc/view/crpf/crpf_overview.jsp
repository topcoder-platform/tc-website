<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<!-- TCO Header -->

<a name="top_page"></a>
<!--
            <object 
            type="application/x-shockwave-flash"
            data="/i/tournament/vcc03/vcc03.swf"
            width="100%"
            height="125"
            border="0">           
            <param name="movie" value="/i/tournament/vcc03/vcc03.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object>
-->
       <img src="/i/tournament/vcc03/vcc03.jpg" width="750" height="120" border="0"/>
       <area shape="rect" alt="TC" coords="1,1,243,85" href="/" />



<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">

<!-- Tab bar links-->
<jsp:include page="verizonLinks.jsp" >
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="verizonSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>



            <blockquote>
            <h2>The Best of the Best</h2>
            
            <p>Everyone knows that programmers from Chennai are the masters of software development. But who among them is the best? Verizon is on a mission to answer that question. 
            Through the Verizon Coding Challenge, top software developers will have a chance to showcase their skills, earn recognition as the top developers in Chennai 
            and win cash and other prizes.  
            </p>
            <p>If you want to raise your profile by besting your peers, then this is the event for you. Verizon has teamed with TopCoder, the leader in online and offline programming competitions 
            and skills assessment, to execute this exciting event. Verizon may use the results of this event for the purpose of finding new employees for their Chennai Center.
            </p>
            <p><span class="bodySubtitle">Choose Your Weapon</span><br />
            Use Java, C++, C# or VB.NET to compete. The event will allow developers to choose from these four important programming languages, with no particular 
            advantage given to any one language.
            </p>
            <p><span class="bodySubtitle">How It Works</span><br />
            The tournament is a timed contest allowing all participants to compete online to solve the same problems under the same time constraints. The contests are challenging and exciting for participants and 
            spectators. The format is simple:
            </p>
            <blockquote>
            <p><span class="bodySubtitle">Download the Arena</span><br />
            TopCoder's Competition Arena (a Java Applet) provides the interface to the competition. Here contestants will read the problem statements, code 
            solutions, compile and test those solutions and submit their code for points. Prior to the match, you can practice on many sample problems by downloading the arena ahead of time.
            </p>
            <p><span class="bodySubtitle">Coding Phase</span><br />
            At the designated date and time, competitors will enter the Arena just prior to "kick off". Competitors are placed in virtual rooms of 10 developers 
            per room. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution 
            in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tells the tale as competitors vie for the highest point total.
            </p>
            <p><span class="bodySubtitle">Challenge Phase</span><br />
            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through submitted code, with the hope that the results are not satisfied by the 
            software written. Breaking another developer's code is the most direct form of engaging competition for a programmer. In this phase, precious points 
            are awarded or taken away based on successful challenges. A penalty exists for an unsuccessful challenge.
            </p>
            <p><span class="bodySubtitle">System Tests</span><br />
            Within minutes of the end of the Challenge Phase, TopCoder will determine the accuracy of all submissions and award final points to all competitors. It 
            is the instant gratification of knowing winners, losers, statistics and one's own performance versus the field that makes TopCoder events unique and 
            captivating.
            </p>
            </blockquote>
            <p><span class="bodySubtitle">Can Your Skills Carry You to August 29th?</span><br />
            Registration for the Verizon Coding Challenge opens on August 4th and closes on August 15th, 2003.  Be sure to register early, as only the first 500 eligible individuals to
            register will be invited to compete in Round #1 which will be held at XXX on August 20th. 

            </p>
            <p>The competitors with the top 250 scores from the first round will advance to the second round on August 25th. The top 25 performers in the second round will be invited to 
            compete for the large cash prizes onsite at VDSI Chennai on August 29th.
            </p>
            
            <a name="sched"></a>
            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center">
                <tr>
                    <td class="sidebarTitle" width="25%">Date</td>
                    <td class="sidebarTitle" width="20%">Time</td>
                    <td class="sidebarTitle" width="40%">Status</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Monday, August 4</td>
                    <td class="sidebarText">XXX</td>
                    <td class="sidebarText">Registration Opens</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Friday, August 15</td>
                    <td class="sidebarText">XXX</td>
                    <td class="sidebarText">Registration Closes</td>
                </tr>
                
                <tr valign="top">
                    <td class="sidebarText">Wednesday, August 20</td>
                    <td class="sidebarText">XXX</td>
                    <td class="sidebarText">Round 1 - 500 participants</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Monday, August 25</td>
                    <td class="sidebarText">XXX</td>
                    <td class="sidebarText">Round 2 - 250 participants</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Friday, August 29</td>
                    <td class="sidebarText">XXX</td>
                    <td class="sidebarText">Championship - 25 participants</td>
                </tr>
            </table>
            
            <p><span class="bodySubtitle">Prizes</span><br />
            The 500 participants in Round 1 will receive a "Verizon Coding Challenge" t-shirt to wear with pride. The shirt will be a symbol 
            of your competitive spirit. You will be recognized as leaders in Chennai's software development community. Verizon will present 
            the top 25 finishers with a Certificate of Merit for outstanding performance in the tournament. The top four scorers 
            will receive the following cash prizes:
            </p>
            <p>
            1st Place - $1,000 USD<br />
            2nd Place - $500 USD<br  />
            3rd Place - $300 USD<br />
            4th Place - $100 USD</p>

            <p>To find out more detailed information about the Verizon Coding Challenge, including a list of the prizes, please read the <a href="/index?t=tournaments&amp;c=vcc03_rules_conditions">Terms and Conditions</a>. 
            </p>

            </blockquote>
            
            <p><br /></p>
                        
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/>
        </td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>