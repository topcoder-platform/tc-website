<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>TopCoder Software Development Opportunities</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value=""/>
                <jsp:param name="level3" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%" align="center"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<table width="600" border="0" cellpadding="0" cellspacing="1" bgcolor="#666666">
	<tr>
		<td bgcolor="#FFFFFF">
			<table width="600" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="3"><a href="/Registration"><img src="/i/development/ad_header.gif" width="600" height="69" border="0"></a></td>

				</tr>
				<tr>
					<td><img src="/i/clear.gif" width="10" height="1" vspace="5" border="0"></td>
					<td class="smallText">If you're a TopCoder member, you can submit <a href="/?t=development&c=comp_projects">design and development solutions</a> for these projects. You will 
					be paid cash for each winning solution you submit. Every solution becomes part of a TopCoder Software Catalog, 
					now available for sale online. For every commercial sale of a catalog, TopCoder will pay the members who designed 
					and developed the components in that catalog a percentage of the sale.<br/>
					Click <a href="/?t=development&c=getting_started">here</a> for help getting started.</td>
					<td><img src="/i/clear.gif" width="10" height="1" vspace="5" border="0"></td>
				</tr>
				<tr>
					<td><img src="/i/clear.gif" width="10" height="1" vspace="5" border="0"></td>
					<td class="smallText">Highly rated and experienced TopCoder members fill the ranks of the <a href="/tc?module=ViewReviewProjects">Architecture and Development Review 
					Board</a>. The Architecture Review Board members screen and review all design submissions to ensure the components 
					meet the functional requirements, are documented properly and contain the appropriate sequence, use case and class 
					diagrams. The Development Review Board members verify that each development submission meets the required functionality, 
					coding style, adheres to the component design  and contains a suitable test suite. </td>
					<td><img src="/i/clear.gif" width="10" height="1" vspace="5" border="0"></td>
				</tr>
			</table>
			
		</td>
	</tr>
</table>
<p></p>
<div align="center"><a href="/Registration"><img src="/i/development/ad_register.gif" width="146" height="35" border="0"></a></div>
<p></p>

</td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
