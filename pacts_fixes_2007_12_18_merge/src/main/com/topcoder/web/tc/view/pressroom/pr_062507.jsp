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
                    
<div align="right"><tc-webtag:forumLink forumID="516295" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Live Coverage of 2007 TopCoder Open to Feature Broadcast Team, Interviews and Behind-the-Scenes Action</span><br>
<span class="bodySubTitle"><em>View All of the Action at the AOL Site dev.aol.com on June 29</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., June 25, 2007 &#151;</strong>TopCoder&#174;, Inc., today announced the broadcast team for the 2007 TopCoder&#174; Open webcast. The event, which will be presented live by the AOL Developer Network on June 29 at <a href="http://dev.aol.com/">http://dev.aol.com/</a>, will be hosted once again by a high caliber panel of coding commentary led by sportscasting celebrity Jeremy Schaap. Returning with him in the broadcast booth will be Google's John Dethridge, a former TopCoder champion and five time onsite finalist, and Ken Vogel, a 2002 quarter finalist and currently a director in equities IT with UBS.</p>

<p>On Friday, June 29, viewers will be able to visit the AOL&#174; Developer Network Web site at <a href="http://dev.aol.com/">http://dev.aol.com/</a> to watch the competition unfold live starting at 21:00 GMT. Over the course of the three hour webcast, viewers will be able to watch the high stakes software competition through live views of the arena, entertaining profiles and interviews with competitors and audience members.</p>

<p>Leading the expert panel of commentators is Jeremy Schaap. Schaap is the author of the New York Times bestsellers 'Cinderella Man' and 'Triumph: The Untold Story of Jesse Owens and Hitler's Olympics'. An ESPN anchor and national correspondent, his work has been published in Sports Illustrated, ESPN the Magazine, Time, Parade and The New York Times.</p>

<p>As well as Algorithm, Design and Development competitions, the 2007 TopCoder Open will feature Marathon Match and TopCoder Studio tournaments for the first time. In addition to the programming and graphic design championship tracks, viewers will be able to enjoy coverage of The Ball - an onsite treasure hunt that challenges competitors to follow clues and solve puzzles in the arena.</p>

<p>Thousands of the brightest students from computer science, mathematics, physics and other fields representing 92 countries from around the world have spent months locked in qualifying heats. Now the 77 finalists that are among the world's best programmers will compete against the clock and each other for a share of $260,000 in prizes.</p>

<p>"Bringing the TCO live to a global audience is an important step towards our goal of making the world's brightest computing minds household names," said Rob Hughes, President and COO of TopCoder, Inc. "Competition is the name of the game and we look forward to sharing all the excitement of this year's tournament with the online audience."</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>
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
