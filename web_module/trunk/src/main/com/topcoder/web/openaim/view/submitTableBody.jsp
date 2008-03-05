<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ page import="com.topcoder.web.openaim.model.ReviewStatus" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
**************************************************
crappy looking to save space on the transmission
**************************************************
--%>

<c:if test="${param.ts!=null}">
    <taconite-root xml:space="preserve">
    <taconite-replace-children contextNodeID="submissions" parseInBrowser="true">
</c:if>
<% boolean even = true;%>
<c:set value="<%=ReviewStatus.FAILED%>" var="failed"/>
<c:set value="<%=ReviewStatus.PASSED%>" var="passed"/>
<c:set value="<%=Constants.SUBMISSION_ID%>" var="submissionId"/>

<c:forEach items="${submissions}" var="submission">
<% int col = 0;%>
<tc-webtag:errorIterator id="err" name="${submissionId}${submission.id}"><tr class="${cssClass}"><td class="value" colspan="9"><span class="bigRed">${err}</span></td></tr></tc-webtag:errorIterator>
<tr class="<%=even?"light":"dark"%>">
<td class="valueW"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div>&#160;</div>
</td>
<%--
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<c:choose>
<c:when test="${submission.review.status.id==failed}">
<!-- doesn't matter what goes in here, we're not populating it because it failed-->
<input type="text" maxlength="3" size="2" disabled="disabled"/>
</c:when>
<c:otherwise>
<tc-webtag:textInput name="${submissionId}${submission.id}" maxlength="3" size="2"/>
</c:otherwise>
</c:choose>
</td>
--%>
<td class="value"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<c:choose>
<c:when test="${submission.rank == null || submission.rank>contest.maxSubmissions.value}">
${submission.originalFileName}
</c:when>
<c:otherwise>
<nobr><%--<img src="/i/v2/selection.png" alt="Selection" />--%>${submission.originalFileName}</nobr>
</c:otherwise>
</c:choose>
</td>
<td class="value"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div id="pop${submission.id}" class="popUp">
<div>View submission</div>
</div>
<a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">
<img src="/i/events/openaim/interface/magnify.png" alt="" onmouseover="postPopUpText('globalPopupText','View submission'); popUp(this,'globalPopup');" onmouseout="popHide()"/>
</a>
</td>
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<tc-webtag:format object="${submission.createDate}" format="EEEE, MMMM d, yyyy '<br />' HH:mm z" timeZone="${sessionInfo.timezone}"/>
</td>
<%--
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<c:choose>
<c:when test="${submission.review.status==null}">
Pending
</c:when>
<c:otherwise>
<c:if test="${submission.review.status.id==failed}">
<span class="bigRed">${submission.review.status.description}</span>
</c:if>
<c:if test="${submission.review.status.id==passed}">
<span class="bigGreen">${submission.review.status.description}</span>
</c:if>
</c:otherwise>
</c:choose>
</td>
<c:choose>
<c:when test="${submission.review.status.id==failed}">
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div align="center" style="margin: 2px;">
<img src="/i/events/openaim/interface/btnMoveUpNA.png" alt="Move up"/>
</div>
<div align="center" style="margin: 2px;">
<img src="/i/events/openaim/interface/btnMoveDownNA.png" alt="Move down"/>
</div>
</td>
<td colspan="2" class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div align="center">
<img src="/i/events/openaim/interface/btnMoveToTopNA.png" alt="Move to top"/>
</div>
</td>
</c:when>
<c:otherwise>
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div align="center" style="margin: 2px;">
<c:choose>
<c:when test="${submission.rank==1}">
<img src="/i/events/openaim/interface/btnMoveUpNA.png" alt="Move up"/>
</c:when>
<c:otherwise>
<a href="#" onclick="changeRank(${submission.rank-1}, ${submission.id});return false;" onfocus="this.blur();" style="display: block;">
<img src="/i/events/openaim/interface/btnMoveUp.png" alt="Move up" />
</a>
</c:otherwise>
</c:choose>
</div>
<div align="center" style="margin: 2px;">
<c:choose>
<c:when test="${submission.rank==maxRank}">
<img src="/i/events/openaim/interface/btnMoveDownNA.png" alt="Move down"/>
</c:when>
<c:otherwise>
<a href="#" onclick="changeRank(${submission.rank+1}, ${submission.id});return false;" onfocus="this.blur();" style="display: block;">
<img src="/i/events/openaim/interface/btnMoveDown.png" alt="Move down" />
</a>
</c:otherwise>
</c:choose>
</div>
</td>
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div align="center">
<c:choose>
<c:when test="${submission.rank==1}">
<img src="/i/events/openaim/interface/btnMoveToTopNA.png" alt="Move to top"/>
</c:when>
<c:otherwise>
<a href="#" onclick="changeRank(1, ${submission.id});return false;" onfocus="this.blur();" style="display: block;">
<img src="/i/events/openaim/interface/btnMoveToTop.png" alt="Move to top" />
</a>
</c:otherwise>
</c:choose>
</div>
</td>
<td class="valueC"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div align="center">
<a href="#" onclick="remove(${submission.id});return false;" onfocus="this.blur();" style="display: block;">
<img src="/i/events/openaim/interface/btnRemove.png" alt="Remove" />
</a>
</div>
</td>
</c:otherwise>
</c:choose>
--%>
<td class="valueE"<c:if test="${newRank==submission.rank}"> id="fade<%=col++%>"</c:if>>
<div>&#160;</div>
</td>
</tr>
<% even = !even;%>
</c:forEach>

<c:if test="${param.ts!=null}">
    </taconite-replace-children>
    </taconite-root>
</c:if>
