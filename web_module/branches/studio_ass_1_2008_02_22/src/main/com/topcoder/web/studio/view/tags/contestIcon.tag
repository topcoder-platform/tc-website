<%@ tag import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ tag import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ tag body-content="empty" %>
<%@ attribute name="row" required="true" type="java.lang.Object"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Since TopCoder Studio Modifications assembly Req# 5.2 --%>
<%
    ResultSetContainer.ResultSetRow item = (ResultSetContainer.ResultSetRow) row;
%>
<c:choose>
    <c:when test="<%=item.getIntItem("contest_channel_id") == ContestChannel.TOPCODER_DIRECT.intValue()%>">
        <img src="i/tcdirectEmblem.png" alt="" width="26" height="18"/>
    </c:when>
    <c:otherwise><img src="i/studioEmblem.png" alt="" width="26" height="18"/></c:otherwise>
</c:choose>
