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
<p><span class="bodyTitle">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC Sponsored by Yahoo!&#174;</span><br />
<span class="bodySubTitle"><em>International Collegiate Elite From 15 Countries to Compete for $100,000 Purse in Programming Championship</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., April 6, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 32 International onsite semifinalists who have advanced to the Championship rounds of the 2004 TopCoder Collegiate Challenge sponsored by Yahoo! This annual TopCoder tournament, the first such event sponsored by Yahoo!, is open to collegiate programmers worldwide and will award cash prizes totaling $100,000. The tournament's semifinal and Championship rounds will be held April 15th and 16th at the Boston Park Plaza Hotel &amp; Towers in Boston, MA. For more information visit: http://www.topcoder.com.
</p>

<p>
The 32 semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $100,000 prize purse. The Algorithm tournament will award $40,000 in cash and the Component tournament will award $60,000 in cash prizes, with $40,000 being awarded for the Design and $20,000 for the Development segments of the competition.
</p>

<p>
"Yahoo! is proud to sponsor the TopCoder Collegiate Challenge and showcase the programmers and developers of tomorrow as they put their skills to the test," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  "Many of the participants in this event are as fun, innovative and talented as our own employees and we are excited to have the Yahoo! team onsite to meet the competitors and witness their considerable coding capabilities."
</p>

<p>
The 24 finalists in the Algorithm Coding Tournament, representing 12 nationalities, are:
</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Algorithm Competitors</td></tr>
<tr><td class="sidebarText" width="50%">*Tomasz Czajka, Warsaw, Poland</td><td class="sidebarText" width="50%">*Reid Barton, Arlington, MA, US</td></tr>
<tr><td class="sidebarText">Adrian Kuegel, Ulm, Germany</td><td class="sidebarText">Alexander Neubeck, Germany</td></tr>
<tr><td class="sidebarText">*Ben Wilhelm, Seattle, WA, US</td><td class="sidebarText">Hubert Hwang, US</td></tr>
<tr><td class="sidebarText">*Alexander Grushetsky, Kiev, Ukraine</td><td class="sidebarText">*Bogdan Stanescu, Fairfax, VA, US</td></tr>
<tr><td class="sidebarText">Geir Engdahl, Oslo, Norway</td><td class="sidebarText">*Jiqing Tang, Hong Kong</td></tr>
<tr><td class="sidebarText">David Rydh, Sweden</td><td class="sidebarText">Eryk Kopczynski, Warsaw, Poland</td></tr>
<tr><td class="sidebarText">Oeyvind Grotmol, Spain</td><td class="sidebarText">Zheng Shao, Il, US</td></tr>
<tr><td class="sidebarText">Jan Kuipers, Utrecht, The Netherlands</td><td class="sidebarText">*John Dethridge, Melbourne, Australia</td></tr>
<tr><td class="sidebarText">David Narum, Oslo, Norway</td><td class="sidebarText">*Lars Hellsten, Waterloo, Canada</td></tr>
<tr><td class="sidebarText">Petko Minkov, Sofia, Bulgaria	</td><td class="sidebarText">Benjamin Mickle, US</td></tr>
<tr><td class="sidebarText">Ralph Furmaniak, Waterloo, Canada</td><td class="sidebarText">Bartholomew Furrow, Canada</td></tr>
<tr><td class="sidebarText">Ryan Pai, TX, US</td><td class="sidebarText">Sebastian Kanthak, BC, Canada</td></tr>
<tr><td class="sidebarText" colspan="2">Po-Ru Loh, CA, US **</td></tr>
<tr><td class="sidebarText" colspan="2">*Developers who have previously participated in TopCoder tournament onsite rounds.</td></tr>
<tr><td class="sidebarText" colspan="2">** Unable to attend the onsite rounds. The next highest scorer in the tournament, Benjamin Mickle has replaced him.</td></tr>
</table>

<p>
The 8 finalists in the Component Design and Development Tournaments, representing 6 countries are:
</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" align="center" width="50%">Design<br/>Competitors</td><td class="sidebarTitle" align="center" width="50%">Development<br/>Competitors</td></tr>
<tr><td class="sidebarText">Adrian Carcu, Romania</td><td class="sidebarText">Roman Koshlyak, Ukraine</td></tr>
<tr><td class="sidebarText">Mihai Pasca, Romania</td><td class="sidebarText">Harsh Jain, India</td></tr>
<tr><td class="sidebarText">Changxi Zheng, Shanghai, China</td><td class="sidebarText">Gary Linscott, Canada</td></tr>
<tr><td class="sidebarText">*Pavlo Aksonov, Kiev, Ukraine</td><td class="sidebarText">Preben Solheim, Norway</td></tr>
<tr><td class="sidebarText">&#160;</td><td class="sidebarText">Jin Guanzhou, ZheJiang, China **</td></tr>
<tr><td class="sidebarText">&#160;</td><td class="sidebarText">Shunbao Chen, ZheJiang, China **</td></tr>
<tr><td class="sidebarText" colspan="2">*Developers who have previously participated in TopCoder tournament onsite rounds.</td></tr>
<tr><td class="sidebarText" colspan="2">** Unable to attend the onsite rounds due to travel restrictions. The next highest scorers in the tournament - Gary Linscott and Preben Solheim - have replaced them.</td></tr>
</table>

<p>
Since February, eligible college students from around the world have competed in qualifying rounds in either the Algorithm or Component competitions. Nearly 1,000 programmers from 47 countries around the world participated in the open qualification rounds of this year's tournament. Through a series of online rounds, the field has been narrowed to 32 semifinalists with the highest scores, comprised of 24 Algorithm and 8 Component competitors.
</p>

<p>
The $100,000 total prize purse will be distributed as follows:
</p>
<p>
Algorithm and Design Champions will win $25,000 each, with the second, third and fourth place finalists in each segment taking $9,000, $4,000 and $2,000, respectively.
</p>
<p>
The Development Champion will win $15,000, with second, third and fourth place finalists earning $2,500, $1,500 and $1,000 in prize money. 
</p>

<p>
"TopCoder's competitions have always drawn the best talent on the local, national and global levels," said Rob Hughes, President of TopCoder. "TopCoder membership has passed the 37,000 member mark globally, and that community represents the single largest pool of developers actively involved in programming competitions anywhere. We look forward to 48 hours of exciting competition in Boston."
</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
</p>
<p>
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
