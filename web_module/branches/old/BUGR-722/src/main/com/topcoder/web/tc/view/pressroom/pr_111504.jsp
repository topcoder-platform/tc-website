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
<p><span class="bodyTitle">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</span><br />
<span class="bodySubTitle"><em>Algorithm, Design and Development Competition Winners Take Home $150,000</em></span></p>
</div>

<p><strong>SANTA CLARA, CA, November 15, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Tomasz Czajka of Stalowej, Poland, Adrian Nicolae Carcu of Bistrita, Romania, and Jin GuanZhou of HangZhou City, China have won the Algorithm, Design and Development Competitions of the 2004 TopCoder Open, sponsored by Microsoft, held at the Marriott Hotel in Santa Clara, CA on November 12th. Czajka beat 23 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $20,000 grand prize in the Algorithm Competition.  Carcu and GuanZhou took home $20,000 and $10,000 respectively as the Component Design and Development Champions. 
<br/><br/>
In the Algorithm Competition, the participants solve complex algorithmic problems using Java, C++, C#, or Visual Basic&#174;.  The Component Competitions challenge participants to design or develop re-useable Java and .Net software components.   
<br/><br/>
At the start of the Algorithm Competition, Czajka, known by the handle 'tomek', was the number 1 seed and the number 1 rated member among more than 47,000 TopCoder members worldwide. Tomek's winning strategy of a measured approach to the problems, combined with no challenges, paid off well as he recorded three correct submissions, beating out second place finisher Derek Kisman aka 'SnapDragon' of Calgary, Canada, as well as third place winner Reid Barton  of Arlington, MA and fourth place winner Steve Newman of Portola Valley, CA. As a result of his victory, tomek remains the number 1 rated TopCoder member. The finalists earned a spot at the event by besting almost 1,600 other programmers from around the world in simultaneous, online competitions.  
<br/><br/>
"This was one of the toughest fields I have ever competed against - the level of collective talent is awesome," said tomek. "Today's win is very special to me. I'd like to express my respect for my opponents and to thank TopCoder and their great sponsors." 
<br/><br/>
Adrian Carcu and Jin GuanZhou battled to win their contests in Design and Development.  Sergey Kalinichenko of San Francisco, CA and Pavlo Aksonov of Kiev, Ukraine finished in second and third place in the Design Competition, while Chip Bradford of Fairport, NY, and Celsus Kintanar of Los Banos, Philippines were awarded second and third place in the Development Competition. GuanZhou intends to use part of his prize to fund his education.
<br/><br/>
"Microsoft is proud to be involved as the title sponsor of the 2004 TopCoder Open," said Kristen Roby, Senior Director, College Recruiting. "We are excited by the high level of energy and skill represented by this field of gifted international contestants today and congratulate each of them on their competitive spirit."
<br/><br/>
The results of TopCoder's major tournaments, weekly competitions and component projects create a global database of objectively rated and talent-differentiated student and professional programmers.  
<br/><br/>
"We would like to thank our sponsors and competitors alike for making the TopCoder Open an ongoing success," said Rob Hughes, President and COO of TopCoder.  "We extend our congratulations to our Champions tomek, adic and Standlove. Each of them has shown the drive and desire to perform at the highest level on the biggest stage of competitive programming." 
<br/><br/>
<span class="bodySubtitle">About Microsoft</span><br/>
Founded in 1975, Microsoft (Nasdaq "MSFT") is the worldwide leader in software, services and solutions that help people and businesses realize their full potential. 
<br/><br/>
<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
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
