<%@ page import="javax.naming.*,
                 com.topcoder.servlet.request.FileUpload" %>
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
    String page_name = "c_component.jsp";
    String action = request.getParameter("a");
%>

<%@ include file="/includes/componentCategories.jsp" %>
<% // PAGE SPECIFIC DECLARATIONS %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ include file="/includes/clsCategoryNode.jsp" %>
<%
  // PHASES
  //  public static final long COLLABORATION = 111;
  //  public static final long SPECIFICATION = 112;
  //  public static final long DEVELOPMENT = 113;
  //  public static final long COMPLETED = 114;
%>

<%
    long lngCategory = 0;
    long lngComponent = 0;
    long lngVersion = -1;
    try {
        lngComponent = Long.parseLong(request.getParameter("comp"));
        lngVersion = Long.parseLong(request.getParameter("ver"));
    } catch (NumberFormatException nfe) {
        // invalid parameter, redirect to main page
        if (lngComponent == 0) response.sendRedirect("c_showroom.jsp");
        if (lngComponent == 600191) response.sendRedirect("c_prodTools.jsp?comp=600191");
    }

    ComponentDetail details = catalog.getComponentDetail(lngComponent, lngVersion);

    lngVersion = Math.max(lngVersion, 0);

    Technology technologies[] = details.getTechs();

    TeamMemberRole teamMemberRoles[] = details.getMembers();

    LicenseLevel levels[] = (LicenseLevel[])catalog.getLicenseLevels().toArray(new LicenseLevel[0]);
    int cost[] = new int[levels.length];
    boolean hasCost = false;
    for (int i=0; i < levels.length; i++) {
        cost[i] = levels[i].calculateUnitCost(details.getVers().getPrice());
        if (cost[i] > 0) {
            hasCost = true;
        }
    }

    ComponentSummary summaries[] = details.getDependencies();

    //Separate screen shots and displayable documents
    Document[] tempDocs = details.getDocs();
    Collection colDocuments = new ArrayList();
    long thumbnailId = 0;
    long screenshotId = 0;
    for (int i = 0; i < tempDocs.length; i++) {
        Document doc = tempDocs[i];
        if ((int)doc.getType() != com.topcoder.dde.catalog.Document.SCREEN_SHOT &&
                    (int)doc.getType() != com.topcoder.dde.catalog.Document.SCREEN_SHOT_THUMBNAIL) {
            colDocuments.add(doc);
        } else {
            if ((int)doc.getType() == com.topcoder.dde.catalog.Document.SCREEN_SHOT) {
                screenshotId = doc.getId();
            } else {
                thumbnailId = doc.getId();
            }
        }
    }
    if (screenshotId > 0 && thumbnailId == 0) {
        thumbnailId = screenshotId;
    }
    if (thumbnailId > 0 && screenshotId == 0) {
        screenshotId = thumbnailId;
    }
    Document documents[] = (Document[])colDocuments.toArray(new Document[0]);
    //Document screenshots[] = (Document[])colScreenShots.toArray(new Document[0]);

    boolean hasPreviousForums = false;

    com.topcoder.dde.catalog.Forum activeCollab = null;
    com.topcoder.dde.catalog.Forum activeSpec = null;
    ComponentVersionInfo versions[] = null;
    com.topcoder.dde.catalog.Forum collaborations[] = null;
    com.topcoder.dde.catalog.Forum specifications[] = null;

    ComponentVersionInfo versionInfo = details.getVers();
    ComponentInfo componentInfo = details.getInfo();

    try {
        ComponentManagerHome component_manager_home = (ComponentManagerHome) PortableRemoteObject.narrow(CONTEXT.lookup("ComponentManagerEJB"), ComponentManagerHome.class);
        ComponentManager componentManager;

        if (lngVersion == 0) {
            componentManager = component_manager_home.create(lngComponent);
        } else {
            componentManager = component_manager_home.create(lngComponent, lngVersion);
        }

        Collection colVersions = componentManager.getAllVersionInfo();
        versions = (ComponentVersionInfo[])colVersions.toArray(new ComponentVersionInfo[0]);
        collaborations = new com.topcoder.dde.catalog.Forum[versions.length];
        specifications = new com.topcoder.dde.catalog.Forum[versions.length];
        for (int i=0; i < versions.length; i++) {
            if (versions[i].getPhase() != ComponentVersionInfo.COMPLETED) {
                collaborations[i] = null;
                specifications[i] = null;
                continue;
            } else {
                componentManager.setVersion(versions[i].getVersion());
                try {
                    collaborations[i] = componentManager.getForum(com.topcoder.dde.catalog.Forum.COLLABORATION);
                    specifications[i] = componentManager.getForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);
                } catch (CatalogException ce) {
                    // getForum returns multiple forums of a type which is not supposed to happen
                    // what to do?
                }
                if (collaborations[i] != null || specifications[i] != null) {
                    hasPreviousForums = true;
                }
            }
        }
        componentManager.setVersion(versionInfo.getVersion());
        try {
            activeCollab = componentManager.getActiveForum(com.topcoder.dde.catalog.Forum.COLLABORATION);
            activeSpec = componentManager.getActiveForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);
        } catch (CatalogException ce) {
        }
    } finally {}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Catalogs of Java and .NET Components at TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

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
            <jsp:param name="level1" value="catalog" />
            <jsp:param name="level2" value="Java" />
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
<!-- Gutter 1 ends -->

<%
    int refCatalog = -1;
    String catalogName = "No";
    if (javaCategory.getId() == details.getSummary().getRootCategory()) {
        refCatalog = 0;
        catalogName = "Java";
    } else if (netCategory.getId() == details.getSummary().getRootCategory()) {
        refCatalog = 1;
        catalogName = ".NET";
    } else if (flashCategory.getId() == details.getSummary().getRootCategory()) {
        refCatalog = 2;
        catalogName = "Flash";
    }
%>

<!-- Middle Column begins -->
        <td width="99%">
            <table border="0" cellpadding="0" cellspacing="15" width="100%">
                <tr><td class="normal" colspan="2"><img src="/images/headCompCatalogShort.gif" alt="Component Catalogs" width="241" height="32" border="0" /></td></tr>
                <tr><td class="subhead" colspan="2"><%= catalogName %> Catalog</td></tr>
                <tr>
                    <td colspan="2">
                        <table cellspacing="0" cellpadding="0" border="0">
                            <tr valign="middle">
                                <%
                                    switch (refCatalog) {
                                        case 0:
                                            %><td><img src="/images/javaSm.gif" alt="" border="0" /></td><%
                                            break;
                                        case 1:
                                            %><td><img src="/images/dotnetSm.gif" alt="" border="0" /></td><%
                                            break;
                                        case 2:
                                            %><td><img src="/images/flashSm.gif" alt="" border="0" /></td><%
                                            break;
                                        default:
                                            %><td></td><%
                                            break;

                                    }
                                %>
                                <td><img src="/images/spacer.gif" alt="" width="5" height="17" border="0" /></td>
                                <td class="testHead2"><strong><%= componentInfo.getName() %></strong> Version <%= versionInfo.getVersionLabel() %></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr valign="top">
                    <td width="50%" class="display">
                        <p><strong>Overview</strong><br />

                        <%  BufferedReader reader = new BufferedReader(new StringReader(componentInfo.getDescription()));
                            String line = reader.readLine();
                            while (line != null) {
                        %>

                        <%= line.trim() %><br />

                        <%      line = reader.readLine();
                            }
                        %>

                        </p>

                        <p><strong>Functionality</strong><br /></p>
                        <ul>

                        <%  reader = new BufferedReader(new StringReader(componentInfo.getFunctionalDescription()));
                            line = reader.readLine();
                            while (line != null) {
                                //Lines with a '-' as the first character should be treated as a bullet point
                                if (line.charAt(0) == '-') {
                        %>
                            <li><%= line.substring(1,line.length()).trim() %></li>

                        <% } else { %>

                            <%= line.trim() %>
                        <%   }
                                line = reader.readLine();
                            }
                        %>
                        </ul>

                    </td>

                    <td width="50%" class="display">
<!-- Screen Shot -->
                        <%  if (thumbnailId > 0 && screenshotId > 0) { %>

                        <p><span class="small"><a href="/catalog/document?id=<%=screenshotId%>"><img src="/catalog/document?id=<%=thumbnailId%>" alt="Screen Shot" border="0" /><br />
                        Click to download full-size screen shot</a></span></p>

                        <%  }  %>

<!-- Technologies -->
                        <% if (technologies.length > 0) { %>

                        <p><strong>Technologies</strong><br />

                        <% for (int i=0; i < technologies.length - 1; i++) { %>
                            <%= technologies[i].getName() %>,&nbsp;
                        <%  }  %>
                            <%= technologies[technologies.length-1].getName() %>
                        </p>

                        <%  }  %>

<!-- Authors -->
                        <% if (teamMemberRoles.length > 0) { %>

                        <p><strong>Authors</strong><br />

                        <%  for (int i=0; i < teamMemberRoles.length - 1; i++) { %>
                            <%= teamMemberRoles[i].getUsername() %>,&nbsp;
                        <%   }  %>
                            <%= teamMemberRoles[teamMemberRoles.length-1].getUsername() %>

                        </p>

                        <%  }  %>

                        <p><strong>Availability</strong><br />

<%  String strAvailability;
    switch( (int)versionInfo.getPhase() ) {
    case (int)ComponentVersionInfo.COLLABORATION:
        strAvailability = "Collaboration";
        break;
    case (int)ComponentVersionInfo.SPECIFICATION:
        strAvailability = "Design and Architecture";
        break;
    case (int)ComponentVersionInfo.DEVELOPMENT:
        strAvailability = "Development and Testing";
        break;
    default:
    case (int)ComponentVersionInfo.COMPLETED:
        strAvailability = "<strong><a href=\"c_component_download.jsp?comp=" + componentInfo.getId() + "&ver=" + versionInfo.getVersion() + "\">Download Now</a></strong>";
        break;
    }
%>
                        <%= strAvailability %></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
<!-- Gutter removed due to cellspacing in middle column table -->
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td height="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td></tr>
            </table>

<!-- Forums for This Component -->
           <table border="0" cellpadding="0" cellspacing="0" width="100%">
<!-- Current Forums begin -->
                <tr><td><img src="/images/headCurrentForums.gif" alt="Current Forums" width="170" height="18" border="0" /></td></tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr>
                    <td width="100%">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
<%  if (activeCollab != null) { %>
                            <tr><td class="rightColDisplay"><a href="/forum/c_forum.jsp?f=<%= activeCollab.getId() %>">Customer Forum</a></td></tr>
<%  } else { %>
                            <tr><td class="rightColOff">No active customer forum</td></tr>

<%  } if (activeSpec != null) { %>
                            <tr><td class="rightColDisplay"><a href="/forum/c_forum.jsp?f=<%= activeSpec.getId() %>">Developer Forum</a></td></tr>
<%  } else { %>
                            <tr><td class="rightColOff">No active developer forum</td></tr>
<%  } %>

                            <tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
                            <tr><td class="small">Participation in current forums requires user login and may require authorization</td></tr>

                            <tr><td width="170"><img src="/images/clear.gif" alt="" width="170" height="1" border="0" /></td></tr>
                        </table>
                    </td>
                </tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
<!-- Current Forums end -->

<!-- Previous Forums begin -->
<%  if (hasPreviousForums) { %>
                <tr><td><img src="/images/headPreviousForums.gif" alt="Previous Forums" width="170" height="18" border="0" /></td></tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr>
                    <td width="100%">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
<%  for (int i=0; i < versions.length; i++) {
            if (collaborations[i] != null) {  %>
                            <tr><td class="rightColDisplay"><a href="/forum/c_forum.jsp?f=<%= collaborations[i].getId() %>">Customer Forum Version <%= "" + versions[i].getVersionLabel() %></a></td></tr>
            <%  }  if (specifications[i] != null) {  %>
                            <tr><td class="rightColDisplay"><a href="/forum/c_forum.jsp?f=<%= specifications[i].getId() %>">Developer Forum Version <%= "" + versions[i].getVersionLabel() %></a></td></tr>
            <%  }
}  %>
                            <tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
                            <tr><td class="small">Previous forums are read only</td></tr>

                            <tr><td width="170"><img src="/images/clear.gif" alt="" width="170" height="1" border="0" /></td></tr>
                        </table>
                    </td>
                </tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
<% } %>
<!-- Previous Forums end -->
            </table>

<!-- Base Components Included -->
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td><img src="/images/headBaseCompIncl.gif" alt="Base Components Included" width="170" height="18" border="0" /></td></tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
<%  if (summaries.length == 0) {
%>
                            <tr valign="top">
                                <td class="rightColOff">This component is a Base Component</td>
                            </tr>
<%  } else {
        for (int i=0; i < summaries.length; i++) {
%>
                            <tr valign="top">
                                <td class="rightColDisplay"><a href="/catalog/c_component.jsp?comp=<%= summaries[i].getComponentId() %>"><%= summaries[i].getName() %></a></td>
                            </tr>
<%      }
    }
%>
                        </table>
                    </td>
                </tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            </table>

<!-- Documentation-->
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td><img src="/images/headDocumentation.gif" alt="Documentation" width="170" height="18" border="0" /></td></tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
<%  if (documents.length == 0) {
%>
                            <tr valign="top">
                                <td class="rightColOff">None available at this time</td>
                            </tr>
<%  } else {
        String url = lngComponent+"/"+versionInfo.getVersionId() + "/";
        for (int i=0; i < documents.length; i++) {
%>
                            <tr valign="top">
                                <td class="rightColDisplay">
<%          if (documents[i].getType() == Document.JAVADOCS) {
%>
                                <a href="<%= "/catalog/javadoc/"+url+"index.html" %>" target="_blank"><%=documents[i].getName()%></a>
<%          } else if (documents[i].getId() < 0) {
%>
                                <a href="<%=documents[i].getURL()%>" target="_blank" ><%=documents[i].getName()%></a>
<%          } else {
%>
                                <a href="/catalog/document?id=<%=documents[i].getId()%>" target="_blank" ><%=documents[i].getName()%></a>
<%          }
%>
                                </td>
                            </tr>
<%      }
    }
%>
                        </table>
                    </td>
                </tr>
                <tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
                <tr><td class="small"><a href="http://www.adobe.com/products/acrobat/readstep.html" target="_blank">Adobe Acrobat 5</a> is required to view some TopCoder Software documentation.</td></tr>
                <tr><td><hr width="170" size="1" noshade="noshade" /></td></tr>
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            </table>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
