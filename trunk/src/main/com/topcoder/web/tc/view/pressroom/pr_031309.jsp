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
                    
<div align="right"><tc-webtag:forumLink forumID="526937" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Crowdsourcing Guru Jeff Howe Interview with TopCoder</span><br />
<span class="bodySubTitle"><em>Crowdsourcing and Which Business Models Will Succeed</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. - March 13, 2009 -</strong>TopCoder, Inc. recently engaged <a href="http://crowdsourcing.typepad.com/" target="_blank">Jeff Howe</a>, the best-selling author and <a href="http://www.wired.com" target="_blank">WIRED</a> contributing editor, for a one-on-one interview looking at crowdsourcing in today's economy, and exploring what business models are likely to succeed in the future. TopCoder is featured as a success story and case study in Howe's book, <a href="http://www.randomhouse.com/catalog/display.pperl?isbn=9780307396204" target="_blank">"Crowdsourcing: Why the Power of the Crowd is Driving the Future of Business,"</a> providing insight into the TopCoder Company and community that lends unique perspective to the interview </p>

<p>"TopCoder, frankly, is one of my models I use when I talk to people - you want to know how to build a community? Look at what these guys did," says Howe in the TopCoder interview. "They spent years and they served the community first - what will the community think is fun? What do our people like to do?"</p>

<p><strong>Read the full interview at:</strong> <a href="http://www.topcoder.com/direct/blogs/?p=174" target="_blank">http://www.topcoder.com/direct/blogs/?p=174</a></p>

<p>In speaking with TopCoder, Howe touches upon the impact of the current credit crisis, which hadn't yet hit when the book went to press, and the stark reality that many crowdsourcing ventures will fail. Howe explores what motivates the crowd to participate in crowdsourcing projects, and the incentive required for success, in exploring what the future may hold for crowdsourcing.</p>

<p>Howe also explores the unique element of competition that TopCoder brings to crowdsourcing, the very core of TopCoder's model. He compares and contrasts the more traditional straight-forward tasks of most crowdsourcing initiatives, with TopCoder's model of building comprehensive software applications and robust technologies that combine many, even hundreds of tasks.</p>

<p>In the interview, Howe continues, "There's a reason that TopCoder has succeeded and you can look at the inverse of that and say well there's a reason that a lot of companies have failed - because they're not going to put in that kind of time."</p>

<p><strong>Read More on TopCoder in Howe's best-selling book:</strong><br />
Jeff Howe's <a href="http://www.randomhouse.com/catalog/display.pperl?isbn=9780307396204" target="_blank">crowdsourcing</a> book examines the growing trend of mass collaboration and the wisdom of the crowd as a new force in business. In the section Community at Work, Howe follows the growth of TopCoder from its beginnings as a niche online destination for a small handful of competitive programmers to the full-fledged software factory and global community of 185,000 developers and creative technologists it is today. From the book:</p>

<p><em>Hughes and company could have been following the crowdsourcing playbook, except of course that no such thing existed. In 2003 TopCoder was basically sui generis, employing a model that Hughes would come to call "competitive collaboration". "There was no crowdsourcing. No wisdom of crowds. We weren't applying theory," says Hughes. "We were a science experiment!" </em></p>

<p><strong>About TopCoder, Inc.</strong><br /> 
TopCoder is the world's largest competitive software development community with more than 187,000 developers representing over 200 countries. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/" target="_blank">http://www.topcoder.com/</a>. 


<p>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
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
