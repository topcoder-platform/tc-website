<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mm" tagdir="/WEB-INF/tags" %>

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
                <jsp:param name="node" value="long_practice"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="long_comps_topcoder"/>
                <jsp:param name="title" value="Practice Contests"/>
            </jsp:include>

            <div align="right" style="margin: 6px 0px;">
                <a href="/longcontest/?module=Static&amp;d1=instructions"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a>
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr>
                    <td class="title" colspan="5">Practice Contests</td>
                </tr>
                <tr>
                    <td class="header">Original Contest</td>
                    <td class="header">Problem</td>
                    <td class="headerC">Competitors</td>
                    <td class="headerC">&nbsp;</td>
                    <td class="headerC">&nbsp;</td>
                </tr>

                <%boolean even = true;%>

                <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <c:forEach items="${originalRounds[contest.problemID]}" var="r" varStatus="status">
                                <a href="/longcontest/?module=ViewStandings&amp;rd=${r.id}" class="bcLink">
                                    ${r.name}
                                </a>
                                <c:if test="${not status.last }">
                                    <br/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td class="value">
                           <mm:problemLink roundId="${contest.roundID}" problemId="${contest.problemID}" problemName="${contest.problemName}" />                            
                        </td>
                        <td class="valueC">
                            ${contest.numCompetitors}
                        </td>
                        <td class="valueC">
                                <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&amp;<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&amp;<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>">submit</a>
                        </td>
                        <td class="valueC">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&amp;<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">standings</a>
                        </td>
                    </tr>
                    <%even = !even;%>
                </logic:iterate>
            </tbody>
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