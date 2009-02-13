<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder Corporate Services</title>

<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
</head>

<body>

<jsp:include page="includes/top.jsp" >
  <jsp:param name="isHomePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
        <td width="170">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>

        <td class=homeBigPromo><img src="/i/corp/bigPromo.jpg" border=0></td>

		<td class=homeRightPromos>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><img src="/i/corp/featClientsHead.gif" border=0 /></td>
				</tr>
				<tr>
					<td><img src="/i/corp/clear.gif" width=170 height=100 border=0 /></td>
				</tr>
				<tr>
					<td><img src="/i/es/animated_emp_promo.gif" border=0 /></td>
				</tr>
			</table>
		</td>
   </tr>
</table>
<jsp:include page="../foot.jsp" />
</body>
</html>