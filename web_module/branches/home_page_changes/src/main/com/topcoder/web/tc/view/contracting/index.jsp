<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Contract</title>

<jsp:include page="../script.jsp" />

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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="my_home"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="contract"/>
            <jsp:param name="title" value=""/>
        </jsp:include>

		<table align=right border=0 cellpadding=5 cellspacing=0 width="100%">
			<tr>
				<td align=center><img src="/i/clear.gif" border=1 width=500 height=100/></td>
			</tr>
		</table>
		<p>
		TopCoder attracts the best software developers to our international programming tournaments. Programmers, team leaders, and software architects join TopCoder to demonstrate their prowess in software development. Only through competition can the most talented developers be found. TopCoder provides placement services for those companies looking to hire fulltime employees. TopCoder works with companies to define a position description including geographic location, skill sets desired, special requirements, salary, etc. TopCoder will then contact members directly about the position and determine the most appropriate candidates based on the position description and feedback from the hiring company. To learn more about our placement services, contact us at <A href="mailto:tces@topcoder.com">tces@topcoder.com</A>.
		<br/><br/>
		TopCoder also provides contract programming services utilizing our member base to handle client needs. Through our competition platform, we measure the relevant skills of developers including problem solving skills, programming ability, and quality assurance. TopCoder works with companies to define the requirements for the contract position and then search our member base for the most appropriate candidates. To learn more about our placement services, contact us at <A href="mailto:tces@topcoder.com">tces@topcoder.com</A>.
		<br/><br/>
		Registering <a href="/tc?module=ContractingPreferences">here</a> is the first step.  You can give us your availability and rate your experience with a variety of programming languages or database platforms.
		<br/><br/>
		<center><a href="/tc?module=ContractingPreferences">Sign up today</a></center>
		</p>
        </div>
        <p><br/></p>
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
