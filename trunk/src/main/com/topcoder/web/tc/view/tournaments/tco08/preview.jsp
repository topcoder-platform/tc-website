<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %> 

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_tournaments"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">
            
<div style="padding-bottom: 10px; margin-bottom: 10px; border-bottom: 1px solid #999999;" align="center">
    <img src="/i/tournament/tco08/previewLogo.png" alt="2008 TopCoder Open" />
</div>

<p>
The TCO returns to the action of Las Vegas for the TopCoder Open in 2008. <tc-webtag:handle coderId="309453" /> looks to defend his crown from the 2007 TCO in Sin City... where <tc-webtag:handle coderId="10574855" /> clinched his first TopCoder Championship, <tc-webtag:handle coderId="10481546" /> became the first-ever Studio Design competition winner, <tc-webtag:handle coderId="10600282" /> won the first-ever Marathon Match Competition, and the dreams of <tc-webtag:handle coderId="119676" />, <tc-webtag:handle coderId="7548200" />, <tc-webtag:handle coderId="152342" /> and <tc-webtag:handle coderId="15214882" /> came true.  It can be your turn next.
</p>

<h2>Mark your calendars!</h2>

<p>
The TCO08 Finals will take place <strong>May 11 - 15, 2008</strong> at the Mirage in <strong>Las Vegas, Nevada</strong> and we're giving away <strong>$260,000 in prizes</strong>.
</p>

<p>
The TCO is bigger and better in 2008, as we <strong><em>increase the finalist pool by 50 percent</em></strong>! TopCoder will fly in the Top 120 finalists this year to compete for more than a quarter of a million dollars in prizes. As our member community continues to grow, so does the elite competition. Spread the word, the world's best developers will be heading to Vegas in May!
</p>

<h2>Details:</h2>

<p>
There will be four competitions making up the TCO08:
</p>

<ul>
    <li>Algorithm Competition</li>
    <li>Component Design and Development</li>
    <li>Marathon Match Competition</li>
    <li>Studio Design Competition</li>
</ul>

<h2>New This Year at the TCO: TopCoder Masters Invitational</h2>

<p>
How would the algorithm finalists of years past stack up against each other? The TopCoder community will find out as we invite each of the competitors who made it onsite in all previous TCO finals to compete in a single online round of competition: the TopCoder Masters Invitational. The Top 10 competitors from this powerhouse online competition will earn the right to face off onsite at the TCO08 to compete in one round of live competition with the Champion taking home the winner-takes-all prize purse of $20,000.
</p>

<h2>Introducing the TopCoder Software Symposium at TCO08</h2>

<p>
We're excited to expand not only the competition at this year's TCO, but to also introduce a top notch selection of educational sessions featuring a lineup of the most talented engineers in the business who will share their expertise with TopCoder members in attendance. TopCoder will host four seminars just for you, the developer. We'll have three special guests on hand as our Keynote Speakers (stay tuned as we head into 2008 when we announce the lineup!). For the business professionals in attendance, TopCoder is also hosting four seminars created specifically for you-corporate sessions to address how the TopCoder community and competition provides direct benefit to your organization.
</p>

<p>
The Software Symposium will take place Tuesday, May 13 - Thursday, May 15, 2008.  The cost to attend is $199 for professionals and $99 for student members. 
</p>

<p>
<strong><em>Check back with TopCoder News</em></strong> for more updates about the TCO08 and to register for the first-ever Software Symposium, hosted by TopCoder.
</p>

<p>
Only the top 120 competitors will make the TCO, so polish up your skills now to prepare for the competition. We'll have room for everyone at the Symposium - start making plans now for your trip to Las Vegas in May.
</p>

<div align="center">
    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&amp;forumID=517604"><img src="/i/tournament/tco08/previewDiscuss.png" alt="Discuss the 2008 TopCoder Open" /></a>
</div>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>