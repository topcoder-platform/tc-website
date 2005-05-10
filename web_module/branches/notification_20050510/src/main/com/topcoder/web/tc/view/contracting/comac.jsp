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
      <img src="/i/contracting/comac_logo.gif" border=0/>
		</div>

		<p>
      <span class="bodySubtitle">Senior Software Developer</span>
      <br><br>
      <strong>Company Description</strong><br>
Comac, a division of Iron Mountain, (http://www.comac.com/) is experiencing rapid growth based upon the Information Technology group's contributions. We are the technology leader in our business segment.
<br><br>
We are seeking a top-quartile software developer looking for a challenging career in the latest development methodologies using Microsoft and other interesting technologies.
<br><br>
<b>Requirements:</b><br>
You will need to bring strength to the group in one or more of the following application development areas:
<ul>
<li>Web/browsers</li>
<li>N-tier rich client</li>
<li>Web services</li>
<li>Relational databases</li>
<li>Digital print production</li>
</ul>
<b>Our Expectations:</b><br>
By the end of your first month you will be enhancing current .NET applications, will be knowledgeable about our current databases and development methodologies and will have learned about our underlying business model.
<br><br>
By the end of your third month you will be replacing older technology applications with .NET and you will be building out our service oriented architecture framework.
<br><br>
By the end of your sixth month you will be contributing significantly to the development of our application framework.  You will be refactoring current applications and evolving applications to meet new customer requirements.
<br><br>
By the end of your first year you will be responsible for a business segment. You will contribute to our pattern languages and code generation schemes.  You will have become the local expert in a set of chosen technologies.
<br><br>
Join us for a fun packed, exciting ride, and be prepared to demonstrate your proficiencies.
      <br><br>
      <a href="/tc?module=JobHit&jid=284&jt=4">Register for this position here!</a>
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
