<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder - Sales Director Position</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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
                       
                       <h3>Internal TopCoder Project Manager</h3>
                       
						
<b>Job Description:</b>
   <ul>
   <li>Work closely with TopCoder staff to identify business needs and translate them into technical specifications. 
   <li>Complete the Specification phase of the Application Development Methodology with the aid of the TopCoder staff and Creative resources. This entails creating: 
      <ul>
      <li>Requirements Specifications</li>
      <li>Activity Diagrams</li>
      <li>Use Cases</li>
      <li>Test Plan</li>
      <li>Working Prototype (HTML, Javascript)</li>
      <li>Component Interaction Diagram</li>
      <li>Project Plan</li>
      </ul>
   <li>Verify the quality of the software application and the adherence to the specification deliverables, including the execution of the test plan.</li>
   <li>Manage and take part in the deployment of the application for TopCoder.</li>
   </ul>
<b>Additional Responsibilities:</b>
   <ul>
   <li>May work on multiple internal projects simultaneously.</li>
   <li>No travel / relocation to the Hartford, CT area is necessary</li>
   </ul>
<b>Technical Skills:</b>
   <ul>
   <li>Strong grasp of Object Oriented design principles with a focus on component based software development.</li>
   <li>Demonstrated experience in software application design and UML creation.</li>
   <li>Technical experience in relevant project technologies. For example, a given project may require familiarity with the following technologies:</li>
      <ul>
      <li>J2EE</li>
      <li>Relational database design</li>
      </ul>
   <li>Experience managing software development projects.</li>
   </ul>
<b>Professional Skills:</b>
   <ul>
   <li>Excellent communication skills.</li>
   <li>Proven leadership experience.</li>
   <li>Team player.</li>
   </ul>

<br><br>
<b>Contact Information:</b><br>
Company: TopCoder<br>
Contact: George Tsipolitis<br>
Email: <A href="mailto:gtsipol@topcoder.com">gtsipol@topcoder.com</A><br>
Address: 703 Hebron Ave<br>
Glastonbury, CT 06033<br>
Phone: 860.633.5540<br>

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
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
