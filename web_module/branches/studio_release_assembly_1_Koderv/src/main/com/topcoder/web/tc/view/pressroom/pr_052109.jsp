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
                    
<div align="right"><tc-webtag:forumLink forumID="528372" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL/TopCoder&reg; Accessibility Developer Competition to Culminate at 2009 TopCoder Open</span><br />
<span class="bodySubTitle"><em>Winning Accessibility Application of AOL/TopCoder Sensations Developer Challenge to be Announced June 1-4, 2009 - Las Vegas, NV</em></span></p>
</div>
      
<p><strong>Dulles, VA - May 20, 2009 - </strong>AOL today announced that the AOL/TopCoder&reg; Sensations Developer Challenge will culminate at the 2009 TopCoder Open (TCO) on Monday, June 1 - Thursday, June 4, 2009 in Las Vegas, NV where the winning accessibility application developed by competition participants will be announced. AOL teamed with TopCoder, Inc., leader in online programming competitions, skills assessment and competitive software development, to encourage third party development of targeted value-add features for the disability community. Features developed will leverage core functionality surfaced through AOL application programming interfaces (APIs).</p>

<p>"The Internet and our computer applications should be friendly, convenient and easy-to-use for all, including those with disabilities," commented Mike Paciello, Sensations Advisory Board panel member and founder of The Paciello Group, a software accessibility consultancy. "The partnership between AOL and TopCoder and the Sensations Developer Challenge bring exciting accessibility awareness to the developer community, where the issue has not been reached until now. We hope this initiative will educate developers to produce tools that improve the lives of all users."</p>

<p>In January, AOL, in coordination with TopCoder, launched the Sensations challenge with the goal of having technological solutions developed by participants to enhance the accessibility of AOL products and services. In March, two submitted application concepts were selected as challenge finalists by the Sensations Advisory Board - Accessible Walking Directions for the blind and My Parents' Email Client for users with cognitive disabilities or little computer experience.</p>

<p>"Accessibility for all users has long been a commitment of AOL. We hope that actively engaging third party developers will foster innovative uses of AOL technologies to further extend the benefits Internet services can provide to consumers with disabilities," stated Tom Wlodkowski, director of accessibility at AOL. "We hope the Sensations challenge is just the beginning of what AOL and others will do to engage and bring important accessibility awareness to the mainstream developer community."</p>

<p>The Accessible Walking Directions application, powered by MapQuest’s routing functionality, is designed to provide blind travelers with a free service that can generate a more detailed set of walking directions than those typically offered in similar applications built for the mass audience. The My Parents Email Client application is geared for older individuals with aging or cognitive disabilities and little computer experience. Sometimes, older users can become overwhelmed or confused by the many features in standard e-mail clients. The challenge was to create a simple user interface for an e-mail client which makes email much easier. The winning application will initially be used for field testing to guide further refinement and consideration for future deployment.</p>

<p>Comprised of notable advocates for accessibility and the disabled, the Sensations Advisory Board was integral in the Sensations Developer Challenge, providing continuous on-line feedback and guidance to participants as well as judging and selecting the finalists. The Board includes James Gips, Egan professor of computer science at Boston College; Brad Hodges, technology program associate for the American Foundation for the Blind; Michael Paciello, founder and president of The Paciello Group; Gregg C. Vanderheiden, Ph.D., professor of Industrial and Biomedical Engineering and director of Trace R&D Center at the University of Wisconsin-Madison; Norman Williams, senior research engineer in Gallaudet University’s Technology Access Program; and AOL’s accessibility director, Thomas Wlodkowski.</p>

<p>For more information about the AOL/TopCoder Sensations Developer Challenge, visit: <a href="http://sensations.aol.com/">http://sensations.aol.com/</a>.</p>

<p>Accessibility at AOL means understanding the value of the Internet to people with disabilities and designing products and services to address compatibility with assistive technology hardware and software. Recent milestones include:
<ul>
	<li>Debut of Real-time IM, a feature in AIM 6.8 that allows users to watch IM conversations unfold one letter at a time, which is of particular value to deaf and hard of hearing users</li>
	<li>A screen reader compatible and keyboard-friendly web-based e-mail and calendar application, available at <a href="http://mail.aol.com">http://mail.aol.com</a></li>
	<li>Closed captions on select kids cartoon series, available at <a href="http://kids.aol.com/cartoons">http://kids.aol.com/cartoons</a></li>
	<li>Release of AXS, a free open source Javascript library for web developers that provides ready-made solutions for making dynamic web applications accessible, available at <a href="http://dev.aol.com/axs">http://dev.aol.com/axs</a></li>
</ul>
Learn more about AOL’s accessibility efforts at <a hef="http://corp.aol.com/corporate-citizenship/accessibility">http://corp.aol.com/corporate-citizenship/accessibility</a>.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with over 180,000 developers representing more than 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>
<p>
<em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em>
</p>

<p><strong>About AOL</strong><br />
AOL is a global Web services company that operates some of the most popular Web destinations, offers a comprehensive suite of free software and services, runs one of the largest Internet access businesses in the U.S., and provides a full set of advertising solutions. A majority-owned subsidiary of Time Warner Inc., AOL LLC and its subsidiaries have operations in the U.S., Europe, Canada and Asia. Learn more at AOL.com.</p>

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
