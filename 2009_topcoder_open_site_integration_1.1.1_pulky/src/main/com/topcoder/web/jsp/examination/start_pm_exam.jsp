<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<HTML>
<BODY>
ECHO<BR />
<table>
<tr><td>ClientID:</td><td>
<c:choose>
 <c:when test="${empty param.ClientID}">
  Missing ClientID.
 </c:when>
 <c:when test="${param.ClientID eq '310' || param.ClientID eq '311'}">
  <c:out value="${param.ClientID}" />
 </c:when>
 <c:otherwise>
  Invalid ClientID.
 </c:otherwise>
</c:choose>
</td></tr>

<tr><td>SeriesID:</td><td>
<c:choose>
 <c:when test="${empty param.SeriesID}">
  Missing SeriesID.
 </c:when>
 <c:when test="${fn:length(param.SeriesID) eq 3}">
  <c:out value="${param.SeriesID}" />
 </c:when>
 <c:otherwise>
  Invalid SeriesID.
 </c:otherwise>
</c:choose>
</td></tr>

<tr><td>Language:</td><td>
<c:choose>
 <c:when test="${empty param.Language}">
  Missing Language.
 </c:when>
 <c:when test="${fn:length(param.Language) eq 3}">
  <c:out value="${param.Language}" />
 </c:when>
 <c:otherwise>
  Invalid Language.
 </c:otherwise>
</c:choose>
</td></tr>

<tr><td>Reg_id:</td><td>
<c:choose>
 <c:when test="${empty param.Reg_id}">
  Missing Reg_id.
 </c:when>
 <c:when test="${fn:length(param.Reg_id) eq 10}">
  <c:out value="${param.Reg_id}" />
 </c:when>
 <c:otherwise>
  Invalid Reg_id.
 </c:otherwise>
</c:choose>
</td></tr>

<tr><td>Stu_id:</td><td>
<c:choose>
 <c:when test="${empty param.Stu_id}">
  Missing Stu_id.
 </c:when>
 <c:when test="${fn:length(param.Stu_id) eq 6}">
  <c:out value="${param.Stu_id}" />
 </c:when>
 <c:otherwise>
  Invalid Stu_id.
 </c:otherwise>
</c:choose></td></tr>

<tr><td>ExamForm:</td><td>
<c:choose>
 <c:when test="${empty param.ExamForm}">
  Missing ExamForm.
 </c:when>
 <c:when test="${fn:length(param.ExamForm) <= 15}">
  <c:out value="${param.ExamForm}" />
 </c:when>
 <c:otherwise>
  Invalid ExamForm.
 </c:otherwise>
</c:choose></td></tr>

</table>
<br />END ECHO
</BODY>
</HTML>
