<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.model.LongContest"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>


<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
    if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_practice";
    } else if (roundType == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_practice";
        image = "long_comps_intel";
    } else if (roundType == Constants.INTEL_LONG_ROUND_TYPE_ID) {
        myNode = "long_intelmtcs_compete";
        image = "long_comps_intel";
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="<%=myNode%>"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

<%-- value of image is 'long_comps_topcoder' or 'long_comps_intel' --%>
<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="<%=image%>"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">

                <tr>
                    <td class="title" colspan="8">Active Marathon Match Contests</td>
                </tr>
                <tr>
                    <td class="header">Contest</td>
                    <td class="header" colspan="2">Problem</td>
                    <td class="headerC">Registrants</td>
                    <td class="headerC">Competitors</td>
                    <td class="headerC">Submissions</td>
                    <td class="headerC" nowrap="nowrap">Start Time</td>
                    <td class="headerC" nowrap="nowrap">End Time</td>
                </tr>

                <%boolean even = true;%>
                <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <% pageContext.setAttribute("sponsorImage", ((LongContest) contest).getSponsorImage());%>
                            <div style="float: right; margin-left: 4px;">
                                <ci:sponsorImage image="sponsorImage" alt="Sponsor" border="0" ifNull=""/></div>
                            <strong><mm:contest roundTypeId="${contest.roundTypeId}" contestName="${contest.contestName}" roundName="${contest.roundName}" />                            
                            </strong>
                            <div style="margin: 6px 10px;">
                                <logic:notEqual name="contest" property="forumId" value="0">
                                    <tc-webtag:forumLink forumID="<%=((LongContest)contest).getForumId()%>" message="discuss"/> |
                                </logic:notEqual>
                                <logic:equal name="contest" property="passed" value="false">
                                    <logic:equal name="contest" property="started" value="true">
                                        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">standings</a>
                                    </logic:equal>
                                </logic:equal>
                                <logic:notEqual name="contest" property="passed" value="false">
                                    <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewOverview&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">results</a>
                                </logic:notEqual>
                            </div>
                        </td>
                        <td class="value">
                            <logic:equal name="contest" property="passed" value="false">
                                <logic:equal name="contest" property="coderRegistered" value="false">
                                    <tc-webtag:beanWrite name="contest" property="problemName"/>
                                </logic:equal>
                                <logic:notEqual name="contest" property="coderRegistered" value="false">
                                    <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" >
                                        <tc-webtag:beanWrite name="contest" property="problemName"/>
                                    </a>
                                </logic:notEqual>
                            </logic:equal>
                            <logic:notEqual name="contest" property="passed" value="false">
                                <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" >
                                    <tc-webtag:beanWrite name="contest" property="problemName"/>
                                </a>
                            </logic:notEqual>

                        </td>
                        <td class="valueC">
                            <logic:equal name="contest" property="passed" value="false">
                                <logic:equal name="contest" property="coderRegistered" value="false">
                                    <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewReg&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                       >Register/Submit</a>
                                </logic:equal>
                                <logic:notEqual name="contest" property="coderRegistered" value="false">
                                    <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>"
                                       >Submit</a>
                                </logic:notEqual>
                            </logic:equal>
                        </td>
                        <td class="valueC" align="center">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" >
                                <tc-webtag:beanWrite name="contest" property="numRegistrants"/></a></td>
                        <td class="valueC" align="center">
                            <tc-webtag:beanWrite name="contest" property="numCompetitors"/></td>
                        <td class="valueC" align="center">
                            <tc-webtag:beanWrite name="contest" property="submissionCount"/></td>
                        <td class="valueC" align="center" nowrap="nowrap">
                            <tc-webtag:beanWrite name="contest" property="startTime"
                                                 format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
                        <td class="valueC" align="center" nowrap="nowrap">
                            <tc-webtag:beanWrite name="contest" property="endTime"
                                                 format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>

                    </tr>
                    <%even = !even;%>
                </logic:iterate>

            </table>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>