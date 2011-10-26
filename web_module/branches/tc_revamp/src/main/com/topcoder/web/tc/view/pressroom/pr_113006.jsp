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
                    
<div align="right"><tc-webtag:forumLink forumID="506193" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AOL and TopCoder Announce Web AIM Mashup Competition</span><br />
<span class="bodySubTitle"><em>Top Prize of $5,000 for Developer With Most Innovative Web AIM Mashup Concept</em></span></p>
</p>
</div>
      
<p><strong>Dulles, VA, November 30, 2006 &#151;</strong>AOL and TopCoder, Inc., a leader in online programming competition, skills assessment and competitive software development, today announced a call for entries for the Web AIM Mashup Competition. Developers submit original concepts for Web applications based on Web AIM, AOL's new APIs that enable users to mashup and integrate Web-based instant messaging functionality for the popular AIM service directly into their Web sites and online communities.
<br><br>
Developers are asked to design a graphical user interface or submit a written explanation in order to clearly convey their mashup concept using the new Web AIM APIs. Contest entries will be judged on creativity, ease of use, market potential and ability to be shared with other users online. All submissions are due by December 6, 2006. 
<br><br>
Finalists will be selected on December 13, 2006. AOL will choose the winner from the finalists who participate in the Review and Revision phase, in which AOL works with each designer finalist to refine their idea. The winner will be announced on January 9, 2007 and will receive a grand prize of $5,000. For contest details and rules, visit: <A href="http://studio.topcoder.com/" target="_blank">http://studio.topcoder.com/</A>. 
<br><br>
Web AIM&#174; provides developers with the tools they need to create new and innovative experiences on the Web. The Web AIM APIs enable developers to mashup and integrate the following services and functionality directly into their Web sites: 

<ul>
<li><b>Presence</b>, to let AIM&#174; users get and set their availability, away message and profile. Friends visiting their site can view users online, idle and away times.</li>
<li><b>IM Window</b>, to enable AIM users to send and receive IMs right from their Web page.</li>
<li><b>Buddy List</b>, to let AIM users view their own Buddy List&#174; feature.</li>
<li><b>Expressions</b>, to let AIM users access and edit their buddy icons, wallpaper, smileys, and sounds.</li>
</ul>

Entrants may also create mashup concepts using the new AIM&#174; Whimsicals<sup><small>TM</small></sup>, embeddable Web-based AIM widgets, which enable developers and AIM users to easily integrate AIM functionality into their Web sites with just a few lines of HTML. These include:</li>
<ul>
<li><b>IM Window</b>, which enables users to send and receive IMs. The sender's online presence is indicated to the recipient only.</li>
<li><b>Buddy List</b>, which enables AIM users to create mashups with their Buddy List based on user-defined criteria. In addition, this widget allows AIM users to see buddy info, including online, idle and away time, user profile and away message on screen name mouse-over.</li>
<li><b>Get Info</b>, which displays the AIM user's availability, away message, profile and buddy icon via a separate window.</li>
</ul>
Made available earlier this month, the new Web AIM APIs are an extension of AOL's Open AIM program, which launched in March 2006. They are available at  <A href="<tc-webtag:linkTracking link="http://developer.aim.com" refer="pr_113006"/>" target="_blank">http://developer.aim.com</A>
<br><br>
The Open AIM&#174; program empowers companies, communities and independent developers to build customized plugins, communications clients and mashups that access AOL's global instant messaging network. To date, more than 50,000 developers have registered for the Open AIM&#174; initiative.
<br><br>
AOL provides a range of resources for developers to build customized third-party applications, plug-ins and mashups based on its leading products and services. For more information about available open APIs, tools and documentation for services such as Open AIM&#174;, AIM&#174; Pages, AIM&#174; Phoneline, AOL&#174; Video Search, MapQuest&#174;, Winamp&#174; and others, please visit <A href="<tc-webtag:linkTracking link="http://dev.aol.com/" refer="pr_113006"/>" target="_blank">http://dev.aol.com/</A>.
<br><br>
<span class="bodySubtitle">About the AIM&#174; Service</span><br>
The AIM&#174; service (<A href="<tc-webtag:linkTracking link="http://www.aim.com" refer="pr_113006"/>" target="_blank">http://www.aim.com</A>) is at the center of one of the largest and most dynamic online and mobile communities. It provides developers with an open and modular platform for development and access to more than 42 million Americans at <A href="<tc-webtag:linkTracking link="http://developer.aim.com" refer="pr_113006"/>" target="_blank">http://developer.aim.com</A>. The AIM service is where users go to find their friends and manage their social lives through instant messaging, email and mobile texting as well as robust voice and video services. 
<br><br>
<span class="bodySubtitle">About AOL</span><br>
AOL is a global Web services company that operates some of the most popular Web destinations, offers a comprehensive suite of free software and services, runs the country's largest Internet access business, and provides a full set of advertising solutions. A majority-owned subsidiary of Time Warner Inc. AOL LLC is based in Dulles, Virginia. AOL and its subsidiaries also have operations in Europe, Canada and Asia. Learn more at <A href="<tc-webtag:linkTracking link="http://www.aol.com" refer="pr_113006"/>" target="_blank">AOL.com</A>. 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">www.topcoder.com</A>.
<br><br>
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
