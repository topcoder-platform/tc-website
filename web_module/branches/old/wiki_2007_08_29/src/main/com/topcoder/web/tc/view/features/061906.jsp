<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
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
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<span class="bigTitle">How to prepare for an Assembly Competition</span><br>

      <p>
      <img src="/i/m/hohosky_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="16096823" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>

We all know that the software development style of TopCoder Software is component-based, and many TopCoder members participate in the weekly component competitions, but designing or developing a single component doesn't really convey the essence of component-based software. Fortunately, TopCoder brings us Assembly Competition. By participating in this competition, you can learn how to create real applications using completed components &mdash; and, in my opinion, creating a real application is a lot more exciting and interesting than creating just one component.
<br><br>
As team captain of the winner team of TopCoder's first Assembly Competition, I would like to offer some tips and experience for helping the future teams.
<br><br>
<span class="bodySubtitle">1. Create or join a team</span><br>
To participate in Assembly Competition, first you need a team. You can choose to be a member of an existing team, by being a free agent, or you can form your own team and be a team captain. How many people should be on your team? I think two to four members, including the team captain, is appropriate. Having too many members on your team will lead to lots of unnecessary communication and decrease the earning of each team member. To decide who you would like to form a team with, my suggestion is to choose the members with the highest design and/or development ratings.
<br><br>
<span class="bodySubtitle">2. Review the specification, then review it again</span><br>
Before your team starts the coding work, you should read the all the documentations carefully, especially the Requirement specification and Design specification. My suggestion is to keep reading them until you can remember and understand every item. If you don't understand an item in the requirements or in the forum posts, post your questions to the forum. Even if you have the slightest doubt, it's worth it to post a question to the forum to confirm that you are thinking along the right lines. The Architect or PM will answer your questions within 24 hours &mdash; they may respond quicker than this, but you should always allow time to discuss their answer and ask follow-up questions. In practice, this means get your questions in as early as possible, otherwise you may run out of time.
<br><br>
<span class="bodySubtitle">3. Understand all the needed components</span><br>
The Component Interface Diagram defines the required interfaces for all components of the application. You should download all the components defined in the diagram from software.topcoder.com and spend some time getting familiar with each of them. At the least, you should know what each component does, and what interface each component provides to finish certain tasks. This is very important, and will make the next steps much easier. Also, you should note that you are REQUIRED to use all the provided components, otherwise you will be scored down by the reviewer for avoiding using components.
<br><br>
<span class="bodySubtitle">4. Prepare the development environment</span><br>
You should set up an environment like the one specified in the "environment" section of the Requirements. By doing this, you can ensure that your submission can be successfully deployed on TopCoder's test environment of TopCoder. Then you should prepare all needed third party lib such as servlet-api, log4j, JDBC drivers, etc. Writing an auto-deploy ant script will make your deployment and testing that much easier.
<br><br>
<span class="bodySubtitle">5. Follow the interface diagram</span><br>
You can add additional helper class when coding, but you should make sure to implement all of the required interfaces, exactly as specified. Test cases will be developed based on these specific interfaces, so it's essential to follow the interface diagram.
<br><br>
<span class="bodySubtitle">6. Deal with component bugs</span><br>
Occasionally, there are certain bugs in the component you are using, such as a resource leak (e.g. not close the DB connection), thread-safe problems, etc. When you find bugs when assembling, immediately post a message to the forum and contact the PM. They will fix any issues with the component and, if necessary, extend the timelines. Note: you should NOT make the fix yourself without bringing it up to the PM.
<br><br>
<span class="bodySubtitle">7. Request component enhancements</span><br>
Sometimes, you will find a certain component can not satisfy the functionality it should provide. In this situation, you should contact the PM immediately, and tell them which function you think should be added, so that they can get the components fixed and back to you. Note: you should NOT make any modifications on the component by yourself without bringing it up to the PM.
<br><br>
<span class="bodySubtitle">8. Convert the prototype</span><br>
Prototype pages will be provided in assembly documentation, and your team will be responsible for converting these HTML pages into the specified front-end technology, such as JSP or ASPX. All the details in the prototype should be followed exactly, otherwise you may be scored down by the reviewer. 
<br><br>
<span class="bodySubtitle">9. Don't stop refactoring</span><br>
Team members should keep refactoring the code mercilessly during the assembly. This will keep the design simple and help you avoid needless clutter and complexity. Keep your code clean and concise so it is easier to understand, modify, and extend. Make sure everything is expressed once, and only once. By doing this, you will save yourself time when you fix bugs and add required functionality &mdash; and you will make your work a lot more appealing to reviewers.
<br><br>
<span class="bodySubtitle">10. Test thoroughly</span><br>
All the public class should have its corresponding unit tests, manual tests should also be done according to the all test scenarios specified in the TestScenarios documentation. Make sure your tests are thorough, and manual tests cover all the test scenarios, since your submission will also be run against several test suites (functional tests) from another software testing competition.
<br><br>
<span class="bodySubtitle">11. Challenge the test cases</span><br>
TopCoder has another software testing competition to go hand-in-hand with the assembly competition. So when testing competition finishes, you can download several test suites to run against your submission. These test suites are all functional tests. Some of them may be invalid, so you have a chance to challenge them; you will need to write a list of test cases you believe are invalid, and give a succinct and accurate appeal to each test case you believe is wrong.
<br><br>
<span class="bodySubtitle">12. Write a detailed deployment guide</span><br>
It's very important to write a highly detailed deployment guide to make sure the TopCoder staff can deploy your submission successfully on their environment. In the guide, you should mention the organization of your submission (directory structure, description of each file), describe how to set up the required servers (such as application server, database server), and include detailed comments of configuration files. You should also give a list of the configuration parameters that need to modify and an auto-deploy build script which will make the deployment work easier.
<br><br>
<span class="bodySubtitle">13. Review and understand the assembly scorecard</span><br>
Before you start, you should review the <a href="/tc?module=Static&d1=dev&d2=assembly&d3=sampleScorecard">assembly scorecard</a>, and make sure you understand each item well so that you can make a high-quality submission.
<br><br>
Follow these thirteen guidelines as well as you can, and you and your team will have a much better shot in the next Assembly Competition.
<br><br>
<i>Watch for the next Assembly Competition, coming next month!</i>
<br><br>




        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
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
