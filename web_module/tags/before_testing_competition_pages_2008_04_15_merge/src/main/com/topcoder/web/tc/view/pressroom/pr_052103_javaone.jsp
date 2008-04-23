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
<h3>TopCoder to Administer Contest at the 2003 JavaOne<span class="super">SM</span> Conference</h3>
JavaOne<span class="super">SM</span> Coding Challenge will be Powered by TopCoder<span class="super">TM</span>
</div>

<p><strong>GLASTONBURY, CT&#151;May 21, 2003&#151;</strong>TopCoder, Inc., the leader in promotion of 
programming talent through online competition, today announced that Sun Microsystems, Inc. (NASDAQ: SUNW) has 
selected the company to administer its JavaOne<span class="super">SM</span> Coding Challenge.  TopCoder's sophisticated competition engine has 
been customized for Sun, allowing them to host the JavaOne Coding Challenge at their flagship developer conference.  
The Challenge is open to all registered onsite attendees of the Conference, being held June 10-13, at the Moscone Center 
in San Francisco, CA.</p>

<p>"TopCoder is pleased to have been selected to administer this contest," said Jack Hughes, Founder and Chairman of 
TopCoder. "The JavaOne conference is the epicenter for all things Java<span class="super">TM</span> technology-related and we are happy to be 
able to enhance the experience for programmers who attend the Conference.  Sun's commitment to Java technology is 
evident in its continued improvements to the JavaOne conference and its support of TopCoder and its developer base."</p>

<p>The JavaOne Coding Challenge offers attendees an opportunity to apply technical knowledge learned during Conference 
technical sessions to real-world problems.  The Coding Challenge will center on the Conference themes of Mobility, 
Enterprise Applications and Java Web Services.</p>

<p>"Sun is dedicated to making the JavaOne conference the essential source for Java technology education and innovation," 
said Mike Bellissimo, senior director, Sun Software Developer Marketing and Management.  "We are excited that TopCoder 
will offer onsite attendees a practical application testing their knowledge of Java technology learned during the JavaOne 
conference."</p>

<p>The 2003 JavaOne conference will be held June 10-13 at the Moscone Convention Center in San Francisco, CA.  
More details on the Conference can be found at <A href="http://www.java.sun.com/javaone/sf" target="_blank">http://www.java.sun.com/javaone/sf.</A></p>

<p><br /></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder, Inc. organizes and hosts online and onsite programming competitions for a global community of members.  
TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated 
rewards create a powerful community of programmers.  Corporate partners access this member base for employment, 
software development and sponsorship.  For registration details or information regarding TopCoder Software, TopCoder 
Employment Services or sponsorship of TopCoder Events, please visit <a class="bodyText" href="http://www.topcoder.com">www.topcoder.com.</a></p>

<p>Sun, Sun Microsystems, Java and JavaOne are trademarks or registered trademarks of Sun Microsystems, Inc. in the 
United States and other countries.</p>

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
