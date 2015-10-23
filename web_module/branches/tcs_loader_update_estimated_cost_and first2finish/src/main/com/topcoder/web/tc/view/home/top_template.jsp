<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer coders = (ResultSetContainer)request.getAttribute(request.getParameter("name"));%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
    <c:when test="${not empty isNewStyle && isNewStyle}">
        <table>
            <thead>
            <tr>
                <th class="colNum">#</th>
                <th class="colHandle">Handle</th>
                <th class="colRating">Rating</th>
            </tr>
            </thead>
            <tbody>
            <rsc:iterator list="<%=coders%>" id="resultRow">
                <tr>
                    <td class="colNum"><rsc:item name="rank" row="<%=resultRow%>"/></td>
                    <td class="colHandle"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="${param.ctxt}" /></td>
                    <td class="colRating"><rsc:item name="rating" row="<%=resultRow%>" format="#"/></td>
                </tr>
            </rsc:iterator>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <div id="${param.id}" style="display: none;">
            <table cellpadding="0" cellspacing="0" class="rightNav" style="width: 100%;">
                <tbody>
                <tr>
                    <td class="title" colspan="3">${param.title} &nbsp;<A href="javascript:infoWindow('${param.help}')"><img src="/i/icon_help_blue.gif" alt="?" border="0"/></A></td>
                </tr>
                <tr>
                    <td class="headerC">&nbsp;</td>
                    <td class="header">Handle</td>
                    <td class="headerR">Rating</td>
                </tr>
                <%boolean even = true;%>
                <rsc:iterator list="<%=coders%>" id="resultRow">
                    <tr>
                        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
                        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="${param.ctxt}" /></td>
                        <td class="valueR"><rsc:item name="rating" row="<%=resultRow%>" format="#"/></td>
                    </tr>
                    <%even = !even;%>
                </rsc:iterator>
                <tr>
                    <td class="valueR" colspan="3"><strong><a href="/stat?c=${param.name}" class="gMetal">View all</a></strong></td>
                </tr>
                </tbody>
            </table>
        </div>

    </c:otherwise>
</c:choose>

