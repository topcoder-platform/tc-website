<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder</title>

<jsp:include page="../script.jsp" />

<script type="text/javascript" language="javascript">

var agt=navigator.userAgent.toLowerCase();
 var appVer = navigator.appVersion.toLowerCase();
 var is_minor = parseFloat(appVer);
 var is_major = parseInt(is_minor);

 var iePos = appVer.indexOf('msie');
 if (iePos !=-1) {
   is_minor = parseFloat(appVer.substring(iePos+5,appVer.indexOf(';',iePos)));
   is_major = parseInt(is_minor);
 }
 var is_opera = (agt.indexOf("opera") != -1);

 var is_konq = false;
 var kqPos = agt.indexOf('konqueror');
 if (kqPos !=-1) {
   is_konq = true;
 }
 var is_safari = ((agt.indexOf('safari')!=-1)&&(agt.indexOf('mac')!=-1))?true:false;

 var is_khtml = (is_safari || is_konq);
 var is_moz = ((agt.indexOf('mozilla/5')!=-1) && (agt.indexOf('spoofer')==-1) &&  (agt.indexOf('compatible')==-1) && (agt.indexOf('opera')==-1) &&  (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1) &&  (is_gecko) && ((navigator.vendor=="")||(navigator.vendor=="Mozilla")));
 var is_nav = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1) && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1) && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1) && (!is_khtml) && (!(is_moz)));
 var is_nav5up = (is_nav && is_minor >= 5);
 var is_ie = ((iePos!=-1) && (!is_opera) && (!is_khtml));
 var is_ie4 = (is_ie && is_major == 4);
 var is_ie4up = (is_ie && is_minor >= 4);
 var is_ie5up = (is_ie && is_minor >= 5);
 var is_ie5_5up =(is_ie && is_minor >= 5.5);
 var is_win = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );
 var is_mac = (agt.indexOf("mac")!=-1);
 if (is_mac) { is_win = !is_mac; } var is_Flash = false;
 var is_FlashVersion = 0;
 if ((is_nav||is_opera||is_moz)|| (is_mac&&is_ie5up)) {
   var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"] &&  navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
 if (plugin) {
   is_Flash = true;
   is_FlashVersion = parseInt(plugin.description.substring(plugin.description.indexOf(".")-1));
 }
 if (is_win&&is_ie4up){ document.write( '' + '\n' + 'Dim hasPlayer, playerversion' + '\n' + 'hasPlayer = false' + '\n' + 'playerversion = 10' + '\n' + 'Do While playerversion > 0' + '\n' + 'On Error Resume Next' + '\n' + 'hasPlayer = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & playerversion)))' + '\n' + 'If hasPlayer = true Then Exit Do' + '\n' + 'playerversion = playerversion - 1' + '\n' + 'Loop' + '\n' + 'is_FlashVersion = playerversion' + '\n' + 'is_Flash = hasPlayer' + '\n' + '<\/sc' + 'ript>' ); } var isBestClient = false;
 if (is_ie5_5up&&(is_FlashVersion >=5)) { isBestClient = true; }



var style="pc";
if (is_mac){style = "mac_ns4"
	if (is_ie5up)
		style="mac_ie"
	if (is_ie4)
		style="mac_ie4"}
else { if (is_nav) {
	if (is_nav5up)
		style+="ns6"
	else
		style+="ns4"}}
        alert(style);
var finalstyle = '<link rel="stylesheet" type="text/css" href="/css/verizon/vcc_' + style + '.css">';
document.write(finalstyle);
</script>
</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" bgcolor="#000000" rowspan="2" valign="top"><img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="140" border="0"/></td>

<!-- Top Nav-->
        <td valign="top" class="black" width="588">
            <table width="588" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="1" class="red"><img src="/i/clear.gif" alt="" width="1" height="1"></td>
                </tr>
            </table>
        </td>
        <td class="black"><img alt="" src="/images/spacer.gif" width="1" height="1"><br/></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td bgcolor="#CC0001" width="589" height="99" colspan="2" valign="top">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="440" height="99" colspan=2 valign="top" align="right" background="/i/home_banner_set1.jpg">
		<img src="/i/events/verizon2003/vcc03_logo.gif" alt="Verizon Coding Contest" width="440" height="99"></td>
                <td width="109" height="99" valign="middle"><img src="/i/events/verizon2003/pbtc.gif" alt="Powered by TopCoder" height="99" width="109" border="0"></td>
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
		<td width="221" style="padding-left:1px;"><img src="/i/clear.gif" height="2" width="178" border="0" alt=""><br/><a href="/progress/" onclick="logWtl('http://www22.verizon.com/progress/HPHH','http://www22.verizon.com/','Make Progress Every Day');" onMouseOut="restore();" onMouseOver="swap(document.makeprogress,'/i/make_progress_hmov.gif');"><img src="/i/make_progress_hm.gif" border="0" width="178" height="17" alt="Make progress every day" name="makeprogress" id="makeprogress"></a></td>
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
        <td valign="top" class="dkGrey" width="147">
            <table width="147" border="0" cellpadding="10" cellspacing="0">
                <tr>
                    <td width="127" class="white"><img src="/i/clear.gif" width="127" height="1" border="0"/>
                        <table width="127" border="0" cellpadding="0" cellspacing="5">
                            <tr>
                                <td width="127" class="leftnav" valign="top">
                                    <jsp:include page="verizonLinks.jsp" >
                                        <jsp:param name="selectedTab" value="overview"/>
                                        <jsp:param name="selectedSubtab" value=""/>
                                    </jsp:include>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" class="bodyCopy" width="579">
            <img src="/i/clear.gif" width="574" height="10" border="0"/><br />

            <h2 class="pgTitle">The Best of the Best</h2>

            <p>Everyone knows that programmers from Chennai are the masters of software development. But who among them is the best? Verizon is on a mission to answer that question.
            Through the Verizon Coding Challenge, top software developers will have a chance to showcase their skills, earn recognition as the top developers in Chennai
            and win cash and other prizes.</p>

            <p>If you want to raise your profile by besting your peers, then this is the event for you. Verizon has teamed with TopCoder, the leader in online and offline programming competitions
            and skills assessment, to execute this exciting event. Verizon may use the results of this event for the purpose of finding new employees for their Chennai Center.</p>

            <p><span class="bodySubtitle">Choose Your Weapon</span><br />
            Use Java, C++, C# or VB.NET to compete. The event will allow developers to choose from these four important programming languages, with no particular
            advantage given to any one language.</p>

            <p><span class="bodySubtitle">How It Works</span><br />
            The tournament is a timed contest allowing all participants to compete online to solve the same problems under the same time constraints. The contests are challenging and exciting for participants and
            spectators. The format is simple:</p>

            <blockquote>
            <p><span class="bodySubtitle">Download the Arena</span><br />
            TopCoder's Competition Arena (a Java Applet) provides the interface to the competition. Here contestants will read the problem statements, code
            solutions, compile and test those solutions and submit their code for points. Prior to the match, you can practice on many sample problems by downloading the arena ahead of time.</p>

            <p><span class="bodySubtitle">Coding Phase</span><br />
            At the designated date and time, competitors will enter the Arena just prior to "kick off". Competitors are placed in virtual rooms of 10 developers
            per room. All participants are presented with the same set of three problems of escalating difficulty. In a race to see who can create an accurate solution
            in the shortest amount of time, competitors try to out-think and out-code their opponents. The Leader Board tells the tale as competitors vie for the highest point total.</p>

            <p><span class="bodySubtitle">Challenge Phase</span><br />
            During the Challenge Phase, competitors view each other's code and try to "break'" that code by passing test cases through submitted code, with the hope that the results are not satisfied by the
            software written. Breaking another developer's code is the most direct form of engaging competition for a programmer. In this phase, precious points
            are awarded or taken away based on successful challenges. A penalty exists for an unsuccessful challenge.</p>

            <p><span class="bodySubtitle">System Tests</span><br />
            Within minutes of the end of the Challenge Phase, TopCoder will determine the accuracy of all submissions and award final points to all competitors. It
            is the instant gratification of knowing winners, losers, statistics and one's own performance versus the field that makes TopCoder events unique and
            captivating.</p>
            </blockquote>

            <p><span class="bodySubtitle">Can Your Skills Carry You to August 29th?</span><br />
            Registration for the Verizon Coding Challenge opens on August 4th and closes on August 15th, 2003.  Be sure to register early, as only the first 500 eligible individuals to
            register will be invited to compete in Round #1 which will be held at XXX on August 20th.</p>

            <p>The competitors with the top 250 scores from the first round will advance to the second round on August 25th. The top 25 performers in the second round will be invited to
            compete for the large cash prizes onsite at VDSI Chennai on August 29th.</p>

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
            will receive the following cash prizes:</p>

            <p>1st Place - $1,000 USD<br />
            2nd Place - $500 USD<br/>
            3rd Place - $300 USD<br/>
            4th Place - $100 USD</p>

            <p>To find out more detailed information about the Verizon Coding Challenge, including a list of the prizes, please read
            the <a href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_conditions">Terms and Conditions</a>.</p>

            <p><br/></p>
      </td>

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td valign="top" width="138">
            <table border="0" cellspacing="0" cellpadding="6" bgcolor="#DD0000">
                <tr>
                    <td class="tableHead" width="138" height="21">Important Dates</td>
                </tr>
            </table>

            <img alt="" src="/images/spacer.gif" height="3" width="138"><br/>

            <table border="0" cellspacing="5" cellpadding="0" width="138" class="testFrame">
                <tr><td width="138"><img src="/i/clear.gif" alt="" width="138" height="1"></td></tr>

                <tr><td class="subBodyCopy">Registraton Starts<br/><strong>August 4th</strong></td></tr>

                <tr><td class="subBodyCopy">Round 1 - Online<br/><strong>August 20th</strong></td></tr>

                <tr><td class="subBodyCopy">Championship Round<br/>Live at the Verizon Chennai Facility<br/><strong>August 29th</strong></td></tr>

                <tr><td width="138"><img src="/i/clear.gif" alt="" width="138" height="1"></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="6" bgcolor="#DD0000">
                <tr>
                    <td class="tableHead" width="138" height="21">Cash Prizes</td>
                </tr>
            </table>

            <table border="0" cellspacing="5" cellpadding="0" width="138" class="testFrame">
                <tr><td width="138" colspan="2"><img src="/i/clear.gif" alt="" width="138" height="1"></td></tr>

                <tr>
                    <td class="subBodyCopy">1st Place</td>
                    <td class="subBodyCopy"><strong>$1,000 USD</strong></td>
                </tr>

                <tr>
                    <td class="subBodyCopy">2nd Place</td>
                    <td class="subBodyCopy"><strong>$500 USD</strong></td>
                </tr>

                <tr>
                    <td class="subBodyCopy">3rd Place</td>
                    <td class="subBodyCopy"><strong>$300 USD</strong></td>
                </tr>

                <tr>
                    <td class="subBodyCopy">4th Place</td>
                    <td class="subBodyCopy"><strong>$100 USD</strong></td>
                </tr>

                <tr><td width="138" colspan="2"><img src="/i/clear.gif" alt="" width="138" height="1"></td></tr>
            </table>
        </td>
<!-- Right Column Ends -->

   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>