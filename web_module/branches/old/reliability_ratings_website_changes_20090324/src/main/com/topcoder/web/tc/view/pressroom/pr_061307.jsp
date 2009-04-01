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
                    
<div align="right"><tc-webtag:forumLink forumID="516186" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Community Helps Research Led by Harvard Business School Professor</span><br>
<span class="bodySubTitle"><em>Global Community of Computer Programmers to Contribute to Study on Distributed Innovation</em></span></p>
</div>
      
<p><strong>GLASTONBURY, Conn., June 13, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that its global community of members will help Professor Karim Lakhani of the Harvard Business School with his research agenda by providing access to their skills in innovative software development.</p>

<p>The TopCoder community will compete in a Wikipedia analysis contest which will aid Professor Lakhani's research on distributed innovation systems and the movement of innovative activity to the edges of organizations and into communities (see <a href="<tc-webtag:linkTracking link='http://courseware.hbs.edu/public/cases/wikipedia/' refer='pr_061307' />">http://courseware.hbs.edu/public/cases/wikipedia/</a> for more details on the project).</p>

<p>Lakhani is a professor at the Harvard Business School where he does research on distributed innovation systems and the movement of innovative activity to the edges of organizations and into communities. He has extensively studied the emergence of open source software communities and their unique innovation and product development strategies.</p>

<p>"TopCoder is excited to be assisting Prof. Lakhani in this research as we have long been proponents of the wisdom of our community and the concept of the collaborative meritocracy as the new model for global business," said Mike Lydon, CTO of TopCoder, Inc. "We are looking forward to contributing to this interesting and timely work."</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology.<br><br>
TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/">http://www.topcoder.com/.</a></p>

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
