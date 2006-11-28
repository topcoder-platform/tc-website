<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ReviewStatus" %>
<%@ page contentType="text/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<taconite-root xml:space="preserve">
    <taconite-replace-children contextNodeID="submissions" parseInBrowser="true">
        <% boolean even = true;%>
        <c:set value="<%=ReviewStatus.FAILED%>" var="failed"/>


        <c:forEach items="${submissions}" var="submission">
            <c:choose>
                <c:when test="${submission.rank == null || submission.rank>contest.maxSubmissions.value}">
                    <c:set value="<%=even ? "light" : "dark"%>" var="cssClass"/>
                </c:when>
                <c:otherwise>
                    <c:set value="<%=even ? "highlightLt" : "highlightDk"%>" var="cssClass"/>
                </c:otherwise>
            </c:choose>
            <tr class="${cssClass}" id="tr${submission.rank}">
                <td class="valueW">
                    <div>&#160;</div>
                </td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="${submission.review.status.id==failed}">
                            <input type="text" maxlength="3" class="" name="" value="${submission.rank}" size="1"
                                   align="center"
                                   disabled="disabled"/>
                        </c:when>
                        <c:otherwise>
                            <input type="text" maxlength="3" class="" name="" value="${submission.rank}" size="1"
                                   align="center"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="value">
                        ${submission.originalFileName}
                </td>
                <td class="value">
                    <div class="container">
                        <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">
                            <img src="/i/layout/magnify.gif" alt="View submission" border="0"
                                 onmouseover="popUp('pop${submission.id}')" onmouseout="popHide()"/>
                        </a>

                        <div id="pop${submission.id}" class="popUp">
                            <div>View submission</div>
                        </div>
                    </div>
                </td>
                <td class="valueC">
                    FIX ME
                </td>
                <td class="valueC">
                    <span class="bigGreen">${submission.review.status.description}</span>
                </td>

                <c:choose>
                    <c:when test="${submission.review.status.id==failed}">
                        <td class="valueC">
                            <div align="center" style="margin:2px;">
                                <img src="/i/layout/btnMoveUpNA.png" alt="Raise priority"/>
                            </div>
                            <div align="center" style="margin:2px;">
                                <img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
                            </div>
                        </td>
                        <td class="valueC">
                            <div align="center">
                                <img src="/i/layout/btnMoveToTopNA.png" alt="Move to top"/>
                            </div>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td class="valueC">
                            <div align="center" style="margin:2px;">
                            <c:choose>
                                <c:when test="${submission.rank==1}">
                                    <img src="/i/layout/btnMoveUpNA.png" alt="Raise priority"/>
                                </c:when>
                                <c:otherwise>
                                <A href="#" onclick="changeRank(${submission.rank-1}, ${submission.id});return false;"
                                   onfocus="this.blur();">
                                    <img src="/i/layout/btnMoveUp.png" alt="Move up"
                                         onmouseover="this.src = '/i/layout/btnMoveUpOn.png';"
                                         onmouseout="this.src = '/i/layout/btnMoveUp.png';"/>
                                </A>
                                </c:otherwise>
                            </c:choose>
                            </div>
                            <div align="center" style="margin:2px;">
                            <c:choose>
                                <c:when test="${submission.rank==maxRank}">
                                    <img src="/i/layout/btnMoveDownNA.png" alt="Move down"/>
                                </c:when>
                                <c:otherwise>
                                <A href="#" onclick="changeRank(${submission.rank+1}, ${submission.id});return false;"
                                   onfocus="this.blur();">
                                    <img src="/i/layout/btnMoveDown.png" alt="Move down"
                                         onmouseover="this.src = '/i/layout/btnMoveDownOn.png';"
                                         onmouseout="this.src = '/i/layout/btnMoveDown.png';"/>
                                </A>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </td>
                        <td class="valueC">
                            <div align="center">
                            <c:choose>
                                <c:when test="${submission.rank==1}">
                                    <img src="/i/layout/btnMoveToTopNA.png" alt="Move to top"/>
                                </c:when>
                                <c:otherwise>
                                <A href="#" onclick="changeRank(1, ${submission.id});return false;"
                                   onfocus="this.blur();">
                                    <img src="/i/layout/btnMoveToTop.png" alt="Move to top"
                                         onmouseover="this.src = '/i/layout/btnMoveToTopOn.png';"
                                         onmouseout="this.src = '/i/layout/btnMoveToTop.png';"/>
                                </A>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </td>
                    </c:otherwise>
                </c:choose>

                <td class="valueE">
                    <div>&#160;</div>
                </td>
            </tr>
            <% even = !even;%>
        </c:forEach>

    </taconite-replace-children>
</taconite-root>

