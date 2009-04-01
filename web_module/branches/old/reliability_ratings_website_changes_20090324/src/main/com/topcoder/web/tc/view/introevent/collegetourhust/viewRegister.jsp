<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

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
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

        <jsp:include page="../../page_title.jsp">
            <jsp:param name="image" value="college_tour"/>
            <jsp:param name="title" value="Instructions"/>
        </jsp:include>


        <div align=center>
            <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
        </div>

        <!-- college tour site subnav -->
        <jsp:include page="topMenu.jsp">
            <jsp:param name="active" value="${isAlgo? 'algo_reg' : 'comp_reg'}"/>
        </jsp:include>        
        <!-- ends -->
        
        <p>
        <c:choose>
            <c:when test="${isEarly}">
            The registration is not yet open.
            </c:when>
            <c:when test="${isLate}">
            Registration is closed.
            </c:when>
            <c:when test="${isRegistered}">
                You are already registered for this event.
            </c:when>
             <c:when test="${!isEligible}" >
                 You are not eligible for this event.
             </c:when>
             <c:otherwise>
                <div align="center" style="margin-top: 40px;">
                    <p align="center">
                        Would you like to register for this event?
                    </p>
                    <A href="/tc?module=IntroEventRegister&eid=${event.id}" class="button" style="width: 80px;">Register now</A>
                </div>             
             </c:otherwise>
    
        </c:choose>
        </p>

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
