<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%
    /*
    String contest_name = (String)request.getAttribute("contest_name");
    String path = StringUtils.checkNull((String)request.getAttribute("path"));
    String link = StringUtils.checkNull((String)request.getAttribute("link"));
    int width = ((Integer)request.getAttribute("width")).intValue();
    int height = ((Integer)request.getAttribute("height")).intValue();
    String date = StringUtils.checkNull((String)request.getAttribute("date"));
    String reg_begin = StringUtils.checkNull((String)request.getAttribute("reg_begin"));
    String reg_end = StringUtils.checkNull((String)request.getAttribute("reg_end"));
    String coding_begin = StringUtils.checkNull((String)request.getAttribute("coding_begin"));
    int forum_id = ((Integer)request.getAttribute("forum_id")).intValue();
    */

    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");
    String time = StringUtils.checkNull((String) request.getAttribute("time"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
    <TITLE>Single Round Match (SRM) Schedule at TopCoder</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="/script.jsp"/>
</HEAD>

<BODY>
<a name="top_page"></a>
<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">

<!-- Left Column Begins -->
<TD WIDTH="180" VALIGN="top">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="m_algo_competitions"/>
    </jsp:include>
</TD>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="5" BORDER="0"/></TD>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="schedule"/>
    <jsp:param name="title" value="Contest"/>
</jsp:include>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
<TR>
<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
<IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<TABLE WIDTH="428" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
<TR>
    <TD COLSPAN="3" ALIGN="center"><IMG SRC="/i/clear.gif" ALT="" WIDTH="428" HEIGHT="10" BORDER="0"/></TD>
</TR>

<TR>
    <TD COLSPAN="3" ALIGN="center">
        <%
            String path = StringUtils.checkNull(rsr.getStringItem("path"));
            String link = StringUtils.checkNull(rsr.getStringItem("link"));
            if (path.equals("")) { %>
        <IMG SRC="/i/srm_banner.jpg" ALT="" WIDTH="428" HEIGHT="80" BORDER="0"/>
        <% } else { %>
        <% if (link.equals("")) { %>
        <IMG ALT="" BORDER="0" SRC="<rsc:item name="path" row="<%=rsr%>"/>" WIDTH="<rsc:item name="width" row="<%=rsr%>"/>" HEIGHT="<rsc:item name="height" row="<%=rsr%>"/>"/>
        <% } else { %>
        <a HREF="<%=link%>">
            <IMG ALT="" BORDER="0" SRC="<rsc:item name="path" row="<%=rsr%>"/>" WIDTH="<rsc:item name="width" row="<%=rsr%>"/>" HEIGHT="<rsc:item name="height" row="<%=rsr%>"/>"/>
        </a>
        <% } %>
        <% } %>

        <TR BGCOLOR="#CCCCCC">
            <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Date</B></TD>
            <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Registration</B></TD>
            <TD WIDTH="130" HEIGHT="24" VALIGN="middle" ALIGN="center" class="bodyText"><B>Start</B></TD>
        </TR>
        <TR BGCOLOR="#666666">
            <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                <b>
                    <rsc:item name="date" row="<%=rsr%>"/>
                    <br/></b>
            </TD>
            <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                <B>
                    <rsc:item name="reg_begin" row="<%=rsr%>"/>
                </B>
            </TD>
            <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                <B>
                    <rsc:item name="coding_begin" row="<%=rsr%>"/>
                </B>
            </TD>
        </TR>
    </TD>
</TR>


<TR>
<TD COLSPAN="3" ALIGN="left" class="bodyText">

<center>
    <span class="bodySubtitle"><rsc:item name="contest_name" row="<%=rsr%>"/></span>
    <br><br>
    All times are Eastern Time unless otherwise noted, click
    <a HREF="<%="http://www.timeanddate.com/worldclock/fixedtime.html?" + time+"&amp;p1=179"%>">here</a>
    to see when coding begins in other time zones.<br/></center>

<% if (round_id == 10004) { %>
<hr />
<p>In memoriam: <tc-webtag:handle coderId="13377493"/></p>

<p>Last month, TopCoder lost a valued member and friend with the passing of Victor_lxd. We are dedicating this match
to his memory, along with a $5,000 prize purse.</p>

<p>With his wife also injured, we believe the best tribute we can make is to lend our support to <tc-webtag:handle coderId="13377493"/>'s family.
We invite all SRM 324 participants to consider pledging their winnings as a gift in Victor's memory, though there is
no obligation to do so - please indicate your preference when registering for the match.</p>

<p>TopCoder will match any and all donations that members make during this SRM, up to a potential total gift of $10,000.
Please join us in this tribute to one of our own.</p>

<hr />
<% } %>

<% if (rsr.getItem("forum_id").getResultData() != null && rsr.getIntItem("forum_id") != 0) { %>
<center><strong>
    <tc-webtag:forumLink forumID="<%=rsr.getIntItem("forum_id")%>" message="Discuss This Match"/>
</strong>
    <br/><br/></center>
<% } %>
<% if (round_id == 8075) { %>
<br/>
TopCoder Employment Services is placing members in the Tampa Bay, FL area. <A HREF="/tc?module=ContractingPreferences">Click
    here to register.</A><br/><br/>
<% } else if (round_id == 8070 || round_id == 8073 || round_id == 8076) { %>
<br/>
<b>If you're a member of <A href="/tc?module=Static&amp;d1=sponsors&amp;d2=sap">SAP Developer Network</A> AND take part
    in
    <rsc:item name="contest_name" row="<%=rsr%>"/>
    , you'll be eligible for a chance to win one 60GB Apple iPod!</b>
<br/><br/>
<table width="428" border="0" cellpadding="6" cellspacing="2">
    <tr valign="top">
        <td align="center" valign="middle">
            <img src="http://www.topcoder.com/i/sponsor/sap_ipod.jpg"/>
        </td>
    </tr>
</table>
<br/><br/>
For Official Contest Rules on how to win a 60GB Apple iPod click
<A href="javascript:openWin('/tc?module=Static&amp;d1=sponsors&amp;d2=sap_ipod_rules','rules',545,655)">here</A>.<br/>
<br/>
<% } else if (round_id == 4710) { %>
<b>For information on how to win an Intel&#174; Centrino(TM) mobile technology-based notebook computer click
    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_intel">here</a></b><br/><br/>
<% } else if (round_id == 5856) { %>
<p>
    If you're a member of
    <a href="/?t=sponsor&amp;c=link&amp;link=http://www.intel.com/IDS&amp;refer=srm_details" target="_blank">Intel
        Developer Services</a> AND take part in Single Round Match 210, you'll be eligible for a chance to win one Intel&#174;
    Centrino(TM) mobile technology-based notebook!
</p>
<table width="428" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr>
        <td align="left" valign="middle">
        </td>
    </tr>
    <tr valign="top">
        <td align="left" valign="middle">
            <h2>Intel<sup>&#174;</sup><br/>Centrino(TM)<br/>Mobile<br/>Technology-<br/>based Tablet<br/>PC Quick<br/>
                Specs</h2>
        </td>
        <td align="left" valign="middle">
            <img src="/i/tournament/tco04/intel_tablet.jpg" width="216" height="167" border="0"/>
        </td>
    </tr>
</table>
<table width="428" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
    <tr valign="top">
        <td class="sidebarTitle">Configuration Details:</td>
        <td class="sidebarText">1 Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M PROCESSOR 1.0GHz, Intel<sup>
            &#174;</sup>
            855GM CHIPSET, OEM BASEBOARD, DDR266 512MB (1x512MB) MEMORY, INTEGRATED GRAPHICS, TABLET FORM FACTOR
            CHASSIS, WINDOWS
            XP TABLET PC OS, CALEXICO 802.11b (Intel<sup>&#174;</sup> PRO/Wireless 2100 network connection)
        </td>
    </tr>

    <tr valign="top">
        <td class="sidebarTitle">Description:</td>
        <td class="sidebarText">Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M based Centrino(TM) Tablet Platform
        </td>
    </tr>

    <tr valign="top">
        <td class="sidebarTitle">Functionality:</td>
        <td class="sidebarText">Production-level</td>
    </tr>

    <tr valign="top">
        <td class="sidebarTitle">New Technologies:</td>
        <td class="sidebarText">Intel<sup>&#174;</sup> Pentium<sup>&#174;</sup> M processor, Intel<sup>&#174;</sup> 855
            Chipset family, Intel<sup>&#174;</sup> PRO/Wireless 2100 network connection (Centrino(TM) Mobile Technology)
        </td>
    </tr>
</table>
<p><b>For Official Contest Rules on how to win an Intel&#174; Centrino(TM) Mobile Technology-based Tablet PC click
    <a href="Javascript:openWin('/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=intel&amp;d4=tablet_rules','comp',545,655)">here</a></b>
</p><br/>
<% } else if (round_id == 5075) { %>
In celebration of SRM 200, TopCoder will hold 10 random drawings at the conclusion of the challenge phase. In order to
be eligible to be randomly chosen for a prize, you must both register for SRM 200 during the registration period and
participate in the match.<br/>
<br/>
The prizes to be given away are: <br/>
<br/>
(3) TopCoder Hooded Jackets<br/>
(3) TopCoder Backpacks<br/>
(4) TopCoder Polo Shirts<br/>
<br/>
A given competitor will only be eligible to win, at most, one random drawing.
<br/>
<br/>
<% } else if (round_id == 5849) { %>
<table>
    <tr>
        <td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members
            in Europe, Asia and Australia. The additional dates and times are as follows:
        </td>
    </tr>
    <tr>
        <td class="bodyText"></td>
    </tr>
    <tr>
        <td class="bodyText">August 10:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">Compete
            - 1:00PM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">September 14:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">
            Compete - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">October 4:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">Compete
            - 1:00PM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">November 4:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">Compete
            - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">December 6:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">
            Compete - 1:00PM ET
        </td>
    </tr>
</table>
<br/>
<% } else if (round_id == 5853) { %>
<table>
    <tr>
        <td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members
            in Europe, Asia and Australia. The additional dates and times are as follows:
        </td>
    </tr>
    <tr>
        <td class="bodyText"></td>
    </tr>
    <tr>
        <td class="bodyText">September 14:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">
            Compete - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">October 4:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">Compete
            - 1:00PM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">November 4:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">Compete
            - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">December 6:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">
            Compete - 1:00PM ET
        </td>
    </tr>
</table>
<br/>
<% } else if (round_id == 5857) { %>
<table>
    <tr>
        <td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members
            in Europe, Asia and Australia. The additional dates and times are as follows:
        </td>
    </tr>
    <tr>
        <td class="bodyText"></td>
    </tr>
    <tr>
        <td class="bodyText">October 4:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">Compete
            - 1:00PM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">November 4:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">Compete
            - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">December 6:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">
            Compete - 1:00PM ET
        </td>
    </tr>
</table>
<br/>
<% } else if (round_id == 5860) { %>
<table>
    <tr>
        <td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members
            in Europe, Asia and Australia. The additional dates and times are as follows:
        </td>
    </tr>
    <tr>
        <td class="bodyText"></td>
    </tr>
    <tr>
        <td class="bodyText">November 4:</td>
        <td class="bodyText">Register - 6:00AM ET</td>
        <td class="bodyText">Compete
            - 9:00AM ET
        </td>
    </tr>
    <tr>
        <td class="bodyText">December 6:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">
            Compete - 1:00PM ET
        </td>
    </tr>
</table>
<br/>
<% } else if (round_id == 5864) { %>
<table>
    <tr>
        <td class="bodyText" colspan="3">TopCoder has adjusted the hours of certain SRMs to better accommodate members
            in Europe, Asia and Australia. The additional dates and times are as follows:
        </td>
    </tr>
    <tr>
        <td class="bodyText"></td>
    </tr>
    <tr>
        <td class="bodyText">December 7:</td>
        <td class="bodyText">Register - 10:00AM ET</td>
        <td class="bodyText">
            Compete - 1:00PM ET
        </td>
    </tr>
</table>
<br/>
<% } %>
</TD>
</TR>

<TR>
    <TD COLSPAN="3" ALIGN="center">
        <table width="100%" cellspacing="0" cellpadding="3" border="0" bgcolor="#EEEEEE">
            <tr valign="middle">
                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Getting started
                    in the Competition Arena</font></td>
            </tr>
            <tr>
                <td class="bodyText">
                    <p style="padding: 3px">Load the Competition Arena as an
                        <A class="bodyText" href="Javascript:arenaApplet();">Applet</A><br/>
                        Load the Competition Arena as a <A class="bodyText" href="Javascript:arena();">Java Web Start
                        Application</A><br/>
                        Don't have JWS?
                        <A class="bodyText" href="http://java.sun.com/products/javawebstart/index.html" target="_blank">Download</A>
                        it on java.sun.com<br/>
                        Check out the <A class="bodyText" href="/tc?module=Static&d1=applet&d2=plugins">plugins</A>
                        available for the Competition Arena</p>
                </td>
            </tr>
        </table>
        <br/>
        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/><BR/>
    </TD>
</TR>

<% if (round_id == 8070 || round_id == 8073 || round_id == 8076) { %>
<TR>
    <TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
        <font size="3"><b>***TopCoder will be giving away $5,000 per match sponsored by SAP. There will also be a raffle
            for
            an iPod during each match.***</b></font><br/><br/>
        <B>Single Round Match Description</B>
        <UL>
            <li>Competitors with a rating of 1200 or higher at the start of the match will be placed into a division one
                room. All other competitors, including non-rated competitors, will be placed into a division two room.
            </li>
            <li>Room assignments within each division will performed randomly, with prizes distributed evenly among all
                rooms in each division.
            </li>
            <li>70% of the total purse will be awarded to division one competitors, and 30% to division two
                competitors.
            </li>
            <li>Approximately 20 competitors will be assigned to each room.</li>
            <li>The first, second, and third place coders in each division one room will receive 50%, 30%, and 20% of
                the
                room award, respectively.
            </li>
            <li>The first and second place competitors in each division two room will receive 60% and 40% of the room
                award,
                respectively.
            </li>
            <li>In the event of a tie for any prize winning position, the sum of the awards of the tied competitors will
                be
                distributed evenly. (For example, if five coders tie for second place in a division one room, each will
                receive (30%+20%)/5 or 10% of the room award.)
            </li>
            <li>Prizes will only be awarded to competitors who finish with greater than zero scores.</li>
            <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18
                years of age, and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the
                Quebec
                province of Canada, or anywhere else where this contest is prohibited by applicable law.
            </li>
            <li><a href="/tc?module=Static&d1=help&d2=ratings">Rating changes</a> go into effect in next participated
                rated
                event
            </li>
            <li>For a complete guide to competing in a Single Round Match, read the
                <a href="/tc?module=Static&amp;d1=help&amp;d2=index">Algorithm Competition Guide</a></li>
        </UL>
        <B>Eligibility:</B>
        <UL>
            <li>Any TopCoder member in good standing, who is at least 13 years of age, may compete in this
                competition.
            </li>
            <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18
                years of age, and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the
                Quebec
                province of Canada, or anywhere else where this contest is prohibited by applicable law.
            </li>
            <li>In the event that any member who is ineligible to receive prizes places in a position in which they
                would
                receive a prize, they will be asked to pick a
                <a href="/tc?module=Static&amp;d1=help&amp;d2=charity">charity</a> to which
                to donate their prize. In the event that the member does not pick a charity, TopCoder will pick a
                charity to
                which the ineligible member's prize will be paid.
            </li>
            <li>Employees of SAP and/or persons living in the same household as such employees are ineligible to win
                prizes
                in this competition and are ineligible to donate any prize to charity. If any such employee finishes in
                a
                prize-winning position in the competition, the next-best competitor will either receive the prize or be
                able
                to donate the applicable prize to a charity.
            </li>
            <li>You must be a member of the SAP Developer Network to be eligible for the iPod raffle. Go here to
                register:
                <a href="http://www.topcoder.com/?t=sponsor&amp;c=link&amp;link=http://sdn.sap.com">http://sdn.sap.com</a>
                and use “TopCoder” as a referral.
            </li>
        </UL>
        <BR/><BR/>

        <A CLASS="bodyText" href="/tc?module=MatchDetails&rd=<%=round_id%>&c=rules"><B>Click here for complete rules
            &amp;
            regulations</B></A>
    </TD>
</TR>

<% } else if (round_id == 7223 || round_id == 8004 || round_id == 8005 || round_id == 7227 || round_id == 8007 ||
        round_id == 8080 || round_id == 8069 || round_id == 8074 || round_id == 8083 || round_id == 9812 ||
        round_id == 9815 || round_id == 9816 || round_id == 9820 || round_id == 9822 || round_id == 9997 ||
        round_id == 9992 || round_id == 9999 || round_id == 10004 || round_id == 9995 || round_id == 10005 ||
        round_id == 10002 || round_id == 10659 || round_id == 10663 || round_id == 10665 || round_id == 10669 ||
        round_id == 10674) { %>
<TR>
    <TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
        <font size="3"><b>Total Prize Purse of $5,000 !!!</b></font><br/><br/>
        <B>Single Round Match Description</B>
        <UL>
            <li>Competitors with a rating of 1200 or higher at the start of the match will be placed into a division one
                room. All other competitors, including non-rated competitors, will be placed into a division two room.
            </li>
            <li>Room assignments within each division will performed randomly, with prizes distributed evenly among all
                rooms in each division.
            </li>
            <li>70% of the total purse will be awarded to division one competitors, and 30% to division two
                competitors.
            </li>
            <li>Approximately 20 competitors will be assigned to each room.</li>
            <li>The first, second, and third place coders in each division one room will receive 50%, 30%, and 20% of
                the
                room award, respectively.
            </li>
            <li>The first and second place competitors in each division two room will receive 60% and 40% of the room
                award,
                respectively.
            </li>
            <li>In the event of a tie for any prize winning position, the sum of the awards of the tied competitors will
                be
                distributed evenly. (For example, if five coders tie for second place in a division one room, each will
                receive (30%+20%)/5 or 10% of the room award.)
            </li>
            <li>Prizes will only be awarded to competitors who finish with greater than zero scores.</li>
            <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18
                years of age, and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the
                Quebec
                province of Canada, or anywhere else where this contest is prohibited by applicable law.
            </li>
            <li><a href="/tc?module=Static&d1=help&d2=ratings">Rating changes</a> go into effect in next participated
                rated
                event
            </li>
            <li>For a complete guide to competing in a Single Round Match, read the
                <a href="/tc?module=Static&amp;d1=help&amp;d2=index">Algorithm Competition Guide</a></li>
        </UL>
        <B>Eligibility:</B>
        <UL>
            <li>Any TopCoder member in good standing, who is at least 13 years of age, may compete in this
                competition.
            </li>
            <li>In order to be eligible for prizes, a competitor must be a TopCoder member in good standing, at least 18
                years of age, and must not be a resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, the
                Quebec
                province of Canada, or anywhere else where this contest is prohibited by applicable law.
            </li>
            <li>In the event that any member who is ineligible to receive prizes places in a position in which they
                would
                receive a prize, they will be asked to pick a
                <a href="/tc?module=Static&amp;d1=help&amp;d2=charity">charity</a> to which
                to donate their prize. In the event that the member does not pick a charity, TopCoder will pick a
                charity to
                which the ineligible member's prize will be paid.
            </li>
        </UL>
        <BR/><BR/>

        <A CLASS="bodyText" HREF="/tc?module=MatchRules&rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
            complete rules &amp; regulations</B></A>
    </TD>
</TR>

<% } else { %>
<TR>
    <TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
        <B>Single Round Match Description</B>
        <UL>
            <LI>Maximum of 20 coders per room</LI>
            <LI>Ratings will be adjusted post-match</LI>
            <LI>Members will be emailed prior to the match with date and time (opt-in)</LI>
        </UL>
        The match will feature a mixed programming language format. For each individual problem, the coder will have the
        option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174;
        .NET to
        code the solution. Syntactical knowledge of all four languages will be helpful during the challenge phase of
        each
        round of competition.<BR/><BR/>
        <B>Divisions and Room Assignments:</B>
        <UL>
            <LI>Members rated 1200 or better compete in Division-I</LI>
            <LI>Members rated 1199 or lower compete in Division-II</LI>
            <LI>Members not yet rated compete in Division-II</LI>
            <LI>Room assignments place members of like divisions together</LI>
            <LI>Rating changes go into effect in next participated match</LI>
        </UL>
        <B>Eligibility:</B><BR/><BR/>
        Anyone who is at least 13 years of age may compete in any Single Round Match.<BR/><BR/>
        <A CLASS="bodyText" HREF="/tc?module=MatchRules&rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
            complete rules &amp; regulations</B></A>
    </TD>
</TR>
<% } %>
</TABLE>

<P><BR/></P>

</TD>
</TR>
</TABLE>
</TD>
<!-- Center Column Ends -->

<!-- Gutter -->
<TD WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<TD WIDTH="170"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</TD>
<!-- Right Column Ends -->

<!-- Gutter Begins -->
<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->
</TR>
</TABLE>

<jsp:include page="../foot.jsp"/>

</BODY>

</HTML>