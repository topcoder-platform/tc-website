<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.model.CoderSessionInfo,
                 com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>

<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="180" height="11"><img src="/i/my_stats_top.gif" alt="" width="180" height="11" border="0"></td></tr>
</table>

<% if (coderInfo!=null && !coderInfo.isEmpty()) { %>
<table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr>
        <td class="statTextBig" bgcolor="#333333">&#160;Coder: <tc-webtag:handle coderId='<%=coderInfo.getLongItem(0, "coder_id")%>'/></td>
    </tr>

    <tr>
        <td align="center"><a href="<%=coderInfo.getIntItem(0, "has_image")==0?"https://"+request.getServerName()+"/Registration":"/tc?module=MemberProfile&cr="+coderInfo.getIntItem(0, "coder_id")%>"><img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" width="126" height="140" border="0" class="myStatsPhoto" /></a></td>
    </tr>
</table>

<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td colspan="2" class="myStatsTitle">Algorithm</td></tr>

    <tr>
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><% if (coderInfo.getIntItem(0, "rating")<1) { %>Not Rated<% } else { %><rsc:item set="<%=coderInfo%>" name="rating" ifNull="Not Rated"/><% } %></td>
    </tr>
    <tr>
        <td class="myStatsEarningsName">Earnings</td>
        <td class="myStatsEarningsAmount"><rsc:item set="<%=coderInfo%>" name="total_earnings" format="$0.00" ifNull="$0.00"/></td>
        </tr>

    <tr><td colspan="2" class="myStatsTitle">Design</td></tr>

    <tr>
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><rsc:item set="<%=coderInfo%>" name="design_rating" ifNull="Not Rated" format="#"/></td>
    </tr>
    <tr>
        <td class="myStatsEarningsName">Earnings</td>
        <td class="myStatsEarningsAmount"><rsc:item set="<%=coderInfo%>" name="design_earnings" format="$0.00"/></td>
    </tr>

    <tr><td colspan="2" class="myStatsTitle">Development</td></tr>

    <tr valign="middle">
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><rsc:item set="<%=coderInfo%>" name="development_rating" ifNull="Not Rated" format="#"/></td>
    </tr>
    <tr valign="middle">
        <td class="myStatsEarningsName">Earnings</td>
        <td class="myStatsEarningsAmount"><rsc:item set="<%=coderInfo%>" name="development_earnings" format="$0.00"/></td>
    </tr>
</table>

<% } else { %>
<table width="180" border="0" cellspacing="0" cellpadding="5" bgcolor="#555555">
<% CoderSessionInfo info = (CoderSessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);%>
    <tr>
        <td class="statTextBig" bgcolor="#333333">Coder: <a href="/tc?module=MemberProfile&cr=<%=info.getUserId()%>" class="<tc:ratingStyle rating='<%=info.getRating()%>'/>"><%=info.getHandle()%></a></td>
    </tr>

    <tr>
        <td class="statText">
            <p>You are not rated for any TopCoder Competition.</p>

            <p>To learn more about Algorithm Competitions, go to the <a href="/tc?module=Static&d1=help&d2=index" class="statText">Competition Guide.</a></p>

            <p>To learn more about Design and Development Competitions, go to <a href="/?t=development&c=comp_meth" class="statText">Component Methodology.</a></p>
        </td>
    </tr>
</table>

<% } %>
<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="180" height="11"><img src="/i/my_stats_bottom.gif" alt="" width="180" height="11" border="0"></td></tr>
</table>
