<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
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

<div align="right"><tc-webtag:forumLink forumID="505831" message="Discuss this press release" /></div>

<div align="center">
<p><span class="bodyTitle">TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million</span><br />
<span class="bodySubTitle"><em>Contributions to TopCoder Software Competitions and Projects Show Attractive Returns for Global Programming Community from Countries Including China, Russian Federation and Romania As Royalty Payments Grow</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, November 21, 2005 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that payments to winners of component design and development competitions in 2005 to date have yielded over $1,000,000 in prize earnings. TopCoder competitions have produced 340 new generic and 360 new custom .NET and Java components for the TopCoder Software catalogs. This represents an increase of more than 277 percent over payments made to members during the same period in 2004. In addition, TopCoder Software application projects have paid out a total of more than $430,000 to winners this year with all-time royalty payments passing the $53,000 mark. 
<br><br>
"The strength of TopCoder, simply put, is the TopCoder community - that's what makes us unique and successful," said Jack Hughes, Chairman and Founder of TopCoder, Inc. "Building and investing in that TopCoder asset base, meaning smart people, is what delivers superior results and ultimately drives down end-user cost." 
<br><br>
TopCoder is a worldwide community of programming excellence with more than 65,000 members representing 201 countries including China, the Russian Federation, Poland, Romania and the United States.
<br><br>
The current top three TopCoder design and development winners have average earning totals in excess of $52,000 in prize awards and more than $2,000 in royalty dividends to date. TopCoder component design and development competitions run 24 hours a day, seven days a week and allow participants a chance to gain recognition amongst the TopCoder community and learn about quality employment opportunities in addition to earning cash prizes.
<br><br>
"TopCoder's goal is to provide our customers with direct access to a professional community of talented developers in a highly competitive environment.  That community provides the means for members to show off their talents, learn from industry experts and improve their skills while earning cash," said Mike Morris, VP Software Development at TopCoder  "These payment numbers reflect an extremely positive trend in growth and the emergence of TopCoder as a viable alternative to traditional software outsourcing models."
<br><br>
TopCoder component competitions offer an attractive source of potential income that can provide a payout each quarter for as long as the component is offered in the TCS catalogs. Both collegiate and professional TopCoder members can earn cash payouts to subsidize college costs, augment their regular income or as a sole source of income. 
<br><br>
<span class="bodySubtitle">How to Become a TopCoder Member and Register for Component Competitions</span><br>
You can become a TopCoder member by registering at <A href="/Registration">http://www.topcoder.com/Registration</A>. Contestants can then register for component competitions by visiting the TopCoder Developer Center at http://www.topcoder.com/?t=development&c=index and clicking on the design or development buttons.  Documentation on the TopCoder Software process, including valuable tutorials and sample diagrams, is available at http://www.topcoder.com/index?t=development&c=comp_meth and http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=compDocumentation.  You must be a TopCoder member in good standing and at least 18 years of age to participate.
<br><br>
<span class="bodySubtitle">TopCoder Member Royalties</span><br>
For members that work on component design and development projects royalties are distributed on a quarterly basis.  The Royalty Pool of money used for royalty distribution is calculated by taking a set percent of all generic component revenue.  Generic component revenue comes from the Generic Component Production portion of application projects.  Generic component revenue also comes from a percentage of all component catalog sales revenue.  The Royalty Pool is distributed based on the members' contribution to the catalogs. This contribution is calculated by taking all current components in the catalogs and determining the royalty split for contributors to the projects. For each component project the royalty distribution is split between the winning designer, design review board,, winning developer and development review board. 
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of highly talented programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<div align="center"><i>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</i><div>
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
