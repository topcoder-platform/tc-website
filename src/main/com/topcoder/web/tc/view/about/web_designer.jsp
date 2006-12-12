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

                       <h3>Web Designer</h3>


<strong>Job Description:</strong><br>
We are seeking a motivated and very talented web designer to work within our current web/graphic design team.  The ideal candidate will have previous experience building websites that are clean, lean, modular and flexible, as well as standards-compliant and cross-browser capable.  The candidate must be able to work within a well-established team environment, while still able to work well independently.  A keen interest in learning new technologies and the ability to pay attention to details are essential for this position.
<br><br>
<strong>Primary Responsibilities</strong>
<ul>
<li>Updating the current TopCoder suite of websites with new content and graphical promotions</li>
<li>Producing website graphics/promotions and integrating them into the website(s)</li>
<li>Creating new web pages or entire websites for specific events</li>
<li>Creating new or modifying existing navigational elements of the website(s)</li>
<li>Converting an image mock-up into new web pages or websites using HTML & CSS</li>
<li>Using Photoshop to modify photography for the website(s)</li>
</ul>

<strong>Additional Responsibilities</strong>
<ul>
<li>Keep organized and work on multiple projects simultaneously.</li>
<li>Ability to work with little supervision and take the initiative.</li>
<li>Required company travel for major TopCoder events (2-3 weeks per year)</li>
</ul>

<strong>Technical Skills</strong>
<ul>
<li>Expert knowledge of HTML & CSS</li>
<li>Advanced knowledge of Adobe Photoshop & Illustrator</li>
<li>Basic to advanced knowledge of XHTML</li>
<li>Familiarity with JavaScript, DHTML, XML and Flash</li>
<li>Previous working experience with JSP's a plus, but not a requirement</li>
</ul>

<strong>Professional Skills</strong>
<ul>
<li>Ability to communicate well with others in person, on the phone, via email and through IM</li>
<li>A desire to always learn more</li>
<li>Attention to detail</li>
</ul>

                        <p>
                        <a href="/tc?module=JobHit&jid=374&jt=4">Apply for this job.<a/>
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
