<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder&#174; Announces First Software Developer Conference at 2005 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>Component-Based Development Best Practices, Component Reuse and Competitive Strategies for Software Development on Schedule for Inaugural Santa Clara Event</em></span></p>
                        </p>
                        </div>
                        
<p><strong>GLASTONBURY, CT, September 2, 2005 &#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced its first ever Software Developer Conference will be held October 13th and 14th at the Santa Clara Marriot in Santa Clara California. Hosted by TopCoder Software, <A href="http://software.topcoder.com">http://software.topcoder.com</A>, the conference will focus on Component-Based Best Practices and how to create successful reuse programs on the enterprise level. The program is designed to run concurrently with the finals of the 2005 TopCoder Open World Championship of Programming sponsored by Sun Microsystems, also taking place at the Santa Clara Marriot October 12th through 14th. For complete schedule and registration details visit: <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=dev_conferences">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco05&d3=dev_conferences</A>.
<br><br>
Attendees will be invited to participate in an open forum with lead technologists from TopCoder, clients and TopCoder Open finalists discussing real world examples of how to use components to achieve over 70% reuse in an application.  Not only will these conversations focus on improving Component-Based Development techniques, they will also explore the technical details of specific areas of component reuse.
<br><br>
<span class="bodySubtitle">Software Development Conference Schedule</span>
<br><br>
<b>Thursday, October 13th 10:15AM - 10:45AM<br>
Hot Coffee with RFID</b><br>
RFID (Radio Frequency IDentification) is one of the hot topics in the industry today.  Blending cutting edge technology into a small operation provides an interesting and exciting edge to the small business.  In this case study, TopCoder will illustrate how a future-facing coffee shop incorporated RFID technology into their ordering process.  A high level overview of the RFID benefits and pitfalls of the technology will be presented.
<br><br>
<b>2:15PM - 2:45PM<br>
Mobile Components and J2ME </b><br>
This session will discuss techniques for rapid development of applications for transferring and storing information on standards based J2ME-enabled phones, smart phones and other wireless devices. Focus will address why it is extremely important to provide a fast, efficient method to transfer data between the server and the handheld device.
<br><br>
<b>4:15PM - 4:45PM<br>
TopCoder Solutions: Identity & Access Management</b><br>
Most people think of security as restricting access to information, but when done correctly the greatest value is realized by increasing the flow of appropriate information to the appropriate people.
<br><br>
Learn how you can utilize TopCoder's Component-Based Methodology to provide a flexible, standardized based solution that helps you to enforce security policies, improve accessibility and reduce maintenance cost while working with industry leading security products. 
<br><br>
<b>Friday, October 14, 2005<br>
11:30AM - 12:00PM<br>
JavaServer Faces Round Table</b><br>
TopCoder Software project managers will host a round table discussion on the advantages of using JavaServer Faces components in your web application.  The conversation will focus on creating JSF components and integrating your custom JSF components with Java Studio Creator.  Learn about a great new emerging technology and one of the best tools to integrate the technology into your application.
<br><br>
<span class="bodySubtitle">2005 TCO Component Competition</span><br>
The 2005 TopCoder Open Component tournament will run simultaneously with the Software Conference, allowing attendees the chance to observe competitors as they submit component designs that adhere to strict project specifications and development solutions for those designs. In addition, TopCoder's Architecture and Design Review Boards will be available onsite to discuss the peer review process and guidelines. 
<br><br>
"TopCoder Software is hosting a rare opportunity to interface for two days with some of the brightest developers in the industry and to discuss development issues facing application areas such as identity management, RFID and wireless," said Mike Morris, VP Software Development at TopCoder. "If your organization has invested in code reuse and is looking to dramatically shorten timelines and decrease costs, these workshops will outline the methodology and strategy for success." 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
                        </p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
