<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="events" value="${requestScope.events}"/>
<c:set var="requests" value="${requestScope.requests}"/>
<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

    <c:choose>
        <c:when test="${not empty isNewStyle && isNewStyle}">
            <td width="100%" align="center" class="bodyColumn">
                <div class="fixedWidthBody">

                    <!-- Visa Letters -->
                    <section id="visa-letters">

                        <a href="javascript:;" class="how-to-request informationLink">How to request visa letter?</a>
                        <h2>Request a Visa Letter</h2>


                        <c:choose>
                            <c:when test="${empty events}">
                                <div align="center" style="margin: 20px;">
                                    You have no pending Visa letter requests.
                                </div>
                            </c:when>
                            <c:otherwise>

                                <table>
                                    <tbody>
                                    <c:forEach items="${requests}" var="req" varStatus="loopStatus">
                                            <c:choose>
                                                <c:when test="${not empty req.sentDate}">

                                                    <tr class="${loopStatus.index % 2 == 0 ? 'dark' : 'light'} send">
                                                        <td class="letter">
                                                            <span><c:out value="${req.event.name}"/></span>
                                                        </td>
                                                        <td class="status">
                                                            Your Visa request has been approved. <br>  <a href="${sessionInfo.secureAbsoluteServletPath}?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request
                                                            again</a>
                                                        </td>
                                                        <td class="date">
                                                            <fmt:formatDate value="${req.sentDate}" pattern="MM/dd/yyyy"/>
                                                        </td>

                                                        <div align="center" style="margin: 20px;">

                                                        </div>

                                                    </tr>
                                                </c:when>
                                                <c:when test="${req.denied }">


                                                    <tr class="${loopStatus.index % 2 == 0 ? 'dark' : 'light'} denied">
                                                        <td class="letter">
                                                            <span><c:out value="${req.event.name}"/></span>
                                                        </td>
                                                        <td class="status">
                                                            We're sorry, your Visa letter request has been denied. <br>  <a href="${sessionInfo.secureAbsoluteServletPath}?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request
                                                            again</a>
                                                        </td>
                                                        <td class="date">

                                                        </td>

                                                    </tr>

                                                </c:when>
                                                <c:otherwise>

                                                    <tr class="${loopStatus.index % 2 == 0 ? 'dark' : 'light'} progress">
                                                        <td class="letter">
                                                            <span><c:out value="${req.event.name}"/></span>
                                                        </td>
                                                        <td class="status">
                                                            Your Visa letter request is in progress, please check again soon.
                                                        </td>
                                                        <td class="date">

                                                        </td>

                                                    </tr>

                                                </c:otherwise>
                                            </c:choose>
                                    </c:forEach>

                                    <!-- end table row -->
                                    </tbody>
                                </table>

                            </c:otherwise>
                        </c:choose>



                    </section>
                    <!-- End Visa Letters -->


                </div>
            </td>
        </c:when>
        <c:otherwise>
            <%-- Center Column Begins --%>
            <td width="100%" align="center" class="bodyColumn" id="visa-letters">
                <div class="fixedWidthBody">


                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="visa"/>
                                <jsp:param name="title" value="&nbsp;"/>
                            </jsp:include>


                    <c:choose>
                        <c:when test="${empty events}">
                            <div align="center" style="margin: 20px;">
                                You have no pending Visa letter requests.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h2 align="center">Current Visa letter requests:</h2>
                            <p align="center">
                                <c:forEach items="${events }" var="event">
                                    <A href="/tc?module=VisaLetterRequestStatus&eid=${event.id}"><c:out value="${event.name}"></c:out> </A><br>
                                </c:forEach>
                            </p>

                        </c:otherwise>
                    </c:choose>



                </div>
            </td>
            <%-- Center Column Ends --%>
        </c:otherwise>
    </c:choose>



        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>
