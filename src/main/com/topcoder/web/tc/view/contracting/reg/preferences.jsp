<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contract</title>

<jsp:include page="../../../script.jsp" />

<SCRIPT TYPE="text/javascript">
<!--
function dropdown(mySel)
{
var myWin, myVal;
myVal = mySel.options[mySel.selectedIndex].value;
if(myVal)
   {
   if(mySel.form.target)myWin = parent[mySel.form.target];
   else myWin = window;
   if (! myWin) return true;
   myWin.location = myVal;
   }
return false;
}
//-->
</SCRIPT>

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
         <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value="Registration"/>
        </jsp:include>

		<p class=bodyText>This is a description paragraph with some instructions and some details about the questions asked.</p>

		<FORM ACTION="" METHOD=POST onSubmit="">
        <table border=0 cellpadding=2 cellspacing=0 width="100%" class=bodyText>
			<tr>
				<td width="100%">Minimum hourly rate:</td>
				<td>
					<SELECT NAME="minHrRate">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">$5.00/hr
					<OPTION VALUE="">$10.00/hr
					<OPTION VALUE="">$20.00/hr
					<OPTION VALUE="">$50.00/hr
					<OPTION VALUE="">$100.00/hr
					</SELECT>
				</td>
			</tr>
			<tr>
				<td>Maximum length of engagement:</td>
				<td>
					<SELECT NAME="maxEngage">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">3 months
					<OPTION VALUE="">6 months
					<OPTION VALUE="">9 months
					<OPTION VALUE="">Indefinite
					</SELECT>
				</td>
			</tr>
			<tr>
				<td>Minimum length of engagement</td>
				<td>
					<SELECT NAME="maxEngage">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">No minimum
					<OPTION VALUE="">3 months
					<OPTION VALUE="">6 months
					<OPTION VALUE="">9 months
					</SELECT>
				</td>
			</tr>
			<tr>
				<td>Willing to travel:</td>
				<td>
					<SELECT NAME="travel">
					<OPTION VALUE="">&#160;-
					<OPTION VALUE="">Yes
					<OPTION VALUE="">No
					</SELECT>
				</td>
			</tr>
			<tr><td colspan=11 align=center><br/><br/><a href="/tc?module=Static&d1=contracting&d2=reg&d3=languages"><img src="/i/submit.jpg" border=0/></a></td></tr>
		</table>
		</FORM>

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
