<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<div align="center">
<p><span class="bodyTitle">TopCoder Adds VB.NET Competitions</span><br />
<span class="bodySubTitle"><em>Competition Platform Also Enhanced to Support Web Services</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., July 21, 2003&#151;</strong>TopCoder, Inc., the leader in online programming competition and skills assessment, today announced that it now 
offers the ability to compete using Microsoft&#174; Visual Basic&#174;.NET (VB.NET) in its programming tournaments.  In 
addition to VB.NET, competitors can use the Java, C++ and C# programming languages. 
</p>
<p>Since March 2001, TopCoder has  conducted over 150 programming competitions at its web site, <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a>.  
These competitions have attracted more than 28,000 members from more than 150 countries.  TopCoder members 
compete online throughout the year.  Twice per year, members are invited to compete in TopCoder's major tournaments 
with substantial cash prizes.  With the addition of VB.NET, TopCoder competitions are now available to a greater number 
of professional and student programmers worldwide.
</p>
<p>"TopCoder is a company created by programmers for programmers, and the addition of VB.NET is yet another 
validation," said Jack Hughes, founder and chairman of TopCoder. "Our members have assisted in the design and 
development of this addition to the competition engine."
</p>
<p>In a continuing effort to support the needs of its clients, TopCoder has recently incorporated another major feature into 
its competition engine.  Clients may now utilize TopCoder to conduct customized, private label competitions on a Web 
Services platform.  This enhancement was recently featured during the JavaOneSM Coding Challenge conducted at the 
2003 JavaOneSM Conference in San Francisco, CA held June 10-13th.
</p>
<p><span class="bodySubTitle">$100,000 prize purse for next tournament</span><br />
TopCoder leverages online and onsite programming competitions to create an international database of objectively 
rated professional and student programmers.  This database provides prospecting companies with a means to efficiently 
and cost-effectively target and communicate with top technologists.  Members are rated weekly in TopCoder's Single Round 
Matches.  In addition, these matches serve to prepare programmers for the major tournaments.  TopCoder's next major 
tournament will be the 2003 TopCoder Open, which begins online on October 7th.  The total purse for the tournament will 
be $100,000, with the winner receiving $50,000.
</p>
<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit www.topcoder.com.
</p>
<p>###</p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
