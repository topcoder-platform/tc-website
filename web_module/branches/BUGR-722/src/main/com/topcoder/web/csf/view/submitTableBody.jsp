<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page import="com.topcoder.web.csf.model.ReviewStatus" %>
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
<c:choose>
<c:when test="${submission.rank == null || submission.rank>contest.maxSubmissions.value}">
<c:set value="<%=even ? "light" : "dark"%>" var="cssClass"/>
</c:when>
<c:otherwise>
<c:set value="<%=even ? "highlightLt" : "highlightDk"%>" var="cssClass"/>
</c:otherwise>
</c:choose>
<tc-webtag:errorIterator id="err" name="${submissionId}${submission.id}"><tr class="${cssClass}"><td class="value" colspan="9"><span class="bigRed">${err}</span></td></tr></tc-webtag:errorIterator>
<tr class="${cssClass}">
<%--
<td class="valueW" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<div>&#160;</div>
</td>
--%>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<c:choose>
<c:when test="${submission.review.status.id==failed}">
<%-- doesn't matter what goes in here, we're not populating it because it failed--%>
<input type="text" maxlength="3" size="2" disabled="disabled"/>
</c:when>
<c:otherwise>
<tc-webtag:textInput name="${submissionId}${submission.id}" maxlength="3" size="2"/>
</c:otherwise>
</c:choose>
</td>
<td class="value" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
${submission.originalFileName}
<%--
</td>
<td class="value" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
--%>
<div id="pop${submission.id}" class="popUp"><div>View submission</div></div>
<A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">
<img src="/i/layout/magnify.gif" alt="" align="absmiddle" onmouseover="popUp(this,'pop${submission.id}')" onmouseout="popHide()" />
</A>

</td>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<tc-webtag:format object="${submission.submissionDate}" format="EEEE, MMMM d, yyyy '<br />' HH:mm z" timeZone="${sessionInfo.timezone}"/>
</td>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
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
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<div align="center" style="margin:2px;">
<img src="/i/layout/btnMoveUpNA.png" alt="Raise priority"/>
</div>
<div align="center" style="margin:2px;">
<img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
</div>
</td>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<div align="center">
<img src="/i/layout/btnMoveToTopNA.png" alt="Move to top"/>
</div>
</td>
</c:when>
<c:otherwise>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<div align="center" style="margin:2px;">
<c:choose>
<c:when test="${submission.rank==1}">
<img src="/i/layout/btnMoveUpNA.png" alt="Raise priority"/>
</c:when>
<c:otherwise>
<A href="#" onclick="changeRank(${submission.rank-1}, ${submission.id});return false;" onfocus="this.blur();"><img src="/i/layout/btnMoveUp.png" alt="Move up" onmouseover="this.src = '/i/layout/btnMoveUpOn.png';" onmouseout="this.src = '/i/layout/btnMoveUp.png';"/></A>
</c:otherwise>
</c:choose>
</div>
<div align="center" style="margin:2px;">
<c:choose>
<c:when test="${submission.rank==maxRank}">
<img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
</c:when>
<c:otherwise>
<A href="#" onclick="changeRank(${submission.rank+1}, ${submission.id});return false;" onfocus="this.blur();"><img src="/i/layout/btnMoveDown.png" alt="Move down" onmouseover="this.src = '/i/layout/btnMoveDownOn.png';" onmouseout="this.src = '/i/layout/btnMoveDown.png';"/></A>
</c:otherwise>
</c:choose>
</div>
</td>
<td class="valueC" <c:if test="${newRank==submission.rank}">id="fade<%=col++%>"</c:if>>
<div align="center">
<c:choose>
<c:when test="${submission.rank==1}">
<img src="/i/layout/btnMoveToTopNA.png" alt="Move to top"/>
</c:when>
<c:otherwise>
<A href="#" onclick="changeRank(1, ${submission.id});return false;" onfocus="this.blur();"><img src="/i/layout/btnMoveToTop.png" alt="Move to top" onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';" onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/></A>
</c:otherwise>
</c:choose>
</div>
</td>
</c:otherwise>
</c:choose>
</tr>
<% even = !even;%>
</c:forEach>

<c:if test="${param.ts!=null}">
    </taconite-replace-children>
</taconite-root>
</c:if>
