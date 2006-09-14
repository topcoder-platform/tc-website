<%@ page language="java"
import="com.topcoder.dde.util.Constants" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<head>
    <title>TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>
<body class="body">

<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="components"/>
                <jsp:param name="level2" value="find"/>
            </jsp:include>
        </td>
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
        <td width="100%">

<%------------ORIGINAL CONTENT--------------%>
    <TABLE>
      <TR>
        <TD>
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="/tcs">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="UploadApplicationSpecificationTask">                
            <br/>Upload file: <input type=file name=file1>
            <br/><input type="submit" value="Upload">
            </form>
        </TD>
      </TR>
      <TR>
        <TD>Uploaded specifications:</TD>
        <TD>
            <tr>
                <td>Date</td>
                <td>Filename</td>
                <td>Screening results</td>
            </tr>
            <c:forEach items="${old_specs}" var="specItem">
            <tr>
                <td><c:out value="${specItem.uploadDate}"/></td>
                <td>
                    <A href="/tcs?module=DownloadApplicationSpecification&<%=Constants.SPECIFICATION_KEY%>=<c:out value="${specItem.specificationId}"/>">
                        <c:out value="${specItem.remoteFilename}"/>
                    </a>
                </td>
                <c:choose>
                    <c:when test="${specItem.screened}">
                        <td>
                            <A href="/tcs?module=ViewUploadResults&<%=Constants.SPECIFICATION_KEY%>=<c:out value="${specItem.specificationId}"/>">
                                <c:choose>
                                    <c:when test="${specItem.passedAutoScreening == 1}">
                                        Passed screening
                                    </c:when>
                                    <c:otherwise>
                                        Failed screening
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td>N/A</td>
                    </c:otherwise>
                </c:choose>
            </tr>
            </c:forEach>
        </TD>
      </TR>
    </TABLE>
<%--------------------------%>

</td>
<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<td width="170">
<jsp:include page="/includes/right.jsp" >
   <jsp:param name="level1" value="components"/>
</jsp:include>
</td>

<!-- Gutter 3 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />

</body>
</html>
