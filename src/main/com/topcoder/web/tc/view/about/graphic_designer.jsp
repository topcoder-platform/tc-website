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

                       <h3>TopCoder Software Graphic Designer</h3>
                       <b>Job Description:</b>
                       <br><br>

The Graphic Designer will work closely with TopCoder Project Managers and Information Architects to design user interfaces and create application prototypes during the specification phase of any software project requiring a GUI.  Responsibilities Include:
<ul>
<li>Designing highly-useable, professional looking user interfaces</li>
<li>Using best practices to create web-based prototypes</li>
<li>Keeping up with current technologies and coding practices</li>
</ul>

<b>Technical Skills:</b>
<ul>
<li>Mastery of HTML/XHTML and CSS</li>
<li>Strong Javascript Skills</li>
<li>Excellent graphic design skills</li>
<li>Experience designing both desktop and web-based products</li>
<li>Ability to create Wireframes from requirements specification documents</li>
<li>Ability to work on multiple projects at once</li>
<li>Ability to resolve cross browser/platform compatibility issues</li>
</ul>

<b>Additional Responsibilities:</b>
<ul>
<li>Will work with multiple customers simultaneously.</li>
<li>Occasional travel is required, but minimal.</li>
</ul>

<b>Professional Skills:</b>
<ul>
<li>Ability to balance priorities, follow through and deliver a finished product on schedule.</li>
<li>Excellent communication skills.</li>
<li>Team player.</li>
<li>Able to work from home.</li>
</ul>
                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Graphic Designer">Apply for this job.</A><br>
                        <b>Please include your TopCoder handle and an attached resume, if possible.</b>
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
