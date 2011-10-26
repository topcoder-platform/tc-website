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

                       <h3>TopCoder Information Architect</h3>
                       <b>Job Description:</b>
                       <br><br>
<%--
The Front-End Designer/Developer will work closely with TopCoder Project Managers and Information Architects to create interactive front-end prototypes from wireframes and storyboards.
--%>
We are seeking a creative candidate who has a strong design background
and experience developing web sites/web applications using standards.
The ideal designer will be capable of producing a web project through
all stages of development using information architecture, design, hand-
coding HTML and CSS and performing any one of these functions as a
part of a larger team. Knowledge of industry trends and the desire to
produce engaging interactive experiences is essential.


<br><br>
<%--
<b>Responsibilities Include:</b>
<ul>
<li>Designing highly-useable, professional looking user interfaces</li>
<li>Creating .NET and Java Swing click-through demos for clients</li>
<li>Design and create skeleton forms for developers</li>
<li>Keeping up with current GUI standards, trends and technologies</li>
</ul>
--%>
<b>Technical Skills:</b>
<ul>
<li>Experience creating standards compliant (X)HTML/CSS</li>
<li>Solid understanding of web standards, usability, and accessibility</li>
<li>Understanding - cross browser issues</li>
<li>Experience - application design/development</li>
<li>Exposure to back end development</li>
<li>Familiarity with JavaScript, AJAX, Subversion, etc. a big plus</li>
</ul>

<b>Additional Responsibilities:</b>
<ul>
<li>Will work with multiple customers simultaneously</li>
<li>Minimal travel required</li>
</ul>

<b>Professional Skills:</b>
<ul>
<li>Ability to balance priorities, follow through and deliver a finished product on schedule</li>
<li>Excellent communication skills</li>
<li>Strong attention to detail</li>
<li>Desire to learn new skills and technologies</li>
<li>Team player</li>
<li>Able to work from home</li>
</ul>

<b>Typical Tasks Include, but are not limited to:</b>
<ul>
<%--
<li>Converting graphical storyboards to .NET templates</li>
--%>
<li>Creating splash screens from designer comps</li>
<li>Ability to setup or use existing components to execute common GUI tasks such as:
   <ul>
   <li>Dialogs</li>
   <li>Wizards</li>
   <li>Closeable tabbed panes</li>
   <li>Directory trees</li>
   <li>What's-this-style context help</li>
   <li>Dockable panes</li>
   <li>Stylized menu bars</li>
   <li>Sortable tables</li>
   <li>Editable table rows</li>
   <li>Themes & Skins</li>
   <li>Date Pickers</li>
   </ul>
</li>
<li>Creating installation screens</li>
<li>Setting up "faux" database tables to use in prototype demos</li>
<%--
<li>Exporting executable .NET files for client demos</li>
--%>
<li>Creating Windows Forms to correspond with IA wireframes</li>
<li>Researching new GUI technologies and making recommendations for custom GUI components</li>
</ul>

<b>* Please include samples of your interface designs with your resume.</b>

                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Information Architect Position">Apply for this job.</A><br>
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
