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
                    
	<div align="right"><tc-webtag:forumLink forumID="538784" message="Discuss this press release" /></div>
                        
<div align="center">
<p>TopCoder Community Refines Medical Kits for Future NASA Space Missions<br />
<span class="bodySubTitle"><em>International Innovation Experiment Validates ROI of Competitive Software Development as New Model for America&rsquo;s Space Agency  
</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - July 27, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, the leader in online software innovation and product development platforms, today announced the success of a pilot competition that tasked its global community of software programmers with helping to develop the next generation of capabilities NASA will need for its crews to live and work in space. Conducted by&nbsp;Harvard Business School&nbsp;and&nbsp;London Business School/MLab, the NASA-TopCoder Challenge asked TopCoder members to create improved mathematical algorithms to determine the optimal contents of medical kits for future human exploration missions. &nbsp;The experiment delivered a cost effective set of improvements to a critical NASA Space Life Science Directorate application, which will be used to reduce the risk associated with manned space flight.</p>
<p>Overall, TopCoder members delivered 2,833 distinct code submissions during the course of the competition and produced numerous enhanced solutions that NASA will adapt for use in its International Space Station missions as soon as early next year. Among the 1,095 participating, top solution providers were&nbsp;<strong>Blazde</strong>&nbsp;of the UK,&nbsp;<strong>Chokudai</strong>&nbsp;and&nbsp;<strong>Imazato</strong>&nbsp;of&nbsp;Japan,&nbsp;<strong>Marcadian</strong>of&nbsp;Indonesia&nbsp;and&nbsp;<strong>WLeite</strong>&nbsp;of&nbsp;Brazil. The competition offered&nbsp;$24,000&nbsp;in cash prizes.</p>
<p>Professor&nbsp;Karim Lakhani&nbsp;of&nbsp;Harvard Business School&nbsp;and Professor&nbsp;Kevin Boudreau&nbsp;of&nbsp;London Business School/MLab joined with TopCoder and NASA to help design the experiment and monitored and analyzed the TopCoder Marathon Match competition output and results from a distributed innovation perspective. The pilot research project was funded by grants from the&nbsp;London Business School/MLab and the&nbsp;Harvard Business School.</p>
<p>The NASA-TopCoder Challenge was the first time the TopCoder community of more than 250,000 software enthusiasts was utilized by NASA. &nbsp;Long-duration human exploration missions such as those being planned for the International Space Station, Moon, and Mars, will require higher levels of pre-planning and more analysis of available data than ever before. Physiologic modeling applications and mission simulation programs are algorithmically-intensive as flight surgeons and mission planners explore and evaluate medical scenarios that might occur on long-duration missions. Categories for analysis included Mass, Volume, Probability of Evacuation, Crew Health Index (a NASA derived number that measures the quality of crew life), and probability of loss of crew. In this experiment, competitors developed algorithms to help NASA's flight surgeons make decisions involved with optimizing the contents of the medical supplies kit that may one day be carried onboard long-duration space missions.<strong>&nbsp;</strong>The submissions were compared with the results of an existing computer model that has simulated the expected medical occurrences and outcomes for various mission scenarios.</p>
<p><strong>About NASA JSC's Space Life Sciences Directorate</strong><br>
  The Space Life Sciences Directorate (SLSD) is an organization at JSC focusing on medical, health, biology, and biotechnology related aspects of manned space flight. Its mission statement is &quot;To optimize human health and productivity for space exploration.&quot; All Space Life Sciences human health and countermeasures research, medical operations, habitability and environmental factors activities, and directorate support functions are ultimately aimed at achieving this mission. SDLS activities enable mission success, optimizing human health and productivity in space before, during and after the actual space flight experience of the flight crews, and include support for ground-based functions. For more information visit   <a href="http://www.nasa.gov/" target="_blank">http://www.nasa.gov/.</a></p>
<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest community of digital creatives with more than 250,000 members representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
