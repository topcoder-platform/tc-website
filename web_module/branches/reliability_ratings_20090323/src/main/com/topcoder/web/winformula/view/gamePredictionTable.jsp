<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.web.winformula.model.PredictionItem" %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="stat">
  <tr class="resultTH">
    <th scope="col"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Handle</a></th>
    <th scope="col" class="center">Pred. Score</th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Picked Winner</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Total Score Variance</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="4" includeParams="true"/>">Victory Margin Variance</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="5" includeParams="true"/>">Points</a></th>
  </tr>
  <% boolean even = true;%>
  <c:forEach items="${result.predictions}" var="predictionItem" varStatus="status">
      <tr class="<%=even?"row_Alt":""%>">
          <td>
                <a href="${sessionInfo.servletPath}?module=ViewProfile&amp;cr=${predictionItem.userId}&amp;week=${week}">${predictionItem.handle}</a>
          </td>
          <td class="alignCenter">
                <c:choose>
                  <c:when test="${not empty predictionItem.predictedResult}">
                        ${predictionItem.predictedResult.homeScore}-${predictionItem.predictedResult.awayScore}
                  </c:when>
                  <c:otherwise>
                        &nbsp;
                  </c:otherwise>
              </c:choose>
          </td>
          <td class="alignCenter">
              <c:choose>
                  <c:when test="${empty predictionItem.pickedWinner}">
                        &nbsp;
                  </c:when>
                  <c:when test="${predictionItem.pickedWinner}">
                        <img src="/i/events/winformula/icoChecked.png" alt="Good Prediction"/>
                  </c:when>
                  <c:otherwise>
                        <img src="/i/events/winformula/icoRedX.png" alt="Bad Prediction" />
                  </c:otherwise>
              </c:choose>
          </td>
          <td class="alignCenter">
              <c:choose>
              <c:when test="${not empty predictionItem.totalScoreVariance}">
                    ${predictionItem.totalScoreVariance}
              </c:when>
              <c:otherwise>
                    &nbsp;
              </c:otherwise>
              </c:choose>
          </td>
          <td class="alignCenter">
              <c:choose>
              <c:when test="${not empty predictionItem.victoryMarginVariance}">
                    ${predictionItem.victoryMarginVariance}
              </c:when>
              <c:otherwise>
                    &nbsp;
              </c:otherwise>
              </c:choose>
          </td>
          <td class="alignCenter">
              <c:choose>
              <c:when test="${not empty predictionItem.score}">
                    ${predictionItem.score}
              </c:when>
              <c:otherwise>
                    &nbsp;
              </c:otherwise>
              </c:choose>
          </td>
      </tr>
    <%even = !even;%>
  </c:forEach>
</table>
