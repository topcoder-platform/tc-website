<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="session.jsp" %>

<%!
    public String translateForumType(ForumComponent forumComponent, long associatedId) {
        if (associatedId == forumComponent.getSpecForumId()) {
            return "specification";
        } else {
            return "collaboration";
        }
    }
%>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "user_admin.jsp";
    String action = request.getParameter("a");
%>


<%
    long lngPrincipal = 0;

    com.topcoder.security.UserPrincipal selectedPrincipal = null;
    com.topcoder.dde.user.User selectedUser = null;
    TCSubject selectedTCSubject = null;

    try {
        lngPrincipal = Long.parseLong(request.getParameter("lngPrincipal"));
        selectedPrincipal = PRINCIPAL_MANAGER.getUser(lngPrincipal);
    } catch (Exception e) {
        selectedPrincipal = null;
    }

    String strError = "";
    String strMessage = "";

    if (action != null) {
        if (action.equalsIgnoreCase("Lookup")) {
            String txtUsername = request.getParameter("txtHandle");
            try {
                selectedPrincipal = PRINCIPAL_MANAGER.getUser(txtUsername);
                lngPrincipal = selectedPrincipal.getId();
            } catch (Exception e) {
                strError += "Principal user could not be found.";
            }
        }

        if (action.equalsIgnoreCase("Set password")) {
            // Match up password fields
            String p1 = request.getParameter("txtPassword");
            String p2 = request.getParameter("txtPasswordConfirm");
            if (p1 != null && p2 != null) {
                if (p1.equals(p2) && p1.trim().length() > 0) {
                    if (selectedPrincipal != null) {
                        PRINCIPAL_MANAGER.editPassword(selectedPrincipal, p1, null);
                        strMessage += "Password has been set.";
                    } else {
                        strError += "An error occurred, please try again.";
                    }
                } else {
                    strError += "Passwords do not match.";
                }
            } else {
                strError += "An error occurred, please try again.";
            }
        }

        if (action.equalsIgnoreCase("Assign Role")) {
            debug.addMsg("user admin", "adding role");
            String strRole = request.getParameter("selRole");
            debug.addMsg("user admin", "adding role " + strRole);
            try {
                long lngRole = Long.parseLong(strRole);
                PRINCIPAL_MANAGER.assignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole), tcSubject);
                strMessage += "Role was assigned";
            } catch (RemoteException re) {
                strError += "RemoteException occurred while assigning role: " + re.getMessage();
            } catch (GeneralSecurityException gse) {
                strError += "GeneralSecurityException occurred while assigning role: " + gse.getMessage();
            }
        }

        if (action.equalsIgnoreCase("RemoveRole")) {
            debug.addMsg("user admin", "removing role");
            String strRole = request.getParameter("role");
            debug.addMsg("user admin", "removing role " + strRole);
            try {
                long lngRole = Long.parseLong(strRole);
                PRINCIPAL_MANAGER.unAssignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole), tcSubject);
                strMessage += "Role was removed";
            } catch (RemoteException re) {
                strError += "RemoteException occurred while unassigning role: " + re.getMessage();
            } catch (GeneralSecurityException gse) {
                strError += "GeneralSecurityException occurred while unassigning role: " + gse.getMessage();
            }
        }

    }

    if (selectedPrincipal != null) {
        try {
            selectedUser = USER_MANAGER.getUser(selectedPrincipal.getId());
            selectedTCSubject = USER_MANAGER.login(selectedUser.getRegInfo().getUsername(), selectedUser.getRegInfo().getPassword());
        } catch (Exception e) {
            selectedUser = null;
        }
    }

    Object objTechTypes = CONTEXT.lookup("CatalogEJB");
    CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
    Catalog catalog = home.create();

    DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(
    CONTEXT.lookup(DDEForumHome.EJB_REF_NAME), DDEForumHome.class);
    DDEForum ddeforum = ddeforumhome.create();
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" type="text/javascript" src="/scripts/javascriptAdmin.js">
</script>

</head>

<body class="body">

<!-- Header begins -->
<%@ include file="/includes/adminHeader.jsp" %>
<%@ include file="/includes/adminNav.jsp" %>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
	<tr valign="top">

<!-- Left Column begins -->
		<td width="165" class="leftColumn">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="165" height="5" border="0" /></td></tr>
			</table>
		</td>
		<td width="5" class="leftColumn"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
		<td width="100%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
				<tr><td class="normal"><img src="/images/headUserAdmin.gif" alt="User Admin" width="545" height="35" border="0" /></td></tr>
	<% if (strError.length() > 0) { %>
				<tr><td class="errorText"><%= strError %></td></tr>
	<% } else { %>
				<tr><td class="subhead"><img src="/images/clear.gif" alt="" width="1" height="1" border="0" /></td></tr>
	<% } %>

			</table>

			<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0">
				<tr valign="top">
					<td align="center">

<!-- Lookup principal by handle -->
						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="29"><img src="/images/lookupUserHead.gif" alt="Lookup Handle" width="500" height="29" border="0" /></td></tr>
						</table>

						<table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">
							<tr valign="middle">
								<td width="48%">
									<form name="frmPrincipal" action="<%= page_name %>" method="post">
									<img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Handle</td>
								<td width="1%" class="adminText"><input class="adminForm" type="text" name="txtHandle" value ="" size="25" maxlength="30"></input></td>
								<td width="1%" class="adminText"><input class="adminButton" type="submit" name="a" value="Lookup"></input></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></form></td>
							</tr>
						</table>

						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="11"><img src="/images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
						</table>
					</td>
				</tr>
			</table>
<!-- Lookup Handle Ends -->

<% if (selectedPrincipal != null) { %>
			<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0">
				<tr valign="top">
					<td align="center">
<!-- Spacer begins-->
 						<table cellpadding="0" cellspacing="0" border="0" align="center">
							<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
						</table>
<!-- Spacer ends-->

<!-- Set Password Begins -->
						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="29"><img src="/images/setPasswordHead.gif" alt="Set Password" border="0" /></td></tr>
						</table>

						<table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">
							<tr valign="middle">
								<td width="48%">
									<form name="frmPrincipalInfo" action="<%= page_name %>" method="post">
									<input type="hidden" name="lngPrincipal" value="<%= selectedPrincipal.getId() %>"></input>
									<img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Handle</td>
								<td width="1%" class="adminText"><strong><%= selectedPrincipal.getName() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Set Password</td>
								<td width="1%" class="adminText"><input type="password" name="txtPassword" value="" size="20" maxlength="15"></input></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Confirm Password</td>
								<td width="1%" class="adminText"><input type="password" name="txtPasswordConfirm" value="" size="20" maxlength="15"></input></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td colspan="2"><img src="/images/clear.gif" alt="" width="5" height="5" border="0" /></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td colspan="2" class="adminTextCenter"><input class="adminButton" type="submit" name="a" value="Set Password"></input></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></form></td>
							</tr>
						</table>

						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="11"><img src="/images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
						</table>
<!-- Set Password Ends -->

<!-- Spacer begins-->
 						<table cellpadding="0" cellspacing="0" border="0" align="center">
							<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
						</table>
<!-- Spacer ends-->
<% } %>

<% if (selectedUser != null) { %>

<!-- User Info Begins -->
						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="29"><img src="/images/userInformationHead.gif" alt="User Information" border="0" /></td></tr>
						</table>

						<table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">
							<tr valign="middle">
								<td width="48%">
									<form name="frmUserInfo" action="<%= page_name %>" method="POST">
									<input type="hidden" name="lngPrincipal" value="<%= selectedPrincipal.getId() %>"></input>
									<img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">First Name</td>
								<td width="1%" class="adminText" nowrap="nowrap"><strong><%= selectedUser.getRegInfo().getFirstName() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Last Name</td>
								<td width="1%" class="adminText" nowrap="nowrap"><strong><%= selectedUser.getRegInfo().getLastName() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Email Address</td>
								<td width="1%" class="adminText" nowrap="nowrap"><strong><%= selectedUser.getRegInfo().getEmail() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Company</td>
								<td width="1%" class="adminText" nowrap="nowrap"><strong><%= selectedUser.getRegInfo().getCompany() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td width="1%" class="adminLabel" nowrap="nowrap">Phone Number</td>
								<td width="1%" class="adminText" nowrap="nowrap"><strong><%= selectedUser.getRegInfo().getPhoneCountry() %> + (<%= selectedUser.getRegInfo().getPhoneArea() %>) <%= selectedUser.getRegInfo().getPhoneNumber() %></strong></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
						</table>

						<table cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
							<tr><td width="500" height="11"><img src="/images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
						</table>
<!-- User Info Ends -->

<!-- Spacer begins-->
						<table cellpadding="0" cellspacing="0" border="0" align="center">
							<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
						</table>
<!-- Spacer ends-->
					</td>
				</tr>
			</table>

<!-- User Roles begins -->
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr><td class="adminSubhead">User Roles</td></tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
				<tr valign="top">
					<td width="80%" class="adminTitle">Role Name</td>
					<td width="20%" class="adminTitleCenter">Action</td>
				</tr>

	<%
        RolePrincipal user_roles[] = (RolePrincipal[])selectedTCSubject.getPrincipals().toArray(new RolePrincipal[0]);
        Arrays.sort(user_roles,new Comparator() {
                    public int compare(Object o1, Object o2) {
                        return ((RolePrincipal)o1).getName().compareTo(((RolePrincipal)o2).getName());
                    }
                });
        for (int i=0; i < user_roles.length; i++) {
            String roleName = user_roles[i].getName();
            long associatedId = 0;
            String associatedLabel = "";
            if (roleName.startsWith("DDEComponentDownload")) {
                try {
                    associatedId = Long.parseLong(roleName.substring(roleName.indexOf(" ") + 1, roleName.length()));
                    associatedLabel = "(" + catalog.getComponent(associatedId).getName() + ")";
                } catch (Exception e) {
                    debug.addMsg("user admin", "error parsing " + roleName);
                }
            } else if (roleName.startsWith("ForumModerator") || roleName.startsWith("ForumUser")) {
                try {
                    associatedId = Long.parseLong(roleName.substring(roleName.indexOf(" ") + 1, roleName.length()));
                    ForumComponent forumComponent = ddeforum.getLinkedComponent(associatedId);
                    associatedLabel = "(" + forumComponent.getName() + " - " + translateForumType(forumComponent, associatedId) + ")";
                } catch (Exception e) {
                    debug.addMsg("user admin", "error parsing " + roleName);
                }
            }
	%>
				<tr valign="top">
					<td class="forumText"><%= roleName %> <%= associatedLabel %>
                                        </td>
					<td class="forumTextCenter"><strong><a href="user_admin.jsp?lngPrincipal=<%= lngPrincipal %>&role=<%= user_roles[i].getId() %>&a=RemoveRole">Remove Role</a></strong></td>
				</tr>
	<% } %>

				<tr valign="top">
					<td class="forumSubject">
						<select class="adminForm" name="selRole">
	<%
        RolePrincipal roles[] = (RolePrincipal[])PRINCIPAL_MANAGER.getRoles(null).toArray(new RolePrincipal[0]);
        Arrays.sort(roles,new Comparator() {
                    public int compare(Object o1, Object o2) {
                        return ((RolePrincipal)o1).getName().compareTo(((RolePrincipal)o2).getName());
                    }
                });
        for (int i=0; i < roles.length; i++) {
            String roleName = roles[i].getName();
            long associatedId = 0;
            String associatedLabel = "";
            //debug.addMsg("user admin", "parsing " + roleName);
/*
   too slow!, might be nice to have one day though

            if (roleName.startsWith("DDEComponentDownload")) {
                try {
                    associatedId = Long.parseLong(roleName.substring(roleName.indexOf(" ") + 1, roleName.length()));
                    associatedLabel = "(" + catalog.getComponent(associatedId).getName() + ")";
                } catch (Exception e) {
                    debug.addMsg("user admin", "error parsing " + roleName);
                }
            } else if (roleName.startsWith("ForumModerator") || roleName.startsWith("ForumUser")) {
                try {
                    associatedId = Long.parseLong(roleName.substring(roleName.indexOf(" ") + 1, roleName.length()));
                    ForumComponent forumComponent = ddeforum.getLinkedComponent(associatedId);
                    associatedLabel = "(" + forumComponent.getName() + " - " + translateForumType(forumComponent, associatedId) + ")";
                } catch (Exception e) {
                    debug.addMsg("user admin", "error parsing " + roleName);
                }
            }
*/
	%>
                            	<option value="<%= roles[i].getId() %>"><%= roles[i].getName() %> <%= associatedLabel %></option>
	<% } %>
                        	</select></td>
					<td class="forumSubjectCenter"><input class="adminButton" type="submit" name="a" value="Assign Role"></input></td>
				</tr>

				<tr><td class="adminTitle" colspan="2"><img src="/images/clear.gif" alt="" width="10" height="1" border="0" /></td></tr>
			</table>
<!-- User Roles ends -->

<% } %>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr><td colspan="2" height="40"><img src="/images/clear.gif" alt="" width="10" height="40" border="0" /></td></tr>
			</table>
		</td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
		<td width="245">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="245" height="15" border="0" /></td></tr>
			</table>
		</td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
		<td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
	</tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/footer.jsp" flush="true" />
<!-- Footer ends -->

</form>
</body>
</html>