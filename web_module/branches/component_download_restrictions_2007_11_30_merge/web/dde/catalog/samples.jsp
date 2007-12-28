<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Download software from the Component Catalog at TopCoder</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css">

<script language="JavaScript" type="text/javascript" src="/scripts/javascript.js">
</script>

</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="catalog"/>
                <jsp:param name="level2" value="download"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Center Column begins -->
        <td width="99%" align="center">
            <div style="width:510px; margin-bottom: 40px;" align="left">
                <p>
                    The following is a list of TopCoder components that are available to all members for download. These components may be used for trial or non-commercial purposes.  If you are interested in gaining full trial access to download components or you wish to purchase access to the components for commercial purposes, please send an email to <a href="mailto:service@topcoder.com">service@topcoder.com</a> and explain the situation. You may download from this list up to <strong>${max_downloads}</strong> times.
                </p>
                <p align="center">
                    You have <strong>${remaining_downloads}</strong> downloads remaining.
                </p>
                <p style="border-bottom: 1px solid #000000;">
                    <strong>Sample components</strong>
                </p>
                <p>
                    <c:forEach var="component" items="${public_components}">
                        <a href="/tcs?module=ViewComponentTerms&comp=${component.primaryKey}&ver=${component.currentVersion}">${component.componentName}</a><br/>
                    </c:forEach>
                </p>
            </div>
        </td>
<!-- Center Column begins -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!--Right Column begins -->
        <td width="170">
            <table border="0" cellpadding="0" cellspacing="0" width="170">
                <tr><td height="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td></tr>
                <tr><td>
<%--
                <jsp:include page="/includes/topDownloads.jsp" />
                <jsp:include page="/includes/newReleases.jsp" />
              <jsp:include page="/includes/right.jsp" >
                  <jsp:param name="level1" value="index"/>
              </jsp:include>
--%>
              </td></tr>
            </table>
        </td>
<!--Right Column ends -->

<!-- Gutter begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0"></td>
<!-- Gutter ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</form>
</body>
</html>
