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
<p><span class="bodyTitle">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Leading Global Internet Company Added to Distinguished Sponsorship Group for World's Most Challenging Programming Tournament</em></span></p>
</div>

<p><strong>GLASTONBURY, Conn., September 2, 2004&#151;</strong>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Yahoo! Inc. as a premier sponsor for the 2004 TopCoder Open. The 2004 TopCoder Open will award $150,000 in total cash prizes for Algorithm, Component Design and Component Development categories, and programmers from more than 50 countries will compete.  Yahoo's sponsorship of the 2004 TopCoder Open marks the company's second successive involvement with TopCoder events. 
<br/><br/>
"As a sponsor of the TopCoder Collegiate Challenge, Yahoo! had the opportunity to recruit several truly talented individuals.  We are excited to continue our relationship with TopCoder and are looking forward to meeting with the top talent competing in the TopCoder Open," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo.  
<br/><br/>
The 2004 TopCoder Open will feature some of the IT industry's top professionals and international collegiate coders. Software will be designed and developed and seemingly unsolvable algorithmic problems will be solved over the course of 14 weeks, culminating in the exciting Onsite Finals at the Santa Clara Marriott in Santa Clara, CA, on November 11th &amp; 12th. 
<br/><br/>
TopCoder events provide the perfect setting for reaching and interacting with some of the most   accomplished software developers in the world.  By providing access to thousands of competitors as they compete, employers can get a unique evaluation of how good a developer really is. 
<br/><br/>
Registration for the 2004 TopCoder Open Algorithm Competition is open until 9:00 am EDT on Tuesday, September 7, 2004. Full registration details and rules are available at:  http://www.topcoder.com/tco04
<br/><br/>
"Our family of sponsors has seen significant growth in the last year and we are committed to continuing our success in delivering a quality program and experience for both competitors and sponsors as they build valuable and enduring relationships," said Rob Hughes, President and COO of TopCoder.  "We are always pleased when we find a shared passion for supporting the most driven and exciting group of programmers in the world - the TopCoder developer community."
<br/><br/>
<span class="bodySubtitle">About TopCoder, Inc.</span><br/>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br/><br/>
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
