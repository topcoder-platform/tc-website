<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder College Tour</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
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

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="college_tour"/>
<jsp:param name="title" value="Instructions"/>
</jsp:include>


      <div align=center>
      <img src="/i/collegetour/college_logo.gif" alt="College Logo" border=0 clear="all">
      </div>
 
      <p>
      <h2>Competition Instructions</h2>
      
      To be able to compete in the competition, you must be a SCHOOL NAME student or a SCHOOL NAME faculty member. <br/><br/>
      
      <ul>
      <li>Register on TopCoder </li>
      <li>Register your TopCoder handle <A href="//tc?module=registrants.jsp">here</a></li>
      </ul>
            
      <h3>Languages</h3>
      TopCoder supports four languages: Java, C++, C# and VB.NET <br/>
      You can find out more about language support here: <A href="#">Choosing a Language</A>
      
      <h3>Phases</h3>
      TopCoder competitions consist of three phases:
      
      <ul>
      <li>Coding </li>
      <li>Challenge </li>
      <li>System-test</li>
      </ul><br/>
      
      You can find out more information about each of the phases here: <A href="tc?module=Static&d1=help&d2=ratedEvent" target="_blank">The Phases of a Rated Event</A>
      
      <h3>Competition Arena</h3>
      The competition takes place in what is called in the Arena. The Arena can be run as an applet from within your web browser or as a stand alone Java Web Start application (recommended). In order to compete, you will need to have Java installed on your computer (<A href="http://java.sun.com/" target="_blank">Sun Java</A>). You can find links to start the Arena on <A href="/tc" target="_blank">TopCoder</A>.

      <h3>Practice Arena</h3>
      It is highly recommended that all new members visit the practice rooms prior to competing in an algorithm rated event. By visiting a practice room you will learn the Arena interface, the nature of the problems, and the expected structure of your solution. You will also get a chance to look at thousands of submissions in various languages from other competitors who have visited the practice rooms.<br/><br/>


      <A href="tc?module=Static&d1=help&d2=pracArena#practicerooms" target="_blank">Practice Room FAQ</A><br/><br/>
      <A href="tc?module=Static&d1=help&d2=index" target="_blank">TopCoder FAQ</A>

      
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

<jsp:include page="../foot.jsp" />

</body>

</html>
