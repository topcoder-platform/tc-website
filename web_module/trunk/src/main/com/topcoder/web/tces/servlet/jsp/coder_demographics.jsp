<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="CoderDemographicsTask" scope="request" class="com.topcoder.web.tces.bean.CoderDemographicsTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <BODY class="tces">
  <jsp:include page="top.jsp" />             
  
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
    <!-- Left Column Begins -->
      <TD WIDTH="170">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="statText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="tces"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Member Profile"/>
        </jsp:include>
        
        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=CoderDemographicsTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="statText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P>


            <TABLE WIDTH="100%" BORDER="0">
            <TR>
            <TD class="statText" ALIGN="right">
              <IMG SRC="/i/clear.gif" ALT="" WIDTH="126" HEIGHT="140" BORDER="0">
            </TD>
            <TD WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" ALIGN="left">

              <B>Member Profile: <%= CoderDemographicsTask.getMemberInfo().getItem(0, "handle").toString()%> </B> <BR/>
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "first_name").toString()%> <%= CoderDemographicsTask.getMemberInfo().getItem(0, "last_name").toString()%> <BR/>
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address1").toString()%>
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "address1").toString().equals("")?"":"<BR/>"+CoderDemographicsTask.getMemberInfo().getItem(0, "address2").toString()+"<BR/>"%>
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "city").toString()%>,
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "state_code").toString()%>
              <%= CoderDemographicsTask.getMemberInfo().getItem(0, "zip").toString()%> <BR/>
              <A HREF="mailto:<%=CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %>" CLASS="statText"><%= CoderDemographicsTask.getMemberInfo().getItem(0, "email").toString() %></A> | <%= CoderDemographicsTask.getMemberInfo().getItem(0, "home_phone").toString()%> <BR/>
              <B>Interested in:</B> <jsp:getProperty name="CoderDemographicsTask" property="JobName"/><BR/>
              <% if (CoderDemographicsTask.hasResume()) { %>
                <a href="/Resume?&t=CorporateDownloadTask&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="CampaignID"/>&<%=TCESConstants.JOB_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="JobID"/>&<%=TCESConstants.MEMBER_ID_PARAM%>=<jsp:getProperty name="CoderDemographicsTask" property="MemberID"/>" class="statText"><B>Resume</B></a>
              <% } %>
              </TD>
              </TR>
              </TABLE>


<% if (CoderDemographicsTask.getIsRanked()) { %>
                  <TABLE ID="linksTable" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                    <TR>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.CODER_DEMOGRAPHICS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="statText">
                            </A>Coder Demographic Info                          
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.COMPETITION_HISTORY_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="statText">
                            Coder Competition History
                          </A>
                        </TD>
                        <TD class="statText" ALIGN="center" WIDTH="33%">
                          <A HREF="<jsp:getProperty name="CoderDemographicsTask" property="ServletPath"/>?<%=TCESConstants.TASK_PARAM%>=<%=TCESConstants.PROBLEM_SUBMISSIONS_TASK%>&<%=TCESConstants.CAMPAIGN_ID_PARAM%>=<%=CoderDemographicsTask.getCampaignID()%>&<%=TCESConstants.JOB_ID_PARAM%>=<%=CoderDemographicsTask.getJobID()%>&<%=TCESConstants.MEMBER_ID_PARAM%>=<%=CoderDemographicsTask.getMemberID()%>" class="statText">
                            Coder Problem Submissions
                          </A>
                        </TD>
                    </TR>
                  </TABLE>             
<% } %>
             
             
              <P><FONT SIZE="5" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Demographic Info</FONT></P>
              <TABLE ID="dataTable" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                <TR>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18">&#160;<b>Question</b></TD>
                  <TD BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                  <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif"><b>Response</b></TD>
                </TR>

                

                <tces:mapIterator id="question" mapList="<%=(List)CoderDemographicsTask.getQuestionList()%>">
                  <TR>
                    <TD class="statText" HEIGHT="18">&#160;
                        <%= (String)question.get("question") %>
                    </TD>
                    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"></TD>
                    <TD class="statText">
                        <b><%= (String)question.get("response") %></b>
                    </TD>
                  </TR>
                </tces:mapIterator>

              </TABLE>
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     

</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  </BODY>
</HTML>
