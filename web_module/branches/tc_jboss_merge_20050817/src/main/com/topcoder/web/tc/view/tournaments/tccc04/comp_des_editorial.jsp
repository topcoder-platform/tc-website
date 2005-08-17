<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Design</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

<script>
function openWin(url, name) {
    win = window.open(url, name, "menubar=no,status=no,scrollbars=yes,resizable=yes,toolbar=no,width=800,height=600");
    win.location.href = url;
    win.focus();
}
</script>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="design"/>
   <jsp:param name="tabLev3" value="editorial"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/des_finals.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">aksonov and his check<br/><br/></span>
            </div>

            <h2>aksonov, writing the design for victory</h2>

            <p>by <a href="/tc?module=MemberProfile&cr=251989">AdamSelene</a>, <br/>
            <em>TopCoder Member</em><br />
            Friday, April 16, 2004<br/>
            </p>


<p>
The competition was fierce, but today aksonov emerged as the victor of the TopCoder Collegiate Challenge 2004 Design competition.  aksonov, the last seed in the final round, bested adic by only the slimmest of margins: 0.59 points.  MPhk put in a strong showing, but fell behind the other two competitors.  In addition to this come from behind victory., aksonov will also take home the sizable $25,000 first prize.
</p>

<h3>THE ROAD TO THE FINALS</h3>

<p>
All three competitors opened the first design round powerfully, each placing in the top 5.  Following up in the second round, they stayed on top of their competition, securing entrance to the finals.  Notably, aksonov submitted 4 designs in the first two rounds of the Collegiate Challenge Design competition, while also submitting a second place solution in the first Development round.  aksonov was the only finalist to compete in both the development and design competition.
</p>

<h3>THE BATTLEGROUND: Catalog</h3>

<p>
On March 30th, the finalists were presented with a specification for a new component: Catalog.  The component was required to manage a catalog of products and apply discounts to their prices.  An interface had to be designed to manipulate the products, prices, and discounts; the design also had to account for how the data would be managed behind the public API.  aksonov, adic, and MPhk would have seven days to create a design which provided the required functionality, and described a powerful and clear public API.  The extent and strength of the design was only limited by the designer's ability and imagination.
</p>

<h3>THE SUBMISSIONS</h3>

<p>
The finalists were responsible for providing the entire public design of the API, as well as diagrams of use and interaction between the component and its clients.  After April 6th, the submissions were in the hands of the Design Review Board: ivern, Ken_Vogel, and kyky.  The reviewers evaluated the design for completeness of functionality and satisfaction of the Requirement Specification.  Additionally, they graded the cleanliness and strength of the design, both in terms of interface and overall function.  The reviewers rated every aspect of the design, from the class diagram to documentation.
</p>

<h3>ON-SITE: APPEALS, FIXES, AND AN ADDENDUM</h3>

<p>
The results of these initial reviews were available to the competitors at 8 AM today. The scorecards revealed a very close race: only 4.3 points separated adic, first place with 83.29 points, and aksonov, last place with 78.99 points.  MPhk stood between the two with an initial score of 81.08 points.  This left four hours for the competitors to improve their designs according to the reviewer's comments, and implement a two part addendum allowing product combinations and product tiering.
</p>

<p>
The reviewers agreed; aksonov's solution was unique and significantly different from the other competitors.  Using an extremely flexible rule set to define products and discounts, aksonov's design was the most complex of the three.  However, his component was lacking key functionality demanded by the Component Requirement Specification.  adic, on the other hand, had a strong, basic solution, meeting all requirements, but suffered from some structural design flaws.
</p>

<p>
The round only saw one appeal, from aksonov on a small standards matter.  All three competitors worked with total dedication for the entire competition, dedicating their efforts to their designs, and asking few questions.  adic first worked on the addendum, adding the required functionality to his design.  Next, he approached the final fixes, achieving roughly half of them by his own estimation.  MPhk, on the other hand, took the opposite approach, ensuring the repair of all existing design flaws before approaching the addendum.  Unfortunately, this meant that by the time he finished the fixes to his design, he did not have enough time remaining to complete the additions required for the addendum.
</p>

<p>
During the competition, aksonov employed a strategy echoed as very important by the judges; he focused only on major design flaws.  Crediting his experience at the TopCoder Open, he tried to avoid getting caught up in minor fixes that would not yield score gain proportional to the effort required.  Like adic, he first added the new functionality required by the addendum, and then approached the largest design issues.
</p>

<p>
His strategy proved wise, as his final score of 82.57 edged out adic's 81.98 to win the final round.  MPhk's missing addendum requirements ended up costing his submission significantly in terms of score, finishing last with 70.13 points.  However, the reviewers commended all three submissions, indicating that all of the three were quality designs that would have won a less hotly contested competition.  Congratulations to all competitors and good luck next year!
</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
