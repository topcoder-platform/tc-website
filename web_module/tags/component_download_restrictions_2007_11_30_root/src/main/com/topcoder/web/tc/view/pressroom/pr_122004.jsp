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
<p><span class="bodyTitle">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Leading Global Internet Company Pairs with TopCoder in $150,000 programming tournament for collegiate coders</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, December 20, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as the title sponsor of the 2005 TopCoder Collegiate Challenge (TCCC).  The 2005 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Design and Development categories. Details and rules are provided at:  <A href="/tccc05">http://www.topcoder.com/tccc05</A>
<br /><br />
"Yahoo! is proud to continue our relationship with TopCoder and more importantly, our relationship with the talented coders participating in the TopCoder Collegiate Challenge," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  "This competition is a tremendous recruiting opportunity for Yahoo! and we look forward to meeting with the outstanding coders who have the potential to become outstanding Yahoos."   
<br /><br />
Registration for the tournament begins today.  Starting in January, eligible college students from around the world will compete in qualifying rounds of the 2005 TCCC. Contestants will have their choice of participating in either the Algorithm or Component competitions, or both should they be that skilled.  Through a series of online rounds, the field will be narrowed to 32 semifinalists, comprised of 24 Algorithm and 8 Component competitors. These semifinalists will then compete head-to-head over two days during the onsite finals at the Santa Clara Marriott in Santa Clara, California on March 10th and 11th to determine the winners.
<br /><br />
The Algorithm competition will award up to 500 competitors with $60,000 in cash and other prizes, with the winner taking home $20,000. The Component Design and Development competitions will share $90,000 in cash prizes.  The Design champion will win $25,000 and the Development champion $13,000.
<br /><br />
"At the very core of what we do at TopCoder is the belief that competition is the best method of evaluating ability and delivering quantifiable results," said Rob Hughes, President of TopCoder.  "TopCoder tournaments provide our clients the chance to interface with some of the world's most ruthlessly proficient programmers in the most demanding of environments -the onsite final." 
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com. 
<br /><br />
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
