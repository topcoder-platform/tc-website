<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.CoderSessionInfo,
                 com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>

<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="180" height="11"><img src="/i/my_stats_top.gif" alt="" width="180" height="11" border="0"></td></tr>
</table>

<% if (coderInfo!=null && !coderInfo.isEmpty()) { %>
<table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr>
        <td class="statTextBig" bgcolor="#333333">&#160;Coder: <a href="/stat?c=member_profile&cr=<rsc:item set="<%=coderInfo%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=coderInfo.getIntItem(0, "rating")%>'/>"><rsc:item set="<%=coderInfo%>" name="handle"/></a></td>
    </tr>

    <tr>
        <td align="center"><a href="<%=coderInfo.getIntItem(0, "has_image")==0?"https://"+request.getServerName()+"/Registration":"/stat?c=member_profile&cr="+coderInfo.getIntItem(0, "coder_id")%>"><img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" width="126" height="140" border="0" class="myStatsPhoto" /></a></td>
    </tr>
</table>

<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td colspan="2" class="myStatsTitle">Algorithm</td></tr>

    <tr>
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><rsc:item set="<%=coderInfo%>" name="rating" ifNull="Not Rated"/></td>
    </tr>
    <tr>
        <td class="myStatsEarningsName">Earnings</td>
        <td class="myStatsEarningsAmount"><rsc:item set="<%=coderInfo%>" name="total_earnings" format="$0.00"/></td>
        </tr>

    <tr><td colspan="2" class="myStatsTitle">Design</td></tr>

    <tr>
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><rsc:item set="<%=coderInfo%>" name="design_rating" ifNull="Not Rated"/></td>
    </tr>
    <tr>
        <td class="myStatsEarningsName">Earnings</td>
        <td class="myStatsEarningsAmount"><rsc:item set="<%=coderInfo%>" name="design_earnings" format="$0.00"/></td>
    </tr>

    <tr><td colspan="2" class="myStatsTitle">Development</td></tr>

    <tr valign="middle">
        <td class="myStatsRatingName">Rating</td>
        <td class="myStatsRatingAmount"><rsc:item set="<%=coderInfo%>" name="development_rating" ifNull="Not Rated"/></td>
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
        <td class="statTextBig" bgcolor="#333333">Coder: <a href="/stat?c=member_profile&cr=<%=info.getUserId()%>" class="<tc:ratingStyle rating='<%=info.getRating()%>'/>"><%=info.getHandle()%></a></td>
    </tr>

    <tr>
        <td class="statText">
            <p>You are not rated for any TopCoder Competition.</p>
            
            <p>To learn more about Algorithm Competitions, go to the <a href="/?&t=support&c=comp_preview" class="statText">Competition Preview.</a></p>
            
            <p>To learn more about Design and Development Competitions, go to <a href="/?&t=development&c=comp_meth" class="statText">Component Methodology.</a></p>
        </td>
    </tr>
</table>

<% } %>
<table width="180" border="0" cellspacing="0" cellpadding="0">
    <tr><td width="180" height="11"><img src="/i/my_stats_bottom.gif" alt="" width="180" height="11" border="0"></td></tr>
</table>
