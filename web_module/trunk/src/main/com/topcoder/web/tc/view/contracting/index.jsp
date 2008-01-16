<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employment Opportunities</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

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
 <jsp:param name="node" value="employment_opps"/>
</jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="cardCell" width="100%" align="center">

        <div class="myTCBody">
      <br/>
      <div align=center>
      <a href="/tc?module=ContractingPreferences"><img src="/i/contracting/contracting_logo.gif" border=0/></a>
      </div>

         <span valign=top>
         <table border="0" cellpadding="10" cellspacing="0" align="right">
            <tr>
               <td align="center" class="bodyText">
               <a href="/tc?module=ContractingPreferences"><img src="/i/contracting/register.gif" alt="Register here" border=0/></a>
               <%--
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol"><img src="/i/contracting/aol_logo.gif" alt="AOL" border=0/></a>
               --%>
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa"><img src="/i/contracting/nsa_logo.gif" alt="NSA" border=0/></a>
               <hr noshade="noshade" size="1" />
               <%--
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs"><img src="/i/contracting/ubs_logo.gif" alt="UBS" border=0/></a>
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw"><img src="/i/contracting/drwLogo.png" alt="DRW" border=0/></a>
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=yodlee"><img src="/i/contracting/yodleeLogo.png" alt="Yodlee" border=0/></a>
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=db"><img src="/i/contracting/dbLogo.png" alt="Deutsche Bank" border=0/></a>
               <hr noshade="noshade" size="1" />
               --%>
               <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=bt"><img src="/i/contracting/btLogo.png" alt="British Telecom" border=0/></a>
               <hr noshade="noshade" size="1" />
               <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly"><img src="/i/contracting/lillyLogo.png" alt="Eli Lilly" border=0/></a>
               <hr noshade="noshade" size="1" />
               <em>Click one of the<br />companies above for more info<br />on their job openings,<br />and be sure to check out <br />the careers available at<br /></em>
               <a href="/tc?module=Static&amp;d1=about&amp;d2=jobs"><img src="/i/contracting/topcoder_logo.gif" alt="TopCoder" border=0/></a>
               <hr noshade="noshade" size="1" />
               </td>
            </tr>
         </table>
         </span>


      <p>
      Welcome to TopCoder Employment Opportunities, your source for full time and contract programming work. In today's world, all major artists and professional athletes are represented by agents who find them the best opportunities.  Finally, the time has come for top programmers of the world to reap the same benefits.
      <br/><br/>
      We are aggressively seeking out companies that have a strong need for the level of talent that only TopCoder members can provide.  TopCoder does all of the leg work for you - we find the companies, look for the right positions and when we find a match, we present you with the opportunity. Only after you confirm your interest in a particular position will TopCoder pass on your information to the appropriate hiring manager.  Before you even talk to the company's representative, TopCoder will make sure your salary requirements, job requirements, and relocation requests are met.  Best of all, TopCoder provides this service for full time and contract work at no cost to you.
      <br/><br/>
      TopCoder currently has several clients looking to hire TopCoder members.  Register <a href="/tc?module=ContractingPreferences">here</a> to provide us with your salary and travel requirements and rate your experience with a variety of programming languages, database platforms and relevant Industry experience.  Then let TopCoder work for you!
      <br/><br/>
      </p>
      <p span class="bigRed">Please note that your placement information will only be accessible by TopCoder personnel.  TopCoder will NOT submit your information to any company without your prior approval.</p>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="employmentOpps"/>
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
