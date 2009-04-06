<%@ tag import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ tag body-content="empty" %>
<%@ attribute name="row" required="true" type="java.lang.Object"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Since TopCoder Studio Modifications assembly Req# 5.2 --%>
<c:set value="<%=ContestChannel.TOPCODER_DIRECT%>" var="direct"/>
<c:choose>
    <c:when test="${row.map['contest_channel_id']==direct}">
        <img src="/i/tcdirectEmblem.png" alt="" class="inlineEmblem" />
    </c:when>
    <c:otherwise><img src="/i/studioEmblem.png" alt="" class="inlineEmblem" /></c:otherwise>
</c:choose>
