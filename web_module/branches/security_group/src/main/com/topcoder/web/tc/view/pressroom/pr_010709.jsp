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
                    
<div align="right"><tc-webtag:forumLink forumID="525296" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder to Keynote MLab Conference on Innovation in the Workplace at London Business School</span><br />
<span class="bodySubTitle"><em>Jack Hughes, TopCoder Founder, Shares Management Insights, Joining Exploration of How the Internet Revolution is Changing the Way Work is Done</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. and London – January 7, 2009 –</strong>TopCoder, Inc., today announced that Chairman and Founder Jack Hughes will present the keynote address for the prestigious London Business School's Management Lab (MLab) conference on Innovation in the Workplace. Bringing together an international lineup of C-level execs with highly-innovative management models, the conference will explore the impact of Web 2.0 and Generation Y employees on the changing global workplace, and takes place on January 28, 2009 at the London Business School.</p>

<p>"The second wave of the Internet Revolution is having an enormous impact on the way we interact with each other online and the ways we perform and manage work," said Professor Julian Birkinshaw, co-founder of MLab at London Business School. "The influx of Generation Y employees who were born into a high-tech, digital world brings different expectations about what constitutes an exciting and worthwhile work environment, presenting many new management challenges. TopCoder was one of the first business models to embrace a global, virtual workforce and Jack Hughes brings a unique perspective on the potential of these trends as we transition toward a radically different workplace of the future."</p>

<p>The MLab conference brings together a powerful lineup of CEOs and thought leaders to explore how Web 2.0 and Generation Y employees are impacting innovation in the workplace. In addition to Jack Hughes' keynote, the full program will feature: Sherman Rowland, CEO of Co-thrive; Don Sull, Professor, London School of Business; Bruce Raynor, CEO of You at Work; Ross Smith, Director of Testing solutions, Microsoft; Julian Birkinshaw, MLab, and Peter Cheese, Managing Director of Accenture.</p>


<p>"We're entering a new world in which you can work for anyone at any time, even for more than one employer in the same day. The new workplace focuses on creating an environment which allows an individual's top skills and interests to be accessed by those willing to pay the most for it," said Jack Hughes of TopCoder. "The global impact of open marketplaces on the Internet means those performing tasks can choose the work they like, rather than what they have to do, with employers willing to pay more for the specialized expertise and talent that drives their business. These global online communities of professionals are thriving, but harnessing the power presents dynamic new management challenges."</p>

<p>Hughes will share insights and first hand experiences from building TopCoder into the world's most elite global community of more than 180,000 software developers and creative professionals. One of the more profound management paradigm shifts taking place in business today, TopCoder is leading the evolution of the traditional corporate enterprise into the "new corporation" structured around virtual communities. Hughes will provide a rare first-hand account of the implications of this new frontier, including success stories and significant challenges faced since the company's founding in 2001. </p>

<p><strong>Registration for the Conference</strong><br />
To register or learn more about the MLab conference and London Business School, please direct inquiries to <a href="mailto:rrobertson@london.edu">rrobertson@london.edu.</a> </p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with over 180,000 developers representing more than 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">http://www.topcoder.com</a>.</p>
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
