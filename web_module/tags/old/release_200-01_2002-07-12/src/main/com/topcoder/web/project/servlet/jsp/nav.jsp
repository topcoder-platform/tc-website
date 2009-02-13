<SCRIPT Language="Javascript1.2">
	function submitPage(vp, page, action, params) {
		document.forms.frmProjectMenu.pt_vp.value = "" + vp;
		document.forms.frmProjectMenu.pt_page.value = "" + page;
		document.forms.frmProjectMenu.pt_action.value = "" + action;
		document.forms.frmProjectMenu.pt_params.value = "" + params;
		document.forms.frmProjectMenu.submit();
	}	
</SCRIPT>

<%
	class PT_Nav {
            PT_Nav parent;

            int pt_vp = 0;
            String pt_page = "";
            int pt_action = 0;
            String pt_params = "";

            String label = "";
            String divClass = "";
            String alignment = "";
            String width = "";
            boolean showSep = false;
				
            public PT_Nav(PT_Nav parentIn, int vp, String page, int action, String params, String labelIn, String divClassIn, String alignmentIn, String widthIn, boolean showSepIn) {
                parent = parentIn;
                pt_vp = vp;
                pt_page = page;
                pt_action = action;
                pt_params = params;
                label = labelIn;
                divClass = divClassIn;
                alignment = alignmentIn;
                width = widthIn;
                showSep = showSepIn;
            }

            public void setLink(int pt_vpIn, String pt_pageIn, int pt_actionIn, String pt_paramsIn) {
                pt_vp = pt_vpIn;
                pt_page = pt_pageIn;
                pt_action = pt_actionIn;
                pt_params = pt_paramsIn;
            }

            public void setVp(int vpIn) { pt_vp = vpIn; }
            public void setPage(String pageIn) { pt_page = pageIn; }
            public void setAction(int actionIn) { pt_action = actionIn; }
            public void setParams(String paramsIn) { pt_params = paramsIn; }

            public String displayNav() {
                StringBuffer ret = new StringBuffer(250);
                ret.append("<TD WIDTH=\"" + width + "\" ALIGN=\"" + alignment + "\">");
                ret.append("<DIV CLASS=" + divClass + ">");
                ret.append("<A HREF=\"javascript:submitPage('" + pt_vp + "', '" + pt_page + "', '" + pt_action + "', '" + pt_params + "');\"><NOBR>" + label + "</NOBR></A>");
                ret.append("</DIV>");
                ret.append("</TD>");
                return ret.toString();
            }
		
            public String redirectJS() {
                StringBuffer ret = new StringBuffer(250);
                ret.append("<SCRIPT Language=\"Javascript1.2\">");
                ret.append("submitPage('" + pt_vp + "', '" + pt_page + "', '" + pt_action + "', '" + pt_params + "');");
                ret.append("</SCRIPT>");
                return ret.toString();			
            }
		
            public String displayLink(String strLinkText) {
                StringBuffer ret = new StringBuffer(250);
                ret.append("<A HREF=\"javascript:submitPage('" + pt_vp + "', '" + pt_page + "', '" + pt_action + "', '" + pt_params + "');\">" + strLinkText + "</A>");
                return ret.toString();				
            }
		
            public String displayLink() {
                return displayLink(getLabel());
            }
		
            public String displayLinks(String sepIn, boolean isFirst) {
                StringBuffer ret = new StringBuffer(250);
                if (getParent() == null) {
                    if (isFirst) { return getLabel(); } else { return displayLink(); }
                } else {
                    ret.append(getParent().displayLinks(sepIn, false) + sepIn + (isFirst ? getLabel() : displayLink()));
                }
                return ret.toString();
            }

            public PT_Nav getRoot() {
                PT_Nav nav = this;
                while (nav.getParent() != null) {
                    nav = nav.getParent();
                }
                return nav;
            }
		
            public PT_Nav getParent() { return parent; }	
            public String getPage() { return pt_page; }
            public String getLabel() { return label; }
            public boolean showSep() { return showSep; }
	}

	class PT_Navs {
            Vector vecNavs = new Vector();
            Hashtable htNavs = new Hashtable();
            String currentPage = "";
            String separator = "";
            String divClass = "";

            public PT_Navs(String currentPageIn, String separatorIn, String divClassIn) {
                currentPage = currentPageIn;
                separator = separatorIn;
                divClass = divClassIn;
            }

            public void addNav(PT_Nav navIn) {
                vecNavs.addElement(navIn);
                htNavs.put(navIn.getPage(), navIn);
            }

            public PT_Nav getNav(String pt_page) {
                return (PT_Nav)(htNavs.get(pt_page));
            }
		
            public String displayNavs() {
                StringBuffer ret = new StringBuffer(250);
                PT_Nav nav;
                for (int i=0; i < vecNavs.size(); i++) {
                    nav = (PT_Nav)vecNavs.elementAt(i);
                    if (nav.getParent() == null) {
                        if (nav.getPage().equals(getNav(currentPage).getRoot().getPage())) {
                            ret.append("<TD>");
                            ret.append("<DIV CLASS=" + divClass + ">");
                            ret.append("*");
                            ret.append("</DIV>");
                            ret.append("</TD>");
                            ret.append("<TD>");
                            ret.append("<DIV CLASS=" + divClass + "><NOBR>");
                            ret.append(nav.getLabel());
                            ret.append("</NOBR></DIV>");
                            ret.append("</TD>\r\n");
                        } else {					
                            ret.append(nav.displayNav() + "\r\n");
                        }

                        if (nav.showSep()) {
                            ret.append("<TD>");
                            ret.append("<DIV CLASS=" + divClass + ">");
                            ret.append(separator);
                            ret.append("</DIV>");
                            ret.append("</TD>");
                        }
                    }
                }
                return ret.toString();
            }
	}
	
	PT_Nav nav_generic = new PT_Nav(null, pt_vp, pt_page, pt_action, pt_params, "Generic", "menu", "LEFT", "", true);

	PT_Nav nav_logout = new PT_Nav(null, pt_vp, "logout", ACTION_LOGOUT, pt_params, "Logout", "menu", "LEFT", "", true);
	PT_Nav nav_menu = new PT_Nav(null, pt_vp, "menu", ACTION_NONE, pt_params, "Home", "menu", "LEFT", "", true);
	PT_Nav nav_message = new PT_Nav(null, pt_vp, "message", ACTION_NONE, pt_params, "Messages", "menu", "LEFT", "", true);
            PT_Nav nav_message_write = new PT_Nav(nav_message, pt_vp, "message_write", ACTION_NONE, pt_params, "Write Message", "menu", "LEFT", "", false);	
            PT_Nav nav_message_read = new PT_Nav(nav_message, pt_vp, "message_read", ACTION_NONE, pt_params, "Read Message", "menu", "LEFT", "", false);	
	PT_Nav nav_projectList = new PT_Nav(null, pt_vp, "project_list", ACTION_NONE, pt_params, "My Projects", "menu", "LEFT", "", true);
            PT_Nav nav_projectSummary = new PT_Nav(nav_projectList, pt_vp, "project_summary", ACTION_NONE, pt_params, "Project Summary", "menu", "LEFT", "", false);
                PT_Nav nav_projectIssue = new PT_Nav(nav_projectSummary, pt_vp, "projectIssue", ACTION_VIEW, pt_params, "Project Issue", "menu", "LEFT", "", false);
                PT_Nav nav_projectTaskSummary = new PT_Nav(nav_projectSummary, pt_vp, "projectTask_summary", ACTION_NONE, pt_params, "Task Summary", "menu", "LEFT", "", false);
                    PT_Nav nav_projectTask = new PT_Nav(nav_projectTaskSummary, pt_vp, "projectTask", ACTION_VIEW, pt_params, "Project Task", "menu", "LEFT", "", false);
                    PT_Nav nav_projectUserTask = new PT_Nav(nav_projectTaskSummary, pt_vp, "projectUserTask", ACTION_VIEW, pt_params, "Task User", "menu", "LEFT", "", false);
            PT_Nav nav_project = new PT_Nav(nav_projectSummary, pt_vp, "project", ACTION_NONE, pt_params, "Project", "menu", "LEFT", "", false);	
            PT_Nav nav_projectUser = new PT_Nav(nav_projectSummary, pt_vp, "projectUser", ACTION_VIEW, pt_params, "Project User", "menu", "LEFT", "", false);
            PT_Nav nav_projectUserUpdate = new PT_Nav(nav_projectSummary, pt_vp, "projectUserUpdate", ACTION_VIEW, pt_params, "Project User Update", "menu", "LEFT", "", false);
		
	PT_Navs navs = new PT_Navs(pt_page, "&nbsp;|&nbsp;", "menu");
	navs.addNav(nav_logout);
	navs.addNav(nav_menu);
	navs.addNav(nav_message);
	navs.addNav(nav_message_write);
	navs.addNav(nav_message_read);
	navs.addNav(nav_projectList);
	navs.addNav(nav_projectSummary);
	navs.addNav(nav_projectIssue);
	navs.addNav(nav_projectTaskSummary);
	navs.addNav(nav_project);
	navs.addNav(nav_projectUser);
	navs.addNav(nav_projectUserUpdate);
	navs.addNav(nav_projectTask);
	navs.addNav(nav_projectUserTask);
%>

<HR>
<TABLE WIDTH="<%= tableWidth %>">
    <TR>
            <%= navs.displayNavs() %>
            <TD WIDTH="100%" ALIGN="RIGHT">
                    <DIV CLASS=menu>
                            <A HREF="javascript:submitPage('<%= pt_vp %>', '<%= pt_page %>', '<%= pt_action %>', '<%= pt_params %>');">
                                    <NOBR>[Refresh]</NOBR>
                            </A>
                    </DIV>
            </TD>
    </TR>
</TABLE>
<HR>

<TABLE WIDTH="<%= tableWidth %>" BGCOLOR="#FEFEFF">
    <TR VALIGN="TOP">
            <TD>
                    <DIV CLASS=menu>
                            <NOBR>
                                    >>
                            </NOBR>
                    </DIV>
            </TD>
            <TD ALIGN="LEFT">
                    <DIV CLASS=menu>
                            <NOBR>
                                    <%= handle %> (<%= arrGroups[pt_vp] %>)&nbsp;->&nbsp;<%= navs.getNav(pt_page).displayLinks("&nbsp;->&nbsp;", true) %>
                            </NOBR>
                    </DIV>
            </TD>
            <TD WIDTH="100%" ALIGN="RIGHT">			
                    <DIV CLASS=menu>
                            <NOBR><%= new java.util.GregorianCalendar().getTime() %></NOBR>
                            <!--BR>[M]essage User&nbsp;&nbsp;[V]iew Details&nbsp;&nbsp;[E]dit Form-->
                    </DIV>
            </TD>
    </TR>
</TABLE>

<FORM NAME="frmProjectMenu" ACTION="/ProjectCtxServlet" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="pt_vp">
<INPUT TYPE="HIDDEN" NAME="pt_page">
<INPUT TYPE="HIDDEN" NAME="pt_action">
<INPUT TYPE="HIDDEN" NAME="pt_params">
</FORM>
