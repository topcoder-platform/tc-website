<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Verizon Coding Contest Powered by TopCoder</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" bgcolor="#000000" rowspan="2" valign="top"><img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="140" border="0"/></td>

<!-- Top Nav-->
        <td class="black" width="588">
        <td class="black"><img alt="" src="/images/spacer.gif" width="1" height="41"></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td bgcolor="#CC0001" width="589" height="99" colspan="2" valign="top">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="440" height="99" colspan=2 valign="top" align="right" background="/i/events/verizon2003/vcc03_logo.jpg">
		<img src="/i/events/verizon2003/banner_angle.gif" alt="" width="30" height="99"></td>
                <td width="146" height="99" valign="middle"><img src="/i/events/verizon2003/pbtc.gif" alt="Contest Powered by TopCoder" height="34" width="146" border="0"></td>
            </tr>
        </table>
      </td>
   </tr>

<!-- Top Bar -->
    <tr>
        <td width="147" class="black"><img src="/i/clear.gif" alt="" width="18" height="1"><br/></td>
        <td width="100%" class="black" colspan="2">
            <table border="0" cellpadding="0" cellspacing="0" width="600">
                <tr>
		<td width="15"><img src="/i/clear.gif" alt="" width="15" height="20"></td>
		<td width="221" style="padding-left:1px;"><img src="/i/clear.gif" height="2" width="178" border="0" alt=""><br/><a href="http://www22.verizon.com/progress/" onMouseOver="document.makeprogress.src='/i/events/verizon2003/make_progress_hmov.gif'; "onMouseOut="document.makeprogress.src='/i/events/verizon2003/make_progress_hm.gif';"><img src="/i/events/verizon2003/make_progress_hm.gif" border="0" width="178" height="17" alt="Make progress every day" name="makeprogress" id="makeprogress"></a></td>
		<td width="221" class="tableHead">&nbsp;</td>
		<td width="143"><img src="/i/clear.gif" alt="" width="143" height="20"></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" class="dkGrey" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="11" class="dkGrey">
                <tr>
                    <td width="124" class="white" align="center"><img src="/i/events/verizon2003/contestlinks.gif" width="124" height="19" border="0" alt="Contest Links">

                        <jsp:include page="verizonLinks.jsp" />

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

                        <h2 class="pgTitle">The Best of the Best</h2>

                        <table width="427" border="0" cellpadding="0" cellspacing="0">
                            <tr valign="bottom">
                                <td width="427" class="bodyCopy">
                                    <img src="/i/events/verizon2003/photo_home.jpg" alt="Photo" width="170" height="159" align="right">
                                    <p>Everyone knows that programmers from Chennai are the masters of software development. But who among them is the best? 
                                    Verizon is on a mission to answer that question. Through the Verizon Coding Challenge, top software developers will have a 
                                    chance to showcase their skills, earn recognition as the top developers in Chennai and win cash and other prizes.<br/><br/>

                                    If you want to raise your profile by besting your peers, then this is the event for you. Verizon has teamed with TopCoder, 
                                    the leader in online and offline programming competitions and skills assessment, to execute this exciting event. Verizon may 
                                    use the results of this event for the purpose of finding new employees for their Chennai Center.</p>
                                </td>
                            </tr>
                        </table>

                        <p><span class="bodySubtitle">Choose Your Weapon</span><br />
                        Use Java, C++, C# or VB.NET to compete. The event will allow developers to choose from these four important programming languages, with no particular
                        advantage given to any one language.</p>

                        <p><span class="bodySubtitle">How It Works</span><br />
                        The tournament is a timed contest allowing all participants to compete online to solve the same problems under the same time constraints. The tournaments are challenging and exciting for participants and
                        spectators. The format is simple:</p>

                        <ul>
                            <li><strong>Download the Arena</strong><br />
                            TopCoder's Competition Arena (a Java Applet) provides the interface to the competition. Here participants will read the problem statements, code
                            solutions, compile and test those solutions and submit their code for points. Prior to the match, you can practice on sample problems by downloading the arena ahead of time.</li>

                            <li><strong>Coding Phase</strong><br />
                            At the designated date and time, competitors will enter the Arena just prior to "kick off". Competitors are placed in virtual rooms of 10 developers
                            per room. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution
                            in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tells the tale as competitors vie for the highest point total.</li>

                            <li><strong>Challenge Phase</strong><br />
                            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through submitted code, with the hope that the results are not satisfied by the
                            software written. Breaking another developer's code is the most direct form of engaging competition for a programmer. In this phase, precious points
                            are awarded or taken away based on successful challenges. A penalty exists for an unsuccessful challenge.</li>

                            <li><strong>System Tests</strong><br />
                            Within minutes of the end of the Challenge Phase, TopCoder will determine the accuracy of all submissions and award final points to all competitors. It
                            is the instant gratification of knowing winners, losers, statistics and one's own performance versus the field that makes TopCoder events unique and
                            captivating.</li>
                        </ul>

                        <p><span class="bodySubtitle">Can Your Skills Carry You to November 7th?</span><br />
                        Registration for the Verizon Coding Challenge opens on October 27th and closes on October 30th, 2003.  Be sure to register early, as only the first 500 eligible individuals to
                        register will be invited to compete in Round #1 which will be held at 8:00 pm IST (GMT + 5:30) on October 31st.</p>

                        <p>The competitors with the top 250 scores from the first round will advance to the second round on November 3rd. The top 25 performers in the second round will be invited to
                        compete for the large cash prizes onsite at VDSI Chennai on November 7th.</p>

                        <a name="sched"></a>
                        <table border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center">
                            <tr>
                                <td class="sidebarTitle">Date</td>
                                <td class="sidebarTitle">Time</td>
                                <td class="sidebarTitle">Status</td>
                            </tr>
                            
                            <tr valign="top">
                                <td class="sidebarText">Monday, October 27</td>
                                <td class="sidebarText">7:00 am</td>
                                <td class="sidebarText">Registration Opens</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Thursday, October 30</td>
                                <td class="sidebarText">10:00 pm</td>
                                <td class="sidebarText">Registration Closes</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Friday, October 31</td>
                                <td class="sidebarText">7:00 pm</td>
                                <td class="sidebarText">Round 1 - 500 participants</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Monday, November 3</td>
                                <td class="sidebarText">7:00 pm</td>
                                <td class="sidebarText">Round 2 - 250 participants</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Friday, November 7</td>
                                <td class="sidebarText">6:00 pm</td>
                                <td class="sidebarText">Championship - 25 participants</td>
                            </tr>
                        </table>

                        <p><span class="bodySubtitle">Prizes</span><br />
                        The 500 participants in Round 1 will receive a "Verizon Coding Challenge" t-shirt to wear with pride. The shirt will be a symbol
                        of your competitive spirit. You will be recognized as leaders in Chennai's software development community. Verizon will present
                        the top 25 finishers with a Certificate of Merit for outstanding performance in the tournament. The top four scorers
                        will receive the following cash prizes:</p>

                        <p>1st Place - Rs. 50,000<br />
                        2nd Place - Rs. 30,000<br/>
                        3rd Place - Rs. 20,000<br/>
                        4th Place - Rs. 10,000</p>

                        <p>To find out more detailed information about the Verizon Coding Challenge, including a list of the prizes, please read
                        the <a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules">Terms and Conditions</a>.</p>

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