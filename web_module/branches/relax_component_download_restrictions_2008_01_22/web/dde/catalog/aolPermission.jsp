<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.dde.catalog.Catalog" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <title>Request permission</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css">

<script language="JavaScript" type="text/javascript" src="/scripts/javascript.js">
</script>

</head>

<body class="body">

<c:set value="<%=new Long(Catalog.NET_CATALOG)%>" var="NET_CATALOG"/>
<c:set value="<%=new Long(Catalog.JAVA_CATALOG)%>" var="JAVA_CATALOG"/>
<c:set value="<%=new Long(Catalog.FLASH_CATALOG)%>" var="FLASH_CATALOG"/>
<c:set value="<%=new Long(Catalog.JAVA_CUSTOM_CATALOG)%>" var="JAVA_CUSTOM_CATALOG"/>
<c:set value="<%=new Long(Catalog.NET_CUSTOM_CATALOG)%>" var="NET_CUSTOM_CATALOG"/>

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
            <jsp:param name="level1" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Center Column begins -->
        <td width="99%" align="center">
            <div style="width:510px; margin-bottom: 40px;" align="left">
                <table align="left">
                <tr><td>
                <br/><br/>
                This is the landing page for the AOL people.
                <br/><br/>
                Here we can explain what is the code for and that they need to be registered in order to download components
                <br/><br/>
                Bla bla bla... <br/>
                <br/><br/>
                <c:choose>
                    <c:when test="${sessionInfo.loggedIn}">
                        <a href="/tcs?module=RequestPermission">Continue and submit code</a>
                    </c:when>
                    <c:otherwise>
                        You must be logged in in order to download... bla bla bla...
                        <br/>
                        If you are new to TopCoder, you can register <a href="https://www.dev.topcoder.com/reg/?module=Main&rt=5">Here</a>.<br/>
                        If you have a TopCoder account, please login <a href="/tcs?module=RequestPermission">Here</a> before entering the code.<br/>
                    </c:otherwise>
                </c:choose>
                <br/><br/>
                </td></tr>
                </table>
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
