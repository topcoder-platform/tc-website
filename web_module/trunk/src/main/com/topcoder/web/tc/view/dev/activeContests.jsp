<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer devContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("dev_contests");%>
<% ResultSetContainer designContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("design_contests");%>
<% boolean design = ((Boolean) request.getAttribute("phase_id_is_design")).booleanValue(); %>

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>Active Contests</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%= design ? "des_compete" : "dev_compete"%>"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= design ? "comp_design":"comp_development"%>"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<% if (design) { %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
        <td>
            <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0"/></A>
        </td>
        <td align="right">
            <A href="/wiki/display/tc/Getting+Started+in+Component+Design+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></A>
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
    Competition opportunities via RSS - <a href="/tc?module=BasicRSS&amp;c=rss_Design_Registration_Open&amp;dsid=28">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Design_Registration_Open&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="10">Active Component Design Contests</td>
    </tr>
    <tr>
        <td class="headerC">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Catalog</a>
        </td>
        <td class="header" width="40%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Component</a>
        </td>
        <td class="header">&#160;</td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Register
                by</a></td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Submit by</a>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Payment*</a>
        </td>
        <td class="headerC" width="10%">
            <div align="center">
                <a href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/interface/emblem/digitalrun.png" alt="" onmouseover="postPopUpText('globalPopupText','The Digital Run'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
            </div>
            <div align="center">
                <a href="SORT BY POINTS">Points</a>
            </div>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Registrants</a><br/>
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rated</a>/
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Unrated</a>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Submissions</a>
        </td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=designContests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <% if (resultRow.getItem("aol_brand").getResultData() != null) { %>
                <img src="/i/development/smAOL.gif"/>
                <% } else if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJava.gif"/>
                <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJavaCustom.gif"/>
                <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/netSm.gif"/>
                <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smNetCustom.gif"/>
                <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/flashSm.gif"/>
                <% } else if ("C++".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smCpp.png"/>
                <% } else { %>
                <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("tourny_project") > 0) { %>
                <div align="center">
                    <a href='/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=description'><img class="emblem" src="/i/tournament/tco08/emblem.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Eligible for the TCO08 CDDC'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
                </div>
                <% } else { %>
                &nbsp;
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <% if (resultRow.getBooleanItem("is_reg_closed")) { %>
                    <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z"/>
                <% } else { %>
                    <rsc:item name="reg_end_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
            </td>
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/>
            </td>
            <td class="valueC">
                1000
            </td>
            <td class="valueC">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <% } %>
                    <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>
                    /
                    <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
                    <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                </a>
                <% } %>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>

<div align="right" style="padding-top: 10px">
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&c=rss_Upcoming_Contests&dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<% } else { %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
        <td>
            <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0"/></A>
        </td>
        <td align="right">
            <A href="/wiki/display/tc/Getting+Started+in+Component+Development+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></A>
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
    Competition opportunities via RSS - <a href="/tc?module=BasicRSS&amp;c=rss_Development_Registration_Open&amp;dsid=28">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Development_Registration_Open&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="10">Active Component Development Contests</td>
    </tr>
    <tr>
        <td class="header";">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Catalog</a>
        </td>
        <td class="header" width="40%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Component</a>
        </td>
        <td class="header">&#160;</td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Register
                by</a></td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Submit by</a>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Payment*</a>
        </td>
        <td class="headerC" width="10%">
            <div align="center">
                <a href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/interface/emblem/digitalrun.png" alt="" onmouseover="postPopUpText('globalPopupText','The Digital Run'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
            </div>
            <div align="center">
                <a href="SORT BY POINTS">Points</a>
            </div>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Registrants</a><br/>
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rated</a>/
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Unrated</a>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Submissions</a>
        </td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=devContests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <% if (resultRow.getItem("aol_brand").getResultData() != null) { %>
                <img src="/i/development/smAOL.gif"/>
                <% } else if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJava.gif"/>
                <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJavaCustom.gif"/>
                <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/netSm.gif"/>
                <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smNetCustom.gif"/>
                <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/flashSm.gif"/>
                <% } else if ("C++".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smCpp.png"/>
                <% } else { %>
                <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("tourny_project") > 0) { %>
                <div align="center">
                    <a href='/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=description'><img class="emblem" src="/i/tournament/tco08/emblem.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Eligible for the TCO08 CDDC'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
                </div>
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <% if (resultRow.getBooleanItem("is_reg_closed")) { %>
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z"/>
                <% } else { %>
                <strong>
                    <rsc:item name="reg_end_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </strong>
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
            </td>
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/>
            </td>
            <td class="valueC">
                1000
            </td>
            <td class="valueC">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <% } %>
                    <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>
                    /
                    <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
                    <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                </a>
                <% } %>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>

<div align="right" style="padding-top: 10px">
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&c=rss_Upcoming_Contests&dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>

<% } %>

<p align="left">* And that's before royalty payments. The more Component
    <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp">Subscriptions</A> we sell,
    the more royalties we
    pay out to our winners! Please note
    that custom components do not get added to the catalog and therefore do not have royalties.</p>

<p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
