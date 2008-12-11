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
            <jsp:param name="active" value="algo_info"/>
        </jsp:include>        
        <!-- ends -->

        <p>
            <h2>Algorithm Competition Instructions</h2>

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

            <h3>Languages</h3>
            TopCoder supports four languages: Java, C++, C# and VB.NET <br/>
            You can find out more about language support here:
            <A href="/tc?module=Static&d1=help&d2=codingWindow#language" target="blank">Choosing a Language</A>
            <br><br>

            <h3>Phases</h3>
            TopCoder competitions consist of three phases:

            <ul>
                <li>Coding</li>
                <li>Challenge</li>
                <li>System-test</li>
            </ul>

            You can find out more information about each of the phases here:
            <A href="/tc?module=Static&d1=help&d2=ratedEvent" target="_blank">The Phases of a Rated Event</A>
            <br><br>

            <h3>Competition Arena</h3>
            The competition takes place in what is called in the Arena. The Arena can be run as an applet from
            within your
            web browser or as a stand alone Java Web Start application (recommended). In order to compete, you
            will need to have Java installed on your computer (<A href="http://java.sun.com/" target="_blank">Sun
            Java</A>). You can find links to start the Arena on <A href="/tc" target="_blank">TopCoder</A>.
            <br><br>

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
