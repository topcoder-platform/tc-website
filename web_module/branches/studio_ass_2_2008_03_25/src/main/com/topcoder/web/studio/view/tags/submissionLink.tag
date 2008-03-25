<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ tag import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ tag body-content="empty" %>

<%@ attribute name="row" required="true" type="java.lang.Object" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<%-- Since TopCoder Modifications Assembly Req# 5.9, 5.10 --%>

<%
    ResultSetContainer.ResultSetRow resultRow = (ResultSetContainer.ResultSetRow) row;
%>

<c:choose>
    <c:when test="<%=resultRow.getIntItem("contest_channel_id") == ContestChannel.STUDIO_ADMINISTRATOR_V1.intValue()%>">
        <c:choose>
            <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                <div align="center">
                    <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                    <div style="overflow: hidden; width: 300px;">
                        <studio_tags:submissionDisplay submissionId="${resultRow.map['submission_id']}" width="${resultRow.map['width']}" height="${resultRow.map['height']}"/>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div align="center">
                    <strong>ID:</strong> <rsc:item name="submission_id" row="<%=resultRow%>"/>
                    <br />
                    <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                        <img src="/i/v2/interface/magnify.png" alt="" onmouseover="popUp(this,'popView')" onmouseout="popHide()"/>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <div align="center">
            <c:set var="imageRequired" value="<%=resultRow.getMap().get("require_preview_image")%>"/>
            <c:set var="fileRequired" value="<%=resultRow.getMap().get("require_preview_file")%>"/>
            <strong>ID:</strong>
            <rsc:item name="submission_id" row="<%=resultRow%>"/>
            <br/>
            <c:if test="${imageRequired or fileRequired}">
            <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                </c:if>
                <c:choose>
                    <c:when test="${imageRequired}">
                        <img src="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ALT_TYPE%>=small&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>"
                             alt="" onmouseover="popUp(this,'popView')" onmouseout="popHide()"/>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${fileRequired}">
                                <img src="/i/v2/interface/magnify.png" alt="" onmouseover="popUp(this,'popView')"
                                     onmouseout="popHide()"/>
                            </c:when>
                            <c:otherwise>
                                <img src="/i/v2/interface/magnifyFade.png" alt=""/>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <c:if test="${imageRequired or fileRequired}">
            </a>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>
