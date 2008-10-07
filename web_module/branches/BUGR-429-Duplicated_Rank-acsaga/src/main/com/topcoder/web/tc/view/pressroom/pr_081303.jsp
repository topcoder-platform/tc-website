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
<p><span class="bodyTitle">TopCoder Hosts Charity Tournament for Christopher Reeve Paralysis Foundation 
</span><br />
<span class="bodySubTitle"><em>International Programming Competition Set to Raise Money for Research</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 13, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced the TopCoder Charity Challenge, 
benefiting the Christopher Reeve Paralysis Foundation (CRPF).  The Charity Challenge represents an exciting fundraising endeavor 
designed to support CRPF's ongoing research to find a cure for, and improve the lives of people with, spinal cord injuries and other 
central nervous system disorders.  In addition, TopCoder will match, dollar for dollar, all funds that are raised by competitors in this 
tournament, up to $50,000.</p>

<p>Programmers worldwide who raise a minimum of $25 in donations will be eligible to compete in this tournament.  Funds can be 
donated to sponsor a competing TopCoder member at <a href ="http://www.christopherreeve.org/topcoder">www.christopherreeve.org/topcoder</a>.  
The TopCoder Charity Challenge will consist of three online rounds, held November 11, 13 and 17.  The first round will be open to all 
eligible competitors.  The top 100 programmers from the open round will advance to the second round.  The top 50 programmers in the 
second round will advance to the final round on November 17.</p>

<p>"This charity tournament represents a unique collaboration," explained Mitchell Stoller,  President and CEO of CRPF.  "By bringing 
together the world's top programmers to compete in an online tournament fundraiser, significant money will be raised so the world's top 
scientists can continue their research to find a cure for paralysis."</p>

<p>The TopCoder Charity Challenge will award a grand prize to ten competitors: a trip to A Magical Evening, the annual star-studded gala 
ball in New York City on November 24 to benefit CRPF.  The ten recipients will consist of the four top scorers in the final round of the 
programming tournament, the four top fundraisers and two "wildcards".  The wildcards will be chosen at random from all members who 
raise at least $100.  In addition, TopCoder will send commemorative t-shirts to all members who raise at least $50.</p>

<p>"TopCoder is excited to host the CRPF event," said Jack Hughes, TopCoder's Founder and Chairman.  "Paralysis is a devastating 
condition for patients and their families.  CRPF is an outstanding organization spearheading research as well as providing guidance 
to resources and direct quality of life grants to those living with paralysis.  TopCoder is proud to be associated with such a determined 
and hard working organization."  Mr. Hughes is a member of CRPF's Board of Directors.</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members 
extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community 
of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration 
details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit 
<a href="/">www.topcoder.com</a>.</p>

<p><span class="bodySubTitle">About CRPF</span><br />
The Christopher Reeve Paralysis Foundation is committed to funding research that develops treatments and cures for paralysis caused 
by spinal cord injury and other central nervous system disorders. The Foundation also vigorously works to improve the quality of life for 
people living with disabilities through its grants program, paralysis resource center and advocacy efforts.  For more information, please 
call (800) 225-0292 or visit the CRPF website at <a href="http://www.christopherreeve.org">www.christopherreeve.org</a>.</p>

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
