<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>

<jsp:include page="../script.jsp" />

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
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="openings"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="employmentOpps"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

		<div align="center">
      <img src="/i/contracting/gentiva_logo.gif" border=0/>
		</div>

<p>
<span class="bodySubtitle">Technical Team Lead</span>
<br><br>
We are seeking exceptional technologists that are highly motivated, have the ability to implement complex concepts and work well in a team environment.  Travel may be required for up a week at a time.
<br><br>
<strong>Requirements:</strong><br>
The positions are on a web-based enterprise application development team. 
<br><br>
As a technical team lead and architect, the individual will provide the expertise in enterprise application architecture, lead a team of developers in architecture, design, and implementation, and direct the architecture for the future expansions of the applications. The successful candidate will be required to design and develop application components, conduct unit testing and integration with other application components. The candidate will also be responsible for gathering technical requirements for external system interfaces and develop the interface components and communicating the technical solutions to customers and end users, and coordinating the associated development, testing and deployment efforts. The position involves working closely with the project management team, requirements team, and testing teams.
<br><br>
As lead and junior developers, the individuals will be responsible for the development, testing, and implementation of all components and systems.
<ul>
<li>Will be using the following technologies: HTTP, XML, SOAP, J2EE, EJB, JSP, EJB, JDBC, JNDI, JMS</li>
<li>Experience designing/developing J2EE compliant applications using WebLogic, Websphere or similar product a plus</li>
<li>Experience with distributed systems or a large enterprise background a plus</li>
</ul>

      <a href="/tc?module=JobHit&jid=292&jt=4">Register for this position here!</a>
		<br/><br/>
        <p><br></p>
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
