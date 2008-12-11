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
<p><span class="bodyTitle">Champions Announced In 2004 TopCoder&#174; Collegiate Challenge Sponsored by Yahoo!&#174;</span><br />
<span class="bodySubTitle"><em>Coding and Component Tournament Winners Take Home $100,000</em></span></p>
</div>

<p><strong>BOSTON, MA., April 19, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Tomasz Czajka of Warsaw, Poland, Pavlo Aksonov of the Ukraine and Roman Koshlyak, also of the Ukraine, have won the Coding, Design and Development Component tournaments of the 2004 TopCoder Collegiate Challenge sponsored by Yahoo!, held at the Boston Park Plaza Hotel &amp; Towers in Boston, MA on April 16th. Czajka beat 23 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $25,000 grand prize in the Coding tournament.  Aksonov and Koshlyak took home $25,000 and $15,000 respectively as the Design and Development winners in the Component tournament. 
</p>
<p>
The Coding tournament was a timed competition where the participants solved complex algorithmic problems using Java, .Net, C++ or C#.  The Component tournament was focused on software design and development where the participants in each tournament were provided general requirements and asked to design or develop re-useable software components.   
</p>
<p>
At the start of the Coding tournament, Czajka, known by the handle 'tomek', was the Number 1 seed and the Number 1 rated member among more than 38,000 members worldwide. Czajka's winning strategy of a measured approach to the problems combined with a limited challenge phase paid off well as he recorded a final score of 417.22, beating out second place finisher Ben Wilhelm of Seattle, WA, US with 397.16 points, and second runner up John Dethridge of Melbourne, Australia and fourth place finalist Reid Barton, of Arlington, MA, US. As a result of his victory, Czajka remains the Number 1 rated TopCoder member. The finalists earned a spot at the event by besting almost 1,000 other programmers from around the world in simultaneous, online competitions.  
</p>
<p>
"It was a hard fought victory and the competition was strong," said Czajka. "I have a great deal of respect for the other finalists and look forward to the next competition!" 
</p>
<p>
Aksonov and Koshlyak battled to win their contests in Design and Development respectively. After the results were announced, Aksonov said he was excited to be put to the test by such a collection of coding talent. Koshlyak intends to use part of his prize to start his own software company.
</p>
<p>
"Yahoo! salutes each and every competitor who made this event such a great success," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo, "Their passion, creativity and ability to perform in a challenging arena is a great credit to them all."
</p>
<p>
The Championship Round finalists of the Coding tournament were as follows:
</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Algorithm Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Reid Barton, Arlington, MA, US</td><td class="sidebarText" width="50%">Adrian Kuegel, Ulm, Germany</td></tr>
<tr><td class="sidebarText">Tomasz Czajka, Warsaw, Poland</td><td class="sidebarText">Alexander Neubeck, Germany</td></tr>
<tr><td class="sidebarText">Ben Wilhelm, Seattle, WA, US</td><td class="sidebarText">Hubert Hwang, US</td></tr>
<tr><td class="sidebarText">Bogdan Stanescu, Fairfax, VA US</td><td class="sidebarText">Geir Engdahl, Oslo, Norway</td></tr>
<tr><td class="sidebarText">Aleksandr Grushetskyy, Kiev, Ukraine</td><td class="sidebarText">Jiqing Tang, Hong Kong</td></tr>
<tr><td class="sidebarText">Lars Hellsten, Waterloo, Canada</td><td class="sidebarText">David Rydh, Sweden</td></tr>
<tr><td class="sidebarText">Erik Kopczynski, Warsaw, Poland</td><td class="sidebarText">Oeyvind Grotmol, Spain</td></tr>
<tr><td class="sidebarText">Zheng Shao, Il, US</td><td class="sidebarText">Jan Kuipers, Utrecht, The Netherlands</td></tr>
<tr><td class="sidebarText">John Dethridge, Melbourne, Australia</td><td class="sidebarText">David Narum, Oslo, Norway</td></tr>
<tr><td class="sidebarText">Petko Minkov, Sofia, Bulgaria</td><td class="sidebarText">Benjamin Mickle, US</td></tr>
<tr><td class="sidebarText">Ralph Furmaniak, Waterloo, Canada</td><td class="sidebarText">Bartholomew Furrow, Canada</td></tr>
<tr><td class="sidebarText">Ryan Pai, TX, US</td><td class="sidebarText">Sebastian Kanthak, BC, Canada</td></tr>
</table>

<p>The finalists in the Design and Development Component tournament were as follows:</p>

<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Design Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Pavlo Aksonov, Kiev, Ukraine</td><td class="sidebarText" width="50%">Adrian Carcu, Romania</td></tr>
<tr><td class="sidebarText">Mihai Pasca, Romania</td><td class="sidebarText">Changxi Zheng, Shanghai, China</td></tr>
</table>
<br/>
<table width="500" cellspacing="2" cellpadding="6" class="formFrame" align="center">
<tr><td class="sidebarTitle" colspan="2" align="center">Development Competitors</td></tr>
<tr><td class="sidebarText" width="50%">Roman Koshlyak, Ukraine</td><td class="sidebarText">Harsh Jain, India</td></tr>
<tr><td class="sidebarText">Gary Linscott, Canada</td><td class="sidebarText">Preben Solheim, Norway</td></tr>
</table>

<p>
The results of TopCoder's major tournaments, weekly competitions and component development projects create a global database of objectively rated and talent-differentiated student and professional programmers.  
</p>
<p>
"With an international field of the highest caliber students representing 15 countries from around the world, it's readily apparent that coding talent knows no geographic boundaries," said Rob Hughes, President and COO of TopCoder.  "We extend our congratulations to our TopCoder Collegiate Champions along with forward-looking sponsors like Yahoo! who recognize that TopCoder Competitions is where global development talent lives."
</p>
<p><span class="bodySubTitle">About TopCoder, Inc.</span><br/>
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
