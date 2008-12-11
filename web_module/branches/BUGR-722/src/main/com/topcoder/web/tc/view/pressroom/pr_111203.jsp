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
<p><span class="bodyTitle">TopCoder Announces Finalists in International Programming Tournament</span><br />
<span class="bodySubTitle"><em>20 of the World's Best Programmers Will Vie for $130,000 Prize Purse at the 2003 TopCoder Open, Sponsored by Intel&#174;</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., November 12, 2003&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 20 finalists who have advanced to the final rounds of the 2003 TopCoder Open, sponsored by Intel&#174; (www.topcoder.com/tco).  This third annual tournament, open to professional and collegiate programmers worldwide, will award cash prizes totaling $130,000.  The tournament's Semifinal and Championship Rounds will be held December 4th and 5th at the Mohegan Sun Casino in Uncasville, CT.</p>

<p>"As a world-wide technology leader, Intel is pleased to be involved with these champions of software development," said Monique Torres, Intel&#174; Developer Services Campaigns and Promotions Manager.  "TopCoder has provided the track on which these champions race."</p>

<p>The onsite events of the TopCoder Open will include the culmination of two programming tournaments.  Throughout the day on Dec. 4th, 16 competitors will compete in four Semifinal rounds of the "Coding Tournament."  The Coding Tournament is a timed competition where the participants solve complex algorithmic problems using Java, C++, C# or VB.Net.  The winner of each Semifinal round will advance to the Championship round on Dec. 5th.  The winner of the Coding Tournament will receive $50,000.</p>

<p>The "Component Tournament" finals, first tournament of its kind, will also be held on Dec. 5th.  The Component Tournament is a more traditional competition where four participants are provided general requirements and are asked to design and develop re-useable software components.  Competitors choose to compete in either the Design or the Development track, and a winner will be selected in each area.  Each of these winners will receive $10,000.</p>

<p>The "Sweet 16" field of the Coding Tournament, plus two replacements, is comprised of the following programmers:</p>

<table border="0" cellspacing="2" cellpadding="5" width="500" class="formFrame" align="center">
<tr><td  class="sidebarText" width="50%">*Reid Barton, Arlington, MA, US</td><td width="50%" class="sidebarText">Steve Newman, Portola Valley, CA, US</td></tr>
<tr><td class="sidebarText">*Nathan Bronson, Chapel Hill, NC, US</td><td  class="sidebarText">David Pecora, Chapel Hill, NC, US </td></tr>
<tr><td  class="sidebarText">(2)Xu Chuan, Hangzhou, China</td><td  class="sidebarText">*Tom Sirgedas, Ann Arbor, MI, US</td></tr>
<tr><td  class="sidebarText">Tomasz Czajka, Warsaw, Poland</td><td  class="sidebarText">*Bogdan Stanescu, Fairfax, VA, US</td></tr>
<tr><td  class="sidebarText">*James Esser, San Jose, CA, US</td><td  class="sidebarText">Jiqing Tang, Hong Kong</td></tr>
<tr><td  class="sidebarText">*Ambrose Feinstein, Orlando, FL, US</td><td  class="sidebarText">Eugene Vasilchenko, North Potomac, MD, US</td></tr>
<tr><td  class="sidebarText">Oleksandr Grushetskyy, Kiev, Ukraine</td><td  class="sidebarText">Mathijs Vogelzang, Groningen, Netherlands</td></tr>
<tr><td  class="sidebarText">*Derek Kisman, Waterloo, Canada</td><td  class="sidebarText">*Ben Wilhelm, Seattle, WA, US</td></tr>
<tr><td  class="sidebarText">*Jimmy Mardell, Stockholm, Sweden</td><td  class="sidebarText">(2)Jiazhi Wu, Hangzhou, China</td></tr>
<tr><td colspan="2" class="sidebarText">*Developers who have previously participated in TopCoder tournament onsite rounds.</td></tr>
<tr><td colspan="2" class="sidebarText">(2)  Jiazhi Wu and Xu Chuan are unable to attend the onsite rounds due to travel restrictions.  The next two highest scorers in the tournament, David Pecora and James Esser have replaced them.</td></tr>
</table>

<p>The "Final Four" in the Component Tournament is comprised of the following programmers:</p>

<table border="0" cellspacing="2" cellpadding="5" width="500" class="formFrame" align="center">
<tr><td width="50%" align="center" class="sidebarTitle">Design<br/>Competitors</td><td width="50%" align="center" class="sidebarTitle">Development<br/>Competitors</td></tr>
<tr><td class="sidebarText">Tim Roberts, Cary, NC, US</td><td class="sidebarText">Pavel Aksonov, Kiev, Ukraine</td></tr>
<tr><td class="sidebarText">Changxi Zheng, Shanghai, China</td><td class="sidebarText">Rob Nielsen, Carter's Ridge, Australia</td></tr>
</table>

<p>More than 1,000 programmers from 51 countries around the world competed in the open qualification rounds of the TopCoder Open.  The finalists advanced to the tournament's onsite rounds based on their performance in a series of online elimination rounds.  "TopCoder combines objective programming tournaments with 'peer-review' component tournaments to identify and promote the best developers in the world," said TopCoder founder and chairman, Jack Hughes.  "TopCoder has more than 33,000 members from around the globe, and our membership increases an average of 242 new members each week.  These 20 have distinguished themselves amongst incredible worldwide talent.  We look forward to seeing them all at Mohegan Sun and we expect a great couple of days of exciting competition."</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  TopCoder members extend across all professional and collegiate levels.</p>

<p>The attraction of competition and the associated rewards create a powerful community of programmers.  Corporate partners access this member base for employment, software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder Employment Services or sponsorship of TopCoder Events, please visit www.topcoder.com or call toll free 866-TopCode.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.<br/>
Intel and Intel Developer Services are trademarks of Intel Corporation or its subsidiaries in the United States and other countries.</p>

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
