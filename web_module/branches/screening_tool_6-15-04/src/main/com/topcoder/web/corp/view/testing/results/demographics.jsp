<%@ page import="com.topcoder.web.corp.common.Constants,
    com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="demographicInfo" scope="request" class="com.topcoder.web.corp.model.DemographicModel" />

<jsp:include page="../includes/script.jsp"/>
</HEAD>
<body>
<% 
    Map StudentQuestionMap = demographicInfo.getStudentDemoInfo();
    Iterator StudentQuestionIterator = StudentQuestionMap.keySet().iterator();
    
    Map ProQuestionMap = demographicInfo.getProDemoInfo();
    Iterator ProQuestionIterator = ProQuestionMap.keySet().iterator();
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
 <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="10"border="0"><br>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
          <TR>
            <TD WIDTH="11"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
              <P>
              <B>Campaign: <jsp:getProperty name="demographicInfo" property="CampaignName"/></B><BR>

              </P>
              
              <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
                <TR valign='top'>
                <TD width='40%'>
                
                  <% if (demographicInfo.getStudentCount() > 0) { %>    
                
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">
                        <TR>
                          <TD class="testTableTitle" COLSPAN="3">&#160;<b>Student (<jsp:getProperty name="demographicInfo" property="StudentCount"/>)</b></TD>
                        </TR>

                        <%
                          while (StudentQuestionIterator.hasNext()) {
                            String question = (String)StudentQuestionIterator.next();
                            List StudentResponsesList = (List)StudentQuestionMap.get(question);
                        %>

                        <TR>
                          <TD class="bodyText" COLSPAN="3"><BR></TD>
                        </TR>                

                        <TR>
                          <TD class="testFormHeader"COLSPAN="3"><%=question%></TD>
                        </TR>


                        <% boolean odd = true;; %>
                        <tces:mapIterator id="resp" MapList="<%=StudentResponsesList%>">
                            <TR>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
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
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">
                        <TR>
                          <TD class="testTableTitle" COLSPAN="3">&#160;<b>Student (0)</b></TD>
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


                <TD WIDTH="10%"></TD>


                <TD width="40%">

                  <% if (demographicInfo.getProCount() > 0) { %>
                  
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="0">
                        <TR>
                          <TD class="testTableTitle" COLSPAN="3">&#160;<b>Professional (<jsp:getProperty name="demographicInfo" property="ProCount"/>)</b></TD>
                        </TR>
                        <%
                          while (ProQuestionIterator.hasNext()) {
                            String question = (String)ProQuestionIterator.next();
                            List ProResponsesList = (List)ProQuestionMap.get(question);
                        %>

                        <TR>
                          <TD class="bodyText" COLSPAN="3"><BR></TD>
                        </TR>                

                        <TR>
                          <TD class="testFormHeader" COLSPAN="3"><B><%=question%></B></TD>
                        </TR>                

                        <% boolean odd = true; %>
                        <tces:mapIterator id="resp" MapList="<%=ProResponsesList%>">
                            <TR>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=odd?"testTableOdd":"testTableEven"%>">
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
                      <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">               
                        <TR>
                          <TD class="testTableTitle" COLSPAN="3">&#160;<b>Professional (0)</b></TD>
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
              
<P><BR/></P>
</td> 


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="../../foot.jsp" />

</body>
</html>
