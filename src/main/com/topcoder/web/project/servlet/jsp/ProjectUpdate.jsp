<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<HTML>
<HEAD>
<%@ include file="header.jsp" %>

<%
    String errors = "";
    ProjectUpdate pu = null;

    // *********************************************************************** //
    // ************************* External actions **************************** //
    // *********************************************************************** //

    if (action.equals("view")) {
        // key is ProjectUpdate
        pu = ProjectBean.getProjectUpdate(Integer.parseInt(key));
    }

    if (action.equals("edit")) {
        // key is ProjectUpdate
        pu = ProjectBean.getProjectUpdate(Integer.parseInt(key));
    }

    if (action.equals("new")) {
        // key is Project
        pu = new ProjectUpdate();
        pu.setProject(Integer.parseInt(key));
    }

    // *********************************************************************** //
    // ************************* Internal actions **************************** //
    // *********************************************************************** //

    boolean redirect = false;

    if (action.equals("cancel")) {
        // key is Project
        pu = new ProjectUpdate();
        pu.setProject(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("return")) {
        // key is Project
        pu = new ProjectUpdate();
        pu.setProject(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("save")) {
        // key is ProjectUpdate
        key = request.getParameter("ProjectUpdate");
        pu = ProjectBean.getProjectUpdate(Integer.parseInt(key));
        if (pu == null) {
            pu = new ProjectUpdate();
            pu.setProject(Integer.parseInt(request.getParameter("key")));
        }
 	HashMap params = new HashMap();
	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String param = (String) paramNames.nextElement();
		params.put(param, request.getParameter(param));
	}
        errors = ProjectBean.saveProjectUpdate(params);
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
        submitPage('<%= htGroups.get(vp) %>', 'view', '<%= pu.getProject() %>', '<%= vp %>'); 
    </SCRIPT>
<% } else { %>

<FONT COLOR="RED"><%= errors %></FONT>

<% if (action.equals("new") || action.equals("edit")) { %>

<FORM NAME="frmSaveUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectUpdate">
<% if (pu.getProjectUpdate() > 0) { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pu.getProjectUpdate() %>">
<% } else { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pu.getProject() %>">
<% } %>

<INPUT TYPE="HIDDEN" NAME="ProjectUpdate" VALUE="<%= pu.getProjectUpdate() %>">
<INPUT TYPE="HIDDEN" NAME="Project" VALUE="<%= pu.getProject() %>">

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>UPDATE NOTES</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><TEXTAREA NAME="UpdateNotes"><%= pu.getUpdateNotes() %></TEXTAREA></DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<INPUT TYPE="SUBMIT" NAME="action" VALUE="save">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmCancelUpdate" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pu.getProject() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="cancel">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>
<% } else { %>

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>UPDATE NOTES</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><%= pu.getUpdateNotes() %></DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<FORM NAME="frmEdit" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pu.getProjectUpdate() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="edit">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmReturn" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectUpdate">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pu.getProject() %>">
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
