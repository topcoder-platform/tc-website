<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"

%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<%--<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>--%>

<% //common code that pulls out the request bean.
    Request srb = (Request) request.getAttribute("REQUEST_BEAN");

    String streakType = srb.getProperty("wst","4");
    String streakDesc = null;
    if (streakType.equals("3")) streakDesc = "Single Round Matches";
    else if (streakType.equals("4")) streakDesc = "Single Round Matches and Tournaments";
    ResultSetContainer rsc = (ResultSetContainer)((Map)request.getAttribute("QUERY_RESPONSE")).get("consecutive_rating_increases");
%>
<html>
<head>
<TITLE>TopCoder Statistics - Consecutive Rating Increases</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
<script language="JavaScript">
<!--
function goTo(selection){
sel = selection.options[selection.selectedIndex].value;
if (sel && sel != '#'){
window.location=sel;
}
}
// -->
</script>
</HEAD>
<BODY>
  <jsp:include page="../top.jsp" />
  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR>
  <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="quick_stats"/>
            </jsp:include>
            </TD>
            <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
            <!-- BEGIN BODY -->
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
            <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
            <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
            <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
            </TD>
            <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
            </TR>
            </TABLE>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
            <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
            <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
            <P CLASS="statText">
            This chart represents the longest consecutive rating increase streaks.
            </P>
            <P CLASS="statText">
<% if (streakType.equals("4")){ %>
View consecutive rating increase streaks for <A CLASS="statText" HREF="/stat?c=consecutive_rating_increases&wst=3">Single Round Matches</A>
    <% } else { %>
    View consecutive rating increase streaks for <A CLASS="statText" HREF="/stat?c=consecutive_rating_increases&wst=4">Single Round Matches and Tournaments</A>
    <% } %>
    </P>
    <!-- Stats Intro Begins -->
        <jsp:include page="qsIntro.jsp" />

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
            </TR>
            <TR>
                <TD background="/i/steel_gray_bg.gif" COLSPAN="7" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Consecutive Rating Increases for <%=streakDesc%></TD>
            </TR>
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            </TR>
            <TR VALIGN="middle">
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="20%">Handle</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="15%">Consecutive Rating Increases</TD>
                <TD colspan="3" CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="40%">Round Duration</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">Start/End Date</TD>
            </TR>
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            </TR>

            <rsc:iterator list="<%=rsc%>" id="resultRow">
                <tr valign="middle">
                    <td CLASS="smallFoot" align="right" height="13"><rsc:item row="<%=resultRow%>" name="rank"/>&nbsp;</td>
                    <td CLASS="statText"><a href="/tc?module=MemberProfile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a></td>
                    <TD CLASS="statText" ALIGN="center"><rsc:item row="<%=resultRow%>" name="length"/></TD>
                    <TD CLASS="statText" ALIGN="right" width="18%"><rsc:item row="<%=resultRow%>" name="start_contest_name"/></td>
                    <TD CLASS="statText" ALIGN="center" width="4%">&nbsp;-&nbsp;</td>
                    <TD CLASS="statText" ALIGN="left" width="18%"><rsc:item row="<%=resultRow%>" name="end_contest_name"/></TD>
                    <TD CLASS="statText" ALIGN="center"><rsc:item row="<%=resultRow%>" name="start_date" format="MM.dd.yy"/>&nbsp;-&nbsp;<rsc:item row="<%=resultRow%>" name="end_date" format="MM.dd.yy"/></TD>
                </tr>
            </rsc:iterator>
            <TR>
                <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
            </TR>
            <TR>
                <TD CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
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
         <jsp:include page="../public_right.jsp" />
         </TD>
         <!-- Gutter -->
         <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
         <!-- Gutter Ends -->
         </TR>
         </TABLE>
   <jsp:include page="../foot.jsp" />
</body>
</html>



