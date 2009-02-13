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

                       <h3>TopCoder Software Project Manager</h3>


                        <b>Job Description:</b>
                        <ul>
                        <li>Work closely with TopCoder Software customers to identify business needs.</li>
                        <li>Manage all phases of the TopCoder Software Application Development Methodology to deliver high quality software applications that add significant business value to our customers.</li>
                        <li>Complete the Specification phase of the TopCoder Software Application Development Methodology with the aid of the customer and Creative resources. This entails creating:</li>                            <ul>
                            <li>Use Cases</li>
                            <li>Activity Diagrams</li>
                            <li>Requirements Specifications</li>
                            <li>Quality Assurance Plans</li>
                            <li>User Interface Prototypes (HTML, CSS, Javascript)</li>
                            <li>Project Plans</li>
                            </ul>
                        <li>Verify the quality of the software application and the adherence to the specification deliverables, including the execution of the test plan.</li>
                        <li>Manage and ensure the successful deployment of the application for the customer.</li>
                        <li>Manage project timelines and budgets.</li>
                        </ul>

                        <b>Additional Responsibilities:</b>
                        <ul>
                        <li>May work with multiple customers simultaneously.</li>
                        <li>Must be willing to travel Monday-Friday within the continental United States.</li>
                        </ul>

                        <b>Technical Skills:</b>
                        <ul>
                        <li>Experience managing software development projects.</li>
                        <li>Working knowledge of Object Oriented design principles and component based software development.</li>
                        <li>Demonstrated experience in UML modeling, project scope development, and requirements gathering techniques.</li>
                        </ul>

                        <b>Professional Skills:</b>
                        <ul>
                        <li>Excellent communication skills.</li>
                        <li>Proven leadership experience.</li>
                        <li>Team player.</li>
                        <li>Ability to effectively meet timelines and manage budgets.</li>
                        </ul>
                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Software Project Manager">Apply for this job.<a/>
                        </p>
                        <p><br /></p>
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
