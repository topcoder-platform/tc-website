<%@ page import="javax.naming.*,
                 com.topcoder.dde.catalog.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "c_advanced_search.jsp";
    String action = request.getParameter("a");
    String strMsg = "";

    Object objTechTypes = CONTEXT.lookup("CatalogEJB");
    CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
    Catalog catalog = home.create();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Advanced Search for Software Components at TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" type="text/javascript" src="/scripts/javascript.js">
</script>
<script language="JavaScript" type="text/javascript" src="/scripts/javascriptCheckAll.js">
</script>

</head>

<body class="body" marginheight="0" marginwidth="0">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="99%">

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
                <tr><td class="normal"><img src="/images/headAdvancedSearch.gif" alt="Advanced Search" width="400" height="32" border="0" /></td></tr>
                <tr><td height="30"><img src="/images/clear.gif" alt="" width="10" height="30" border="0" /></td></tr>
            </table>

            <div align="center">
            <form action="/catalog/c_showroom_search.jsp" method="post" name="frmSiteSearch">
            <input type="hidden" name="a" value="search"/>
            <table width="80%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">

                <tr valign="top"><td class="forumTitle">Status</td></tr>

                <tr valign="top">
                    <td class="forumTextOdd" valign="top" align="center">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">

<!-- Status begins -->
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="status_all" value="true" onclick="checkallclicked(this, comp_status)"/><font color="#CC0000"><strong> Select All</strong></font></td>

                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>

                            <tr valign="middle">
                                <td width="49%">
                                    <input type="checkbox" name="comp_status" value="<%= ComponentVersionInfo.COLLABORATION %>" onclick="singleclicked(this, status_all)" /> Collaboration<br>
                                    <input type="checkbox" name="comp_status" value="<%= ComponentVersionInfo.SPECIFICATION %>" onclick="singleclicked(this, status_all)" /> Design and Architecture<br>
                                </td>

                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%">
                                    <input type="checkbox" name="comp_status" value="<%= ComponentVersionInfo.DEVELOPMENT %>" onclick="singleclicked(this, status_all)" /> Development and Testing<br>
                                    <input type="checkbox" name="comp_status" value="<%= ComponentVersionInfo.COMPLETED %>" onclick="singleclicked(this, status_all)" /> Complete<br>
                                </td>
                            </tr>

                            <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="5" alt="" border="0"></td></tr>
<!-- Status ends-->

                        </table>
                    </td>
                </tr>

                <tr valign="top"><td class="forumTitle">Catalog</td></tr>

                <tr valign="top">
                    <td class="forumTextOdd" valign="top">
                        <table cellspacing="0" cellpadding="0" border="0" width="100%">

<!-- Catalog begins -->
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="catalog_all" value="true"  onclick="checkallclicked(this, catalog)"/><font color="#CC0000"><strong> Select All</strong></font></td>

                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>

<%
    Category[] baseCategories = catalog.getBaseCategories();
    for (int i = 0; i < baseCategories.length; i++) {
        if (i % 2 == 0) {
%>
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="catalog" value="<%= baseCategories[i].getId() %>" onclick="singleclicked(this, catalog_all)" /> <%= baseCategories[i].getName() %></td>
<% } else { %>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"><input type="checkbox" name="catalog" value="<%= baseCategories[i].getId() %>" onclick="singleclicked(this, catalog_all)" /> <%= baseCategories[i].getName() %></td>
                            </tr>
<%      }
    }
    if (baseCategories.length % 2 == 1) {
 %>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>
<%  }  %>

                            <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="5" alt="" border="0"></td></tr>
<!-- Catalog ends -->

                        </table>
                    </td>
                </tr>

                <tr valign="top"><td class="forumTitle">Technology</td></tr>

                <tr valign="top">
                    <td class="forumTextOdd" valign="top">
                        <table cellspacing="0" cellpadding="1" border="0" width="100%">

<!-- Technology begins -->
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="technology_all" value="true" onclick="checkallclicked(this, technology)" /><font color="#CC0000"><strong> Select All</strong></font></td>

                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>

<%
    Technology[] technologies = catalog.getAllTechnologies();
    for (int i = 0; i < technologies.length; i++) {
        if (i % 2 == 0) {
%>
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="technology" value="<%= technologies[i].getId() %>" onclick="singleclicked(this, technology_all)" /> <%= technologies[i].getName() %></td>
<% } else { %>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"><input type="checkbox" name="technology" value="<%= technologies[i].getId() %>" onclick="singleclicked(this, technology_all)" /> <%= technologies[i].getName() %></td>
                            </tr>
<%      }
    }
    if (technologies.length % 2 == 1) {
%>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>
<%  }  %>
                            <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="5" alt="" border="0"></td></tr>
<!-- Technology ends -->

                        </table>
                    </td>
                </tr>

                <tr valign="top"><td class="forumTitle">Category</td></tr>

                <tr valign="top">
                    <td class="forumTextOdd" valign="top">
                        <table cellspacing="0" cellpadding="1" border="0" width="100%">

 <!-- Caterogy begins -->
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="category_all" value="true" onclick="checkallclicked(this, category)" /><font color="#CC0000"><strong> Select All</strong></font></td>

                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>

<%
    String[] categories = catalog.getUniqueCategoryNames(false);
    for (int i = 0; i < categories.length; i++) {
        if (i % 2 == 0) {
%>
                            <tr valign="middle">
                                <td width="49%"><input type="checkbox" name="category" value="<%= categories[i] %>" onclick="singleclicked(this, category_all)" /> <%= categories[i] %></td>
<% } else { %>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"><input type="checkbox" name="category" value="<%= categories[i] %>" onclick="singleclicked(this, category_all)" /> <%= categories[i] %></td>
                            </tr>
<%      }
    }
    if (categories.length % 2 == 1) {
%>
                                <td width="10"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td>

                                <td width="49%"> </td>
                            </tr>
<%  }  %>

                            <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="5" alt="" border="0"></td></tr>
 <!-- Caterogy ends -->

                        </table>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="forumTextEven">
                        <table cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td class="forumTextEven" valign="middle"><strong>Keyword(s)</strong></td>
                                <td class="forumTextEven" valign="middle" width="5"><img src="/images/clear.gif" width="5" height="3" alt="" border="0"></td>
                                <td class="forumTextEven" valign="middle"><input type="text" name="keywords" size="40" maxlength="50" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellpadding="3" cellspacing="0">
                <tr><td><img src="/images/clear.gif" width="1" height="3" alt="" border="0"></td></tr>

                <tr>
                    <td class="bodyText" align="center"><input type="reset" name="Clear" value="Clear"></td>
                    <td class="bodyText" align="center"><img src="/images/clear.gif" width="2" height="3" alt="" border="0"></td>
                    <td class="bodyText" align="center"><input type="submit" name="Search" value="Search"></td>
                </tr>

                <tr><td><img src="/images/clear.gif" width="1" height="20" alt="" border="0"></td></tr>
            </table>
            </form>
            </div>
        </td>
<!--Middle Column ends -->

<!-- Gutter 3 begins -->
        <td width="195"><img src="/images/clear.gif" alt="" width="195" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
