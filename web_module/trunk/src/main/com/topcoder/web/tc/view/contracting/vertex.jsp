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
      <img src="/i/contracting/vertex_logo.gif" border=0/>
		</div>

		<p>
      <span class="bodySubtitle">Lead Scientific Software Analyst (448JO)</span>
      <br><br>
      The selected candidate will architect, develop and support software applications used in drug discovery, especially those applications involved in the capture, analysis, reduction, storage, retrieval and visualization of chemical and biological data. This Analyst will be expected to work closely with scientists to define practical solutions to research data problems, respond quickly to high-priority prototyping efforts and mentor junior developers. Critical to success in this role will be the ability to work closely with developers and architects at other sites to create and maintain a consistent and high-quality code base. The selected candidate must also keep up with resources available in the open source community, commercial research software trends, advances in software development tools and cheminformatics techniques, as well as be available to support installation, configuration, maintenance, troubleshooting and upgrading of concomitant computer systems. 
      <br><br>
      <strong>Requirements:</strong>
      <ul>
      <li>College degree in Computer Science or Math</li>
      <li>command of Java</li>
      <li>demonstrated GUI/Swing experience on both Mac and PC and experience with Oracle database-driver applications</li>
      <li>database design and working with open-source tools and Linux</li>
      <li>a rapid learning curve and strong communication and interpersonal skills are essential</li>
      <li>experience in multi-site project management is desirable</li>
      <li>experience with Perl or Python would be advantageous</li>
      </ul>
      <br><br>
      <a href="/tc?module=JobHit&jid=280&jt=4">Register for this position here!</a>
		<br><br>
		</p>

        </div>
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
