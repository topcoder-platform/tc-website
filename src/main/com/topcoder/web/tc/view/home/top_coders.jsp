<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<% ResultSetContainer coders = (ResultSetContainer)request.getAttribute("top_coders");%>

<table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
    <tr valign="middle">
        <td class="statTextBig" width="1%" nowrap="0">&#160;Top 10 Coders</td>
        <td class="statTextBig" width="15"><A href="javascript:infoWindow('/tc?&amp;module=Static&amp;d1=statistics&amp;d2=info&amp;d3=topRatedCoders')" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
        <td class="statTextBig" align="right" width="99%"><a href="/stat?c=coder_ratings" class="statTextBig">View all coders</a>&#160;</td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
    <tr valign="middle">
        <td align="center" background="/i/graybv_lite_bg.gif" class="statText" width="10%">&#160;Rank</td>
        <td align="left" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Handle</td>
        <td align="right" background="/i/graybv_lite_bg.gif" class="statText" width="45%">Rating</td>
    </tr>
    <rsc:iterator list="<%=coders%>" id="resultRow">
        <tr>
            <td align="right" class="formHandleOdd"><rsc:item name="rank" row="<%=resultRow%>"/></td>
            <td align="left" class="formHandleOdd" nowrap="nowrap"><a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRowS%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a></td>
            <td align="right" class="formHandleOdd" nowrap="nowrap"><rsc:item name="rating" row="<%=resultRow%>"/></td>
        </tr>
    </rsc:iterator>
</table>