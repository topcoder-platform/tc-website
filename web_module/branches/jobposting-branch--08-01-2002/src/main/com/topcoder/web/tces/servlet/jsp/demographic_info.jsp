<%@  page
  language="java"
  import="java.util.*,
          java.io.*,
          java.text.*,
          javax.naming.*,
          com.coolservlets.forum.*,
          com.coolservlets.forum.util.*,
          weblogic.common.T3Services,
          com.topcoder.common.web.data.Navigation,
          com.topcoder.common.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="DemographicTask" scope="request" class="com.topcoder.web.tces.bean.DemographicTask" />

<% 
    Map StudentDemoInfoMap = DemographicTask.getStudentDemoInfo();
    List StudentResponseList = (List)StudentDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_REFERRAL_KEY); 
    List StudentNotifyList = (List)StudentDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_NOTIFY_KEY);
    Map StudentQuestionMap = (Map)StudentDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_INFO_KEY);
    Iterator StudentQuestionIterator = StudentQuestionMap.keySet().iterator();
    
    Map ProDemoInfoMap = DemographicTask.getProDemoInfo();
    List ProResponseList = (List)ProDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_REFERRAL_KEY); 
    List ProNotifyList = (List)ProDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_NOTIFY_KEY);
    Map ProQuestionMap = (Map)ProDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_INFO_KEY);
    Iterator ProQuestionIterator = ProQuestionMap.keySet().iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <%@ include file="/script.jsp" %>
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <%@ include file="/top.jsp" %>
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <%@ include file="left.jsp" %>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="../body_top.jsp" >  
           <jsp:param name="image" value="tces"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Company Name"/>  
        </jsp:include><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"><BR>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              
              <P>
              <B>Campaign: <jsp:getProperty name="DemographicTask" property="CampaignName"/></B><BR>
              
              <% if (DemographicTask.getJobID()>0) { %>             
              Position: <B><jsp:getProperty name="DemographicTask" property="PositionName"/></B><BR>
              <% } %>
              </P>
              
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">               
                <TR valign='top'>
                <TD width='50%'>
                  <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                    <TR>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18" COLSPAN="3">&#160;<b>Student (<jsp:getProperty name="DemographicTask" property="StudentCoderCount"/>)</b></TD>
                    </TR>

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>                  
                    </TR>                
                    
                    <tces:mapIterator id="responseRow" MapList="<%=(List)StudentResponseList%>">                    
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)responseRow.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)responseRow.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)responseRow.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                    </TR>                

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B>Receive Notification Emails?</B></TD>                  
                    </TR>                
                    
                    <tces:mapIterator id="notify" MapList="<%=(List)StudentNotifyList%>">                    
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)notify.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)notify.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)notify.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>


                    <%
                      while (StudentQuestionIterator.hasNext()) {
                        String question = (String)StudentQuestionIterator.next();
                        List StudentResponsesList = (List)StudentQuestionMap.get(question);
                    %>
            
                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                    </TR>                

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B><%=question%></B></TD>                  
                    </TR>                

            
                    <tces:mapIterator id="resp" MapList="<%=(List)StudentResponsesList%>">                                
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)resp.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)resp.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)resp.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>
                        
                    <%            
                      }
                    %>

                  </TABLE>
                </TD>
                    
                <TD width="50%">
                  <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0">               
                    <TR>
                      <TD class="statText" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="18" COLSPAN="3">&#160;<b>Professional (<jsp:getProperty name="DemographicTask" property="ProCoderCount"/>)</b></TD>
                    </TR>

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>                  
                    </TR>                
                    
                    <tces:mapIterator id="responseRow" MapList="<%=(List)ProResponseList%>">                    
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)responseRow.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)responseRow.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)responseRow.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                    </TR>                

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B>Receive Notification Emails?</B></TD>                  
                    </TR>                
                    
                    <tces:mapIterator id="notify" MapList="<%=(List)ProNotifyList%>">                    
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)notify.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)notify.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)notify.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>


                    <%
                      while (StudentQuestionIterator.hasNext()) {
                        String question = (String)ProQuestionIterator.next();
                        List ProResponsesList = (List)ProQuestionMap.get(question);
                    %>
            
                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                    </TR>                

                    <TR>
                      <TD class="statText" HEIGHT="18" COLSPAN="3"><B><%=question%></B></TD>                  
                    </TR>                

            
                    <tces:mapIterator id="resp" MapList="<%=(List)ProResponsesList%>">                                
                        <TR>
                          <TD class="statText" HEIGHT="18">
                            <%=(String)resp.get("title")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)resp.get("percent")%>
                          </TD>
                          <TD class="statText">
                            <%=(String)resp.get("count")%>
                          </TD>                  
                        </TR>                     
                    </tces:mapIterator>
                        
                    <%            
                      }
                    %>

                  </TABLE>                  
                </TD>
                </TR>
              </TABLE>
              
              <P><BR></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <!-- <TR>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" bgcolor="#001935"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="4" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10" bgcolor="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!-- <%@ include file="right.jsp" %> -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  <%@ include file="../foot_tces.jsp" %>

  </BODY>
</HTML>
