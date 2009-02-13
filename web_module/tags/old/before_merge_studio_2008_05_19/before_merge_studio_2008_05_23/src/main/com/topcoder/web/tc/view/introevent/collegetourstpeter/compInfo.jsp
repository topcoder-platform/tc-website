<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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
            <jsp:param name="active" value="comp_info"/>
        </jsp:include>        
        <!-- ends -->

            <h2>Component Competition Instructions</h2>

            To be able to compete in the competition, you must be
            a ${mainEvent.school.name} student or
            a ${mainEvent.school.name} faculty member. <br/><br/>
            In order to compete, you must:

            <ol>
                <li><A href="/reg/" target="blank">Register</a> as a TopCoder member</li>
                <li>
                    <A href="/tc?module=IntroEventRegister&eid=${event.id}" target="blank">Register</A>
                    for this TopCoder College Tour event
                </li>
            </ol>
            
<h3>Getting Started in a Component Competition</h3>

<p>
At a high level, the process is simple - in a design competition, you convert a set of requirements into a set of diagrams and a component specification document, and in a development competition, you convert a component design into a functional component. When you have submitted your work, a three-member review board will review everything and give you feedback. You are given an opportunity to review their feedback and submit appeals. After the appeals, TopCoder Software compares scores of all submissions and determines the winning submission. If your submission wins, you implement the changes detailed in the feedback from the review board and submit the changes for the final review. This is the last step of the process - once your changes are approved, you are done!
</p>
<p><strong>
<A href="/wiki/display/tc/Getting+Started+in+Component+Design+Competitions">Learn more >></A>
</strong></p>

    </div>


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
