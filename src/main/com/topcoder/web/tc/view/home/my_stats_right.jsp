<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>

<% if (coderInfo!=null && !coderInfo.isEmpty()) { %>
    <table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
        <tr valign="middle">
            <td class="statTextBig" bgcolor="#333333">&#160;Coder: <a href="/stat?c=member_profile&cr=<rsc:item set="<%=coderInfo%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=coderInfo.getIntItem(0, "rating")%>'/>"><rsc:item set="<%=coderInfo%>" name="handle"/></a></td>
        </tr>

        <tr valign="middle">
            <td align="center"><a href="/stat?c=member_profile&cr=<rsc:item set="<%=coderInfo%>" name="coder_id"/>"><img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" width="126" height="140" border="0" class="memberPhoto" /></a></td>
        </tr>
    </table>

    <table width="180" border="0" cellspacing="0" cellpadding="3" bgcolor="#333333">
        <tr><td colspan="2" background="/i/graybv_lite_bg.gif" class="statTextBig">&nbsp;Algorithm</td></tr>

        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Rating</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="rating"/>&nbsp;</td>
        </tr>
        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Earnings</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="total_earnings" format="$#.##"/>&nbsp;</td>
        </tr>

        <tr><td colspan="2" background="/i/graybv_lite_bg.gif" class="statTextBig">&nbsp;Design</td></tr>

        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Rating</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="design_rating" ifNull="Not Rated"/>&nbsp;</td>
        </tr>
        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Earnings</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="design_earnings" format="$#.##"/>&nbsp;</td>
        </tr>

        <tr><td colspan="2" background="/i/graybv_lite_bg.gif" class="statTextBig">&nbsp;Development</td></tr>

        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Rating</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="developement_rating" ifNull="Not Rated"/>&nbsp;</td>
        </tr>
        <tr valign="middle">
            <td align="left" class="statText">&nbsp;Earnings</td>
            <td align="right" class="statText"><rsc:item set="<%=coderInfo%>" name="development_earnings" format="$#.##"/>&nbsp;</td>
        </tr>
    </table>
<% } %>