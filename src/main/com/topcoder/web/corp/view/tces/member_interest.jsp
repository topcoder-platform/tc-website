<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.common.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.JSPUtils,
          com.topcoder.web.corp.common.TCESConstants" %>
          
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="MemberInterestTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.MemberInterestTask" />
          
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <body>
  <jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<table width=700 border=0 cellpadding=0 cellspacing=0 align=center>
    <tr valign="top">
<!-- Center Column Begins -->
        <td class="bodyText" width="100%" align=center>
			<img src="/i/corp/clear.gif" width="400" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText colspan=2>
					<p>
	                <tces:trailIterator id="trailItem" trailList="<%=MemberInterestTask.getTrail()%>">
	                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
	                </tces:trailIterator>
					<br/>
					<span class=testHead>Member Interest: <jsp:getProperty name="MemberInterestTask" property="Handle"/></span>
						<br/><br/>
					</td>
				</tr>


            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
          <tr>
            <td WIDTH="11"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></td>
            <td class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
                  <table ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <tr>
                        <td class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Demographic Info</A>
                        </td>
                        <% if (MemberInterestTask.isRanked()) { %>
                        <td class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Competition History</A>
                        </td>
                        <td class="bodyText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="MemberInterestTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=MemberInterestTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=MemberInterestTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=MemberInterestTask.getMemberID()%>" class="bodyText">
                            Coder Problem Submissions</A>
                        </td>
                        <% } %>
                    </tr>
                  </table>

              <P>
              <FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Member Interest</FONT>
              <BR/>
              <B>Campaign:</B> <%=MemberInterestTask.getCampaignName()%><br/>
              </P>
              <table ID="dataTable" WIDTH="50%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                <tr>
                  <td class="screeningHeader" HEIGHT="18">&#160;<b>Position Name</b></td>
                  <td class="screeningHeader"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></td>
                  <td class="screeningHeader"><b>Hit Date</b></td>
                </tr>


                <% int i=0; %>
                <tces:rowIterator id="hit" rowList="<%=(List)MemberInterestTask.getHitList()%>">
                <% i++; %>

                <tr>
                  <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>" HEIGHT="18">&#160;
                    <%= hit.getItem("job_desc").toString() %>
                  </td>                                   
                  <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></td>
                  <td class="<%=i%2==1?"screeningCellOdd":"screeningCellEven"%>">
                    <%= JSPUtils.autoFormat(hit.getItem("timestamp")) %>
                  </td>
                </tr>
                
                </tces:rowIterator>


              </table>
              <P><br/></P>
    </td>
    <td VALIGN="top" WIDTH="10"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></td>
  </tr>
  <tr>
    <td COLSPAN="4" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></td>
  </tr>     

</table>
    </td>
  <!-- Center Column Ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
