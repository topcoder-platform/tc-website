<HTML>
<HEAD>
<%@ include file="header.jsp" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<%
    String errors = "";
    ProjectDeveloper pd = null;

    // *********************************************************************** //
    // ************************* External actions **************************** //
    // *********************************************************************** //

    if (action.equals("view")) {
        // key is ProjectDeveloper
        pd = ProjectBean.getProjectDeveloper(Integer.parseInt(key));
    }

    if (action.equals("edit")) {
        // key is ProjectDeveloper
        pd = ProjectBean.getProjectDeveloper(Integer.parseInt(key));
    }

    if (action.equals("new")) {
        // key is Project
        pd = new ProjectDeveloper();
        pd.setProject(Integer.parseInt(key));
    }

    // *********************************************************************** //
    // ************************* Internal actions **************************** //
    // *********************************************************************** //

    boolean redirect = false;

    if (action.equals("cancel")) {
        // key is Project
        pd = new ProjectDeveloper();
        pd.setProject(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("return")) {
        // key is Project
        pd = new ProjectDeveloper();
        pd.setProject(Integer.parseInt(request.getParameter("key")));
        // redirect to summary page
        redirect = true;
    }

    if (action.equals("save")) {
        // key is ProjectDeveloper
        key = request.getParameter("ProjectDeveloper");
        pd = ProjectBean.getProjectDeveloper(Integer.parseInt(key));
        if (pd == null) {
            pd = new ProjectDeveloper();
            pd.setProject(Integer.parseInt(request.getParameter("key")));
        }
 	HashMap params = new HashMap();
	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String param = (String) paramNames.nextElement();
		params.put(param, request.getParameter(param));
	}
        errors = ProjectBean.saveProjectDeveloper(params);
        //redirect if no errors occur
        if (errors.length() == 0) {
            redirect = true;
        }
    }
%>

</HEAD>

<BODY BACKGROUND="/i/track/back.gif" TOPMARGIN=0 LEFTMARGIN=0>
<%@ include file="menuInc.jsp" %>

<FONT COLOR="RED"><%= errors %></FONT>

<CENTER>
<TABLE WIDTH="96%">
<TR><TD>
<% if (redirect) { %>
    <SCRIPT Language="Javascript1.2">
        submitPage('<%= htGroups.get(vp) %>', 'view', '<%= pd.getProject() %>', '<%= vp %>'); 
    </SCRIPT>
<% } else { %>

<%= errors %>

<% if (action.equals("new") || action.equals("edit")) { %>

<%
    HashMap taskStatuses = ProjectBean.getProjectTaskStatuses();
    HashMap developers = ProjectBean.getDevelopers();
    Object[] status_ids = taskStatuses.keySet().toArray();
    Arrays.sort(status_ids);
    Object[] developer_ids = developers.keySet().toArray();
    Arrays.sort(developer_ids);
%>

<FORM NAME="frmSaveUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectDeveloper">
<% if (pd.getProjectDeveloper() > 0) { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pd.getProjectDeveloper() %>">
<% } else { %>
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pd.getProject() %>">
<% } %>

<INPUT TYPE="HIDDEN" NAME="ProjectDeveloper" VALUE="<%= pd.getProjectDeveloper() %>">
<INPUT TYPE="HIDDEN" NAME="Project" VALUE="<%= pd.getProject() %>">

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>DEVELOPER</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content>
<SELECT NAME="TCDeveloper">
<% int developerId = pd.getTCDeveloper(); %>
<% for (int i = 0; i < developer_ids.length; i++) { %>
<% String developer_name = (String) developers.get(developer_ids[i]); %>

<OPTION VALUE="<%= developer_ids[i] %>" <%= (developerId == Integer.parseInt("" + developer_ids[i]) ? "SELECTED" : "") %>><%= developer_name %>
<% } %>
</SELECT>
		</DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<INPUT TYPE="SUBMIT" NAME="action" VALUE="save">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmCancelUpdate" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectDeveloper">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pd.getProject() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="cancel">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>
<% } else { %>

<BR>
<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>DEVELOPER</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><%= ProjectBean.getUserString(new Integer(pd.getTCDeveloper())) %></DIV></TD>
	</TR>
</TABLE>
</DIV>
<BR>

<BR>
<FORM NAME="frmEdit" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectDeveloper">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pd.getProjectDeveloper() %>">
<INPUT TYPE="SUBMIT" NAME="action" VALUE="edit">
<INPUT TYPE="HIDDEN" NAME="vp" VALUE="<%= vp %>">
</FORM>

<FORM NAME="frmReturn" ACTION="/ProjectCtxServlet" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="page" VALUE="ProjectDeveloper">
<INPUT TYPE="HIDDEN" NAME="key" VALUE="<%= pd.getProject() %>">
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