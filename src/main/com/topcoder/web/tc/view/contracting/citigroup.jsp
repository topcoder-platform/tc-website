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
                <jsp:param name="level1" value="employment"/>
                <jsp:param name="level2" value="openings"/>
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
      <img src="/i/contracting/citigroup_logo.gif" border=0/>
		</div>

<p>
<span class="bodySubtitle">Join Our Team</span>
<br><br>
Working at Citigroup gives employees the chance to create an exciting and wide-ranging career in one of the world's leading organizations. Our belief in employee ownership offers a unique experience in entrepreneurialism on a global scale, and an unparalleled geographic footprint enables our employees to work with and learn from a diverse group of colleagues whose insight, integrity, and commitment set the standard for success in our industry.
<br><br>
<strong>What We Value:</strong>
<br><br>
<strong>Integrity</strong>: We do the right thing. 
<br><br>
<strong>Excellence</strong>: We deliver superior products and services to our clients and take pride in the quality of our work. 
<br><br>
<strong>Respect</strong>: We treat people with respect. 
<br><br>
<strong>Teamwork</strong>: We work together to get the job done. 
<br><br>
<strong>Ownership</strong>: We act like owners and take responsibility for our actions. 
<br><br>
<strong>Leadership</strong>: We believe in leadership by example, in the office and in the community.
<br><br>
As a company that does business in more than 100 countries, with 98 percent of our employees native to the locations where they work, Citigroup is one of the most diverse organizations in the world. This diversity has been a source of strength for Citigroup's employees, for our clients, and for the communities where we live and work.
<br><br>
<strong>Types of Job Skills Desired:</strong>
<ul>
<li>People that can solve complex problems and implement this vision in a small team environment.
<li>Dedicated, self-motivated individuals, who are passionate about technology.
<li>Employees who can to implement cutting edge grid computing, artificial intelligence, and advanced numerical optimization techniques.
<li>Someone who can tackle numerous intellectual and technical challenges.
<li>People with superior knowledge, passion, and accomplishment in his/her area of expertise.
</ul>

      <a href="">Register for this position here!</a>
      <%--<a href="/tc?module=JobHit&jid=297&jt=4">Register for this position here!</a>--%>
		<br/><br/>
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
