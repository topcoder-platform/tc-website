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
<p><span class="bodyTitle">TopCoder Announces Yahoo! as Title Sponsor for Annual International Programming Tournament</span><br />
<span class="bodySubTitle"><em>Leading Global Internet Company Pairs with TopCoder to Determine Collegiate World Champions of Coding</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., February 16, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as the title sponsor for the 2004 TopCoder Collegiate Challenge (TCCC). The 2004 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $100,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at:  <a href="/tccc04">http://www.topcoder.com/tccc04</a></p>

<p>"Yahoo! is proud to sponsor the TopCoder Collegiate Challenge and showcase the programmers and developers of tomorrow as they put their skills to the test," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  "Many of the participants in this event are as fun, innovative and talented as our own employees and we are excited to have the Yahoo! team on-site to meet the competitors and witness their considerable coding capabilities."</p>

<p>Beginning in February, eligible college students from around the world will compete in qualifying rounds of the 2004 TCCC. Contestants will have their choice of participating in either the Algorithm or Component competitions, or both should they be that skilled.  Through a series of online rounds, the field will be narrowed to 32 semifinalists, comprised of 24 Algorithm and 8 Component competitors. These semifinalists will then compete head-to-head over two days during the onsite finals at the Boston Park Plaza Hotel in Boston, Massachusetts on April 15th and 16th to determine the winners. In addition to an expanded semifinal field, the 2004 TCCC marks the first TopCoder tournament to have coaches. Coaches will provide competitors in the Component Design Competition with technical guidance and support during the competition. The Algorithm tournament will award up to 500 competitors with $40,000 in cash and other prizes. The Component tournament will award $60,000 in cash prizes, with $40,000 being awarded for the Design competition and $20,000 for the Development competition.</p>

<p>The $100,000 total prize purse will be distributed as follows:</p>

<ul>
<li>Algorithm and Design Champions will win $25,000 each, with the second, third and fourth place finalists taking $9,000, $4,000 and $2,000, respectively.</li>
<li>The Development Champion will win $15,000, with second, third and fourth place finalists earning $2,500, $1,500 and $1,000 in prize money. </li>
</ul>

<p>"TopCoder is dedicated to providing the frontline of competitive coding challenges to colleges and students across frontiers and beyond borders," said Rob Hughes, President of TopCoder.  "Yahoo!'s commitment to identifying and recognizing the next wave of programming excellence brings global prestige to our event as well as a new level of excitement and anticipation among our competitors."</p>

<p><span class="bodySubTitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.</p>

<p>TopCoder is a trademark of TopCoder, Inc. in the United States and other countries</p>

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
