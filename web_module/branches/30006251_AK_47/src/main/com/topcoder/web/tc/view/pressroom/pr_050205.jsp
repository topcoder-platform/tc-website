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
<p><span class="bodyTitle">TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference</span><br />
<span class="bodySubTitle"><em>Highly Rated JavaOne Programming Contest Returns for Third Consecutive Year at Worldwide Java Developer Event</em></span></p>
</div>

<p><strong>Glastonbury, CT, May 2, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that they are again teaming up with Sun Microsystems, Inc. (Nasdaq: SUNW), the creator and leading advocate of Java(TM) technology, to host the JavaOne Coding Challenge at the tenth annual 2005 JavaOne conference, scheduled for June 27 - 30th at Moscone Center in San Francisco. As one of the most popular events held during the JavaOne conference, the Java Coding Challenge is an exciting contest of Java development skills and creativity. Judged by Java industry luminaries such as James Gosling, the inventor of Java, this year's event promises to raise the bar with TopCoder putting tremendous challenges forward for the competition.
<br /><br />
"The TopCoder-powered Coding Challenge continues to be one of highest rated and most exciting programs offered at the JavaOne Conference," said Matt Thompson, Director of Developer Outreach for Sun Microsystems. "It's a great opportunity for developers to come test their Java language coding skills in a unique developer-to-developer format."
<br /><br />
The competition will give conference attendees a chance to apply what they learn during the conference sessions to real-world programming problems. In the onsite competition arena, participants will be presented with programming problems and will use the Java programming language to code, compile, test and submit solutions to the problem sets. TopCoder will also be promoting the event among its global membership of more than 54,000 professional and student programmers. For more information visit <A href="/javaone2005">http://topcoder.com/javaone2005</A>.
<br /><br />
Throughout each day, competitors' submissions will be objectively scored for accuracy and the time it took to complete the problem. At the conclusion of each day's Qualification Round, the four individuals who have achieved the highest scores will be invited back to compete head-to-head, where they will battle it out in the onsite competition arena. The Grand prize will include one complimentary full conference badge to the 2006 JavaOne conference valued at $1,995 and a collection of 6 books from Sun Microsystems Press valued at $300. Additional prizes include gift certificates of $500 for 1st runners up, $250 for 2nd runners up and $125 for 3rd runners up daily. In addition, the first 800 contestants will receive a 2005 JavaOne Coding Challenge T-shirt and messenger bag. The daily winners will be shown on the JavaOne Coding Challenge scoreboard throughout each day.
<br /><br />
"This year's Coding Challenge will give Java enthusiasts a chance to unleash their competitive energies in an arena that is specifically engineered to reward speed, accuracy and skillful application of programming knowledge," said Rob Hughes, President of TopCoder, Inc. "We hope all attendees will make a point of stopping by the arena to register and enjoy the spirit of competition."
<br /><br />
<span class="bodySubtitle">About JavaOne, Sun's 2005 Worldwide Java Developer Conference</span><br />
The JavaOne 2005 Worldwide Developer conference is the premiere event for Java technology developers. Established in 1996, the conference provides Java technology developers with access to the greatest minds and innovations in the Java technology development community. Attendees have a chance to network with other developers and get exposure to real-world solutions and the Java technology industry.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br /><br />
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries
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
