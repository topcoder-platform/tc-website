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
                    
	<div align="right"><tc-webtag:forumLink forumID="532572" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces "Mission Impact" Marathon Matches for National Security Agency</span><br />
<span class="bodySubTitle"><em>$3,000 Competitive Computer Programming Event Seeks Innovative Thinkers and Problem Solvers</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - December 2, 2009</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, today announced the NSA Mission Impact Marathon Match events, a series of computer programming competitions hosted by TopCoder and made possible by patron National Security Agency (NSA). The first of four classic TopCoder 'Marathon Match' formatted competitions begins today and is open to all TopCoder members in good standing, and will offer $3,000 in prize money for the top 5 highest scoring U.S. citizens. For complete details, free registration and access to the problem statement, visit <a href="http://www.topcoder.com/nsa">www.topcoder.com/nsa</a>.</p>

<p>"In the current environment of heightened sensitivity surrounding cyber security, TopCoder is actively involved with several agencies to help increase their capacity and ability to address technical challenges that impact our national interests," said Rob Hughes, president and COO of TopCoder, Inc. "At a very early stage, NSA recognized the unique talent and skills represented by the TopCoder community and has been a strong and highly valued patron of both our online and onsite events."</p>

<p>NSA is the longest continuing patron of TopCoder competitions having previously supported the past three TopCoder Open events (2006-2008) and the 2005 and 2006 TopCoder Collegiate Challenge events.</p>

<p>For more information about the National Security Agency, please visit <a href="http://www.NSA.gov">www.NSA.gov</a>.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world’s largest competitive software development community with more than 225,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
