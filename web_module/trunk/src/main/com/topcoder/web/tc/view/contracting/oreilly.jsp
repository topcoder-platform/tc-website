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
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="employmentOpps"/>
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
      <img src="/i/contracting/oreilly_logo.gif" border=0/>
		</div>

		<p>
      <span class="bodySubtitle">Software Engineer<br>(Java/Perl/MySQL/Linux/XML/Web Services)</span>
      <br><br>
      Do you have experience with web application development on enterprise-class applications? Are you passionate about open source technologies including Java, Perl, Linux, XML, and MySQL? Are you someone who enjoys working in a collaborative environment and is able to manage deadline driven projects? These positions are responsible for development and maintenance of enterprise-class business and client-oriented applications in a team environment, using creative and cutting edge technologies. 
      <br><br>
      <strong>Minimum Requirements:</strong>
      <ul>
      <li>Expertise in Java or Perl and application development experience in web-based systems and client-server environments.</li>
      <li>Advanced knowledge of system analysis and design. This should include structured methodologies, logical and physical database design, and business process engineering.</li>
      <li>Practical, business-related experience in system administration and in setting up Client-Server architectures on Windows and Unix/Linux operating systems.</li>
      <li>Two or more years of practical business experience administering and/or designing relational databases (MySQL, SQL Server, Oracle etc) is required.</li>
      <li>Experience in XML (especially docbook), XML databases and web services a plus. Familiarity with XQuery also considered a plus.</li>
      <li>Minimum of a Bachelors degree in Computer Sciences or related field OR 6-8 years of actual related business experience.</li>
      <li>Ability to solve medium to complex technical and business issues with direction/approval.</li>
      <li>Must possess good communication skills, both verbal and written with demonstrated success in a team environment.</li>
      <li>Ability to interpret, evaluate and respond to problems and requests received from business users.</li>
      <li>Working knowledge of the publishing industry is desirable.</li>
      <li>Organized, deadline driven and pays attention to detail.</li>
      </ul>
      Location: Sebastopol, CA
      <br><br>
      <a href="/tc?module=ContractingPreferences">Register for this position here!</a>
		<br/><br/>
		</p>

        </div>
        <p><br/></p>
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
