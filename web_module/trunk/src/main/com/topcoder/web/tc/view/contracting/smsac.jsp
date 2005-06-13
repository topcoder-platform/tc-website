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
      <img src="/i/contracting/smsac_logo.gif" border=0/>
		</div>

<p>
<span class="bodySubtitle">.NET Software Developers</span>
<br><br>
You will work closely with the technology team to meet corporate objectives. This is an ideal position for someone who can work effectively in a small group and independently in a fast paced environment. You will be following a .NET framework utilizing C# and ASP.NET for all web based application development. The applications you will be developing / enhancing includes smsFlirt, smsClubs, smsChannels, MobilePartner and many more future applications. This is the ideal position for someone who is strong in traditional ASP, but also has working knowledge of .NET / with C#. Additional work will focus on wireless application development (including WAP and BREW technologies). Some of the focus will be on developing a WAP based website and additional work will be focused on creating applications for the handset. All developers will work closely with marketing and business development in improving these applications and adding better functionality. You will have a hand in not only the programming, but also in the look and feel of the applications. You will also have the opportunity to lead projects from start to finish. 
<br><br>
The work environment adheres to the engineers that want to have a say in all aspects of the product life cycle. If you are looking for a 9-5 where you can sit quietly and code exactly what you are told to, this is not the place for you. We are looking for intelligent, creative programmers that embrace challenges and obstacles with confident determination and resolve. 
<br><br>
Our 30 millions + users span over 200 countries. Your work and ideas affects each of them as fast as you can create it. SMS.ac is changing the world everyday and already our engineers are pioneering the technology that is molding the direction of the wireless data space. Leave your own mark on the world.
<br><br>
<strong>Requirements:</strong>
<ul>
<li>BS/MS in Computer Science or Electrical Engineering</li>
<li>1+ year experience with .NET framework (ASP.NET or C#)</li>
<li>Experience with WAP, J2ME, BREW and wireless application development a plus</li>
<li>SQL experience a plus</li>
<li>Team player with excellent communications skills</li>
</ul>

      <a href="/tc?module=JobHit&jid=296&jt=4">Register for this position here!</a>
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
