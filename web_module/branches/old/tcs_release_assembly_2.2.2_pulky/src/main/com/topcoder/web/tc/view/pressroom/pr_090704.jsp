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
<p><span class="bodyTitle">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</span><br />
<span class="bodySubTitle"><em>VP of Software Development to Discuss Competition Based Software Methodology</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., September 7, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Michael Morris, vice president of software development, will be speaking at the Software Development Best Practices Conference and Expo at the Hynes Convention Center in Boston, MA September 20-23rd. Produced by CMP Media's SD Events group, the SD Best Practices Conference and Expo gives software management professionals an expansive range of topics that focus on boosting efficiency, streamlining infrastructure and producing successful project outcomes to enhance the quality of software production.  
<br/><br/>
In the presentation titled "Competition Based Software Methodology" Morris will examine how organizations can obtain incredible results by implementing a development methodology that requires developers to compete against each other in a highly disciplined environment. The advanced level process &amp; methods session will take place Wednesday, September 22 at 3:45 pm.
<br/><br/>
Joining TopCoder Software in 2002 as the Vice President of Software Development, Michael P. Morris brings a decade of technology experience, across vertical markets, to drive the company's technology vision, product development and virtual project teams.  Morris' commitment to the proper design and development of software applications has elevated him to "guru" status among programmers, managers and chief technology officers alike.  His specialties - Component Based Development and Web services - have earned him published articles, industry recognition and speaking engagements at acclaimed institutions, such as Java One and Harvard University. Formerly, Morris was the director of design and development for the northern California region of Tallan, a custom software development and consulting company.  
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
