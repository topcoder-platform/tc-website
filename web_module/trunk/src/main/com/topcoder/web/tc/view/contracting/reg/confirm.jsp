<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contract</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center">
        <div class="myTCBody">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

<!-- Breadcrumb-->
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td class=oppDesc width="100%" valign=top>
				<span class=bodySubtitle>Confirm selections</span>
				<br/><br/>
				Please confirm that the information below is correct, then click SUBMIT.
				<br/><br/>
				<span class=bigRed>NOTE: You are not registered yet.  You MUST click SUBMIT at the bottom of this page to complete the registration.</span>
				</td>
				<td valign=top>
				<jsp:include page="breadcrumb.jsp" >
				<jsp:param name="phase" value="confirm"/>
				</jsp:include>
				</td>
			</tr>
		</table>

		<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
            <tr>
				<td align="right" width="50%"><b>Preferences</b></td>
				<td width="50%"><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align="right"><b>Contract Work</b></td>
				<td>&#160;</td>
            </tr>
            <tr>
				<td align="right">Minimum hourly rate:</td>
				<td>$20/hr</td>
            </tr>
            <tr>
				<td align="right">Maximum length of engagement:</td>
				<td>Indefinite</td>
            </tr>
            <tr>
				<td align="right">Minimum length of engagement</td>
				<td>3 months</td>
            </tr>
            <tr>
				<td align="right">Willing to travel:</td>
				<td>No</td>
            </tr>
            <tr>
				<td align="right"><b>Permanent Work</b></td>
				<td>&#160;</td>
            </tr>
            <tr>
				<td align="right">Minimum hourly rate:</td>
				<td>$20/hr</td>
            </tr>
            <tr>
				<td align="right">Maximum length of engagement:</td>
				<td>Indefinite</td>
            </tr>
            <tr>
				<td align="right">Minimum length of engagement</td>
				<td>6 months</td>
            </tr>
            <tr>
				<td align="right">Willing to travel:</td>
				<td>Yes</td>
            </tr>
			
			<tr><td colspan=2>&#160;</td></tr>

            <tr>
				<td align="right" width="50%"><b>Language Skills</b></td>
				<td width="50%"><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align="right">Javascript:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">VB Script:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">SQL:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">HTML:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">COBOL:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">FORTRAN:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Smalltalk:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Eiffel:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Lisp:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">C:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">C++:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Java:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Visual Basic:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Pascal:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">PERL:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">XML:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">XSL:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Python:</td>
				<td>7</td>
            </tr>
			
			<tr><td colspan=2>&#160;</td></tr>

            <tr>
				<td align="right" width="50%"><b>Technology Skills</b></td>
				<td width="50%"><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align="right">OO Concepts:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">ActiveX:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">CGI:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">ASP:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">JSP:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">Servlets:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">CORBA:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">RMI:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">EJB:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">COM/DCOM:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">TCP/IP:</td>
				<td>7</td>
            </tr>
            <tr>
				<td align="right">X Window/Motif:</td>
				<td>7</td>
            </tr>
			<tr><td colspan=12 align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=success"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>
        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
