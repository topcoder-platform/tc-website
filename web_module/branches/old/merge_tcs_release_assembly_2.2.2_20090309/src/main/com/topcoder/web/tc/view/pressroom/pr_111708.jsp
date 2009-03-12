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
                    
<div align="right"><tc-webtag:forumLink forumID="524546" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">RIBBIT'S KILLER APP CHALLENGE<br />LAUNCHES AT ADOBE MAX</span><br />
<span class="bodySubTitle"><em>Flash and Flex Developers Invited by World's First Global,<br />Programmable Phone Company to Create the Next Killer Voice Applications</em></span></p>
</div>
      
<p>
<strong>SAN FRANCISCO (Adobe MAX Conference) November 17, 2008 &#151;</strong>Ribbit, Silicon Valley's first phone company, today announced it is partnering with competitive software development community TopCoder to offer the Killer App Challenge, a chance for developers to create the next killer application on the Ribbit open platform for integrating voice communications in applications, web sites, and communities. The competition begins immediately and will conclude in March 2009. Cash prizes totaling $100,000 will be awarded to the most compelling, creative, and useful application in each of five development categories, as well as a grand prize for the best overall entrant. Full contest details can be found at <a target="_blank" href="http://www.ribbit.com/killerappchallenge">www.ribbit.com/killerappchallenge</a>.
</p>

<p>
"The latest version of our telephony platform brings even more incredible features into Rich Internet application development. We want to give developers the power to add valuable voice features to their existing apps and spark innovation towards creating applications never seen before," said Chuck Freedman, Director of Developer Platform at Ribbit. "The Killer App Challenge is an unparalleled opportunity for creative professionals, developers and entrepreneurs to have their ideas launched on this global stage. We're looking for the kind of apps that will improve interactions between business and user, help brands better interact with their audiences, and evolve social networking into the next level of essential communication."
</p>

<p>
The Ribbit platform - a carrier-grade telephony-plus-software infrastructure with a community of 7,000-plus application developers - is enabling enterprises to completely rethink the way they manage their customer relationships via voice. By treating voice as a data object, Ribbit lets developers add feature-rich voice capabilities to any application, on any device - capabilities such as updating records by phone, integrating voice and messages into a single workflow, and initiating many automated processes via voice command.
</p>

<p>
The five contest categories are:<br />
<ul>
    <li><strong>Media, Advertising and Entertainment</strong> - Add unprecedented interactive value to a media campaign by captivating a target audience through rich voice capabilities</li>
    <li><strong>Social Networking and Communication</strong> - Create a Web 3.0 preview application that connects people via Open Telephony</li>
    <li><strong>Business and Productivity</strong> - Integrate voice and rich communication features into a business application workflow</li>
    <li><strong>Carrier, Network, or ISP Integration</strong> - Integrate innovative voice capabilities into an existing cable, carrier, mobile network, or ISP</li>
    <li><strong>Wildcard</strong> - Create an application that uses voice to improve the usability of any device or interface, from vending machines to ticket kiosks</li>
</ul>
</p>

<p>
Developers retain full ownership of their applications, so even those applications not chosen as a contest winner can be deployed to deliver exciting new voice capabilities to customers, partners and employees. For a complete description of the rules and prizes of the Ribbit Killer App Challenge, visit <a target="_blank" href="http://www.ribbit.com/killerappchallenge">www.ribbit.com/killerappchallenge</a>.
</p>

<p>
"As the world's largest competitive software development community with more than 175,000 developers representing more than 200 countries, our goal is to encourage and support opportunities for our members to directly benefit from their inventions," said Rob Hughes, president and COO at TopCoder. "Ribbit is a very rich, open platform that has already inspired developers to create innovations that are transforming the way companies conduct business. We anticipate the Ribbit's Killer App Challenge will generate several game-changing innovations, and we're very pleased that these talented developers will be rewarded for their efforts."
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with over 175,000 developers representing more than 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards-based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

<p>
<span class="bodySubtitle">About Ribbit</span><br />
Ribbit is Silicon Valley's first phone company. Our mission is to liberate voice from devices, and integrate it into the workflow of life, both business and personal. By providing a world-class telephone carrier infrastructure and the first open platform for Internet and voice developers, we foster innovation across the entire telephony marketplace, from the development of leading-edge consumer voice services to the integration of voice with the world's best business applications.<br /><br />
Ribbit is headquartered in Mountain View, Calif. Ribbit is a wholly owned subsidiary of BT. For more information about Ribbit, please visit <a target="_blank" href="http://www.ribbit.com">www.ribbit.com</a>.
</p>

<p>
<strong>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</strong>
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
