<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder</title>

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
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="about"/>
                <jsp:param name="level2" value="jobs"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Working at TopCoder"/>
        </jsp:include>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="10" BORDER="0"/></TD>
                     </TR>
                      <TR>
                        <TD CLASS="statText" BGCOLOR="#43515E" HEIGHT="18" VALIGN="middle">&#160;&#160;<B>Great Jobs at TopCoder</B></TD>
                     </TR>
                  </TABLE>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

<h3>Component Architect</h3>

<b>Job Description:</b>
<ul>
<li>Work closely with TopCoder Software project managers to break applications down into functional areas for concurrent development.</li>
<li>Break down customer applications into components using the TopCoder Component Catalog for existing components and the TopCoder Component Development Methodology for new components.</li>
<li>Complete the Component Architecture phase of the Application Development Methodology with the aid of the Project Manager and other component architects.  This entails creating:
<ul>
<li>Identifying Components</li>
<li>Component Requirements Specifications</li>
<li>Class Diagrams</li>
<li>Sequence Diagrams</li>
<li>Physical ERD Diagrams</li>
<li>Application Design Document</li>
</ul>
</li>
<li>Manage and work with some of the best coders in the world designing components specified during Component Architecture.</li>
<li>Support Application Assemblers and Project Managers assemble components into workable systems.</li>
</ul>
<b>Additional Responsibilities:</b>
<ul>
<li>May work with multiple customers simultaneously.</li>
<li>Must be willing to travel.  Travel will be minor, estimated at 30 to 45% of the time.</li>
</ul>

<b>Technical Skills:</b>
<ul>
<li>Strong grasp of Object Oriented design principles with a focus on component based software development.</li>
<li>Demonstrated experience in software application design and UML creation.</li>
<li>Technical experience in relevant project technologies.  For example, a given project may require familiarity with the following technologies:
<ul>
<li>J2EE, .NET</li>
<li>Strong relational database design (Microsoft SQL Server or Oracle)</li>
<li>Unit Testing frameworks (NUnit, JUnit, Cactus, HTTP Unit, etc)</li>
</ul>
</li>
<b>Professional Skills:</b>
<ul>
<li>Excellent communication skills.</li>
<li>Team player.</li>
<li>Participant in a TopCoder component competition</li>

</ul>


                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
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
