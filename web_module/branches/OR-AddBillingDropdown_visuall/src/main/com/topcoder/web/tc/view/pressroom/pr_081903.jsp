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
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div align="center">
<p><span class="bodyTitle">TopCoder Hosts Software Component Design and Development Contest as Part of 2003 TopCoder Open</span><br />
<span class="bodySubTitle"><em>International Competitors Vie For $30,000</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., August 19, 2003&#151;</strong>
TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced its Software 
Component Design and Development Contest as part of the 2003 TopCoder Open.  In addition to the annual coding 
competition for professional and collegiate programmers, TopCoder will host a separate two-part contest focused on 
software component development.  One aspect of the component competition will test the design skills of software 
architects while the other will challenge programmers to implement previous winning designs.</p>

<p>"The addition of the Software Component Design and Development Contest is a natural progression for TopCoder," 
said Jack Hughes, chairman and founder of TopCoder.  "The common denominator amongst our vast and growing member 
base is great technologists.  The additional competitions allow them to test their skills by tackling a business problem 
with a software design, or use existing designs to develop software components, in addition to quickly solving 
algorithmic problems.  Many will do all three."</p>

<p><span class="bodySubTitle">Software Component Design and Development Contest</span><br />
The development competition of the Software Component Design and Development Contest begins on September 2.  
TopCoder will post software designs <A href="/tc?module=ViewActiveContests&ph=112">here</A>.
Eligible TopCoder members view the project designs and submit source code by September 15.  On September 4, the 
design competition begins and TopCoder will post software design specifications.  Architects are invited to submit 
designs by September 17.  All submissions will be judged in a peer review process and given a score.  Ten competitors 
will advance in each competition.</p>

<p>The second online rounds will begin on October 7 and October 9 for the development and design competitions, 
respectively.  Submission deadlines will be October 20 and October 22.  Two competitors from each of the second 
online rounds will advance to the finals.</p>

<p>The final four will compete simultaneously in two head-to-head competitions onsite at the Mohegan Sun Casino 
in Uncasville, Connecticut on December 5.  The winner of the onsite design and development competitions will each 
receive a grand prize of $10,000.  Each second place finisher will receive $5,000.</p>

<p>"We are very excited to integrate a software design and development contest into the TopCoder Open," said Dave 
Tanacea, president of TopCoder Software.  "It gives us an opportunity to showcase the quality of the commercial 
software TopCoder Software is building in addition to highlighting the incredible talent of TopCoder members."</p>

<p><span class="bodySubTitle">About TopCoder Software</span><br />
TopCoder Software harnesses the talent of the internationally ranked TopCoder member base to design, develop and 
implement cost-effective, high quality software.  Through a unique competition-based development methodology, 
TopCoder Software leverages its catalogs of re-usable components to develop and deliver commercial applications 
and services.  For more information regarding TopCoder Software, please visit www.topcodersoftware.com.</p>

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
