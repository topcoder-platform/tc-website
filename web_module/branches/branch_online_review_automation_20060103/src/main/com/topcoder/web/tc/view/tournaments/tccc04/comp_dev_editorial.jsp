<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Development</title>

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
   <jsp:param name="tabLev2" value="development"/>
   <jsp:param name="tabLev3" value="editorial"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/dev_finals.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">roma and his check<br/><br/></span>
            </div>

            <h2>roma takes the development title</h2>

            <p>by <a href="/tc?module=MemberProfile&cr=251989">AdamSelene</a>, <br/>
            <em>TopCoder Member</em><br />
            Friday, April 16, 2004<br/>
            </p>

<p>
A five hour struggle with bugs both large and small has ended, with roma finishing ahead of preben and gladius.  Along with a year's bragging rights, roma netted $15,000 in today's match.  The competition was largely quiet until the last two hours, with roma diving into the development addendum, and gladius exploring the Configuration Manager component.  The addendum proved to be a stumbling block for all competitors, but roma emerged victorious by a margin of nearly 15 points.
</p>

<h3>THE ROAD TO THE FINALS</h3>

<p>
The Component Development section of the TCCC04 began two months ago, on February 17th, with the posting of the development projects.  The first round ended ominously for preben, who placed last.  gladius did not fare much better, coming in only two places higher.  roma placed in the middle of the pack, but the first round was led by Standlove and aksonov (an eventual Design finalist).
</p>

<p>
Despite this slow start, the three competitors each submitted a solution for the second round of competition; roma and gladius for the Heartbeat component, and preben for the Source Control Client.  After the second round, these three stood alone as the qualifiers for the final round of the Component Development challenge.
</p>

<h3>THE BATTLEGROUND: Document Generator</h3>

<p>
On March 30th, roma, preben and gladius began preparing their implementations of a single component: a document generator.  The design was available in .NET and Java formats, both using the same template and data format to generate documents.  Two of today's competitors chose Java (roma and preben), while gladius implemented his solution in C#.
</p>

<p>
The Document Generator allows users to create documents from simple yet powerful templates.  The templates contain fields complete with descriptions and default values.  Further, Document Generator templates can even allow complex loop structures to repeat fields in generated documents.  All of this template information is converted into an XSL transformation, which can then be applied to XML user data.
</p>

<p>
Additionally, the Document Generator has a command line interface and uses a custom XML configuration. Luckily, both abilities were already available through the TopCoder component catalog.  Still, the competitors had a full workload for the seven days of development!
</p>

<h3>THE SUBMISSIONS</h3>

<p>
The submissions for the final round came in on April 6th, and the development reviewers, mishagam, pzhao, and AdamSelene tested each submission with a barrage of more than 200 test cases to probe accuracy, throughput, and graceful failure.  The submissions were also scored on adherence to formatting and quality standards, as well as reviewed for efficiency and proper design.
</p>

<h3>ON-SITE: APPEALS, FIXES, AND AN ADDENDUM</h3>

<p>
At 8 AM, the competitors were given the results of these reviews: their scorecards.  roma had scored 86.51 points, and had a sizable lead of 13 points ahead of his nearest competitor, preben at 73.46.  Gladius came in third, with a score of 56.31 points, hindered by a missing command line and configuration interface.  The competitors were given four hours to fix their submissions and improve their scores.  In addition to any fixes necessary, they were also required to implement an addendum to the original design: a BatchFileProcessor to process batches of templates or data from the file system.  This addendum proved important, as only roma had time to implement a solution.
</p>

<p>
The round began quietly, with little word from the competitors.  Surprisingly, no appeals were filed against the initial reviews.  However, as the final stretch of the competition approached, roma began probing and questioning the addendum design.  Many points were clarified, and as time ran out, roma worked feverishly on the BatchFileProcessor addendum.  The requirement for a wild-card enabled file mask proved difficult for the Java competitors, as Java 1.3, a required platform, did not support regular expressions or any other simple method to filter a directory listing.  .NET, on the other hand, provided the functionality via the DirectoryInfo class.
</p>

<p>
Unfortunately, gladius never began the addendum, instead focusing his efforts on adding Configuration Manager support to his component.  Overcoming difficulty creating a valid configuration file, gladius fully implemented this support by the end of the competition, significantly raising his final score.  However, the lack of the addendum or a command line interface kept him in third place.
</p>

<p>
preben was eerily silent throughout the duration of the competition, and his final submission showed more effort on smaller issues, such as minor documentation and bug fixes, and less attention to issues such as code duplication, inefficient parsing and completeness issues.  Like gladius, preben did not approach the addendum, which hurt his final score, barely holding on to second place ahead of gladius by a margin of only 1.6 points!
</p>

<p>
All competitors put forth admirable effort, but roma's superior component implementation heading into the on-site competition enabled him to spend more time and effort on the addendum, and secured him victory in the component development competition.  Congratulations to all competitors and good luck next year!
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
