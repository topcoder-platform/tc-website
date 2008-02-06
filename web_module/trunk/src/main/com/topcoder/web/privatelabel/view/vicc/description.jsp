<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value="description"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">VeriSign&#174; Code Fest</span>
<br /><br />
Welcome to the VeriSign Code Fest -- VeriSign's annual internal coding competition, powered by TopCoder. Code Fest is a great way for members of the VeriSign Technical Community to come together and have some fun! Participants can earn cash prizes and the opportunity to compete in the Code Fest Finals at the third annual VeriSign Technical Symposium (VTS) in Miami, Florida, August 11-13, 2008.
<br /><br />
This year's Code Fest consists of three Single Round Matches (SRM) <strong>exclusively for VeriSign employees</strong>. First-place finishers from each will advance to the VTS finals. The SRMs are timed contests where participants compete online to solve the same problems under the same time constraints. You can compete in Java, C++, C#, or VB.
<br /><br />
<%--
<strong>Get Ready for Sponsor Track! Registration Deadline: March 27</strong>
<br /><br />
The 2007 TopCoder Open Sponsor Track Competition is now here!  Its format is more challenging with 5 elimination-style SRMs. VeriSign winners win bigger prizes (see below) and compete alongside employees from AOL. Don't miss your chance to show your technical prowess and do VeriSign proud.
<br /><br />
<strong>Important Note: The Sponsor Track competition is run separately from our Code Fest SRMs. The rules, registration process, and competition arena are different. Find the rules and registration here: <a href="/sponsortrack">www.topcoder.com/sponsortrack</a>.</strong>
<br /><br />
--%>
<span class="bodySubtitle">Code Fest Schedule:</span><br />
<br />

<table width="500" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr>
        <td class="sidebarTitle" width="25%"><strong>Date</strong></td>
        <td class="sidebarTitle" width="40%" colspan="2"><strong>Time*</strong></td>
        <td class="sidebarTitle" width="35%"><strong>Status</strong></td>
    </tr>
    <tr valign="top">
        <td class="sidebarText">&#160;</td>
        <td class="sidebarText"><strong>Register</strong></td>
        <td class="sidebarText"><strong>Start</strong></td>
        <td class="sidebarText">&#160;</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 1</strong><br />March 4, 2008</td>
        <td class="sidebarText">6:00 PM - 8:55 PM</td>
        <td class="sidebarText">9:00 PM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 2</strong><br />April 17, 2008</td>
        <td class="sidebarText">7:00 AM - 9:55 AM</td>
        <td class="sidebarText">10:00 AM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <%--
    <tr valign="top">
        <td class="sidebarText"><strong>TopCoder Sponsor Track</strong><br />April 3 - April 14, 2007</td>
        <td class="sidebarText"><strong>Register by March 27!</strong>
           <br />See details <a href="/sponsortrack">here</a>.
        </td>
        <td class="sidebarText">See details <a href="/sponsortrack">here</a>.</td>
        <td class="sidebarText">TopCoder members from VeriSign and other sponsoring companies.</td>
    </tr>
    --%>
    <tr valign="top">
        <td class="sidebarText"><strong>SRM 3</strong><br />June 3, 2008</td>
        <td class="sidebarText">6:00 PM - 8:55 PM</td>
        <td class="sidebarText">9:00 PM</td>
        <td class="sidebarText">All participants</td>
    </tr>
    <tr>
        <td class="sidebarText" colspan="4">&#160;</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText"><strong>VTS Finals</strong><br />August 12, 2008</td>
        <td class="sidebarText">&#160;</td>
        <td class="sidebarText">TBD</td>
        <td class="sidebarText">Championship Round<br />4 participants</td>
    </tr>
    <tr valign="top">
        <td class="sidebarText" colspan="4">*All times are in Eastern Time.<br />NOTE: In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.
        </td>
    </tr>
</table>
<br />

<a name="prizes"></a>
<span class="bodySubtitle">Prizes:</span><br />
Cash prizes are as follows:
<br /><br />

<table width="500" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr>
        <td class="sidebarTitle" colspan="2">SRM Prizes**</td>
    </tr>
    <tr>
        <td class="sidebarText"><strong>1st Place Finisher</strong></td>
        <td class="sidebarText"><strong>$1,500 and a trip to the VTS finals</strong></td>
    </tr>
    <tr>
        <td class="sidebarText">2nd Place Finisher</td>
        <td class="sidebarText">$750</td>
    </tr>
    <tr>
        <td class="sidebarText">3rd Place Finisher</td>
        <td class="sidebarText">$500</td>
    </tr>
    <%--
    <tr>
        <td class="sidebarTitle" colspan="2">Sponsor Track Prizes**</td>
    </tr>
    <tr>
        <td class="sidebarText"><strong>1st Place Finisher</strong></td>
        <td class="sidebarText"><strong>$2,500 and a trip to the VTS finals</strong></td>
    </tr>
    <tr>
        <td class="sidebarText">2nd Place Finisher</td>
        <td class="sidebarText">$1,500</td>
    </tr>
    <tr>
        <td class="sidebarText">3rd Place Finisher</td>
        <td class="sidebarText">$750</td>
    </tr>
    --%>
</table>
<br />

The first-place winners from the three SRMs plus one wild card from the second and third place finishers will compete onsite at the VTS for the following great prizes:
<br /><br />
<table width="300" border="0" align="center" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr>
        <td class="sidebarTitle" colspan="2">Finals Prizes**</td>
    </tr>
    <tr>
        <td class="sidebarText"><strong>1st Place Finisher</strong></td>
        <td class="sidebarText"><strong>$5,000</strong></td>
    </tr>
    <tr>
        <td class="sidebarText">2nd Place Finisher</td>
        <td class="sidebarText">$3,500</td>
    </tr>
    <tr>
        <td class="sidebarText">3rd Place Finisher</td>
        <td class="sidebarText">$2,000</td>
    </tr>
    <tr>
        <td class="sidebarText">4th Place Finisher</td>
        <td class="sidebarText">$500</td>
    </tr>
</table>
<br /><br />
** THRIVE Awards outside of the fifty United States and Washington, D.C. are subject to regional currency equivalence adjustments, which are determined by VeriSign, in its sole discretion.
<br /><br />
The first place winners in the SRMs may participate, but are not eligible to win prize money in any of the other SRMs that lead up to the 2008 VTS finals.
<br /><br />
Check out these <a href="/pl/?module=Static&d1=vicc&d2=instructions">instructions</a> on how a Single Round Match (SRM) works and how to register. 
<br /><br />
The competition is free. You must be a registered VeriSign employee who is at least 18 years old to be eligible to participate. See the official rules and regulations for more details. Questions? Contact <a href="mailto:afinan@verisign.com?subject=VeriSign Code Fest">Angelique Finan</a> at 703.948.4409.
</div>
</td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
