<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>AT&amp;T Foundation - About Us - Overview</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="http://www.att.com/cds/css/global.css">');
  document.write('<link type="text/css" rel="stylesheet" href="http://www.att.com/foundation/css/styles.css">');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="http://www.att.com/cds/css/global.css">');
  document.write('<link type="text/css" rel="stylesheet" href="http://www.att.com/foundation/css/styles.css">');
}
</SCRIPT>


</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="charity"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                  </tr>
               </table>


<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="att"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>


               <blockquote>
               <h2>AT&amp;T Foundation</h2>

		<!--Overview-->
		<table cellspacing="0" cellpadding="4" width="100%" border="0">
		<tr><td>
				<p><span class="section-title"><b>Public service and social responsibility are traditions deeply embedded at AT&amp;T, going back over 100 years to the beginnings of the company.</b></span></p>
				<table border="0" cellpadding="0" cellspacing="0" align="right" summary="Overview."><tr><td width="5">&nbsp;</td><td><img src="/i/events/crpf03/volunteerpix3a.gif" width="180" height="209" border="0" alt="AT&amp;T Volunteers."><br><img src="/i/events/crpf03/spacer.gif" border="0" width="10" height="8" alt="Space."><br clear="all"></td></tr></table><p>Our commitment to the communities we serve continues to inspire the financial and product contributions our businesses and divisions make every year. It spurs, too, the volunteer activities of our employees who give so generously of themselves to the communities where they work and live worldwide. Our commitment to community is also the mainspring of the AT&amp;T Foundation, the principal arm of AT&amp;T's philanthropy since 1984.</p>
				<ul>
				<li><a href="#prior"><b>Our Priorities</b></a></li>
				<li><a href="#yards"><b>Our Yardsticks</b></a></li>
				<li><a href="#value"><b>Our Shared Values</b></a></li>
				<li><a href="#action"><b>Our Action</b></a></li>
				</ul><br></td>
		</tr>
		<!--Our Priorities-->
		<tr bgcolor="#cccccc">
		<td class="head-gray"><a name="prior">Our Priorities</a></td>
		</tr>
		<tr><td>
				<p>The AT&amp;T Foundation invests globally in undertakings that address a range of public concerns. Our focus of support is in the following areas:</p>
				<p><img src="/i/events/crpf03/edon2.gif" width="126" height="120" align="left" alt="Student."><span class="section-title"><b>Education</b></span><br>
				We invest in projects that use technology to improve the quality of teaching and learning; we support programs that develop the skills needed for a competitive workforce, particularly in the information technology industry; and we promote efforts to advance diversity in education and the workplace, with special interest in increasing the participation of women and minorities in science, math, engineering and technology. <a href="http://www.att.com/foundation/programs/education.html" target="_blank"><img src="/i/events/crpf03/btn_more.gif" width="51" height="16" border="0" alt="More."></a>
				<p><img src="/i/events/crpf03/empon2.gif" width="123" height="115" align="right" alt="Father &amp; Daughter."><span class="section-title"><b>Civic &amp; Community Service</b></span><br>
				We support programs that address community needs, encourage volunteerism, and promote leadership with integrity.  We do this by providing grants to organizations that are dedicated to promoting diversity, providing leadership development, encouraging youth, protecting the environment, and supporting communities and families in need. <a href="http://www.att.com/foundation/programs/community.html" target="_blank"><img src="/i/events/crpf03/btn_more.gif" width="51" height="16" border="0" alt="More."></a></p>
				<p><img src="/i/events/crpf03/enron2.gif" width="126" height="120" align="left" alt="Musician."><span class="section-title"><b>Arts &amp; Culture</b></span><br>
				We support artistic work that fosters communication, builds diverse audiences, 
				and inspires innovation and learning in communities; we also target initiatives 
				that help women and artists of diverse cultures bring their work to wider audiences. <a href="/foundation/programs/arts.html" target="_blank"><img src="/i/events/crpf03/btn_more.gif" width="51" height="16" border="0" alt="More."></a></p>				
				<p><img src="/i/events/crpf03/engon2.gif" width="124" height="115" align="right" alt="AT&amp;T Volunteer."><span class="section-title"><b>Employee Involvement</b></span><br>
				The AT&amp;T Foundation helps extend the reach of AT&amp;T employees' community involvement efforts by matching employee contributions to educational and cultural organizations and by providing grants to recognize employee volunteer efforts in communities located in all areas of the country. <a href="http://www.att.com/foundation/employee/employee.html" target="_blank"><img src="/i/events/crpf03/btn_more.gif" width="51" height="16" border="0" alt="More."></a></p>			
			</td>
		</tr>
		<tr><td align="right">&nbsp;</td></tr>
		<!--/Our Priorities-->
		
		<!--Our Yardsticks-->
		<tr bgcolor="#cccccc">
		<td class="head-gray"><a name="yards">Our Yardsticks</a></td>
		</tr>
		<tr><td>
				<p>With the great number and range of potential projects to fund, the AT&amp;T Foundation focuses its grant decisions in various ways. Here are just three important yardsticks:</p>
				<ul>
				<li>Programs that serve the needs of people in communities where AT&amp;T has a significant business presence.</li>
				<li>Initiatives that use technology in inventive ways. We're confident that information and communications technology will hasten the solutions to some of our most intractable social problems. Like telecommunications itself, many of these solutions will cut across the boundaries of time and place to bring people closer together and fresh ideas to fruition.</li>
				<li>Groups that our employees are actively involved with as contributors and/or volunteers. These include organizations that focus on education, community services, the environment, and arts and culture.</li>
				</ul>
				<p>&nbsp;</p>
			</td>
		</tr>
		<!--/Our Yardsticks-->
				
		<!--Our Shared Values-->
		<tr bgcolor="#cccccc">
		<td class="head-gray"><a name="value">Our Shared Values</a></td>
		</tr>
		<tr><td>
				<p>A set of principles based on corporate values known as &quot;Our Common Bond&quot; help guide AT&amp;T's philanthropic work. These standards shape the AT&amp;T Foundation goals and inform our actions:</p>
				<ul>
				<li>Respect for all individual and cultural differences in our diverse society.</li>
				<li>Dedication to serving our customers optimally, and to building long-term relationships with our partners in the community.</li>
				<li>Devotion to the highest standards of integrity and to open communication that reports the objectives and results of our work.</li>
				<li>Commitment to innovation in meeting the needs of communities and applying the resources of AT&amp;T.</li>
				<li>Support for 
				teamwork between AT&amp;T people and their community partners.</li>
				</ul>	
				<p>&nbsp;</p>	
			</td>
		</tr>
		<!--/Our Shared Values-->
		
		<!--Our Action-->
		<tr bgcolor="#cccccc">
		<td class="head-gray"><a name="action">Our Action</a></td>
		</tr>
		<tr><td>
				<p>In 2001 and 2002, AT&amp;T's total contributions (including cash contributions and product donations) amounted to nearly $150 million.  The AT&amp;T Foundation contributed more than $85 million of this total. The rest came in the form of direct contributions and product donations from AT&amp;T business units and divisions. In addition, tens of thousands of AT&amp;T
employees and retirees contributed their volunteer efforts to charitable organizations in their local communities.</p>
				<p>To find out what organizations have received grants from the AT&amp;T Foundation, check out our <a href="http://www.att.com/foundation/grants.html" target="_blank">Grant Search</a> for listings of grants by program area, organization and location.</p>
               </td></tr></table>
               <p><br/></p>
               </blockquote>
         </td>               
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
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