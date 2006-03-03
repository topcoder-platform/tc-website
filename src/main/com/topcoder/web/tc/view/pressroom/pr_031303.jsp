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


<div align="center"><strong>Sun Microsystems and TopCoder Highlight Field for 2003 Collegiate Challenge Programming Tournament</strong><br />
Students Across the Globe Vie for Share of $100,000 in Java[tm] and C++ Programming Tournament</div>

<p><strong>SANTA CLARA, Calif.  and GLASTONBURY, CT.&#151;March, 13, 2003&#151;</strong>Sun Microsystems, Inc. and
TopCoder, Inc., a company committed to identifying and promoting computer programming talent through competition, today
announced the top fifty Java[tm] and C++ programmers remaining in its 2003 Collegiate Challenge. The tournament will award
a total prize purse of $100,000.  This is the second consecutive year that Sun and TopCoder have hosted this world-renowned
collegiate programming tournament and the fifth major tournament hosted by TopCoder.</p>

<p>"Sun is thrilled to be the exclusive sponsor of the 2003 Collegiate Challenge," said Stans Kleijnen, vice president, Market
Development Engineering, Sun Microsystems, Inc.  "This type of collegiate competition enables students to sharpen their
Java programming skills and enhance their opportunities for employment when they graduate."</p>

<p>The 2003 Sun Microsystems and TopCoder Collegiate Challenge brings together the world's highest-rated college-level Java
and C++ computer programmers and members of the TopCoder community.  The programmers are ranked based upon their
performance during weekly online competitions and the top ranked members are then invited to participate in four online
elimination rounds of regional competition.  The winner of each region will be named Regional Champion on March 24, awarded
$600 and automatically advanced to the final field of sixteen competitors.  The remaining sixteen will compete in the
tournament's semifinal and championship rounds, which will be held April 4 and 5, 2003 at the University Park Hotel @ MIT
in Cambridge, Massachusetts.  There, the tournament champion will win $50,000. </p>

<p>The fifty programmers that participated in the Regional Championships represent thirty-four schools from eight countries
around the world.  CalTech had the strongest representation with six programmers, followed by the Massachusetts Institute of
Technology, Duke University, Stanford University and Georgia Tech, each with three programmers. </p>

<p>Eight semifinalists from previous tournaments are still competing in this year's Collegiate Challenge.  Among them is Daniel
Wright of Stanford University.  This returning Collegiate Challenge champion chose to use Java technology to secure his
$100,000 purse in 2002.  Also competing in this year's challenge is former finalist David Arthur from Duke University. </p>

<p>"Each year a new class of graduates enters the IT workforce," said TopCoder Chairman and founder, Jack Hughes.  "TopCoder
competitions enable technology companies and recruiters to identify and objectively assess candidates through testing and rating
coding skills under real-world conditions.  TopCoder offers services to assist companies looking to hire top programming talent."</p>


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
