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

                       <h3>Deployment Engineer</h3>


<strong>Job Description:</strong><br>
The Deployment Engineer will work with TopCoder Project Managers and Software Architects in configuring, installing, and running applications created through the TopCoder competition process.  This opportunity seeks a candidate who has prior experience in running a diverse IT environment, with a broad range of skills.
<ul>
<li>Take a functioning application from the TopCoder development process and configure, install/compile, and deploy it in a development or production environment.</li>
<li>Ability to diagnose and troubleshoot errors from applications independently or with team members.</li>
<li>Communicate project status, errors, and other items with the TopCoder team.</li>
<li>Create documentation of your process.</li>
<li>Ability to work with clients and communicate with them regarding errors and project status when necessary.</li>
</ul>
<strong>Additional Responsibilities:</strong>
<ul>
<li>Keep organized and work on multiple projects simultaneously.</li>
<li>Ability to work in a dynamic and fluid role.</li>
<li>Work with no supervision and take the initiative.</li>
<li>Required to travel and work from home.</li>
</ul>
<strong>Technical Skills:</strong>
<ul>
<li>Experience operating in production and development IT environments.</li>
<li>Windows 2003 Server Standard.</li>
<li>Redhat Enterprise Linux.</li>
<li>Basic IT security methods (users, groups, filesystem, directory services, etc).</li>
<li>TCP/IP networking and related applications (ping, netstat, dns).</li>
<li>Troubleshooting in the OSI 7 Layer model.</li>
<li>Linux shell scripting command (bash, grep).</li>
<li>Familiar with the following would be a plus.</li>
    <ul>
    <li>VMWare</li>
    <li>Java and installing of the jdk</li>
    <li>Apache Software Group products (Apache 2, Tomcat, Ant)</li>
    <li>JBoss</li>
    <li>Database products (MS SQL/Oracle)</li>
    <li>MS .Net</li>
    <li>IIS</li>
    </ul>
<li>No prior programming experience is required, though being familiar with Java or .NET would be a plus.</li>
</ul>
<strong>Professional Skills:</strong>
<ul>
<li>Ability to communicate with others.</li>
<li>A desire to always learn more.</li>
</ul>

                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Deployment Engineer">Apply for this job.<a/>
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
