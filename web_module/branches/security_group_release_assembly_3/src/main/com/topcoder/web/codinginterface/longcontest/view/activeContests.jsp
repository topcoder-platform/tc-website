<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.codinginterface.longcontest.Constants" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.model.LongContest"

        %>
<%@ page import="com.topcoder.web.common.model.algo.RoundType" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
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
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="includes/global_left.jsp">
                <jsp:param name="node" value="long_compete"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="long_comps_topcoder"/>
                <jsp:param name="title" value="Active Contests"/>
            </jsp:include>

            <div align="right" style="margin: 6px 0px;">
                <a href="/longcontest/?module=Static&amp;d1=instructions"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a><br /><br />
              <br />
            </div>
            
    <%-- MM Promo On/Off--%>
            <div align="right" style="margin: 6px 0px;">
                
                
            </div>
            

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">

                <tr>
                    <td class="title" colspan="8">Active Contests</td>
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

                <c:set value="<%=RoundType.MARATHON%>" var="mmRoundType"/>
                <%boolean even = true;%>
                <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <% pageContext.setAttribute("sponsorImage", ((LongContest) contest).getSponsorImage());%>
                            <div style="float: right; margin-left: 4px;">
                                <ci:sponsorImage image="sponsorImage" alt="Sponsor" border="0" ifNull=""/></div>
                                    <c:choose>
                                        <c:when test="${mmRoundType==contest.roundTypeId}">
                                            <a href="/tc?module=MatchDetails&amp;<%=Constants.ROUND_ID%>=${contest.roundID}" >
                                                <mm:contest roundTypeId="${contest.roundTypeId}" contestName="${contest.contestName}" roundName="${contest.contestName} - ${contest.roundName}" />
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <mm:contest roundTypeId="${contest.roundTypeId}" contestName="${contest.contestName}" roundName="${contest.roundName}" />
                                        </c:otherwise>
                                    </c:choose>
                            <div style="margin: 6px 10px;">
                                <logic:notEqual name="contest" property="forumId" value="0">
                                    <tc-webtag:forumLink forumID="<%=((LongContest)contest).getForumId()%>" message="discuss"/> |
                                </logic:notEqual>
                                <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">standings</a>
                            </div>
                        </td>
                        <td class="value">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&amp;<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" >
                                <tc-webtag:beanWrite name="contest" property="problemName"/>
                            </a>
                        </td>
                        <td class="valueC">
                            <c:choose>
                                <c:when test="${isAnonymous}">
                                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewReg&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                               >Register/Submit</a>                                
                                </c:when>
                                <c:otherwise>                          
                                    <logic:equal name="contest" property="passed" value="false">
                                        <logic:equal name="contest" property="coderRegistered" value="false">
                                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewReg&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>"
                                               >Register</a>
                                        </logic:equal>
                                        <logic:notEqual name="contest" property="coderRegistered" value="false">
                                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&amp;<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&amp;<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>"
                                               >Submit</a>
                                        </logic:notEqual>
                                   </logic:equal>
                               </c:otherwise>  
                           </c:choose>
                        </td>
                        <td class="valueC" align="center">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewRegistrants&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>" >
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
             <logic:empty name="<%=Constants.CONTEST_LIST_KEY%>">
                <tr class="light">
                    <td class="valueC" colspan="8">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no active contests, but check back soon.
                        </div>
                    </td>
                </tr>
                </logic:empty>
            </table>

            <div align="center" style="margin:10px;">
                <a href="javascript:arena();"><img src="/i/longcontest/launchArena.png" alt="Launch Arena" /></a>
            </div>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="branded"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
