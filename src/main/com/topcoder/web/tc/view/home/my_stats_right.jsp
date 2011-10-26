<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.model.CoderSessionInfo"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coderInfo= (ResultSetContainer)request.getAttribute("member_info");%>
<% CoderSessionInfo info = (CoderSessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);%>

<% if (coderInfo!=null && !coderInfo.isEmpty()) { %>
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
<tbody>
    <tr>
        <td class="valueC" colspan="2">
        <strong>Coder: 
        <tc-webtag:handle coderId='<%=coderInfo.getLongItem(0, "coder_id")%>' darkBG='true'/>
        </strong>
        </td>
    </tr>
    <tr>
        <td class="valueC" colspan="2">
            <strong>Total Earnings: 
            <% if (coderInfo.getItem(0, "overall_earnings").getResultData() == null || coderInfo.getDoubleItem(0, "overall_earnings") > 0) { %>
                <a href="/tc?module=PaymentSummary&cr=<%=info.getUserId()%>" class="gMetal">
                    <rsc:item set="<%=coderInfo%>" name="overall_earnings" format="$#,##0.00" ifNull="$0.00"/>
                </a>
            <% } else { %>
                $0.00
            <% } %>
            </strong>
        </td>
    </tr>
    <tr>
        <td class="valueC" colspan="2">
        <a href="<%=coderInfo.getIntItem(0, "has_image")==0?"https://"+request.getServerName()+"/reg/?nrg=false":"/tc?module=MemberProfile&cr="+coderInfo.getIntItem(0, "coder_id")%>"><img src="<rsc:item set="<%=coderInfo%>" name="image_path" ifNull="/i/m/nophoto_submit.gif"/>" alt="" width="126" height="140" border="0" class="myStatsPhoto" /></a>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="header">Algorithm</td>
    </tr>
    <tr>
        <td class="value">Rating</td>
        <td class="valueR">
        <% if (coderInfo.getItem(0, "rating").getResultData()==null||coderInfo.getIntItem(0, "rating")<1) { %>
        Not Rated
        <% } else { %>
        <a class="gMetal" href="/tc?module=AlgoCompetitionHistory&cr=<%=info.getUserId()%>"><rsc:item set="<%=coderInfo%>" name="rating" ifNull="Not Rated"/></a>
        <% } %>
        <% if (coderInfo.getItem(0, "rating").getResultData()!=null&&coderInfo.getIntItem(0, "rating")>0) { %>
            <div>
                <a class="gMetal" href="/stat?c=coder_room_stats&cr=<%=coderInfo.getLongItem(0, "coder_id")%>">My Last Match</a>
            </div>
        <% } %>
        </td>
    </tr>

    <tr><td colspan="2" class="header">Design</td></tr>

    <tr>
        <td class="value">Rating</td>
        <td class="valueR">
            <% if (coderInfo.getItem(0, "design_rating").getResultData()!=null 
                    && coderInfo.getIntItem(0, "design_rating")>0) { %>
            <a class="gMetal" href="/tc?module=CompetitionHistory&ph=112&cr=<%=info.getUserId()%>">
                <rsc:item set="<%=coderInfo%>" name="design_rating" format="#"/>
            </a>
            <% } else {%>
            Not Rated
            <% } %>
        </td>
    </tr>

    <tr><td colspan="2" class="header">Development</td></tr>

    <tr>
        <td class="value">Rating</td>
        <td class="valueR">
            <% if (coderInfo.getItem(0, "development_rating").getResultData()!=null 
                    && coderInfo.getIntItem(0, "development_rating")>0) { %>
            <a class="gMetal" href="/tc?module=CompetitionHistory&ph=113&cr=<%=info.getUserId()%>">
                <rsc:item set="<%=coderInfo%>" name="development_rating" format="#"/>
            </a>
            <% } else {%>
            Not Rated
            <% } %>
        </td>
    </tr>

    <tr>
        <td colspan="2" class="header">Marathon Match</td>
    </tr>

    <tr>
        <td class="value">Rating</td>
        <td class="valueR">
        <% if (coderInfo.getItem(0, "mm_rating").getResultData()==null||coderInfo.getIntItem(0, "mm_rating")<1) { %>
        Not Rated
        <% } else { %>
            <a class="gMetal" href="/tc?module=SimpleStats&c=long_comp_history&d1=statistics&d2=longHistory&cr=<%=info.getUserId()%>">
                <rsc:item set="<%=coderInfo%>" name="mm_rating" ifNull="Not Rated"/></a>
        <% } %>
        </td>
    </tr>
</table>

<% } else { %>
<table cellpadding="0" cellspacing="0" class="rightNav" style="width: 180px;">
<tbody>
    <tr>
        <td class="title">Coder: 
        <a href="/tc?module=MemberProfile&cr=<%=info.getUserId()%>" class="<tc:ratingStyle rating='<%=info.getRating()%>'/>"><%=info.getHandle()%></a>
        </td>
    </tr>
    <tr>
        <td class="value">
            <p>You are not rated for any TopCoder Competition.</p>

            <p>To learn more about Algorithm Competitions, go to the 
            <a href="/tc?module=Static&d1=help&d2=index" class="statText">Competition Guide.</a></p>

         <p>To learn more about Design Competitions, check out 
         <a href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted" class="statText">this tutorial</a>.</p>

         <p>To learn more about Development Competitions, check out 
            <a href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted" class="statText">this tutorial</a>.</p>
        </td>
    </tr>
</tbody>
</table>

<% } %>