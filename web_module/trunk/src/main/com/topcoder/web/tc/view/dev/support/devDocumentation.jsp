<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development FAQ</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="dev_documentation"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

         <h2>Development Documentation</h2>

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="projectHeaders" align="left" width="60%">Description</td>
                    <td class="projectHeaders" align="center">Last Modified</td>
                    <td class="projectHeaders" align="right" width="40%">File</td>
                </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>TopCoder Software Component Tutorials</strong><br/>
               The TopCoder Software Development Tutorial provides detailed information on developing components using the TopCoder Software process.  This tutorial was written by review board member AdamSelene.
               </td>
               <td class="projectCells" valign="top" align="center">08.12.2004</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/tc?module=Static&d1=dev&d2=support&d3=devTutorial">Component Development Tutorial</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>Screening and Review Scorecards</strong><br/>
               The screening and review scorecards are used by the Development Review Boards to score component submissions. All members who submit a development solution will be able to log in to TopCoder Software Project Submit & Review and view their corresponding project's screening and review scorecards. These are sample screen shots from the Submit & Review application.
               </td>
               <td class="projectCells" valign="top" align="center">
               08.17.2004<br/>
               08.17.2004
               </td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap">
               <A href="/tc?module=Static&d1=dev&d2=support&d3=devScreeningSample">Sample Development Screening Scorecard</A><br/>
               <A href="/tc?module=Static&d1=dev&d2=support&d3=devReviewSample">Sample Development Review Scorecard</A><br/>
               </td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>TopCoder Software Jalopy Configuration File</strong><br/>
               The TopCoder Software Jalopy Configuration File contains the formatting rules required to adhere to the TopCoder Software Java Coding Standards. Please use this configuration file with Jalopy to format your source code before submitting it for review.
               </td>
               <td class="projectCells" valign="top" align="center">05.28.2003</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/topcoder_code_convention.xml">Jalopy Configuration File</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>CheckStyle Configuration</strong><br/>
               The TopCoder Software CheckStyle Configuration Files contain the formatting style required by the TopCoder Software Java Coding Standards.  Both submitters and reviewers can use this configuration to see how closely a submission follows the required coding style.
               </td>
               <td class="projectCells" valign="top" align="center">09.27.2004</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/tcs_checkstyle_config.jar">CheckStyle Configuration</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>TopCoder Software Ant Build Global Properties</strong><br/>
               The ant build files distributed with the design and development distributions will use this file to override certain parts of the build.xml. This file can be modified to suit your local environment, the build file TopCoder distributes should not be modified. If you think it needs to be, contact your project manager. Keep in mind that the reviewers will be using the build.xml that was distributed.
               </td>
               <td class="projectCells" valign="top" align="center">06.16.2004</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/topcoder_global.properties">topcoder_global.properties</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>TopCoder Software NAnt Build Global Properties</strong><br/>
               The NAnt build files distributed with the design and development distributions will use this file to override certain parts of the default.build. This file can be modified to suit your local environment, the build file TopCoder distributes should not be modified. If you think it needs to be, contact your project manager. Keep in mind that the reviewers will be using the default.build that was distributed.
               </td>
               <td class="projectCells" valign="top" align="center">06.23.2005</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/topcoder_global.build">topcoder_global.build</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>TopCoder Software Member Guide</strong><br/>
               The TopCoder Software Member Guide provides details required to design and develop TopCoder Software components. This document includes supported versions of software tools, coding standards and submission deliverables</td>
               <td class="projectCells" valign="top" align="center">12.07.2005</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/tc?module=Static&d1=dev&d2=support&d3=devMemberGuide">TopCoder Software Member Guide</A></td>
            </tr>
                <tr>
               <td class="projectCells" valign="top">
               <strong>Reviewer Guidelines</strong><br/>
               These guidelines are a must-read for all reviewers, and can provide designers and developers with valuable insight into how the review process works.</td>
               <td class="projectCells" valign="top" align="center">09.14.2004</td>
               <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/tc?module=Static&d1=dev&d2=support&d3=devReviewerGuide">Reviewer Guidelines</A></td>
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

<jsp:include page="/foot.jsp" />

</body>

</html>
