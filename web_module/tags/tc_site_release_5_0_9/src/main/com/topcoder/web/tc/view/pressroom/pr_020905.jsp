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
<p><span class="bodyTitle">GOOGLE CODE JAM COMES TO INDIA</span><br />
<span class="bodySubTitle"><em>Google Research &amp; Development Centre in Bangalore Launches Google India Code Jam to Find South Asia's Best Programmers</em></span></p>
</div>

<p><strong>BANGALORE, INDIA, February 9, 2005&#151;</strong>
Google India today announced the launch of the Google India Code Jam 2005, a computer programming competition with a Rs. 3,00,000 ($6,900) first prize, to find the best programming talent from India and South Asia. 
<br /><br />	
The Google India Code Jam is an extension of Google's annual Code Jam competition and celebrates the art of computer science, demonstrating to software professionals everywhere the value Google places on excellent coding. In addition to rewarding the top programmers in the region, Google India also hopes that the competition will provide further opportunities to attract strong technical talent to the new Google R&amp;D centre in Bangalore, which opened in early 2004. 
<br /><br />	
The competition is open to participants throughout the region and registration begins today through February 25.  On February 27, contestants will compete online to qualify for the top 500 spots in the first round.  These 500 qualifiers will battle head-to-head for the 50 final positions.  Finalists will be flown to the Google R&amp;D Centre in Bangalore for the championship round on March 26.  The winner of the Google India Code Jam will receive Rs. 3,00,000 ($6,900) while additional cash prizes totaling Rs. 13,00,000 ($30,000) will be distributed to the other 49 finalists.
<br /><br />	
The Google India Code Jam is powered by TopCoder, Inc., the recognised leader in online programming competition, skills assessment and competitive software development.
<br /><br />	
More information on the competition and how to participate is available at www.google.com/bangalore - which also provides information about employment opportunities at the Google R&amp;D Centre in Bangalore.
<br /><br />	
<span class="bodySubtitle">About Google Inc.</span><br />
Google's innovative search technologies connect millions of people around the world with information every day. Founded in 1998 by Stanford Ph.D. students Larry Page and Sergey Brin, Google today is a top web property in all major global markets. Google's targeted advertising programme provides businesses of all sizes with measurable results, while enhancing the overall web experience for users. Google is headquartered in Silicon Valley with offices throughout North America, Europe, and Asia. For more information, visit www.google.com.
<br /><br />	
Google is a registered trademark of Google Inc. All other company and product names may be trademarks of the respective companies with which they are associated.
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
