<%--
  - Author: vangavroche, gonia_119
  - Version: 1.0
  - Copyright (C) - 2014 TopCoder Inc., All Rights Reserved.
  -
  - Version 1.0 (Module Assembly - DocuSign Integration v1.0)
  - add sign document page that embeded docusign website page.
  - -
--%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Sign Document</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>
<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div>
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.ERROR_INFO %>">
          <span class="bigRed"><%=err%></span>
        </tc-webtag:errorIterator>
    </p>
    <c:if test="${viewUrl != null}">
        <iframe frameborder="0" width="100%" height="800" marginWidth="5" style="margin-bottom: 10px;"
            src="${viewUrl }"></iframe>
        <div align="center"></div>
    </c:if>
</div>
</TD>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
