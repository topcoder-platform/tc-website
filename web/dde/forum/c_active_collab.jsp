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

<%
    // STANDARD PAGE VARIABLES
    String page_name = "c_active_collab.jsp";
    String action = request.getParameter("a");
%>

<%@ page import="com.topcoder.dde.forum.*" %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%!
    private static java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("E, MMM d, yyyy hh:mm a");

    String getStatusIcon(int phase) {
        switch( phase ) {
        case (int)ComponentVersionInfo.SPECIFICATION:
            return "/images/iconStatusSpecSm.gif";
        case (int)ComponentVersionInfo.DEVELOPMENT:
            return "/images/iconStatusDevSm.gif";
        case (int)ComponentVersionInfo.COMPLETED:
            return "/images/iconStatusCompleteSm.gif";
        case (int)ComponentVersionInfo.COLLABORATION:
        default:
            return "/images/iconStatusCollabSm.gif";
        }
    }
%>
<%
    long forumType = com.topcoder.dde.catalog.Forum.COLLABORATION;
    try {
        forumType = Long.parseLong(request.getParameter("ft"));
    } catch (Exception e) {
    }

    if (forumType == com.topcoder.dde.catalog.Forum.SPECIFICATION) {
        if (tcUser == null) {
            //Redirect to logon page
            session.putValue("nav_redirect_msg", "You must login to view the Developer forums");
            response.sendRedirect("/login.jsp");
            return;
        }
    }

    DDEForumHome ddeforumHome = (DDEForumHome)CONTEXT.lookup(DDEForumHome.EJB_REF_NAME);
    DDEForum ddeforum = ddeforumHome.create();

    List activeForums = ddeforum.getActiveForums(forumType);
    if (forumType == com.topcoder.dde.catalog.Forum.SPECIFICATION) {
        List secureActiveForums = new LinkedList();
        Iterator itr = activeForums.iterator();
        while (itr.hasNext()) {
            ActiveForum forum = (ActiveForum)itr.next();
            if (ddeforum.canPost(forum.getForumId(),tcSubject)||ddeforum.canModerate(forum.getForumId(),tcSubject)) {
                secureActiveForums.add(forum);
            }
        }
        activeForums = secureActiveForums;
    }
%>


<html>
<head>
    <title>Collaborate with your peers about software components at TopCoder</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/javascriptForum.js"></script>
</head>

<body class="body">

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
                <jsp:param name="level1" value="forum"/>
                <jsp:param name="level2" value="all"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="50%" align="left">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
                            <tr><td class="normal"><img src="/images/headForums.gif" alt="Forums" width="100" height="22" border="0"></td></tr>
                            <tr><td height="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0"/></td></tr>
                        </table>
                    </td>

                    <td width="50%" align="right">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
                            <tr><td class="normal"><img src="/images/statusKey.gif" alt="Status Key" width="454" height="35" border="0"></td></tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
<%  if (forumType == com.topcoder.dde.catalog.Forum.COLLABORATION) { %>
                    <td width="1%" class="normal"><a class="normal" href="c_active_collab.jsp"><img src="/images/tabCustForums_on.gif" alt="Customer Forums" name="tabCustForums" width="152" height="22" border="0"></a></td>
                    <td width="1%" class="normal"><a onmouseover="document.images['tabDevForums'].src = tabDevForumson.src; window.status='Developer Forums'; return true;" onmouseout="document.images['tabDevForums'].src = tabDevForumsoff.src" class="normal" href="c_active_collab.jsp?ft=<%=com.topcoder.dde.catalog.Forum.SPECIFICATION%>"><img src="/images/tabDevForums_off.gif" alt="Developer Forums" name="tabDevForums" width="152" height="22" border="0"></a></td>
<%  } else { %>
                    <td width="1%" class="normal"><a onmouseover="document.images['tabCustForums'].src = tabCustForumson.src; window.status='Customer Forums'; return true;" onmouseout="document.images['tabCustForums'].src = tabCustForumsoff.src" class="normal" href="c_active_collab.jsp"><img src="/images/tabCustForums_off.gif" alt="Customer Forums" name="tabCustForums" width="152" height="22" border="0"></a></td>
                    <td width="1%" class="normal"><a class="normal" href="c_active_collab.jsp?ft=<%=com.topcoder.dde.catalog.Forum.SPECIFICATION%>"><img src="/images/tabDevForums_on.gif" alt="Developer Forums" name="tabDevForums" width="152" height="22" border="0"></a></td>
<%  } %>
                    <td width="98%"><img src="/images/clear.gif" alt="" width="10" height="22" border="0"/></td>
                </tr>
                <tr valign="top">
                    <td colspan="3" class="forumHeadFoot"><img src="/images/clear.gif" alt="" width="10" height="7" border="0"></td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
<%  if ((activeForums == null) || (activeForums.size() == 0)) { %>
                <tr valign="top">
                    <td class="forumTextOdd">There are no active forums.</td>
                </tr>
<%  } else { %>
                <tr valign="top">
                    <td width="195" class="forumTitle">Forum</td>
                    <td width="45%" class="forumTitle">Description</td>
                    <td width="5%" class="forumTitleCenter">Threads</td>
                    <td width="5%" class="forumTitleCenter">Messages</td>
                    <td width="25%" class="forumTitle">Last Updated</td>
                </tr>
<%
        Iterator itr = activeForums.iterator();
        int row = 0;
        String oddeven;
        while(itr.hasNext()) {
            ActiveForum forum = (ActiveForum)itr.next();
            row++;
            oddeven = (row%2==0)?"Even":"Odd";
%>
                <tr valign="top">
                    <td class="forumText<%=oddeven%>">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td width="25" class="forumText"><img src="<%=getStatusIcon((int)forum.getVersionPhase())%>" alt="" width="25" height="17" border="0"></td>
				<td>
				<%
				if( Catalog.JAVA_CATALOG == forum.getRootCategory( ) )
				{
				%>
                                <img src="/images/javaSm.gif" alt="Java Catalog" border="0" />
				<%
				}
				else if( Catalog.NET_CATALOG == forum.getRootCategory( ) )
				{
				%>
                                <img src="/images/dotnetSm.gif" alt=".NET Catalog" border="0" />
				<%
				}
				else if( Catalog.FLASH_CATALOG == forum.getRootCategory( ) )
				{
				%>
                                <img src="/images/flashSm.gif" alt="Flash Catalog" border="0" />
				<%
				}
				else if( Catalog.APPLICATION_CATALOG == forum.getRootCategory( ) )
				{
				%>
                                <img src="/images/appSm.gif" alt="Application Catalog" border="0" />
				<%
				}
                else if( Catalog.JAVA_CUSTOM_CATALOG == forum.getRootCategory( ) )
                {
				%>
				<img src="/images/javaCustomSm.gif" alt="Java Custom Catalog" border="0" />
				<%
				}
                else if( Catalog.NET_CUSTOM_CATALOG == forum.getRootCategory( ) )
                {
				%>
				<img src="/images/dotnetCustomSm.gif" alt=".NET Custom Catalog" border="0" />
				<%
                }
                %>
				</td>
                                <td><img src="/images/clear.gif" alt="" width="5" height="17" border="0" /></td>
                                <td width="165" class="forumText"><a href="c_forum.jsp?f=<%=forum.getForumId()%>"><strong><%=forum.getName()%></strong><!-- version&nbsp;<%=forum.getVersionText()%> --></a><br />
                                    <img src="/images/clear.gif" alt="" width="165" height="1" border="0"/></td>
                                    </td>
                            </tr>
                        </table></td>
                    <td class="forumText<%=oddeven%>"><%=forum.getShortDescription()%></td>
                    <td class="forumTextCenter<%=oddeven%>"><%=forum.getTotalThreads()%></td>
                    <td class="forumTextCenter<%=oddeven%>"><%=forum.getTotalPosts()%></td>
                    <td class="forumText<%=oddeven%>">
<%          if (forum.getTotalPosts()!=0 && forum.getLastPostTime()!=null && forum.getLastPostUsername()!=null) { %>
                        <%=dateFormat.format(forum.getLastPostTime())%>&nbsp;EST by&nbsp;<strong><%=forum.getLastPostUsername()%></strong>
<%          } %>
                    </td>
                </tr>
<%      }
    }
%>
                <tr><td class="forumHeadFoot" colspan="5" height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0"/></td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</form>
</body>
</html>
