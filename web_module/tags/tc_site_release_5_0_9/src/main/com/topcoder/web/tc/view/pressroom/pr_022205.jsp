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
<p><span class="bodyTitle">Semifinalists Announced for 2005 TopCoder Collegiate Challenge Sponsored by Yahoo!&#174;</span><br />
<span class="bodySubTitle"><em>Coding Elite from 21 Colleges in 12 Countries to Meet at World Championship of Collegiate Programming Scheduled for March 10th and 11th in Santa Clara, CA</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, February 22, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 31 International onsite semifinalists who have advanced to the Championship rounds of the 2005 TopCoder Collegiate Challenge sponsored by Yahoo! This annual TopCoder tournament, the second collegiate challenge event sponsored by Yahoo!, is open to college students worldwide and will award cash prizes totaling $150,000. The tournament's semifinal and Championship rounds will be held March 10th and 11th at the Santa Clara Marriott in Santa Clara, CA. Full details are provided at: <A href="/tccc05">http://www.topcoder.com/tccc05</A>.
<br /><br />
"TopCoder tournaments traditionally attract the world's very top programming problem solvers," said Rob Hughes, President and COO of TopCoder, Inc. "It's always an impressive sight to see such an international representation of programming talent assembled in one place."
<br /><br />
The 24 finalists in the Algorithm Coding Competition, representing 10 nationalities, are:
<br /><br />
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" align="center" colspan="2">Algorithm Competitors</td>
</tr>
<tr class="sidebarText">
<td width="50%">*Jan Kuipers, The Netherlands</td>
<td width="50%">*Tomasz Czajka, Poland</td>
</tr>
<tr class="sidebarText">
<td>Erik-Jan Krijgsman, The Netherlands</td>
<td>Luka Kalinovcic, Croatia</td>
</tr>
<tr class="sidebarText">
<td>Michal Forisek, Slovak Republic</td>
<td>*Alexander Neubeck, Germany</td>
</tr>
<tr class="sidebarText">
<td>Hong Chen, USA</td>
<td>*Ante Derek, USA</td>
</tr>
<tr class="sidebarText">
<td>Po-Ru Loh, USA</td>
<td>*John Dethridge, Australia</td>
</tr>
<tr class="sidebarText">
<td>Robin Nittka, Germany</td>
<td>Marian Dvorsky, Slovak Republic</td>
</tr>
<tr class="sidebarText">
<td>*Adrian Kuegel, Germany</td>
<td>Rune Fevang, Norway</td>
</tr>
<tr class="sidebarText">
<td>Xin Qi, USA</td>
<td>*Tomasz Idziaszek, Poland</td>
</tr>
<tr class="sidebarText">
<td>*Zheng Shao, USA</td>
<td>*Eryk Kopczynski, Poland</td>
</tr>
<tr class="sidebarText">
<td>*Mathijs Vogelzang, The Netherlands</td>
<td>*Georgios Papoutsis, Germany</td>
</tr>
<tr class="sidebarText">
<td>*Adam D'Angelo, USA</td>
<td>*David Vickrey, USA</td>
</tr>
<tr class="sidebarText">
<td>Marcin Michalski, Poland</td>
<td>*Ralph Furmaniak, Canada</td>
</tr>
</table>

<br /><br />
The 7 finalists in the Component Design and Development Competitions, representing 4 countries are:
<br /><br />

<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
<tr>
<td class="sidebarTitle" width="50%" align="center">Design Competitors</td>
<td class="sidebarTitle" width="50%" align="center">Development Competitors</td>
</tr>
<tr class="sidebarText">
<td>*Adrian Carcu, Romania</td>
<td>Zheng Zhang, China</td>
</tr>
<tr class="sidebarText">
<td>*Mihai Pasca, Romania</td>
<td>Xu Chuan, China</td>
</tr>
<tr class="sidebarText">
<td>Kyle Littlefield, USA</td>
<td>*Gary Linscott, Canada</td>
</tr>
<tr class="sidebarText">
<td>&#160;</td>
<td>Zhimin Chen, China</td>
</tr>
</table>

<br /><br />
*Competitors who have previously participated in TopCoder tournament onsite rounds.
<br /><br />
Over 1,300 students from around the world began competing in qualifying rounds of the TCCC05 in December. Through a series of online rounds, this field has been narrowed down to 31 final competitors comprised of 24 Algorithm and 7 Component competitors. These finalists will now compete in face-to-face competition at the Santa Clara Marriot in California on March 10th and 11th to determine the winners of all competitions. 
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries.
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
