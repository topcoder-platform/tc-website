<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<HTML>
<BODY>
ECHO<br /><br /><BR />
<table>
<tr><td>ClientID:</td>
<c:choose>
 <c:when test="${empty param.ClientID}">
 <td style="background-color:red">Missing ClientID.</td>
 <c:set var="failCheck" value="true" />
 </c:when>
 <c:when test="${param.ClientID eq '310' || param.ClientID eq '311'}">
 <td style="background-color:green"><c:out value="${param.ClientID}" /></td>
 </c:when>
 <c:otherwise>
  <td style="background-color:red"> Invalid ClientID.</td>
 <c:set var="failCheck" value="true" />
</c:otherwise>
</c:choose>
</tr>

<tr><td>SeriesID:</td>
<c:choose>
 <c:when test="${empty param.SeriesID}">
   <td style="background-color:red">Missing SeriesID.</td>
   <c:set var="failCheck" value="true" />
 </c:when>
 <c:when test="${fn:length(param.SeriesID) eq 3}">
  <td style="background-color:green"><c:out value="${param.SeriesID}" /></td>
 </c:when>
 <c:otherwise>
   <td style="background-color:red">Invalid SeriesID.</td>
   <c:set var="failCheck" value="true" />
 </c:otherwise>
</c:choose>
</tr>

<tr><td>Language:</td>
<c:choose>
 <c:when test="${empty param.LanguageID}">
   <td style="background-color:yellow">Missing LanguageID.</td>
 </c:when>
 <c:when test="${fn:length(param.LanguageID) eq 3}">
  <td style="background-color:green"><c:out value="${param.LanguageID}" /></td>
 </c:when>
 <c:otherwise>
  <td style="background-color:red">Invalid LanguageID.</td>
  <c:set var="failCheck" value="true" />
</c:otherwise>
</c:choose>
</tr>

<tr><td>Reg_id:</td>
<c:choose>
 <c:when test="${empty param.Reg_id}">
  <td style="background-color:red">Missing Reg_id.</td>
  <c:set var="failCheck" value="true" />
 </c:when>
 <c:when test="${fn:length(param.Reg_id) eq 10}">
  <td style="background-color:green"><c:out value="${param.Reg_id}" /></td>
 </c:when>
 <c:otherwise>
  <td style="background-color:red">Invalid Reg_id.</td>
  <c:set var="failCheck" value="true" />
 </c:otherwise>
</c:choose>
</tr>

<tr><td>Stu_id:</td>
<c:choose>
 <c:when test="${empty param.Stu_id}">
   <td style="background-color:red">Missing Stu_id.</td>
   <c:set var="failCheck" value="true" />
 </c:when>
 <c:when test="${fn:length(param.Stu_id) eq 6}">
   <td style="background-color:green"><c:out value="${param.Stu_id}" /></td>
 </c:when>
 <c:otherwise>
  <td style="background-color:red">Invalid Stu_id.</td>
  <c:set var="failCheck" value="true" />
 </c:otherwise>
</c:choose></td></tr>

<tr><td>ExamForm:</td>
<c:choose>
 <c:when test="${empty param.ExamForm}">
   <td style="background-color:yellow">Missing ExamForm.</td>
 </c:when>
 <c:when test="${fn:length(param.ExamForm) <= 15}">
   <td style="background-color:green"><c:out value="${param.ExamForm}" /></td>
 </c:when>
 <c:otherwise>
   <td style="background-color:red">Invalid ExamForm.</td>
   <c:set var="failCheck" value="true" />
 </c:otherwise>
</c:choose></tr>
 <tr><td>Overall:</td>
  <c:choose>
   <c:when test="${failCheck}">
    <td style="background-color:red">FAIL</td>
   </c:when>
   <c:otherwise>
    <td style="background-color:green">PASS</td>
   </c:otherwise>
  </c:choose>
 </tr>
</table>

<br /><br />END ECHO
</BODY>
</HTML>
