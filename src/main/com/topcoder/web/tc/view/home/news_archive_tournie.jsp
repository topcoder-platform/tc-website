<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="../includes/global_left.jsp">
				<jsp:param name="level1" value=""/>
				<jsp:param name="level2" value=""/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Tournaments"/>
        </jsp:include>

<table border=0 cellpadding=2 cellspacing=0 width="100%">
<tr class="bodyText"><td nowrap="nowrap">03.11.05 3:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_wildcard_analysis">misof wins the WildCard Round</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.11.05 12:45 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_leader_website">radeye wins Day 1 of the Spectator Showdown</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 9:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room3_analysis">mathijs wins Room 3</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 6:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room2_analysis">ploh wins Room 2</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.10.05 3:30 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room1_analysis">tomek takes Room 1</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.09.05 5:45 PM - </td><td width="100%"><A href="/i/tournament/tccc05/TCCC05_Program.pdf">TCCC05 Program</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.28.05 1:05 PM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=ss_description">Announcing the TCCC05 Spectator Showdown</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.22.05 9:45 AM - </td><td width="100%">The TCCC05 <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_bracket">Design</A> and <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_bracket">Development</A> finalists have been announced.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.21.05 9:30 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=skiena">Professor Steven Skiena to speak at TCCC05</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.03.05 11:00 AM - </td><td width="100%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_bracket">TCCC05 Algorithm SemiFinalists</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.27.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 3 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.20.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 2 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.17.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview">TCCC05 Algorithm Round 1 results</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.13.05 11:00 AM - </td><td width="100%"><A href="/tc?module=SimpleStats&c=tccc05_alg_qual&trans=true&d1=tournaments&d2=tccc05&d3=alg_qualification">TCCC05 Algorithm Qualification Round results</A></td></tr>
</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
