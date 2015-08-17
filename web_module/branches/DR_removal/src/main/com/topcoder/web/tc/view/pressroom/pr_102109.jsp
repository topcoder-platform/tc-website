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
                    
	<div align="right"><tc-webtag:forumLink forumID="531604" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces Experimental Crowdsourcing Competition to Benefit Human Space Flight</span><br />
<span class="bodySubTitle"><em>NASA-TopCoder Challenge Seeks Software Programmers to Write Algorithms That Identify Optimal Contents of Emergency Medical Kit for Future Missions</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - October 21, 2009</strong> - <a href="http://www.topcoder.com">TopCoder &reg;, Inc.</a>, in cooperation with NASA Johnson Space Center's (JSC) Space Life Sciences Directorate (SLSD), today announced the opening of registration for the NASA-TopCoder Challenge, an experimental programming competition to develop algorithms which would help NASA's flight surgeons make better decisions on what might be included in the medical supplies kit of future long-term human space missions. The online competition runs November 4th - 14th, and is open to all TopCoder members, but is limited to only 480 registrants. More than $24,000 in total cash and prizes is at stake. For full registration information and rules, visit: <a href="http://www.topcoder.com/nasacontest">www.topcoder.com/nasacontest</a></p>

<p>Professor Karim Lakhani of Harvard Business School and Professor Kevin Boudreau of London Business School and M-Lab have joined with TopCoder and NASA to help design the experiment and will monitor and analyze the TopCoder Marathon Match competition output and results from a distributed innovation perspective. The research project is funded by grants from the London Business School M-Lab and the Harvard Business School.</p>

<p>"We are both excited and extremely proud to have the TopCoder community participate in this unique experiment," said Rob Hughes, president and COO of TopCoder, Inc. "Space flight has long captured the imagination of humankind, and this competition marks a new and innovative paradigm for scientific inclusion and global participation."</p>

<p>The NASA-TopCoder Challenge will be the first time the TopCoder community of more than 220,000 software enthusiasts is utilized by the world's leading aerospace organization. Long-term human space missions such as those being planned for Mars, will require higher levels of pre-planning and more analysis of available data than ever before. Biometric modeling and simulation programs are algorithmically-intensive as flight surgeons explore and evaluate every possible medical scenario that might occur on long-term missions. In this experiment, competitors will develop algorithms to help NASA's flight surgeons make decisions involved with optimizing the contents of the medical supplies kit that may one day be carried onboard long-term space missions. The submissions will be compared with the results of an existing computer model that has simulated the expected medical occurrences and outcomes for various mission scenarios.</p>

<p><strong>About NASA JSC's Space Life Sciences Directorate</strong><br />
The Space Life Sciences Directorate (SLSD) is an organization at JSC focusing on medical, health, biology, and biotechnology related aspects of manned space flight. Its mission statement is "To optimize human health and productivity for space exploration." All Space Life Sciences human health and countermeasures research, medical operations, habitability and environmental factors activities, and directorate support functions are ultimately aimed at achieving this mission. SDLS activities enable mission success, optimizing human health and productivity in space before, during and after the actual space flight experience of the flight crews, and include support for ground-based functions. For more information visit <a href="http://www.nasa.gov/">http://www.nasa.gov/</a></p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with nearly 200,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
