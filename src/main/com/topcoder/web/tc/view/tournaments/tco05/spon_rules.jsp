<%@ page import="java.net.URL,
                 com.topcoder.web.tc.Constants,
                 java.io.InputStream"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="rules"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">

<%-- REG CONTENT STARTS HERE --%>
    <%
        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+Constants.TERMS_OF_USE_ID+"="+Constants.TCO05_SPONSOR_TERMS_ID);
        InputStream is = termsURL.openStream();
        int count = is.available();
        for (int i=0; i<count; i++) {
            out.write(is.read());
        }
        is.close();
    %>
<%-- REG CONTENT ENDS HERE --%>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
