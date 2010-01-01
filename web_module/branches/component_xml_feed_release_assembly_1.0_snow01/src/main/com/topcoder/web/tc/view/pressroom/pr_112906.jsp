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
                    
<div align="right"><tc-webtag:forumLink forumID="506191" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder to Present Keynote Address: Future of Virtual<br> Communities as Business; at Gartner CIO Summit 2006</span><br />
<span class="bodySubTitle"><em>Jack Hughes, TopCoder Chairman and Founder To Discuss Managing Social Network <br>Web Communities as a New Model for Global Productivity</em></span></p>
</p>
</div>
      
<p><strong>Glastonbury, Conn., November 28, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that TopCoder Chairman and Founder Jack Hughes will present the keynote address at the 2006 Gartner CIO Summit on December 10th at the LaCosta Resort and Spa, Carlsbad, California. For more information visit <A href="<tc-webtag:linkTracking link="http://www.gartner.com/2_events/conferences/cios1.jsp" refer="pr_112906"/>" target="_blank">http://www.gartner.com/2_events/conferences/cios1.jsp</A>
<br><br>
One of the more profound paradigm shifts taking place in business today is the evolution of the traditional corporate enterprise into the "new corporation" structured around virtual communities. The presentation at the Gartner CIO Summit from Mr. Hughes will provide a rare first-hand account of the implications of this new frontier, and explain how TopCoder created its proprietary community infrastructure, how it manages the community's deliverables, and the numerous ways in which it has succeeded in benefiting its members and its clients.
<br><br>
Founded in April, 2001, TopCoder was established with the purpose of identifying top computer software engineers world-wide. Since then, the company's worldwide membership has grown to almost 100,000 developers in more than 200 countries. In a best-solution-wins format, through its contests, tournaments and competitive software development methodology, TopCoder identifies and accesses the development skills of thousands of developers from around the globe to be applied to software development needs for clients such as Google, AOL, Philip Morris (Altria Group, Inc.), GEICO, ESPN, VeriSign,  AOL and Polo.
<br><br>
In November 2000, Mr. Hughes founded TopCoder on the premise that talent and skill are the determinant factors in the quality and utility of software-and that software has become central to the global economy.  Based on over 20 years of experience, Mr. Hughes recognized that while successful projects were driven by superior programming skills, the talent was unqualified and largely unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industries best and brightest, and build opportunity and community for programmers through ongoing programming tournaments and employer connections. Numerous articles on TopCoder have appeared in BusinessWeek, The Wall Street Journal and other business publications.  Former Fast Company editors Bill Taylor and Polly LaBarre profile Hughes and TopCoder in their current business best seller "Mavericks at Work".
<br><br>
<span class="bodySubtitle">About the conference </span><br>
Gartner CIO Summit 2006 is an exclusive gathering for CIOs on the forefront of business and technology. Limited in size, tightly focused and highly interactive, it offers a unique exchange of information and insight unduplicated at other CIO-level events. Analyst presentations are complemented by intensive, hands-on workshops professionally facilitated to ensure a thorough peer-to-peer exploration of the issues, trends and technologies challenging your enterprise. 
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
