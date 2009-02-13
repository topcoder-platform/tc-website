<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="cid" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="galImgCount" value="<%=Constants.GALLERY_IMAGES_COUNT%>"/>

<c:set var="submissionId" value="${param[subId]}"/>
<c:set var="imageIndex" value="${param[subFileIdx]}"/>
<c:set var="contestId" value="${param[cid]}"/>
<c:set var="imagesCnt" value="${param[galImgCount]}"/>

<html>
  <head>
      <title>TopCoder Studio</title>
  </head>
  <body>
  <a href="${sessionInfo.servletPath}?${modKey}=ViewSubmissions&amp;${cid}=${contestId}">Back to Contest Submissions</a>
  <br/>
  Image ${imageIndex} of ${imagesCnt}
  <br/>
  <c:if test="${imageIndex > 1}">
      <a href="${sessionInfo.servletPath}?${modKey}=Static&amp;d1=full&amp;${cid}=${contestId}&amp;${subId}=${submissionId}&amp;${subFileIdx}=${imageIndex-1}&amp;${galImgCount}=${imagesCnt}">Prev</a>&nbsp;
  </c:if>
  <c:if test="${imageIndex < imagesCnt}">
      <a href="${sessionInfo.servletPath}?${modKey}=Static&amp;d1=full&amp;${cid}=${contestId}&amp;${subId}=${submissionId}&amp;${subFileIdx}=${imageIndex+1}&amp;${galImgCount}=${imagesCnt}">Next</a>&nbsp;
  </c:if>
  <br/>
  <br/>
  <br/>
  <img src="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}&amp;${subFileIdx}=${imageIndex}&amp;${subAltType}=full"
       alt=""/>
  <br/>
  </body>
</html>