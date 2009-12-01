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

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

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
                <jsp:param name="node" value="working_tc"/>
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

        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                        <td><img src="/i/clear.gif" alt="" width="11" height="10" border="0"/></td>
                     </tr>
                      <tr>
                        <td class="statText" bgcolor="#43515E" height="18" valign="middle">&#160;&#160;<strong>Great Jobs at TopCoder</strong></td>
                     </tr>
                  </table>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

                       <h3>TopCoder Platform Manager</h3>


                       <strong>Job Description </strong>

                        <p><strong>Responsibilities:</strong></p>

             			<ul>
							<li>Work closely with enterprise customers to explore and identify business needs. </li>
							<li>Guide customers through all phases of the TopCoder Software Application Development Methodology to deliver high quality software applications that add significant value to their business:</li>
                            	<ul>
                                	<li>Conceptualization</li>
                                	<li>Specification</li>
                                	<li>Architecture</li>
                                	<li>Design</li>
                                	<li>Component Design and Development</li>
                                	<li>Assembly</li>
                                	<li>Certification/Testing</li>
                                	<li>Deployment</li>
                                	<li>Support/Enhancements</li>
                                </ul>
							<li>Function as subject matter expert in utilization of component library.</li>
							<li>Function as a resource for the client in areas such as managing project timelines and budgets.</li>
							<li>Manage relationship with customer and identify additional business challenges that can be successfully met through utilization of the platform.</li>
							<li>Work with the TopCoder Production team to help improve the various process and procedures with regards to engaging the TopCoder community.</li>
                        </ul>

                        <p><strong>Additional Responsibilities:</strong></p>

             			<ul>
							<li>May work with multiple customers simultaneously. </li>
							<li>Must be willing to travel Monday-Friday within the continental United States. </li>
                        </ul>

                        <strong>Job Requirements</strong>
                        
                        <p><strong>Technical Skills:</strong></p>

             			<ul>
							<li>Experience managing software development projects in a customer facing capacity.</li>
							<li>Working knowledge of Object Oriented design principles and component based software development.</li>
							<li>Demonstrated experience in UML modeling, project scope development, and requirements gathering techniques. </li>
							<li>Experience with social networks and latest social media technologies</li>
                        </ul>

                        <p><strong>Professional Skills:</strong></p>

             			<ul>
							<li>Excellent analytical and problem solving skills as well as strong verbal and communication skills. </li>
							<li>Ability to demonstrate leadership skills by being committed to excellence, demonstrating company values and policies, initiating action, accepting responsibility for results, and making quality decisions.</li>
							<li>Effective team player.</li>
							<li>Ability to lead software development projects to successful completion on time and on budget.</li>
                        </ul>

                        <p><strong>Other Requirements:</strong></p>

             			<ul>
							<li>Bachelor degree.</li>
							<li>Candidates must be US Citizens, have a valid Green Card, or be eligible for a TN visa.</li>
                        </ul>

                        
                        <p>TopCoder is passionate about innovation and building long lasting relationships with companies interested in finding 'a better way' to do things.  To start or continue a management career in a forward-thinking environment that offers a lucrative compensation structure focused on performance including a corporate benefits package, <a href="mailto:kstanulis@topcoder.com, gtsipolitis@topcoder.com?subject=Platform Manager">apply for this job<a/>.</p>
                        <%--
                        <strong>Salary: </strong>
                        <ul>
                            <li>Base Salary</li>
                            <li>Personal Goals bonus plan</li>
                            <li>Company Goals bonus plan</li>
                        </ul>

                        <p>
                        <a href="mailto:jobs@topcoder.com?subject=Salesperson">Apply for this job.<a/>
                        </p>
                        <p><br /></p>
                        --%>
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
