<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="../top.jsp">
            <jsp:param name="section" value="admin"/>
        </jsp:include>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back
                    to
                    Contests</A></div>

                <h1>Edit Candidate Details</h1>

                <p><a href="${sessionInfo.servletPath}?module=AdminViewRound&amp;<%=Constants.ROUND_ID%>=${room.round.id}">edit round</a></p>
                <p><a href="${sessionInfo.servletPath}?module=AdminViewRooms&amp;<%=Constants.ROUND_ID%>=${room.round.id}">view rooms</a></p>
                <p><a href="${sessionInfo.servletPath}?module=AdminViewCandidates&amp;<%=Constants.ROOM_ID%>=${room.id}">view candidates</a></p>

                <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditCandidate"/>
                    <tc-webtag:hiddenInput name="<%=Constants.ROOM_ID%>"/>
                    <tc-webtag:hiddenInput name="<%=Constants.CANDIDATE_ID%>"/>

                    <div class="header">Candidate Details</div>

                    <table cellpadding="0" cellspacing="0" class="input">
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.CANDIDATE_NAME%>">
                                        <span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td class="name">
                                    Candidate Name:
                                </td>
                                <td class="value" width="100%">
                                    <tc-webtag:textInput name="<%=Constants.CANDIDATE_NAME%>"/>
                                </td>
                            </tr>


                            <c:set value="<%=Constants.CANDIDATE_PROPERTY%>" var="candidatePropertyKey"/>


                            <c:forEach items="${properties}" var="property">
                                <c:set value="${candidatePropertyKey}${property.id}" var="currKey"/>
                                <tr>
                                    <td colspan="2">
                                        <tc-webtag:errorIterator id="err" name="${currKey}"><span class="bigRed">${err}
                                            <br/></span></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="name">
                                            ${property.description}:
                                    </td>
                                    <td class="value">
                                        <tc-webtag:textArea name="${currKey}" rows="4" cols="80"/>
                                    </td>
                                </tr>

                            </c:forEach>


                        </tbody>
                    </table>


                    <p>
                        <button name="submit" value="submit" type="submit">Save</button>
                    </p>


                </form>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="../foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>