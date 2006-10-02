<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.web.common.tag.HandleTag,java.util.Map"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("QUERY_RESPONSE")).get("successful_challenges");
%>
<html>
<head>
    <TITLE>TopCoder Statistics - Most Rated Events</TITLE>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script language="JavaScript">
        <!--
        function goTo(selection) {
            sel = selection.options[selection.selectedIndex].value;
            if (sel && sel != '#') {
                window.location = sel;
            }
        }
        // -->
    </script>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD WIDTH="180" VALIGN="top">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="algo_recordbook"/>
    </jsp:include>
</TD>
<TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="bodyText" WIDTH="100%" VALIGN="top">
<IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
<!-- BEGIN BODY -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
    <TR>
        <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom">
            <IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
        <TD VALIGN="bottom" WIDTH="180" ALIGN="left">
            <IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
        <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Record Book&#160;&#160;</SPAN>
        </TD>
        <TD VALIGN="top" WIDTH="10" ALIGN="right">
            <IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
    </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
    <TR>
        <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
            <BR/>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                <TR>
                    <TD VALIGN="top" WIDTH="100%">
                        <IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

                        <P CLASS="statText">
                            This chart shows the coders that have gotten the most successful challenges in a single
                            match.
                        </P>

                        <!-- Stats Intro Begins -->
                        <jsp:include page="qsIntro.jsp"/>

                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                            <TR>
                                <TD COLSPAN="8" CLASS="smallFoot">
                                    <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                            </TR>
                            <TR>
                                <TD background="/i/steel_gray_bg.gif" COLSPAN="8" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">
                                    &nbsp;Challenge Success</TD>
                            </TR>
                            <TR>
                                <TD COLSPAN="8" CLASS="smallFoot" WIDTH="1">
                                    <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                            </TR>
                            <TR VALIGN="middle">
                                <TD class="statText">&nbsp;</TD>
                                <TD class="statText">&nbsp;</TD>
                                <TD class="statText">Handle</TD>
                                <TD class="statText">Successful Challenges</TD>
                                <TD class="statText">Failed Challenges</TD>
                                <TD class="statText">Net Challenge Points</TD>
                                <TD class="statText">Positive Challenge Points</TD>
                                <TD class="statText">Event</TD>
                            </TR>
                            <TR>
                                <TD COLSPAN="8" CLASS="smallFoot" WIDTH="1">
                                    <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                            </TR>
                            <rsc:iterator list="<%=rsc%>" id="row">
                                <tr>
                                    <td class="statText" align="right">
                                        <rsc:item name="rank" row="<%=row%>"/>&#160;</td>
                                    <td class="statText" align="right">
                                        <A HREF="/stat?c=coder_room_stats&amp;rd=<rsc:item name="round_id" row="<%=row%>"/>&cr=<rsc:item name="coder_id" row="<%=row%>"/>" CLASS="statText"><IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0">&#160;
                                        </A>
                                    </td>
                                    <td class="statText" width="20%">
                                        <tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                    <td class="statText" width="10%">
                                        <rsc:item name="challenges_made_successful" row="<%=row%>"/></td>
                                    <td class="statText" width="10%">
                                        <rsc:item name="challenges_made_failed" row="<%=row%>"/></td>
                                    <td class="statText" width="10%">
                                        <rsc:item name="challenge_points" row="<%=row%>" format="#.##"/></td>
                                    <td class="statText" width="10%">
                                        <rsc:item name="positive_challenge_points" row="<%=row%>" format="#.##"/></td>
                                    <td class="statText" width="20%">
                                        <a href="/stat?c=round_overview&amp;rd=<rsc:item name="round_id" row="<%=row%>"/>" class="statText">
                                            <rsc:item name="contest_name" row="<%=row%>"/> &gt;
                                            <rsc:item name="round_name" row="<%=row%>"/>
                                        </a>
                                    </td>
                                </tr>
                            </rsc:iterator>
                            <TR>
                                <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="8">
                                    <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                            </TR>
                            <TR>
                                <TD CLASS="statText" COLSPAN="8">
                                    <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                            </TR>
                        </TABLE>


                    </TD>
                </TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
    </TR>
</TABLE>

<p><br></p>

<!-- END BODY -->

</TD>
<TD WIDTH="10"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
    <jsp:include page="../public_right.jsp"/>
</TD>
<!-- Gutter -->
<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->
</TR>
</TABLE>
<jsp:include page="../foot.jsp"/>
</body>
</html>



