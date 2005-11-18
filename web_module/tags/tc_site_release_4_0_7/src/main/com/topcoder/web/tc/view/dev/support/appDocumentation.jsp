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
                <jsp:param name="level3" value="appDocumentation"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

			<h2>Application Documentation</h2>

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="3">Design Documentation</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="left" width="60%">Description</td>
                    <td class="projectHeaders" align="center">Last Modified</td>
                    <td class="projectHeaders" align="right" width="40%">File</td>
                </tr>
                <tr>
					<td class="projectCells" valign="top">
					<strong>Application Specification Deliverables</strong><br/>
					The Application Requirements Specification provides an outline of the items required for the specification process. The Application Specification Document is completed by a TopCoder project manager and presented to designers at the start of the design phase.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Requirements_Specification.pdf">Application Requirements Specification</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					<strong>Application Design Deliverables</strong><br/>
					The Design Deliverables provides an overview of the design process including the deliverables required of a complete submission and the responsibilities of a winning designer. The Application Design Review Board will not review submissions that do not meet the screening requirements.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Design_Deliverables.pdf">Application Design Deliverables</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					The Application Design Specification is to be completed by the Designers as part of their submission for the design project.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Design_Specification.rtf">Application Design Specification</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					The Application Development Scope Document is to be completed by the Designers as part of their submission for the design project.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Development_Scope.rtf">Application Development Scope</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					<strong>Application Design Review Scorecards</strong><br/>
					The design review scorecard is completed by each member of the Application Design Review Board that is assigned to the application design project. All members who submit a design solution will receive the populated scorecards from the review board members.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/App_Design_Review_Scorecard.rtf">Application Design Deliverables</A></td>
				</tr>
			</table>

			<br/><br/>

            <table border="0" cellspacing="0" width="100%" class="formFrame">
                <tr>
                    <td class="projectTitles" colspan="3">Development Documentation</td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="left" width="60%">Description</td>
                    <td class="projectHeaders" align="center">Last Modified</td>
                    <td class="projectHeaders" align="right" width="40%">File</td>
                </tr>
                <tr>
					<td class="projectCells" valign="top">
					<strong>Application Development Deliverables</strong><br/>
					The Application Development Deliverables provides an overview of the development process including the deliverables required of a complete submission and the responsibilities of a winning developer. The Application Development Review Board will not review submissions that do not meet the screening requirements.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Development_Deliverables.pdf">Application Development Deliverables</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					The Application Development Specification is to be completed by the Developers as part of their submission for the design project.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/Application_Development_Specification.rtf">Application Development Specification</A></td>
				</tr>
                <tr>
					<td class="projectCells" valign="top">
					<strong>Application Development Review Scorecards</strong><br/>
					The application development review scorecard is completed by each member of the Application Development Review Board that is assigned to the application development project. All members who submit a development solution will receive the populated scorecards from the review board members.
					</td>
					<td class="projectCells" valign="top" align="center">01.12.2004</td>
					<td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/i/development/downloads/App_Development_Review_Scorecard.rtf">Application Development Review Scorecard</A></td>
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
