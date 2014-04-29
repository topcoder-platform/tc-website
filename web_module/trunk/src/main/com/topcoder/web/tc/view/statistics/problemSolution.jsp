<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.Request,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.tc.Constants,
                com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,
                java.util.StringTokenizer"

        %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics - Problem Solution</TITLE>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD WIDTH="180" VALIGN="top" class="alignTop" class="alignTop">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_algo_stats"/>
    </jsp:include>
</TD>
<TD WIDTH="10" VALIGN="top" class="alignTop" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
<TD CLASS="bodyText" WIDTH="100%" VALIGN="top" class="alignTop" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR>


<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

<%
    //common code that pulls out the request bean.
    Request srb = (Request) request.getAttribute("REQUEST_BEAN");
    String sCoderId = srb.getProperty("cr", "");
    String sRoomId = srb.getProperty("rm", "");
    String sRoundId = srb.getProperty("rd", "");
    pageContext.setAttribute("pm", srb.getProperty("pm", ""));

//get the Header info

    ResultSetContainer rscHdr = (ResultSetContainer) queryEntries.get("Room_Header_Information");
    ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

    ResultSetContainer.ResultSetRow resultRowHdr = rscHdr.isValidRow(0) ? rscHdr.getRow(0) : null;

    String sMatch = "";
    String sRoomName = "";

    if (resultRowHdr != null) {
        sMatch = resultRowHdr.getItem(0).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(1).toString();
        sRoomName = resultRowHdr.getItem(2).toString();
    }

//get the Problem Name info
    ResultSetContainer rscInfo = (ResultSetContainer) queryEntries.get("Problem_Data");
    ResultSetContainer.ResultSetRow resultRow_Info = rscInfo.isValidRow(0) ? rscInfo.getRow(0) : null;
    String sClassName = resultRow_Info != null ? resultRow_Info.getItem(0).toString() : "";

//get the solution text
    ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Submission");
    ResultSetContainer.ResultSetRow resultRow_0 = rsc.isValidRow(0) ? rsc.getRow(0) : null;
    String sSolutionText = resultRow_0 != null ? resultRow_0.getItem("submission_text").toString() : "";
    
    String roundOverviewLink = "/stat?c=round_overview&rd=" + sRoundId;
    String roomStatsLink = "/stat?c=coder_room_stats&cr=" + sCoderId + "&rd=" + sRoundId;

%>
<%!
    private String addSpace(String text) {
        int i = -1;
        text = JSPUtils.htmlEncode(text);
        while ((i = text.indexOf("\n\n")) >= 0) {
            text = text.substring(0, i + 1) + "&#160;" + text.substring(i + 1);

        }

        StringTokenizer strtok = new StringTokenizer(text, "\n");
        StringBuffer stBuffer = new StringBuffer(text.length());
        String sTemp = "";
        while (strtok.hasMoreTokens()) {
            sTemp = strtok.nextToken();
            for (i = 0; i < sTemp.length(); i++) {
                if (sTemp.charAt(i) == ' ')
                    stBuffer.append("&#160;");
                else
                    stBuffer.append(sTemp.charAt(i));
            }
            stBuffer.append("<BR>");
        }
        return stBuffer.toString();
    }
%>

<!-- BEGIN BODY -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
    <TR>
        <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom" class="alignBottom">
            <IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
        <TD VALIGN="bottom" class="alignBottom" WIDTH="180" ALIGN="left">
            <IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
        <TD CLASS="bodyTextBold" VALIGN="middle" class="alignMiddle" WIDTH="100%">
            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Statistics&#160;&#160;</SPAN>
        </TD>
        <TD VALIGN="top" class="alignTop" class="alignTop" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
    </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%"  class="paddingTable">
<TR>
<TD VALIGN="top" class="alignTop" class="alignTop" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
    <TR>
        <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
    </TR>
    <TR>
        <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"></TD>
    </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="8" HEIGHT="18">&#160;Problem Statistics for
            <A href="<%= roundOverviewLink %>" class="statText"><%=sMatch%></A> > <A href="<%=roomStatsLink%>" class="statText"><%= sRoomName %></A> > <tc-webtag:handle coderId="<%= sCoderId %>" context='algorithm' />
        </TD>
    </TR>
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" class="alignMiddle" WIDTH="10">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" WIDTH="20%" HEIGHT="18">Class Name</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Method Name</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">&#160;</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Difficulty</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Status</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="right">Score</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" class="alignTop" class="alignTop" WIDTH="10">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <% ResultSetContainer rscSubmissions = (ResultSetContainer) queryEntries.get("Coder_Problems");
        pageContext.setAttribute("resultSetSubmissions", rscSubmissions);
        if (rscSubmissions.size() > 0) { %>
    <logic:iterate name="resultSetSubmissions" id="resultRow" type="ResultSetContainer.ResultSetRow">
        <TR>
            <TD VALIGN="middle" class="alignMiddle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <% if (pageContext.getAttribute("pm").toString().equals(resultRow.getItem(2).toString())) { %>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" WIDTH="20%" HEIGHT="18">
                <SPAN CLASS="coderBrackets">[&#160;</SPAN><SPAN CLASS="statText"><bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></SPAN><SPAN CLASS="coderBrackets">&#160;]</SPAN>
            </TD>
            <% } else { %>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" WIDTH="20%" HEIGHT="18">
                <A HREF="/stat?c=problem_solution&rd=<%= sRoundId %>&rm=<%=sRoomId %>&cr=<%=sCoderId%>&pm=<bean:write name="resultRow" property='<%= "item[" + 2 /* class name */ + "]" %>'/>" CLASS="statText">
                    <bean:write name="resultRow" property='<%= "item[" + 0 /* class name */ + "]" %>'/></A>
            </TD>
            <% } %>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">
                <bean:write name="resultRow" property='<%= "item[" + 1 /* method name */ + "]" %>'/></TD>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">
                <% if (sSolutionText.trim().length()==0) { %>
                &#160;
                <% } else { %>
                <a href="/tc?<%=Constants.MODULE_KEY%>=ProblemDetail&amp;<%=Constants.ROUND_ID%>=<%=sRoundId%>&pm=<rsc:item name="problem_id" row="<%=resultRow%>"/>" class="statText">problem
                    details</a>
                <% } %>
            </TD>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">
                <bean:write name="resultRow" property='<%= "item[" + 3 /* problem level */ + "]" %>'/></TD>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">
                <bean:write name="resultRow" property='<%= "item[" + 6 /* problem status*/ + "]" %>'/></TD>
            <TD CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="right">
                <bean:write format="0.00" name="resultRow" property='<%= "item[" + 7 /* score*/ + "].resultData" %>'/></TD>
            <TD VALIGN="top" class="alignTop" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        </TR>
    </logic:iterate>
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
    </TR>
    <% } %>
    <TR>
        <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="8">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
    </TR>
    <TR>
        <TD CLASS="statText" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
    </TR>


    <TR>
        <TD CLASS="statText" COLSPAN="8" VALIGN="middle" class="alignMiddle" ALIGN="center">
            <A HREF="/stat?c=problem_statement&pm=<%= pageContext.getAttribute("pm").toString()%>&rd=<%=sRoundId%>&rm=<%=sRoomId%>&cr=<%=sCoderId%>" CLASS="statText">View&nbsp;<%= sClassName %>
                &nbsp; Problem Statement</A>
        </TD>
    </TR>
    <TR>
        <TD CLASS="problemText" COLSPAN="8" VALIGN="middle" class="alignMiddle" ALIGN="left">
            <%= sSolutionText.trim().length() == 0 ? "Solution Not Available" : addSpace(sSolutionText) %>
        </TD>
    </TR>
    <TR>
        <TD COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
    </TR>
</TABLE>
<!-- Defenses -->
<% ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Problem_Defenses");
    pageContext.setAttribute("resultSetDefense", rscDefense);
    if (rscDefense.size() > 0) {
        int row = 0;
%>
<a name="defenses"></a>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
    <TR>
        <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="10" HEIGHT="18">&#160;Defense Results</TD>
    </TR>
    <TR>
        <TD COLSPAN="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" class="alignMiddle" WIDTH="10">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" WIDTH="20%" HEIGHT="18">Challenger</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Challenge Arguments</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" class="alignMiddle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Expected Result</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" class="alignMiddle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Received Result</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" class="alignMiddle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" class="alignMiddle" ALIGN="center">Succeeded</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" class="alignTop" class="alignTop" WIDTH="10">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <logic:iterate name="resultSetDefense" id="resultRow" type="ResultSetContainer.ResultSetRow">
        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 1 /*"challenger Rating"*/ + "]" %>'/>
        <TR>
            <TD COLSPAN="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% if (row % 2 == 0) { %>

        <TR>
            <TD VALIGN="middle" class="alignMiddle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                <A HREF="/tc?module=MemberProfile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>">
                    <bean:write name="resultRow" property='<%= "item[" + 0 /* challenger name */ + "]" %>'/></A>
            </TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(7).toString())%></TD>
            <TD VALIGN="middle" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(3).toString())%></TD>
            <TD VALIGN="middle" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(4).toString())%></TD>
            <TD VALIGN="middle" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><%= resultRow.getItem(6).toString().equals("Y") ? "Yes" : "No" %></TD>
            <TD VALIGN="top" class="alignTop" class="alignTop" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <TR>
            <TD COLSPAN="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% } else { %>
        <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                <A HREF="/tc?module=MemberProfile&cr=<bean:write name="resultRow" property='<%= "item[" + 2 /* challenger id */ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>">
                    <bean:write name="resultRow" property='<%= "item[" + 0 /* challenger name */ + "]" %>'/></A>
            </TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(7).toString())%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(3).toString())%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><%= addSpace(resultRow.getItem(4).toString())%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><%= resultRow.getItem(6).toString().equals("Y") ? "Yes" : "No" %></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" class="alignTop" class="alignTop" WIDTH="10">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="10">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% }
            row++;
        %>


    </logic:iterate>
    <TR>
        <TD COLSPAN="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>

</TABLE>
<% } //end if there are > 0 defenses %>


<!-- End Defense -->
<!-- System Testing -->
<% ResultSetContainer rscSysTest = (ResultSetContainer) queryEntries.get("System_Tests");
    pageContext.setAttribute("resultSetSysTest", rscSysTest);
    if (rscSysTest.size() > 0) {
        int row = 0;
%>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
    <TR>
        <TD COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="9" HEIGHT="18">&#160;System Test Results</TD>
    </TR>
    <TR>
        <TD COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Test
            Arguments</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">Expected Results</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">Success</TD>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="5">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
    </TR>
    <logic:iterate name="resultSetSysTest" id="resultRow" type="ResultSetContainer.ResultSetRow">
        <TR>
            <TD COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% if (row % 2 == 0) { %>
        <TR VALIGN="top" class="alignTop">
            <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(0))%></TD>
            <TD WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" ALIGN="right"><%= JSPUtils.htmlEncode(resultRow.getItem(1))%></TD>
            <TD WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD CLASS="statText" ALIGN="right"><%= resultRow.getItem(4).toString().equals("1") ? "Passed" : "<span class=bigRed>FAILED - Result:&#160;&#160;&#160;&#160;" + JSPUtils.htmlEncode(resultRow.getItem(2)) + "</span>"%></TD>
            <TD WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <TR>
            <TD COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% } else { %>
        <TR VALIGN="top" class="alignTop">
            <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="10">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="left"><%= JSPUtils.htmlEncode(resultRow.getItem(0))%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><%= JSPUtils.htmlEncode(resultRow.getItem(1))%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" ALIGN="right"><%= resultRow.getItem(4).toString().equals("1") ? "Passed" : "<span class=bigRed>FAILED - Result:   " + JSPUtils.htmlEncode(resultRow.getItem(2)) + "</span>"%></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" WIDTH="5">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="9">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        </TR>
        <% }
            row++;
        %>
    </logic:iterate>
    <TR>
        <TD COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    </TR>
</TABLE>
<% } %>
<!-- End System Testing -->
</TD>
</TR>
<TR>
    <TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
</TR>
</TABLE>

<p><br></p>

<!-- END BODY -->

</TD>
<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
<TD WIDTH="180" VALIGN="top" class="alignTop" class="alignTop"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
    <rsc:iterator list="<%=image%>" id="resultRow">
        <CENTER>
            <A HREF="<rsc:item name="link" row="<%=resultRow%>"/>"><img src="<rsc:item name="file" row="<%=resultRow%>"/>" ALT="" WIDTH="<rsc:item name="width" row="<%=resultRow%>"/>" HEIGHT="<rsc:item name="height" row="<%=resultRow%>"/>" BORDER="0"/></A>
        </CENTER>
    </rsc:iterator>
    <jsp:include page="../public_right.jsp"/>
</TD>
<!-- Gutter -->
<TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Gutter Ends -->
</TR>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>

