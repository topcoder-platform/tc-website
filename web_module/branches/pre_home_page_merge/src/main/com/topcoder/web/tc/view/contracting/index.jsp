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
                <jsp:param name="level2" value="employmentOpps"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
		<br/>
		<div align=center>
		<A href="/tc?module=ContractingPreferences"><img src="/i/empOppsBanner.jpg" border=0/></A>
		</div>

		<p>
		Welcome to TopCoder Employment Opportunities, your source for full time and contract programming work. In today's world, all major artists and professional athletes are represented by agents who find them the best opportunities.  Finally, the time has come for top programmers of the world reap the same benefits.  
		<br/><br/>
		We are aggressively seeking out companies that have a strong need for the level of talent that only TopCoder members can provide.  TopCoder does all of the leg work for you - we find the companies, look for the right positions and when we find a match, we present you with the opportunity. Only after you confirm your interest in a particular position will TopCoder pass on your information to the appropriate hiring manager.  Before you even talk to the company's representative, TopCoder will make sure your salary requirements, job requirements, and relocation requests are met.  Best of all, TopCoder provides this service for full time and contract work, at no cost to you.
		<br/><br/>
		Registering <a href="/tc?module=ContractingPreferences">here</a> is the first step. Give us your salary and travel requirements and rate your experience with a variety of programming languages, database platforms and relevant Industry experience.  Then, let TopCoder work for you!
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
