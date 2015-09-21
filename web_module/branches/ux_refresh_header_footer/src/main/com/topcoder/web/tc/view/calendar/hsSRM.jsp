<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%

    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    String time = StringUtils.checkNull((String) request.getAttribute("time"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
    <TITLE>TopCoder - High School Competitions</TITLE>
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
        <jsp:param name="node" value="m_hs_competitions"/>
    </jsp:include>
</TD>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="SRM Details"/>
</jsp:include>

<div align="center">
<TABLE WIDTH="428" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
    <TD COLSPAN="3" ALIGN="center"><IMG SRC="/i/clear.gif" ALT="" WIDTH="428" HEIGHT="10" BORDER="0"/></TD>
</TR>

<TR>
    <TD COLSPAN="3" ALIGN="center">
        <%
            String path = StringUtils.checkNull(rsr.getStringItem("path"));
            String link = StringUtils.checkNull(rsr.getStringItem("link"));
            if (path.equals("")) { %>
        <IMG SRC="/i/srm_tchs_banner.jpg" ALT="" WIDTH="428" HEIGHT="80" BORDER="0"/>
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
            All times are Eastern Time unless otherwise noted, click
            <a HREF="<%="http://www.timeanddate.com/worldclock/fixedtime.html?" + time+"&amp;p1=179"%>">here</a>
            to see when coding begins in other time zones.<br/></center>
        <% if (rsr.getItem("forum_id").getResultData() != null && rsr.getIntItem("forum_id") != 0) { %>
        <center><strong>
            <tc-webtag:forumLink forumID="<%=rsr.getIntItem("forum_id")%>" message="Discuss This Match"/>
        </strong><br/><br/></center>
        <% } %>
    </TD>
</TR>

<TR>
    <TD COLSPAN="3" ALIGN="center">
        <table width="100%" cellspacing="0" cellpadding="3" border="0" bgcolor="#EEEEEE">
            <tr valign="middle">
                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Getting started in the
                    Competition Arena</font></td>
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

<%if(rsr.getIntItem("round_id") < 10767) {%>

<TR>
<TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
    <b>TCHS SRM Description</b>

    <ul>
        <li>Maximum of 25 coders per room</li>
        <li>Ratings will be adjusted post-match for individuals and team members</li>
        <li>Members will be emailed prior to the match with date and time (opt-in)</li>
        <li>This SRM is for the
            <rsc:item name="region_name" row="<%=rsr%>"/>
            region
        </li>
    </ul>

    <p>
        The match will feature a mixed programming language format. For each individual problem,
        the coder will have the option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET
        or Microsoft&#174; Visual Basic&#174; .NET to code the solution. Syntactical knowledge of all
        four languages will be helpful during the challenge phase of each match.
    </p>

    <b>Structure & Scoring</b><br/>

    <p style="padding-left:20px;">
        <b>Teams</b><br/>
        A team is defined as a group of at least three (3) students from the same school.
        All students registered from a particular school will be on the same team.
        Each person on the team will participate individually and the team score will be
        calculated by adding the placement of the top three (3) team scorers. The
        best team score will be declared the winner during each SRM.
    </p>

    <p style="padding-left:40px;">
        <b>Scoring</b><br/>
        TopCoder High School team scoring is different from scoring in most other team sports,
        in that the lowest score wins. Although more than three (3) members may compete in
        each SRM, the placement (excluding competitors from outside the region) of the first
        three (3) members for each team are added together to determine the team score. For example, a finish of 1,
        3,
        and 51 - a score of 55 - will lose to a team finishing 17, 18 and 19 - with a
        score of 54.
    </p>

    <p style="padding-left:40px;">
        <b>Coaches</b><br/>
        Those teams wishing to use a coach to prepare for any SRM may do so, but the use of
        coaches is not mandatory. Coaches should be a Computer Science, Math, or other
        teacher from the team's school.
    </p>

    <p style="padding-left:20px;">
        Teams must compete in rated events prior to the start of the 2007 TopCoder High School
        tournament. In order to be eligible for the tournament, a team must have competed in
        at least four (4) TCHS SRMs <!--SRMs intended for their region -->prior to the start of the tournament..
    </p>

    <p style="padding-left:20px;">
        <b>Individuals</b><br/>
        There will also be an individual track of competition for those students who cannot
        assemble a team and/or who wish to participate as an individual, separate from
        their team. As with the teams, in order to be eligible for the
        2007 TopCoder High School tournament, individuals must have competed in at
        least four (4) TCHS SRMs <!--SRMs intended for their region -->prior to the start of the tournament..
    </p>

    <b>Regions</b><br/>

    <p>
        In order to best accommodate students from across the globe competing at times
        that are convenient, SRMs will take place according to regions. The
        regions will be as follows:
    </p>
    <ul>
        <li><a href="/tc?module=Static&amp;d1=hs&amp;d2=regions#alpha">Alpha Region</a> - Time zones that fall
            within <strong>GMT -12 through GMT -5</strong></li>
        <li><a href="/tc?module=Static&amp;d1=hs&amp;d2=regions#beta">Beta Region</a> - Time zones that fall within
            <strong>GMT -4 through GMT +2</strong></li>
        <li><a href="/tc?module=Static&amp;d1=hs&amp;d2=regions#gamma">Gamma Region</a> - Time zones that fall
            within <strong>GMT +3 through GMT +7</strong></li>
        <li><a href="/tc?module=Static&amp;d1=hs&amp;d2=regions#delta">Delta Region</a> - Time zones that fall
            within <strong>GMT +8 through GMT +12</strong></li>
    </ul>

    <p>If a country falls within two regions, TopCoder will assign that country to a particular region.</p>

    <p>Each week there will be one (1) SRM that will take place during a time that is convenient
        for a particular region. Each region will have approximately one (1) SRM each month
        that is intended for their region. Teams and individuals may compete in any SRM, regardless
        of the SRM time and their region. However, each team and individual wishing to be
        eligible for the 2007 TopCoder High School tournament must compete in at least four (4)
        TCHS SRMs <!--SRMs intended for their region -->prior to the start of the tournament.</p>

    <b>Eligibility</b><br/>

    <p>Anyone who is a registered TopCoder High School competitor between the ages of 13 and 20, inclusive, who is
        pursuing a secondary school education for the 2006-2007 school year through at least March 31, 2007 and who
        is not matriculated full time at a college or university may compete in any Single Round Match and the
        TopCoder High School tournament.</p>

    <A HREF="/tc?module=MatchRules&rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for complete rules
        &amp; regulations.</B></A>
</TD>
</TR>
<% } else {%>
<TR>
<TD COLSPAN="3" ALIGN="left" VALIGN="top" CLASS="bodyText">
    <b>TCHS SRM Description</b>

    <ul>
        <li>Maximum of 25 coders per room</li>
        <li>Ratings will be adjusted post-match for all competitors</li>
        <li>Members will be emailed prior to the match with date and time (opt-in)</li>
    </ul>

    <p>
        The match will feature a mixed programming language format. For each individual problem,
        the coder will have the option of using either Java, C++, Microsoft&#174; Visual C#&#174; .NET
        or Microsoft&#174; Visual Basic&#174; .NET to code the solution. Syntactical knowledge of all
        four languages will be helpful during the challenge phase of each match.
    </p>

    <b>Eligibility</b><br/>

    <p>Anyone who is a registered TopCoder High School competitor between the ages of 13 and 20, inclusive, who is
        pursuing a secondary school education for the 2007-2008 school year through at least March 15, 2008 and who
        is not matriculated full time at a college or university may compete in any Single Round Match and the
        TopCoder High School tournament.</p>

    <A HREF="/tc?module=MatchRules&rd=<rsc:item name="round_id" row="<%=rsr%>"/>"><B>Click here for complete rules
        &amp; regulations.</B></A>
</TD>
</TR>
<% } %>
</TABLE>

</div>
</div>
</TD>
<!-- Center Column Ends -->


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