<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
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
   <jsp:param name="tabLev2" value="coaches"/>
   <jsp:param name="tabLev3" value="description"/>
</jsp:include> 

            <h2>Collegiate Challenge Coaches</h2>

<p>TopCoder is introducing coaches to the 2004 TopCoder Collegiate Challenge Component 
Design Competition.  Coaches will provide design competitors with technical guidance and 
support during the contest.  The details below explain the coaching position in more 
detail.  If you are interested in becoming a coach, please send an email to <a href="mailto:service@topcoder.com">service@topcoder.com</a>
with "Coach" in the subject line.

<p><span class="bodySubtitle">Eligibility</span><br/>
<ul>
<li>Must be a rated TopCoder or TopCoder Software member</li>
<li>Must be available to provide design guidance or technical explanations to the competitors for the duration of the Design Contest</li>
<li>Coaches that are Component Architect Review Board members cannot participate as reviewers for the Component Competition</li>
</ul>

<p><span class="bodySubtitle">Selection</span><br/>
<ul>
<li>Each coach will provide the number of competitors he/she can coach.</li>
<li>The list of coaches, the number of available positions, and the number of filled positions will be listed on the TopCoder website.</li>
<li>Coaches with available positions will be listed with a "Request Coach" link.  Members can select this link to request the coach.</li>
<li>Positions with a coach will be filled on a first come, first serve basis.</li>
<li>Once a coach and competitor agree to the coaching agreement, the agreement is effective for the remainder of the competition.</li>
<li>Members cannot "fire" coaches.</li>
</ul>

<p><span class="bodySubtitle">Compensation</span><br/>
<ul>
<li>Coaches will receive 10% of the competitor's winnings for all submissions made during the Component Competition and submitted after the coaching agreement was signed.  This includes both component earnings and contest prizes.</li>
<li>Future royalties received by the winning competitor are not subject to the coach's percentage.</li>
</ul>

<p><span class="bodySubtitle">Coaching Responsibilities</span></p>
<p>NOTE: Coaches will not be available or permitted to provide assistance to any competitor during any portion of Round #3 - Championship Round.</p>
<ul>
<li>Expected behavior:</li>
<ul>
<li>Provide general design direction based on the initial ideas of the competitor.</li>
<li>Provide pattern recommendations or explanations if the member is improperly using them.</li>
<li>Explain technical theory and concepts.</li>
<li>Identify potential downfalls of the design based on technical merit or in regard to the component scorecard requirements.</li>
</ul>
<li>Unaccepted behavior:</li>
<ul>
<li>It is unacceptable to guide a member to create your own design.</li>
<li>It is unacceptable, at any time, to modify the design directly.</li>
<li>When managing multiple competitors, it is unacceptable to share the ideas of one competitor with the others you are managing.</li>
<li>When managing multiple competitors, it is unacceptable to guide all competitors to a similar design.  Again, initial design ideas and overall structure should be that of the members.</li>
</ul>
</ul>

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
