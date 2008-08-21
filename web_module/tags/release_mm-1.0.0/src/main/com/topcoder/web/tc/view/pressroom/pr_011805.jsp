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


<%------CONTENT-------%>
<div align="center">
<p><span class="bodyTitle">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</span><br />
<span class="bodySubTitle"><em>Global Leader in Wireless, Broadband and Automotive Communications Technologies Sponsors World Championship of Programming Scheduled for March 11th in Santa Clara, CA</em></span></p>
</div>

<p><strong>GLASTONBURY, CT, January 18, 2005&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Motorola, Inc., (NYSE: MOT), a global leader in wireless, broadband and automotive communications technologies, as a premier sponsor for its 2005 TopCoder Collegiate Challenge (TCCC 05).  The TCCC 05 will bring many of the world's finest student programmers together in competition over the course of ten weeks for international ranking, notoriety and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. Details and rules are provided at: <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about">http://www.topcoder.com/tccc05</A>.
<br /><br />
"Motorola is proud to be a sponsor of the worldwide TopCoder tournament, one of the most demanding and entertaining technical competitions for inventive and innovative software programmers in the world," said Anson Chen corporate vice president of Motorola's Global Software Group (GSG). "We value TopCoder's leadership in developing the software talent we need to grow our 19 software centers worldwide."
<br /><br />
Over 1,300 students from around the world will begin competing in qualifying rounds of the TCCC 05. Through a series of online rounds, this field will be narrowed to 32 final competitors comprised of 24 Algorithm and 8 Component competitors. These finalists will compete in face-to-face competition at the Santa Clara Marriot in California on March 10th and 11th to determine the winners of all competitions. The TCCC 05 marks the first time Motorola has participated in a major TopCoder tournament. 
<br /><br />
"The demands of the TopCoder Collegiate Challenge require the same spirit of competition and applied energy that is the hallmark of true industry leaders," said Rob Hughes, president of TopCoder. "With such a longstanding history of excellence in edge technologies for communications, Motorola is a welcome sponsor to our program of events."
<br /><br />
<span class="bodySubtitle">About Motorola</span><br />
Motorola is a Fortune 100 global communications leader that provides seamless mobility products and solutions across broadband, embedded systems and wireless networks.  In your home, auto, workplace and all spaces in between, seamless mobility means you can reach the people, things and information you need, anywhere, anytime.  Seamless mobility harnesses the power of technology convergence and enables smarter, faster, cost-effective and flexible communication.  Motorola had sales of US$27.1 billion in 2003.  For more information: <A href="http://www.motorola.com">www.motorola.com</A>.
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
