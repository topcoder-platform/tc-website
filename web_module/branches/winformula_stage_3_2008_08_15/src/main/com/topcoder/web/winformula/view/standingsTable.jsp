<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.web.winformula.model.StandingsItem" %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
  <tr class="resultTH">
    <th scope="col" align="left"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Rank (change)</a></th>
    <th scope="col" align="left"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Points</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="4" includeParams="true"/>">Win %</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="5" includeParams="true"/>">Avg Total Score Variance</a></th>
    <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="6" includeParams="true"/>">Avg Victory Margin Variance</a></th>
  </tr>
  <% boolean even = true;%>
  <c:forEach items="${result}" var="standingsItem" varStatus="status">
      <tr class="<%=even?"row_Alt":""%>">
          <td>
                <strong class="green">${standingsItem.rank}</strong>
                <c:if test="${not empty standingsItem.rankDiff and standingsItem.rankDiff != 0}">
                    (<fmt:formatNumber value="${standingsItem.rankDiff}" pattern="+#;-#"/>)
                </c:if>
          </td>
          <td><a href="${sessionInfo.servletPath}?module=ViewProfile&amp;cr=${standingsItem.coderId}">${standingsItem.handle}</a></td>
          <c:choose>
                <c:when test="${not empty standingsItem.points}">
                    <td class="alignCenter"><fmt:formatNumber value="${standingsItem.points}" pattern="0.00"/></td>
                    <td class="alignCenter"><fmt:formatNumber value="${standingsItem.winPercent}" pattern="0.00"/></td>
                    <td class="alignCenter"><fmt:formatNumber value="${standingsItem.avgTotalScoreVariance}" pattern="0.00"/></td>
                    <td class="alignCenter"><fmt:formatNumber value="${standingsItem.avgVictoryMarginVariance}" pattern="0.00"/></td>
                </c:when>
                <c:otherwise>
                    <td>n/a</td><td>n/a</td><td>n/a</td><td>n/a</td>
                </c:otherwise>
          </c:choose>
          </td>
      </tr>
    <%even = !even;%>
  </c:forEach>
</table>
