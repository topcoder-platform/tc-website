<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="java.util.Arrays" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%
    ResultSetContainer.ResultSetRow rsr = (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    long roundId = rsr.getLongItem("round_id");
    String time = StringUtils.checkNull((String) request.getAttribute("time"));

    long[] regularPrizeRounds = {7223,8004 ,8005,7227,8007,8080,8069,8074,8083,9812,9815,9816,9820,9822,9997,9992,9999,
            10004,9995,10005,10002,10659,10663,10665,10669,10674,10664,10666,10669,10712,10710,10675,10711,10766,10770,
            10773,10778,10787,11122,11126,12169,12172,12177,13901,14429};
    //sort it just for insurance, we're going to use binary search later
    Arrays.sort(regularPrizeRounds);
	
	long[] unratedRounds = {13935,13952};
	Arrays.sort(unratedRounds);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
    <TITLE>Single Round Match (SRM) Schedule at TopCoder</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    
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
                    <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy"/>
                    <br/></b>
            </TD>
            <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                <B>
                    <rsc:item name="reg_start_time" row="<%=rsr%>" format="hh:mm a z"/>
                </B>
            </TD>
            <TD WIDTH="130" HEIGHT="18" VALIGN="middle" ALIGN="center" class="statText">
                <B>
                    <rsc:item name="coding_start_time" row="<%=rsr%>" format="hh:mm a z"/>
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
    Click
    <a HREF="<%="http://www.timeanddate.com/worldclock/fixedtime.html?" + time+"&amp;p1=179"%>">here</a>
    to see when coding begins in other time zones.<br/></center>


<% if (rsr.getItem("forum_id").getResultData() != null && rsr.getIntItem("forum_id") != 0) { %>
<center><strong>
    <tc-webtag:forumLink forumID="<%=rsr.getIntItem("forum_id")%>" message="Discuss This Match"/>
</strong>
    <br/><br/></center>
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
                        Check out the <A class="bodyText" href="/tc?module=Static&amp;d1=applet&amp;d2=plugins">plugins</A>
                        available for the Competition Arena</p>
                </td>
            </tr>
        </table>
        <br/>
        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/><BR/>
    </TD>
</TR>

<% if (roundId == 13901) { %>

<TR>
    <TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
        <font size="3"><b>Total Prize Purse of $5,000 !!!</b></font><br/><br/>

		<hr>
		Facebook is excited to sponsor TopCoder single-round match 447.  
		Seasoned veterans and newcomers alike will get to duke it out in real time to see who can solve the toughest problems the fastest. 
		We will be distributing $5,000 worth of cash prizes to top performers, 
		and all match registrants will have the chance to opt-in to be contacted by Facebook recruiting if they put on an impressive show.
		<br><br>
		Anyone interested in competing in the Facebook-sponsored match on August 25th should take a look at 
		<a HREF="http://www.facebook.com/careers/puzzles.php">Facebook Puzzles</a> as great fodder for getting your brain 
		and your fingers warmed up and ready to compete.  
		Keep an eye out for Facebook engineers in the Arena during the hour before the match; 
		we will be around to chat and answer any questions that come our way.  
		Hope to see you all there, and good luck! 
		<hr>
		<br><br>


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
            <li><a href="/tc?module=Static&amp;d1=help&amp;d2=ratings">Rating changes</a> go into effect in next participated
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

        <A CLASS="bodyText" HREF="/tc?module=MatchRules&amp;rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
            complete rules &amp; regulations</B></A>
    </TD>
</TR>

<% } else if (Arrays.binarySearch(regularPrizeRounds, roundId)>=0) { %>
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
            <li><a href="/tc?module=Static&amp;d1=help&amp;d2=ratings">Rating changes</a> go into effect in next participated
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

        <A CLASS="bodyText" HREF="/tc?module=MatchRules&amp;rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
            complete rules &amp; regulations</B></A>
    </TD>
</TR>

<% } else if (Arrays.binarySearch(unratedRounds, roundId)>=0) { %>

<TR>
    <TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
        <B>Single Round Match Description</B>
        <UL>
            <LI>Maximum of 20 coders per room</LI>
            <LI>This event is unrated - no ratings will be adjusted during this event</LI>
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
            <LI>Members who have not yet been rated will compete in Division-II</LI>
            <LI>Room assignments place members of like divisions together</LI>
        </UL>
        <B>Eligibility:</B><BR/><BR/>
        Anyone who is at least 13 years of age may compete in any Single Round Match.<BR/><BR/>
        <A CLASS="bodyText" HREF="/tc?module=MatchRules&amp;rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
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
        <A CLASS="bodyText" HREF="/tc?module=MatchRules&amp;rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for
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
