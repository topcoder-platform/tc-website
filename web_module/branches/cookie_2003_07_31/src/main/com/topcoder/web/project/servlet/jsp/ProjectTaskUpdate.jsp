<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<HTML>
<HEAD>
<%@ include file="header.jsp" %>

<%
    String errors = "";
    ProjectTaskUpdate ptu = null;

    // *********************************************************************** //
    // ************************* External actions **************************** //
    // *********************************************************************** //

    if (action.equals("view")) {
        // key is ProjectTaskUpdate
        ptu = ProjectBean.getProjectTaskUpdate(Integer.parseInt(key));
    }

    if (action.equals("edit")) {
        // key is ProjectTaskUpdate
        ptu = ProjectBean.getProjectTaskUpdate(Integer.parseInt(key));
    }

    if (action.equals("new")) {
        // key is ProjectTask
        ptu = new ProjectTaskUpdate();
        ptu.setProjectTask(Integer.parseInt(key));
    }

    // *********************************************************************** //
    // ************************* Internal actions **************************** //
    // *********************************************************************** //

    boolean redirect = false;

    if (action.equals("cancel")) {
        // key is ProjectTask
        ptu = new ProjectTaskUpdate();
        ptu.setProjectTask(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("return")) {
        // key is ProjectTask
        ptu = new ProjectTaskUpdate();
        ptu.setProjectTask(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("save")) {
        // key is ProjectTaskUpdate
        key = request.getParameter("ProjectTaskUpdate");
        ptu = ProjectBean.getProjectTaskUpdate(Integer.parseInt(key));
        if (ptu == null) {
            ptu = new ProjectTaskUpdate();
            ptu.setProjectTask(Integer.parseInt(request.getParameter("key")));
        }
 	HashMap params = new HashMap();
	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String param = (String) paramNames.nextElement();
		params.put(param, request.getParameter(param));
	}
        errors = ProjectBean.saveProjectTaskUpdate(params);
        //redirect if no errors occur
        if (errors.length() == 0) {
            redirect = true;
        }
    }
%>

</HEAD>
<BODY BACKGROUND="/i/track/back.gif" TOPMARGIN=0 LEFTMARGIN=0>
<%@ include file="menuInc.jsp" %>

<CENTER>
<TABLE WIDTH="96%">
<TR><TD>
<% if (redirect) { %>
    <SCRIPT Language="Javascript1.2">
        submitPage('<%= htGroups.get(vp) %>', 'view', '<%= (ProjectBean.getProjectTask(ptu.getProjectTask())).getProject() %>', '<%= vp %>'); 
    </SCRIPT>
<% } else { %>

<FONT COLOR="RED"><%= errors %></FONT>

<% if (action.equals("new") || action.equals("edit")) { %>

<FORM NAME="frmSaveUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectTaskUpdate">
<% if (ptu.getProjectTaskUpdate() > 0) { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= ptu.getProjectTaskUpdate() %>">
<% } else { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= ptu.getProjectTask() %>">
<% } %>

<INPUT TYPE="HIDDEN" NAME="ProjectTaskUpdate" VALUE="<%= ptu.getProjectTaskUpdate() %>">
<INPUT TYPE="HIDDEN" NAME="ProjectTask" VALUE="<%= ptu.getProjectTask() %>">

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>UPDATE NOTES</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><TEXTAREA NAME="UpdateNotes"><%= ptu.getUpdateNotes() %></TEXTAREA></DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<INPUT TYPE="SUBMIT" NAME="action" VALUE="save">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmCancelUpdate" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectTaskUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= ptu.getProjectTask() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="cancel">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>
<% } else { %>

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>UPDATE NOTES</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><%= ptu.getUpdateNotes() %></DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<FORM NAME="frmEdit" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectTaskUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= ptu.getProjectTaskUpdate() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="edit">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmReturn" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectTaskUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= ptu.getProjectTask() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="return">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>
<% } %>

<% } %>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>