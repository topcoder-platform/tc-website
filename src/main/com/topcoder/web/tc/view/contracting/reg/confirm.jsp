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

		
        <table border=0 cellpadding=0 cellspacing=0 width="100%" class=bodyText>
		<tr>
		<td valign=top width="50%">
		<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
            <tr>
				<td align=right width="65%"><b>Preferences</b></td>
				<td width="35%"><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align=right><b>Contract Work</b></td>
				<td valign=top>&#160;</td>
            </tr>
            <tr>
				<td align=right>Minimum hourly rate:</td>
				<td valign=top>$20/hr</td>
            </tr>
            <tr>
				<td align=right>Maximum length of engagement:</td>
				<td valign=top>Indefinite</td>
            </tr>
            <tr>
				<td align=right>Minimum length of engagement</td>
				<td valign=top>3 months</td>
            </tr>
            <tr>
				<td align=right>Willing to travel:</td>
				<td valign=top>No</td>
            </tr>
            <tr>
				<td align=right><b>Permanent Work</b></td>
				<td valign=top>&#160;</td>
            </tr>
            <tr>
				<td align=right>Minimum hourly rate:</td>
				<td valign=top>$20/hr</td>
            </tr>
            <tr>
				<td align=right>Maximum length of engagement:</td>
				<td valign=top>Indefinite</td>
            </tr>
            <tr>
				<td align=right>Minimum length of engagement</td>
				<td valign=top>6 months</td>
            </tr>
            <tr>
				<td align=right>Willing to travel:</td>
				<td valign=top>Yes</td>
            </tr>
			
			<tr><td>&#160;</td></tr>			

            <tr>
				<td align=right><b>Technology Skills</b></td>
				<td><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align=right>OO Concepts:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>ActiveX:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>CGI:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>ASP:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>JSP:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Servlets:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>CORBA:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>RMI:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>EJB:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>COM/DCOM:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>TCP/IP:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>X Window/Motif:</td>
				<td valign=top>7</td>
            </tr>

			<tr><td>&#160;</td></tr>			

            <tr>
				<td align=right><b>Databases</b></td>
				<td valign=top><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align=right>Oracle</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Sybase</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Informix</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>MS SQL Server</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>DB2</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Access</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Paradox</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>dbase</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Interbase</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>PostgreSQL</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>MySQL</td>
				<td valign=top>7</td>
            </tr>
		</table>
		</td>
		<td valign=top width="50%">
		<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center" >
            <tr>
				<td align=right width="65%"><b>Language Skills</b></td>
				<td valign=top width="35%"><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align=right>Javascript:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>VB Script:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>SQL:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>HTML:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>COBOL:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>FORTRAN:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Smalltalk:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Eiffel:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Lisp:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>C:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>C++:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Java:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Visual Basic:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Pascal:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>PERL:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>XML:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>XSL:</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Python:</td>
				<td valign=top>7</td>
            </tr>

			<tr><td>&#160;</td></tr>			

            <tr>
				<td align=right><b>Operating Systems</b></td>
				<td valign=top><a href="">edit<a/></td>
            </tr>
            <tr>
				<td align=right>OS/2</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Windows 2000</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>DOS</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Windows NT</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>Linux</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>UNIX</td>
				<td valign=top>7</td>
            </tr>
            <tr>
				<td align=right>MAC OS</td>
				<td valign=top>7</td>
            </tr>
		</table>
		</tr>
		<tr><td colspan=2 align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=success"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>


        </div>
		<p align=center class=bodyText><b>Please check to make sure that your information is up-to-date.</b></p>
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
