<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all active contests for design/development contests.
  -
  - Version 1.1 (BUGR-2749) changes: Added reliability bonus column.
--%>
<%@ page language="java" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<% boolean design = ((Boolean) request.getAttribute("phase_id_is_design")).booleanValue(); %>
<% ResultSetContainer devContests = (ResultSetContainer) request.getAttribute("devContests");%>
<% ResultSetContainer designContests = (ResultSetContainer) request.getAttribute("designContests");%>

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>Active Contests</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
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
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="<%= design ? "des_compete" : "dev_compete"%>"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <%--
            <div class="fixedWidthBody">
            --%>
           
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= design ? "comp_design":"comp_development"%>"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<% if (design) { %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
        <td>
            <a href="/dr"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0"/></a>
        </td>
        <td align="right">
            <a href="/wiki/display/tc/Getting+Started+in+Component+Design+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a><br /><br />
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
    Competition opportunities via RSS - <a href="/tc?module=BasicRSS&amp;c=rss_Design_Registration_Open&amp;dsid=28">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Design_Registration_Open&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" /></a>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="11">Active Component Design Contests</td>
    </tr>
    <tr>
        <td class="headerC">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Catalog</a>
        </td>
        <td class="header" width="40%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Component</a>
        </td>
        <td class="header">&#160;</td>
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
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="99" includeParams="true"/>">Reliability Bonus</a>
        </td>
        <td class="headerC" width="10%">
            <div align="center">
                <a href="/dr"><img src="/i/interface/emblem/digitalrun.png" alt="" onmouseover="postPopUpText('globalPopupText','The Digital Run'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
            </div>
            <div align="center">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="15" includeParams="true"/>">Points</a>
            </div>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Registrants</a><br />
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
                <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>"
                                      paypalBrand="<%=(resultRow.getItem("paypal_brand").getResultData() != null)%>"/> 
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

                    <a href='http://community.topcoder.com/tco12'><img class="emblem" src="/i/tournament/tco12/emblem.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Eligible for the TopCoder Open'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
                </div>
                <% } else { %>
                &nbsp;
                <% } %>
            </td>
            <td class="value">
              <% if (resultRow.getIntItem("sensations_project") > 0) { %>
                <div align="center">
                    <a href='http://sensations.aol.com'><img class="emblem" src="/i/tournament/tco09/tc-sdc-icon.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Part of the AOL/TopCoder Sensations Challenge'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
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
                <rsc:item name="reliability_bonus" row="<%=resultRow%>" format="$###,###.00"/>
            </td>
            <td class="valueC">
                <rsc:item name="dr_points" row="<%=resultRow%>" format="######"/>
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
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" /></a>
</div>

<% } else { %>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
        <td>
            <a href="/dr"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0"/></a>
        </td>
        <td align="right">
            <a href="/wiki/display/tc/Getting+Started+in+Component+Development+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a><br /><br />
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
    Competition opportunities via RSS - <a href="/tc?module=BasicRSS&amp;c=rss_Development_Registration_Open&amp;dsid=28">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Development_Registration_Open&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" /></a>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="12">Active Component Development Contests</td>
    </tr>
    <tr>
        <td class="headerC">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="16" includeParams="true"/>">Type</a>
        </td>
        <td class="header">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Catalog</a>
        </td>
        <td class="header" width="40%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Component</a>
        </td>
        <td class="header">&#160;</td>
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
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="99" includeParams="true"/>">Reliability Bonus</a>
        </td>
        <td class="headerC" width="10%">
            <div align="center">
                <a href="/dr"><img src="/i/interface/emblem/digitalrun.png" alt="" onmouseover="postPopUpText('globalPopupText','The Digital Run'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
            </div>
            <div align="center">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="15" includeParams="true"/>">Points</a>
            </div>
        </td>
        <td class="headerC" width="10%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Registrants</a><br />
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
            <td class="valueC" style="font-weight:bold">
                <rsc:item name="type" row="<%=resultRow%>"/>
            </td>
            <td class="valueC">
                <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>" 
                                      paypalBrand="<%=(resultRow.getItem("paypal_brand").getResultData() != null)%>"/> 
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
                    <a href='http://community.topcoder.com/tco12'><img class="emblem" src="/i/tournament/tco12/software_tco12_icon.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Eligible for the TopCoder Open'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
                </div>
                <% } %>
            </td>
            <td class="value">
              <% if (resultRow.getIntItem("sensations_project") > 0) { %>
                <div align="center">
                    <a href='http://sensations.aol.com'><img class="emblem" src="/i/tournament/tco09/tc-sdc-icon.png" alt="" border="0" onmouseover="postPopUpText('globalPopupText','Part of the AOL/TopCoder Sensations Challenge'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
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
                <rsc:item name="reliability_bonus" row="<%=resultRow%>" format="$###,###.00"/>
            </td>
            <td class="valueC">
                <rsc:item name="dr_points" row="<%=resultRow%>" format="######"/>
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
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" /></a>
</div>

<% } %>

<p align="left">* And that's before royalty payments. The more <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp">Component Subscriptions</a> we sell, the more royalties we pay out to our winners! Please note that custom components do not get added to the catalog and therefore do not have royalties.  Additionally, component testing competitions are not included in royalty payments.
    </p>

<br />

            <%--
            </div>
            --%>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="branded"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
