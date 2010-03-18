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
<p><span class="bodyTitle">TopCoder Announces the Ultimate Software Development Contest</span><br />
<span class="bodySubTitle"><em>$50,000 in Cash Prizes at Stake for Software Design and Development Competitions</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., May 12, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the Ultimate Software Development Contest (USDC) scheduled to begin June 1, 2004 and run through September 2, 2004. The online competition will give eligible TopCoder members chances to win cash prizes totaling $50,000 during a series of weekly, monthly and quarterly contests, as well as match skills with other members around the globe using TopCoder's unique Competitive Development Methodology. Official rules and more details about the USDC are available at  http://www.topcoder.com.
</p>
<p>
"At TopCoder we know that competition drives quality," said Dave Tanacea, President of TopCoder Software. "By expanding our industry standard algorithm competition into the component design and development disciplines with the USDC, our members can increase core competencies while improving their skills sets - all within an exciting and profitable arena."
</p>
<p>
The online competition will challenge contestants to submit component designs that adhere to strict project specifications and development solutions for those designs. Submissions will be independently reviewed and scored by TopCoder's Architecture and Design Review Boards to determine final ranking placement for each component. 
</p>
<p>
The total prize purse of $50,000 will be awarded during the two tracks of competition:  design and development.  Prizes in the design competition will be $1,200 awarded each week, $3,500 each month and $9,000 each quarter. The prizes in the development contest will be $400 awarded each week, $1,750 each month and $4,500 each quarter. 
</p>
<p><span class="bodySubTitle">About TopCoder and TopCoder Software</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. This methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries.
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
