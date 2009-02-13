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
<p><span class="bodyTitle">TopCoder Announces 2003 TopCoder Open</span><br />
<span class="bodySubTitle"><em>$100,000 Tournament Will Crown World Programming Champion</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., June 16, 2003&#151;</strong>TopCoder, Inc., the leader in on-line programming 
competition and skills assessment, today announced its next major tournament, the 2003 TopCoder Open.  This coding event 
will be open to programmers around the world and will award a total of $100,000 in cash prizes.  The tournament will begin 
with online elimination rounds in October, and culminate on December 5 with the final rounds taking place live at Mohegan 
Sun Casino in Uncasville, Connecticut, where the winner of the TopCoder Open will be awarded $50,000 and named the 2003 
World Champion.</p>

<p>In the two qualifying rounds held in October, eligible TopCoder members will compete for 500 coveted spots in the 
tournament.  These 500 will be narrowed to the final 16 through four successive online rounds.  The remaining 16 will 
travel to the Mohegan Sun Casino to compete live on December 4 and 5, in the semi-final and final rounds, for the grand 
prize and champion title.</p>

<p>"The skill level in the TopCoder tournaments increases dramatically each year and from the caliber of competition 
we've seen in recent weekly matches, the 2003 TopCoder Open will be no exception," said Jack Hughes, founder of 
TopCoder, Inc.  "Once again, we are thrilled to bring together the world's best and brightest programmers for a tournament 
that promises to deliver plenty of excitement and opportunity."</p>

<p>TopCoder's software developer member base exceeds 27,000 and encompasses more than 150 countries.  Membership 
grows steadily at an average of more than 1,300 new members per month.  Participation in TopCoder tournaments that 
includes both college and professional programmers has increased more than 300% between 2001 and 2002.  The 2003 
TopCoder Open is the sixth major tournament hosted by TopCoder since inception in 2001.</p>

<p><strong>Companies interested in sponsoring this worldwide event should contact Drew Vaughn at 866.867.2633, 
<A href="mailto:dvaughn@topcoder.com">dvaughn@topcoder.com</A> or visit www.topcoder.com.</strong></p>

<p><br /></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

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
