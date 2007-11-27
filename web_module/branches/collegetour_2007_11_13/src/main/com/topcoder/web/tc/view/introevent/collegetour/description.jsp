<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.collegetour.Description" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer list = (ResultSetContainer) request.getAttribute("list"); %>
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

<script type="text/javascript">
  function next() {
    var myForm = document.eventsForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.eventsForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

    myForm.submit();
  }
</script>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">
            <div class="myTCBody">

                <div align=center>
                    <img src="/i/collegetour/banner.jpg" alt="Competition, evolved." border=0 clear="all">
                </div>

                <p>
                    <h2 align="center">2006-2007 TopCoder College Tour</h2>
                    <br/><br/>
                    <%--
                                        <p align="center"><a href="#schools">Participating schools</a></p>
                    --%>

                    <h3>Is your school on the schedule?</h3>

                    TopCoder will be touring the college campuses during the remainder of 2006 and early 2007 to promote
                    TopCoder competitions, both Component and Algorithm, and to grow membership. We're looking for
                    collegiate CS students who are interested in hosting TopCoder on campus for an evening of problem
                    solving, food, prizes and fun.

                    <br/><br/>

                    <h3>How will the College Tour work?</h3>
                    Each selected campus will receive a visit from TopCoder during a regularly scheduled SRM
                    (<strong>S</strong>ingle <strong>R</strong>ound <strong>M</strong>atch). TopCoder
                    will provide a private registration path for each campus prior to the SRM. At the time of the SRM,
                    the registered students will gather in a computer lab and compete in their own virtual room during
                    the SRM,
                    with everyone solving the same Division II problems. Everyone who registers and attends the SRM will
                    receive a
                    TopCoder t-shirt and the top three performers will receive other great prizes. TopCoder will also
                    provide food
                    and beverages for all in attendance.
                    <br/><br/>
                    Prior to the SRM, TopCoder will provide the school with a web page dedicated to their event, to be
                    used for promotional and informational purposes. Additionally, TopCoder will provide flyers to be
                    printed and hung around campus to attract attention.
                    <br/><br/>
                    At the conclusion of the SRM, TopCoder representatives will talk about the benefits of being
                    involved with TopCoder:

                    <ul>
                        <li><strong>Component Design & Development:</strong> Learn how building software happens under
                            TopCoder's competitive model.
                        </li>
                        <li><strong>SRMs:</strong> Win cash prizes and chat before the competition with sponsors
                            interested in hiring TopCoder members
                        </li>
                        <li><strong>TopCoder Software:</strong> Consulting and full-time employment possibilities.</li>
                        <li><strong>TopCoder Employment Services:</strong> Learn how the leading technology companies -
                            Google, Yahoo, Microsoft, National Security Agency, Sun Microsystems, NVIDIA, VeriSign,
                            Motorola, etc. - hire elite talent and what positions there are available.
                        </li>
                        <li><strong>TopCoder tournaments - TopCoder Open & TopCoder Collegiate Challenge:</strong> Win
                            huge cash prizes, major recognition, and an all-expenses paid trip to the onsite finals with
                            other top-notch programmers from around the world.
                        </li>
                        <li><strong>TopCoder Studio:</strong> Learn about TopCoder's newest competition for Graphic
                            Designers and artists.
                        </li>
                    </ul>
                    <br/>

                    Interested in coordinating this event at your school? Contact
                    <A href="mailto:collegetour@topcoder.com">collegetour@topcoder.com</a> today!

                    <br/><br/>
                    <% if (request.getAttribute(Constants.FORUM_ID) != null) {%>
                    <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>"
                                         message="Discuss College Tour"/>
                    <% } %>
                </p>

                <a name="schools"></a>

                <form name="eventsForm" action="${sessionInfo.servletPath}" method="get">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CollegeTourDescription"/>
                <tc-webtag:hiddenInput name="<%=Constants.FULL_LIST%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
                
                <div class="pagingBox">
                <a href="/tc?module=CollegeTourDescription">Reset view</a>

                <c:choose>
                    <c:when test="${full}">
                        | <a href="${sessionInfo.servletPath}?module=CollegeTourDescription&full=false">Pages</a>
                        | Full view
                    </c:when>
                    <c:otherwise>
                        | Page view
                        | <a href="${sessionInfo.servletPath}?module=CollegeTourDescription&full=true">Full view</a>
                    </c:otherwise>
                </c:choose>

                <br />
                    <c:if test="${!full}">
                        <div class="pagingBox">
                            <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                            | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                        </div>
                    </c:if>
                </div>

                 <table cellspacing="0" cellpadding="0" width="100%" class="stat">
                    <tr><td colspan="3" class="title">
                    Events
                    </td></tr>
                    <tr>
                       <td class="header B"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%=list.getColumnIndex("start_time")%>" includeParams="true" excludeParams="sr"/>">Date</a></td>
                       <td class="header B"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="<%=list.getColumnIndex("event_name")%>" includeParams="true" excludeParams="sr"/>">Event</a>
                            <br/><tc-webtag:textInput name="<%=Constants.EVENT_NAME%>" size="16" maxlength="100"/>
                       </td>
                       <td class="header">&#160;</td>
                    </tr>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=list%>" id="resultRow">
                        <c:set var="row" value="<%=resultRow%>"/>
                    
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="value B"><fmt:formatDate value="${row.map['start_time']}" pattern="MM.dd.yyyy"/></td>
                            <td class="value B">${row.map['event_name']}</td>
                            <td class="value">
                                <c:choose>
                                    <c:when test="${row.map['algo_event'] != 0}">
                                        <a href="${sessionInfo.servletPath}?module=IntroEventAlgoInfo&eid=${row.map['algo_event']}">
                                            <img src="${row.map['image_path']}"
                                                 alt="${row.map['event_name']}" border="0"/>
                                        </a>
                                    </c:when>
                                    <c:when test="${row.map['comp_event'] != 0}">
                                        <a href="${sessionInfo.servletPath}?module=IntroEventCompOverview&eid=${row.map['comp_event']}">
                                            <img src="${row.map['image_path']}"
                                                 alt="${row.map['event_name']}" border="0"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${row.map['image_path']}"
                                             alt="${row.map['event_name']}" border="0"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <%even=!even;%>
                    </rsc:iterator>
                </table>
                <div class="pagingBox">
                    <a href="/tc?module=CollegeTourDescription">Reset view</a>
    
                    <c:choose>
                        <c:when test="${full}">
                            | <a href="/tc?module=CollegeTourDescription&full=false">Pages</a>
                            | Full view
                        </c:when>
                        <c:otherwise>
                            | Page view
                            | <a href="/tc?module=CollegeTourDescription&full=true">Full view</a>
                        </c:otherwise>
                    </c:choose>
    
                    <br />
                    <c:if test="${!full}">
                        <div class="pagingBox">
                            <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                            | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                        </div>
                       <br>
                    
                       View &#160;
                       <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                       &#160;at a time starting with &#160;
                       <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                        <button name="nameSubmit" value="submit" type="submit">Go</button>
                    </c:if>
                </div>
                </form>
            </div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
