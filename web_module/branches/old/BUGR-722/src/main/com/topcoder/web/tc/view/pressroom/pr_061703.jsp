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
<p><span class="bodyTitle">TopCoder Adds Sweden To Its Developer Community</span><br />
<span class="bodySubTitle"><em>Host of Computer Programming Contests Continues Global Expansion</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., June 17, 2003&#151;</strong>TopCoder, Inc., the leader in on-line programming 
competition and skills assessment, today announced it has expanded eligibility for cash prizes in its online and onsite 
computer programming contests to include citizens of Sweden.  The addition of Sweden to the TopCoder developer community 
demonstrates the company's continuing global expansion efforts.  Sweden is the eighth international territory to be added 
since the company launched its competitions in February 2001.  Citizens of Australia, Canada (excluding Quebec), China, 
India, Ireland, New Zealand, the United Kingdom and the United States are also eligible to receive cash prizes.  Citizens 
from all countries are allowed to compete, however those not listed above have their prize money donated to a charity of 
their choice.</p>

<p>"We are pleased to welcome the citizens of Sweden to TopCoder's developer community, and are excited about the 
continued international expansion of our competitions," said Jack Hughes, Chairman and founder of TopCoder.  "Our 
Swedish member base continues to grow and in fact, produced a finalist in our 2003 TopCoder Collegiate Challenge."</p>

<p><span class="bodySubTitle">International Demand for Competition Continues</span><br />
TopCoder has always seen positive results from expanding the eligibility criteria to include residents of new countries.  
The worldwide appeal of TopCoder has resulted in membership growth of more than 1,300 members per month.</p>

<p>"TopCoder is a venue for interaction, learning and competition amongst the worldwide developer community," said 
Tom Longo, Vice President of Membership for TopCoder.  "The continued growth in our membership clearly demonstrates 
the international draw of TopCoder."</p>

<p>TopCoder will continue to extend its programming competitions globally as international demand for competition 
continues, in effect, bringing the entire worldwide developer community together.  According to Hughes, the company's 
next expansion effort is Germany.</p>

<p><br /></p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

<p># # #</p>



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
