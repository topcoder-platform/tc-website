<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ include file="/includes/formclasses.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "request.jsp";
    String action = request.getParameter("a");
%>

<% // PAGE SPECIFIC DECLARATIONS %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ include file="/includes/clsCategoryNode.jsp" %>
<%

    if (tcUser == null) {
        //Redirect to logon page
        session.putValue("nav_redirect", "/components/"+page_name);
        session.putValue("nav_redirect_msg", "You must login to suggest a component");
        response.sendRedirect("/login.jsp");
        return;
    }

    Object objTechTypes = CONTEXT.lookup("CatalogEJB");
    CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
    Catalog catalog = home.create();

    // Request
    Fields fieldsRequest = new Fields();
    fieldsRequest.add("name", new Field("Name", "name", "", true));
    fieldsRequest.add("desc", new Field("Description", "desc",  "", true));
    fieldsRequest.add("comments", new Field("Comments", "comments",  "", false));

    boolean requestError = false;
    String strRequestError = "";
    String strRequestMsg = "";

    if (action != null) {
        if (action.equalsIgnoreCase("Send Suggestion")) {
            Enumeration enum = fieldsRequest.elements();
            while (enum.hasMoreElements()) {
                Field f = (Field)enum.nextElement();
                f.getFromRequest(request, "");
                f.doBasicValidation();
                if (f.hasError()) {
                    requestError = true;
                    debug.addMsg("admin->catalog->requestComponent", "error for field " + f.getLabel());
                    strRequestError += "Field " + f.getLabel() + " is not valid.<BR>";
                }
            }

            if (!requestError) {
                try {
                    debug.addMsg("admin->catalog", "Requesting component");
                    catalog.requestComponent(
                                new ComponentRequest(
                                    fieldsRequest.get("name").getValue(),
                                    "",                     // Short description
                                    fieldsRequest.get("desc").getValue(),
                                    "",                     // Functional description
                                    "",                     // keywords
                                    fieldsRequest.get("comments").getValue(),
                                    "",                     // version label
                                    tcUser.getId()
                                )
                            );
                    debug.addMsg("admin->catalog", "Requested component");
                    strRequestMsg += "Component (" + fieldsRequest.get("name").getValue() + " has been requested.";
                    response.sendRedirect("/components/request_confirm.jsp");
                    return;

                } catch (RemoteException re) {
                    debug.addMsg("admin->catalog", ""+re);
                    strRequestError += "System error occurred.<BR>";
                } catch (CatalogException ce) {
                    debug.addMsg("admin->catalog", ""+ce);
                    strRequestError += "Catalog could not create component.<BR>";
                }
            }
        }
    }

%>

<html>
<head>
    <title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css">

<script language="JavaScript" src="/scripts/javascript.js">
</script>

</head>

<body class="body" marginheight="0" marginwidth="0" onLoad="frmCompRequest.name.focus()">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="components"/>
            <jsp:param name="level2" value="suggest"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
                <tr><td class="normal"><img src="/images/headComponents.gif" alt="Components" width="545" height="32" border="0" /></td></tr>
                <tr><td class="subhead">Suggest a Component</td></tr>
            </table>

            <div align="center">
            <img src="/images/clear.gif" alt="" width="530" height="15" border="0"/>
            <table border="0" cellpadding="0" cellspacing="0"><form name="frmCompRequest" action="<%=page_name%>" method="post">
                <tr><td class="registerTitle">Describe the component you need</td></tr>
<!-- Component Name Error Text -->
                <tr>
                    <td class="registerError"><%=fieldsRequest.get("name").getError()%></td>
                </tr>

<!-- Component Name Field -->
                <tr>
                    <td class="registerLabel"><%=fieldsRequest.get("name").getLabel()%><br/>
                        <input type="text" class="registerElement" name="<%=fieldsRequest.get("name").getName()%>" value="" size="40" maxlength="50"></td>
                </tr>

<!-- Description Error Text -->
                <tr>
                    <td class="registerError"><%=fieldsRequest.get("desc").getError()%></td>
                </tr>

<!-- Description Field -->
                <tr>
                    <td class="registerLabel"><%=fieldsRequest.get("desc").getLabel()%><br/>
                        <textarea class="registerElement" name="<%=fieldsRequest.get("desc").getName()%>" value="" cols="40" rows="6"></textarea></td>
                </tr>

<!-- Comment Field -->
                <tr>
                    <td class="registerLabel"><%= fieldsRequest.get("comments").getLabel() %><br/>
                        <textarea class="registerElement" name="<%=fieldsRequest.get("comments").getName()%>" value="" cols="40" rows="6"></textarea></td>
                </tr>

                <tr>
                    <td align="center"><input type="reset" name="clear" value="&nbsp;Clear Fields&nbsp;"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /><input type="submit" name="a" value="Send Suggestion"></input></td>
                </tr>
            </form></table>
            </div>

            <p><br/></p>

        </td>
<!-- Middle Column ends -->
</form>

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="components"/>
        </jsp:include>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0"></td></form>
<!-- Gutter 3 ends -->
    </tr>
</table>

<jsp:include page="/includes/foot.jsp" flush="true" />

</body>
</html>
