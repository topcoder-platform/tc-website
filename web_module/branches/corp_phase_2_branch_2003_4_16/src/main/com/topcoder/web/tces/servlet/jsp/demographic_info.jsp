<%@  page
  language="java"
  errorPage="errorPage.jsp"
  import="java.util.*,
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
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/corpStyle.css">
    <jsp:include page="script.jsp" />
    
  </HEAD>
  <body>
  <jsp:include page="top.jsp" />             
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="bodyText" width="100%"><img src="/i/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P ALIGN="center">
                <tces:trailIterator id="trailItem" trailList="<%=DemographicTask.getTrail()%>">
                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
                </tces:trailIterator>
              </P> 
              <P>
              <B>Campaign: <jsp:getProperty name="DemographicTask" property="CampaignName"/></B><BR>
              
              <% if (DemographicTask.getJobID()>=0) { %>             
              <B>Position:</B> <jsp:getProperty name="DemographicTask" property="PositionName"/><BR>
              <% } %>
              </P>
              
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">               
                <TR valign='top'>
                <TD width='40%'>
                
                  <% if (DemographicTask.getStudentCoderCount() > 0) { %>    
                
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                        <TR>
                          <TD class="testTableTitle" HEIGHT="18" COLSPAN="3">&#160;<b>Student (<jsp:getProperty name="DemographicTask" property="StudentCoderCount"/>)</b></TD>
                        </TR>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>
                        </TR>

                        <% int i=0; %>
                        <tces:mapIterator id="responseRow" MapList="<%=StudentResponseList%>">
                        <% i++; %>
                            <TR>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">
                                <%=(String)responseRow.get("title")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)responseRow.get("percent")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)responseRow.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>
<%--
                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B>Receive Notification Emails?</B></TD>                  
                        </TR>                

                        <tces:mapIterator id="notify" MapList="<%=(List)StudentNotifyList%>">                    
                            <TR>
                              <TD class="bodyText" HEIGHT="18">
                                <%=(String)notify.get("title")%>
                              </TD>
                              <TD class="bodyText">
                                <%=(String)notify.get("percent")%>
                              </TD>
                              <TD class="bodyText">
                                <%=(String)notify.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>
--%>


                        <%
                          while (StudentQuestionIterator.hasNext()) {
                            String question = (String)StudentQuestionIterator.next();
                            List StudentResponsesList = (List)StudentQuestionMap.get(question);
                        %>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B><%=question%></B></TD>
                        </TR>


                        <% i=0; %>
                        <tces:mapIterator id="resp" MapList="<%=StudentResponsesList%>">
                        <% i++; %>
                            <TR>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>

                        <%            
                          }
                        %>

                      </TABLE>
                      
                   <% }else{ %>
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                        <TR>
                          <TD class="testTableTitle" HEIGHT="18" COLSPAN="3">&#160;<b>Student (0)</b></TD>
                        </TR>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3" align="center">No data available.</TD>                  
                        </TR>                
                      </TABLE>
                   <% } %>
                   
                </TD>
                    
                <TD WIDTH="10%">
                    <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935">
                        <TR HEIGHT="18"><TD class="testTableTitle"><BR></TD></TR>
                        <TR><TD><BR></TD></TR>
                    </TABLE>
                </TD>
                
                    
                <TD width="40%">
                  
                  <% if (DemographicTask.getProCoderCount() > 0) { %>
                  
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                        <TR>
                          <TD class="testTableTitle" HEIGHT="18" COLSPAN="3">&#160;<b>Professional (<jsp:getProperty name="DemographicTask" property="ProCoderCount"/>)</b></TD>
                        </TR>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>
                        </TR>

                        <% int i=0; %>
                        <tces:mapIterator id="responseRow" MapList="<%=(List)ProResponseList%>">
                        <% i++; %>
                            <TR>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">
                                <%=(String)responseRow.get("title")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)responseRow.get("percent")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)responseRow.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>

<%--

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B>Receive Notification Emails?</B></TD>                  
                        </TR>                

                        <tces:mapIterator id="notify" MapList="<%=(List)ProNotifyList%>">                    
                            <TR>
                              <TD class="bodyText" HEIGHT="18">
                                <%=(String)notify.get("title")%>
                              </TD>
                              <TD class="bodyText">
                                <%=(String)notify.get("percent")%>
                              </TD>
                              <TD class="bodyText">
                                <%=(String)notify.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>
--%>


                        <%
                          while (ProQuestionIterator.hasNext()) {
                            String question = (String)ProQuestionIterator.next();
                            List ProResponsesList = (List)ProQuestionMap.get(question);
                        %>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><B><%=question%></B></TD>                  
                        </TR>                

                        <% i=0; %>
                        <tces:mapIterator id="resp" MapList="<%=ProResponsesList%>">
                        <% i++; %>
                            <TR>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>" HEIGHT="18">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=i%2==1?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("count")%>
                              </TD>                  
                            </TR>                     
                        </tces:mapIterator>

                        <%            
                          }
                        %>

                      </TABLE>                  
                  
                   <% }else{ %>
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                        <TR>
                          <TD class="testTableTitle" HEIGHT="18" COLSPAN="3">&#160;<b>Professional (0)</b></TD>
                        </TR>

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3"><BR></TD>                  
                        </TR>                

                        <TR>
                          <TD class="bodyText" HEIGHT="18" COLSPAN="3" align="center">No data available.</TD>                  
                        </TR>                
                      </TABLE>
                    <% } %>
                   
                </TD>
                </TR>
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

<!-- Footer begins -->
<jsp:include page="foot.jsp" />             
<!-- Footer ends -->

</BODY>
</HTML>
