<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <img src="/i/collegetour/logo_belarus_all_college.png" alt="" />
</div>

<p align="center">
    <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarus">Overview</A> | 
    Instructions | 
    <a href="/tc?module=CollegeTourViewReg&cteid=41">Registration</A> | 
    <a href="/tc?module=CollegeTourRegistrants&cteid=41">Registrants</A> | 
    <tc-webtag:forumLink forumID="514541" message="Discuss College Tour" />
</p>

<h2>Competition Instructions</h2>

To be able to compete in the competition, you must be
a Belarusian college student or
a Belarusian college faculty member. <br><br>
In order to compete, you must:

<ol>
<li><a href="/reg/" target="blank">Register</a> as a TopCoder member</li>

<li><a href="/tc?module=CollegeTourViewReg&cteid=41" target="blank">Register</a> for this TopCoder College Tour event</li>
</ol>

<h3>Languages</h3>
TopCoder supports four languages: Java, C++, C# and VB.NET <br>
You can find out more about language support here:
<a href="/tc?module=Static&amp;d1=help&amp;d2=codingWindow#language" target="blank">Choosing a Language</a>

<br><br>

<h3>Phases</h3>
TopCoder competitions consist of three phases:

<ul>
<li>Coding </li>
<li>Challenge </li>
<li>System-test</li>
</ul>

You can find out more information about each of the phases here:
<a href="/tc?module=Static&amp;d1=help&amp;d2=ratedEvent" target="_blank">The Phases of a Rated Event</a>
<br><br>

<h3>Competition Arena</h3>
The competition takes place in what is called in the Arena. The Arena can be run as an applet from
within your
web browser or as a stand alone Java Web Start application (recommended). In order to compete, you
will need to have Java installed on your computer (<a href="http://java.sun.com/" target="_blank">Sun
Java</a>). You can find links to start the Arena on <a href="/tc" target="_blank">TopCoder</a>.
<br><br>

<h3>Practice Arena</h3>
It is highly recommended that all new members visit the practice rooms prior to competing in an
algorithm rated event. By visiting a practice room you will learn the Arena interface, the nature of
the problems, and the expected structure of your solution. You will also get a chance to look at
thousands of submissions in various languages from other competitors who have visited the practice
rooms.<br><br>


<a href="/tc?module=Static&amp;d1=help&amp;d2=pracArena#practicerooms" target="_blank">Practice Room FAQ</a>
<br><br>
<a href="/tc?module=Static&amp;d1=help&amp;d2=index" target="_blank">TopCoder FAQ</a>


            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>