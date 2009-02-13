<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ include file="includes/session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1">
    <title><template:get name="title"/></title>

<html:base/>
<link rel="stylesheet" type="text/css" href="<html:rewrite page='/stylesheets/tcs_style.css'/>" />

</head>

<body class="body" marginheight="0" marginwidth="0">

<!--Header begins -->
<%@ include file="/includes/header.jsp" %>   
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isDevelopmentPage" value="true"/>
</jsp:include>
<!--Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">

        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="development"/>
            <jsp:param name="level2" value="components"/>
            <jsp:param name="level3" value="project_review"/>
        </jsp:include>

        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="normal"><img src="images/clear.gif" alt="" width="100" height="47" border="0"></td>
                </tr>
            </table>
            
<!-- Tabs -->
                

<!-- Content begins -->
        <template:get name="content"/>
<!-- Content ends-->
        
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>
        </td>
<!--Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

    </tr>
</table>

<!-- Footer begins -->
<%@ include file="/includes/foot.jsp" %>   
<!-- Footer ends -->

</body>
</html>


