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
                    
<div align="right"><tc-webtag:forumLink forumID="526936" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Julian Birkinshaw of London Business School Interview with TopCoder</span><br />
<span class="bodySubTitle"><em>Exploring the Impact of Web 2.0 upon Management</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. - March 17, 2009</strong> - TopCoder, Inc. recently sat down with <a href="http://www.london.edu/facultyandresearch/faculty/search.do?uid=jbirkinshaw" target="_blank">Julian Birkinshaw</a>, Professor of strategic and international management at the <a href="http://www.london.edu/index.html" target="_blank">London Business School</a>, to discuss changes underway in the nature of management brought on by evolution of how workers interact and use information through Web 2.0 technologies. TopCoder interviewed the noted academic, author and management theory guru, to explore the hallmarks of the Gen Y worker, and how their approach to the use of technology in the workplace will enable big changes in our approach to management.</p>

<p><strong>Read TopCoder's interview with Julian Birkinshaw online at:</strong> <a href="http://www.topcoder.com/direct/blogs/?p=206" target="_blank">http://www.topcoder.com/direct/blogs/?p=206</a></p>

<p>"TopCoder's management model is a fascinating exemplar of how we can rethink the basic principles of management - away from old notions of hierarchy, bureaucracy, and extrinsic rewards, and towards newer concepts like crowdsourcing, self-organization, and intrinsic forms of motivation," says Birkinshaw in the interview.</p>

<p>The conversation expands upon roundtable discussions begun with TopCoder's CEO Jack Hughes on-stage at the London Business School's Management Lab <a href="http://www.managementlab.org/node/289" target="_blank">Innovation in the Workplace</a> conference. Birkinshaw provides additional insight into the challenges facing organizations that are building and working through online communities.</p>

<p>"TopCoder was created with this highly-distinctive management model, so its DNA is unusual," explains Birkinshaw.  "People accept that TopCoder is not going to do things by the old rules."</p>

<p>For additional insight, Julian Birkinshaw wrote a recent article relating to the topic, entitled, <a href="http://sloanreview.mit.edu/the-magazine/articles/2009/winter/50216/what-is-your-management-model/" target="_blank">"What is your management model?"</a> that appeared in the winter 2009 issue of MIT Sloan Management Review. In the article, Birkinshaw highlights TopCoder as a case study in his discussion of four management models that may offer a path to competitive advantage. The article confronts hidden assumptions about the very nature of how work and management can be done. </p>

<p><strong>Julian Birkinshaw</strong> is a professor of strategic and international management at the London Business School, and Deputy Dean responsible for degree programmes.  He is also co-founder of the <a href="http://www.managementlab.org/" target="_blank">Management Lab</a>, a unique academic-business collaboration focused on accelerating the evolution of management.</p>

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
