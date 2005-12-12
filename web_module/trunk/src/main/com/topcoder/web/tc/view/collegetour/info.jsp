<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
    <!-- Left Column Begins-->
    <td width="180">
        <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="level1" value=""/>
            <jsp:param name="level2" value=""/>
        </jsp:include>
    </td>
    <!-- Left Column Ends -->

    <!-- Center Column Begins -->
    <td class="cardCell" width="100%" align="center">
        <div class="myTCBody">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="college_tour"/>
                <jsp:param name="title" value="Instructions"/>
            </jsp:include>


            <div align=center>
                <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
            </div>

            <!-- college tour site subnav -->
            <p align="center">
                <A href="/tc?module=CollegeTourOverview&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Overview</A>&#160;&#160;|&#160;&#160;
                Instructions&#160;&#160;|&#160;&#160;
                <A href="/tc?module=CollegeTourReg&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Register</A>&#160;&#160;|&#160;&#160;
                <A href="/tc?module=CollegeTourRegistrants&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>">Registrants</A>&#160;&#160;|&#160;&#160;
                    <% if (request.getAttribute(Constants.FORUM_ID))!=null) {%>
                <tc-webtag:forumLink forumID="<%=Long.parseLong((String)request.getAttribute(Constants.FORUM_ID))%>" message="Discuss College Tour"/>
                    <% } %>
            </p>
            <!-- ends -->

            <p>
                <h2>Competition Instructions</h2>

                To be able to compete in the competition, you must be
                a <%=request.getAttribute(Constants.SCHOOL_NAME)%> student or
                a <%=request.getAttribute(Constants.SCHOOL_NAME)%> faculty member. <br/><br/>
                In order to compete, you must:

                <ol>
                    <li><A href="/Registration" target="blank">Register</a> as a TopCoder member</li>
                    <li><A href="/tc?module=CollegeTourReg&<%=Constants.COLLEGE_TOUR_EVENT_ID%>=<%=request.getAttribute(Constants.COLLEGE_TOUR_EVENT_ID)%>" target="blank">Register</A> for this TopCoder College Tour event</li>
                </ol>

                <h3>Languages</h3>
                TopCoder supports four languages: Java, C++, C# and VB.NET <br/>
                You can find out more about language support here:
                <A href="/tc?module=Static&d1=help&d2=codingWindow#language" target="blank">Choosing a Language</A>

                <h3>Phases</h3>
                TopCoder competitions consist of three phases:

                <ul>
                    <li>Coding </li>
                    <li>Challenge </li>
                    <li>System-test</li>
                </ul><br/>

                You can find out more information about each of the phases here:
                <A href="/tc?module=Static&d1=help&d2=ratedEvent" target="_blank">The Phases of a Rated Event</A>

                <h3>Competition Arena</h3>
                The competition takes place in what is called in the Arena. The Arena can be run as an applet from
                within your
                web browser or as a stand alone Java Web Start application (recommended). In order to compete, you
                will need to have Java installed on your computer (<A href="http://java.sun.com/" target="_blank">Sun
                Java</A>). You can find links to start the Arena on <A href="/tc" target="_blank">TopCoder</A>.

                <h3>Practice Arena</h3>
                It is highly recommended that all new members visit the practice rooms prior to competing in an
                algorithm rated event. By visiting a practice room you will learn the Arena interface, the nature of
                the problems, and the expected structure of your solution. You will also get a chance to look at
                thousands of submissions in various languages from other competitors who have visited the practice
                rooms.<br/><br/>


                <A href="/tc?module=Static&d1=help&d2=pracArena#practicerooms" target="_blank">Practice Room FAQ</A>
                <br/><br/>
                <A href="/tc?module=Static&d1=help&d2=index" target="_blank">TopCoder FAQ</A>


                <br/><br/>
            </p>

        </div>


    </div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
