<%@ page import="com.topcoder.web.corp.common.Constants,
	com.topcoder.shared.dataAccess.DataAccessConstants,
                 java.util.Map,
                 java.util.Iterator" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="tces-taglib.tld" prefix="tces"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="demographicInfo" scope="request" class="com.topcoder.web.corp.model.DemographicModel" />

<jsp:include page="../includes/script.jsp"/>
</HEAD>
<body>
<%
	Map StudentQuestionMap = demographicInfo.getStudentDemoInfo();
	Iterator StudentQuestionIterator = demographicInfo.getStudentDemoList().iterator();

	Map ProQuestionMap = demographicInfo.getProDemoInfo();
	Iterator ProQuestionIterator = demographicInfo.getProDemoList().iterator();
%>
<!-- Header begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">

<!-- gutter begins -->
		<td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Center Column Begins -->
		<td width="50%"></td>
		<td align="center">
		<img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
		<TABLE border="0" cellspacing="0" CELLPADDING="0" WIDTH="100%">
			<TR>
				<TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%" align="center">
				<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
					<tr valign="top">
						<td class="bodyText">
						<P class=testHead>Campaign: <jsp:getProperty name="demographicInfo" property="CampaignName"/></B></P>
						</td>
					</tr>
				</table>

			  	<TABLE width="100%" cellspacing="0" CELLPADDING="0" border="0">
					<TR valign='top'>
						<TD width="50%">

			  		<% if (demographicInfo.getStudentCount() > 0) { %>

						<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
							<TR>
				  				<TD class="screeningTitle" COLSPAN="3"><b>Student (<jsp:getProperty name="demographicInfo" property="StudentCount"/>)</b></TD>
							</TR>
							<%
								while (StudentQuestionIterator.hasNext()) {
								String question = (String)StudentQuestionIterator.next();
								List StudentResponsesList = (List)StudentQuestionMap.get(question);
							%>
							<TR>
						  		<TD class="screeningHeader"COLSPAN="3"><%=question%></TD>
							</TR>
							<% boolean odd = true;; %>
							<tces:mapIterator id="resp" MapList="<%=StudentResponsesList%>">
							<TR>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("title")%>
								</TD>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("percent")%>
								</TD>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("count")%>
								</TD>
							</TR>
							<% odd = !odd; %>
							</tces:mapIterator>
							<%
							  }
							%>
						</TABLE>
			   		<% }else{ %>
						<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
							<TR>
								<TD class="screeningTitle" COLSPAN="3"><b>Student (0)</b></TD>
							</TR>
							<TR>
								<TD class="bodyText" COLSPAN="3"><BR></TD>
							</TR>
							<TR>
								<TD class="bodyText" COLSPAN="3" align="center">No data available.</TD>
							</TR>
					  	</TABLE>
						<% } %>

						</TD>

						<td><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>

						<TD width="50%">

					  	<% if (demographicInfo.getProCount() > 0) { %>

						<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
							<TR>
								<TD class="screeningTitle" COLSPAN="3"><b>Professional (<jsp:getProperty name="demographicInfo" property="ProCount"/>)</b></TD>
							</TR>
							<%
						  	while (ProQuestionIterator.hasNext()) {
								String question = (String)ProQuestionIterator.next();
								List ProResponsesList = (List)ProQuestionMap.get(question);
							%>
							<TR>
						  		<TD class="screeningHeader" COLSPAN="3"><B><%=question%></B></TD>
							</TR>
							<% boolean odd = true; %>
							<tces:mapIterator id="resp" MapList="<%=ProResponsesList%>">
							<TR>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("title")%>
								</TD>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("percent")%>
								</TD>
								<TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>">
								<%=(String)resp.get("count")%>
								</TD>
							</TR>
							<% odd = !odd; %>
							</tces:mapIterator>
								<%
						  		}
							%>

					  	</TABLE>

						<% }else{ %>
						<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
							<TR>
						  		<TD class="screeningTitle" COLSPAN="3"><b>Professional (0)</b></TD>
							</TR>
							<TR>
						  		<TD class="bodyText" COLSPAN="3"><BR></TD>
							</TR>
							<TR>
						  		<TD class="bodyText" COLSPAN="3" align="center">No data available.</TD>
							</TR>
					  	</TABLE>
						<% } %>

						</TD>
					</TR>
					</TABLE>
					</TD>
				</TR>
			</TABLE>

		<P><BR/></P>
		</td>
		<td width="50%"></td>
<!-- Center Column Ends -->

<!-- Gutter -->
		<td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

	</tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
