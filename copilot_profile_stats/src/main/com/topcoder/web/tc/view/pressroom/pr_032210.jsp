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
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
	<div align="right"><tc-webtag:forumLink forumID="668666" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>Student from Belarus is Champion in 2010 TopCoder High School </strong><br>
    <strong>Global Programming Tournament</strong><br />
</p>
</div>
      
<p><strong>Glastonbury, CT - March 22, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, ., the leader in online programming competition, skills assessment and competitive software development, today announced Gennady Korotkevich a student from School #56 in Gomel, Belarus, as champion of the 2010 TopCoder High School global programming tournament. Korotkevich prevailed over a final field of 100 skilled young algorithmists from 11 countries and earned a $3,000 share of the $10,000 total prize purse. The tournament consisted of three online elimination rounds which started in February, involved close to 500 participants representing 54 countries and culminated in a championship round on Saturday.</p>

<p>Second place and $1,500 went to Rumen Hristov, (exod40), a student at the High School of Natural Science and Mathematics in Shrumen, Bulgaria. Rounding out the top three was Neal Wu (neal_wu) of the Baton Rouge Magnet High School in Baton Rouge, LA. Wu was one of two American finalists. </p>
<p>Details are available at <a href="http://www.topcoder.com/tc">http://www.topcoder.com/tc.</a></p>
<p>Since its inauguration in 2007, over 25,000 high school students have registered for the TopCoder High School Tournament. The TopCoder High School Tournament follows in the full tradition of the flagship TopCoder Open professional event by providing a world class platform for high school students to demonstrate their programming talents and skills to the world.</p>
<p>TopCoder offers a comprehensive array of outcome-based software competitions 24 x 7 in which real world business solutions are built on time and on budget.&nbsp; For creative work, TopCoder Studio provides a competitive arena for creative skills such as graphic arts and digital design. </p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 240,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>. </p>
<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
