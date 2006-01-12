<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development FAQ</title>

<jsp:include page="../../script.jsp" />

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="support"/>
                <jsp:param name="level3" value="reliability"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<h2>Development Faq</h2>
<p>If you have any questions concerning Reliability Rating that are not answered here, please send an email to
    <A href="mailto:service@topcoder.com">service@topcoder.com</A>.</p>

<h3>Reliability Rating</h3>
<p>Member profiles have been modified to reflect a reliability factor for the last 15 component design and 15 development competitions. 
The reliability factor is calculated as the percent of the last 15 projects that a member registers for in which that same 
member presents a timely submission that scores at least a 75 in review.</p>

<p>Separate reliability ratings will be kept for design and development projects.</p>

<p>When figuring out the reliability bonus for a project, the reliability rating used will take into account those projects
    that were signed up for prior to the current project.  A participant with no previous projects is considered to
    have no reliability rating, and therefore gets no bonus.</p>

<p>TopCoder will not reset reliability statuses for projects posted prior to October 5th, 2005.  Projects prior to this date 
will be marked reliable, if the user submitted a solution that passed screening.  Additionally, for those that had never
submitted prior to October 5th, 2005 they will not be given a reliability rating until they submit a project that scores
at least a 70 in review.  As of January 12th 2006, TopCoder has increased the minium score to 75.</p>

    <p>One will not be allow to register for more than 2 projects if their relevant reliability rating is less
        than 70%, or if they don't have a reliability rating.</p>

<p>Members will be eligible to receive a bonus on top of any prize money won if their Reliability Ratings are equal to or exceed 
80%. Winning members with Reliability Ratings equal to or exceeding 80% and less than 90% will receive a bonus equal to 10% 
of the prize. For Reliability Ratings equal to or exceeding 90% and less than 95%, winning members will receive a bonus equal 
to 15% of the prize. And winning members with a Reliability Rating equal to or exceeding of 95% will receive a bonus equal 
to 20% of the prize. The following is an example of payouts based on the member's Reliability Rating:</p>


         <table width="400" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">

                <tr>
                   
                   <td class="sidebarTitle">0% - 79%</td>
                    <td class="sidebarTitle">80% - 89%</td>
                    <td class="sidebarTitle">90% - 94%</td>
                    <td class="sidebarTitle">95 - 100%</td>
                </tr>
                
                
                <tr>
                   
                    <td class="sidebarText">$5,000</td>
                    <td class="sidebarText">$5,500</td>
                    <td class="sidebarText">$5,750</td>
                    <td class="sidebarText">$6,000</td>
                </tr>
                <tr>
                   
                    <td class="sidebarText">$2,000</td>
                    <td class="sidebarText">$2,200</td>
                    <td class="sidebarText">$2,300</td>
                    <td class="sidebarText">$2,400</td>
                </tr>                
                <tr>
                   
                    <td class="sidebarText">$500</td>
                    <td class="sidebarText">$550</td>
                    <td class="sidebarText">$575</td>
                    <td class="sidebarText">$600</td>
                </tr>
                  <tr>
                     
                    <td class="sidebarText">$200</td>
                    <td class="sidebarText">$220</td>
                    <td class="sidebarText">$230</td>
                    <td class="sidebarText">$240</td>
                </tr>
                  <tr>
                     
                    <td class="sidebarText">$100</td>
                    <td class="sidebarText">$110</td>
                    <td class="sidebarText">$115</td>
                    <td class="sidebarText">$120</td>
                </tr> 
                               
            </table>

            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
