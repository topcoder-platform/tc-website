<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="506139" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Identified As Business Leader and Innovator <br>In New Book "Mavericks at Work"</span><br />
<span class="bodySubTitle"><em>National Maverick City Book Tour to Stop in Hartford, Conn. November 7th</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, October 10, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that the company is recognized as being among the very leading businesses and innovators in the new business book "Mavericks at Work: Why the Most Original Minds in Business Win"  Written by former Fast Company authors William C. Taylor and Polly LaBarre, the book provides a set of provocative insights and a collection of instructive case studies that amount to a business plan for the 21st century&mdash;a smarter way to lead, compete and succeed.  The Mavericks at Work website is available at <a href="http://www.mavericksatwork.com/" target="_blank">http://www.mavericksatwork.com/</A>.
<br><br>
Identified as one of the new breed of businesses making waves and growing fast, TopCoder's ultra competitive open-source environment is described as "an architecture of participation that works on several levels simultaneously, which may be why it is working so effectively in the marketplace [as members] compete simply to compete - to solve digital brain teasers under tight deadlines, great pressure, and the intense scrutiny of their peers." 
<br><br>
"Mavericks at Work successfully captures the feel and energy of some of the most creative and truly radical companies doing business today," said Jack Hughes, Founder and Chairman of TopCoder, Inc. "To be included in such a group is a wonderful validation for both our company and the greater TopCoder community."
<br><br>
<span class="bodySubtitle">Mavericks in Hartford</span><br>
On November 7th the Mavericks book tour will be coming to Hartford as local Maverick Jack Hughes of TopCoder will join the authors and greater Hartford-area business leaders to discuss how in an age of hyper-competition and non-stop innovation, the only way to stand out from the crowd is to stand for something truly unique. A "Maverick Meeting of the Minds" will be hosted by the Metro Hartford Economic Alliance Rising Star Breakfast on November 7th at the Connecticut Convention Center, 100 Columbus Boulevard, Hartford, Conn. from 8:00-9:30 AM. For more details contact Jim McKeown at 860.633.5540. 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="http://www.topcoder.com">www.topcoder.com</a>.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
</p>
                                                
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
