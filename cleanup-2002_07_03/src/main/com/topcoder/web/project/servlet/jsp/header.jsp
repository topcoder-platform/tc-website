<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />
<%@ page import="com.topcoder.web.project.common.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
// ROLES (from ProjectBean.java) -------------------
	//int ROLE_EXECUTIVE	= 1;
	//int ROLE_MANAGER		= 2;
	//int ROLE_DEVELOPER	= 3;
	
// ACTIONS -----------------------------------------
	int ACTION_NONE		= 0;

	int ACTION_LOGIN	= 10;
	int ACTION_LOGOUT	= 11;

	int ACTION_SEARCH = 50;

	int ACTION_VIEW		= 100;
	int ACTION_NEW 		= 101;
	int ACTION_EDIT 	= 102;
	int ACTION_SAVE 	= 103;
	int ACTION_CANCEL	= 104;

        int ACTION_CONVERT_ISSUE= 120;

	int ACTION_MESSAGE_USER	= 150;

	int ACTION_MESSAGE_WRITE	= 200;
	int ACTION_MESSAGE_SEND		= 201;
	int ACTION_MESSAGE_SENT		= 202;
	int ACTION_MESSAGE_REPLY	= 203;
	int ACTION_MESSAGE_DELETE	= 204;
        int ACTION_MESSAGE_MARK_READ    = 205;
        int ACTION_MESSAGE_MARK_UNREAD  = 206;

// GLOBAL CONSTANTS

        int FOLDER_INBOX = 1;
        int FOLDER_SENTBOX = 2;
        int FOLDER_TRASH = 3;

// GLOBAL VARIABLES ---------------------------------
	int pt_vp		= 0;
	String pt_page		= "";
	int pt_action		= 0;
	String pt_params	= "";

// RETRIEVE REQUEST VARIABLES -----------------------
	String s_pt_vp 		= request.getParameter("pt_vp");
	String s_pt_page 	= request.getParameter("pt_page");
	String s_pt_action	= request.getParameter("pt_action");
	String s_pt_params 	= request.getParameter("pt_params"); // params is in the format [keyName=value][keyName=value] ...etc...

// MARSHAL REQUEST VARIABLES ------------------------
	if (s_pt_vp == null) { pt_vp = 0; } else { pt_vp = Integer.parseInt(s_pt_vp); }
	if (s_pt_page == null) { pt_page = ""; } else { pt_page = "" + s_pt_page; }
	if (s_pt_action == null) { pt_action = 0; } else { pt_action = Integer.parseInt(s_pt_action); }
	if (s_pt_params == null) { pt_params = ""; } else { pt_params = "" + s_pt_params; }

	Hashtable htParams = new Hashtable();
	for (int i=0; i < pt_params.length(); i++) {
		if (pt_params.charAt(i) == '[') {
			String keyName = pt_params.substring(i+1, pt_params.indexOf("=", i+1));
			String value = pt_params.substring(pt_params.indexOf("=", i+1)+1, pt_params.indexOf("]", i+1));
			htParams.put(keyName, value);
		}
	}

// SESSION GLOBAL VARIABLES -------------------------
	int user_id = ((Integer) request.getSession().getAttribute("user_id")).intValue();	
	String groups = "" + request.getSession().getAttribute("groups"); // groups is in the format [role1][role2][role3] ...etc...
	String handle = "" + request.getSession().getAttribute("handle");

// LOOKUPS ------------------------------------------
	String arrGroups[] = new String[4];
	arrGroups[1] = "Executive";
	arrGroups[2] = "Manager";
	arrGroups[3] = "Developer";
	
	if (pt_action == ACTION_EDIT || pt_action == ACTION_NEW) {
	    ProjectBean.refreshLookups();
	}
	
// CUSTOM LOGIC --------------------------------------
if (pt_page.equals("login")) {
	pt_page = "menu";
	pt_action = ACTION_NONE;
}

if (pt_vp == 0) {
    // Get highest default role
    int idx_s = groups.indexOf("[") + 1;
    int idx_e = groups.indexOf("]");
    if (idx_s > -1 && idx_e > -1) {
        try {
                pt_vp = Integer.parseInt(groups.substring(idx_s, idx_e));
        } catch (NumberFormatException nfe) {}
    } else {
        pt_vp = 0;
    }
}
%>