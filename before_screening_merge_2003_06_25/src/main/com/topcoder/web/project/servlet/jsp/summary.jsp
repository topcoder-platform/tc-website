<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.project.common.Project" %>
<%@ page import="com.topcoder.web.project.common.ProjectTask" %>
<%@ page import="com.topcoder.web.project.common.ProjectUpdate" %>
<%@ page import="com.topcoder.web.project.common.ProjectDeveloper" %>

<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />

<HTML>

<HEAD>

<%@ include file="stylesheet.jsp" %>

<SCRIPT Language="Javascript1.2">
	function submitPage(page, action, key) {
		document.forms.frmProjectMenu.page.value = "" + page;
		document.forms.frmProjectMenu.action.value = "" + action;
                document.forms.frmProjectMenu.key.value = "" + key;
		document.forms.frmProjectMenu.submit();
	}	
</SCRIPT>

</HEAD>

<BODY TEXT="#DDDDFF" LINK="yellow" ALINK="yellow" VLINK="yellow">

<FORM NAME="frmLogout" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="logout">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="logout">
</FORM>

<FORM NAME="frmProjectMenu" ACTION="/ProjectCtxServlet" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="page">
	<INPUT TYPE="HIDDEN" NAME="action">
        <INPUT TYPE="HIDDEN" NAME="key">
</FORM>

<%
ArrayList projectList = ProjectBean.getAllProjects();
for (int id = 0; id < projectList.size(); id++) {
	Project project = (Project) projectList.get(id);
%>

<DIV CLASS=box>
<%@include file="ProjectSummary.jsp" %>
</DIV>
<BR>

<%
}
%>

</BODY>
</HTML>
