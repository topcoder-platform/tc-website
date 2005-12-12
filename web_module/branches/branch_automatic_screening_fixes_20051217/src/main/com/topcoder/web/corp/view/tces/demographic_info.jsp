<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.corp.controller.request.tces.*,
          com.topcoder.web.corp.common.TCESConstants" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="DemographicTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.DemographicTask" />

<%
    Map StudentDemoInfoMap = DemographicTask.getStudentDemoInfo();
    List StudentResponseList = (List)StudentDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_REFERRAL_KEY);
    Map StudentQuestionMap = (Map)StudentDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_INFO_KEY);
    Iterator StudentQuestionIterator = StudentQuestionMap.keySet().iterator();

    Map ProDemoInfoMap = DemographicTask.getProDemoInfo();
    List ProResponseList = (List)ProDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_REFERRAL_KEY);
    Map ProQuestionMap = (Map)ProDemoInfoMap.get(TCESConstants.DEMOGRAPHIC_INFO_KEY);
    Iterator ProQuestionIterator = ProQuestionMap.keySet().iterator();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <jsp:include page="script.jsp" />

  </HEAD>
  <body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<table width=100% border=0 cellpadding=0 cellspacing=0 align=center>
	<TR valign="top">
		<td width="50%"><jsp:include page="left.jsp" /></td>
<!-- Center Column Begins -->
        <td class=recruitingBody>
			<img src="/i/corp/clear.gif" width="700" height="11" alt="" border=0><br/>
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class=bodyText>
                        <p>
		                <tces:trailIterator id="trailItem" trailList="<%=DemographicTask.getTrail()%>">
		                  <A HREF="<jsp:getProperty name="trailItem" property="href"/>" class="bodyText"><jsp:getProperty name="trailItem" property="name"/></A> &gt;
		                </tces:trailIterator>
						<br/>
						<span class=testHead>Campaign Demographic Info</span>
						<br/><br/>
                        <strong>Campaign:</strong> <jsp:getProperty name="DemographicTask" property="campaignName"/><br/>
                        </p>
                    </td>
                </tr>
            </table>

              <TABLE WIDTH="100%" cellspacing="0" cellpadding="0" border=0>
                <TR valign='top'>
                <TD width='50%'>
                  <% if (DemographicTask.getStudentCoderCount() > 0) { %>

            		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                        <TR>
                          <TD class="screeningTitle" COLSPAN="3"><b>Student (<jsp:getProperty name="DemographicTask" property="studentCoderCount"/>)</b></TD>
                        </TR>
                        <% if (!StudentResponseList.isEmpty()) { %>
                            <TR>
                              <TD class="screeningHeader" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>
                            </TR>

                            <% boolean odd = true; %>
                            <tces:mapIterator id="responseRow" mapList="<%=StudentResponseList%>">
                                <TR>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="50%">
                                    <%=(String)responseRow.get("title")%>
                                  </TD>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                    <%=(String)responseRow.get("percent")%>
                                  </TD>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                    <%=(String)responseRow.get("count")%>
                                  </TD>
                                </TR>
                                <% odd = !odd; %>
                            </tces:mapIterator>
                        <% } %>
					</table>
                        <%
                          while (StudentQuestionIterator.hasNext()) {
                            String question = (String)StudentQuestionIterator.next();
                            List StudentResponsesList = (List)StudentQuestionMap.get(question);
                        %>
            		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">

                        <TR>
                          <TD class="screeningHeader"COLSPAN="3"><%=question%></TD>
                        </TR>


                        <% boolean odd = true;; %>
                        <tces:mapIterator id="resp" mapList="<%=StudentResponsesList%>">
                            <TR>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="50%">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                <%=(String)resp.get("count")%>
                              </TD>
                            </TR>
                            <% odd = !odd; %>
                        </tces:mapIterator>
					</table>
                        <%
                          }
                        %>


                   <% }else{ %>
                      <TABLE WIDTH="100%" cellspacing="0" cellpadding="3" BORDER="0">
                        <TR>
                          <TD class="screeningTitle" COLSPAN="3">Student (0)</TD>
                        </TR>
                        <TR>
                          <TD class="screeningCellOdd" COLSPAN="3"><BR></TD>
                        </TR>
                        <TR>
                          <TD class="screeningCellOdd" COLSPAN="3" align="center">No data available.</TD>
                        </TR>
                      </TABLE>
                   <% } %>

                </TD>

                <TD><IMG src="/i/corp/clear.gif" ALT="" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>

                <TD width="50%">

                  <% if (DemographicTask.getProCoderCount() > 0) { %>

            		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                        <TR>
                          <TD class="screeningTitle" COLSPAN="3">Professional (<jsp:getProperty name="DemographicTask" property="proCoderCount"/>)</TD>
                        </TR>

                        <% if (!ProResponseList.isEmpty()) { %>
                            <TR>
                              <TD class="screeningHeader" COLSPAN="3"><B>How did you hear about TopCoder?</B></TD>
                            </TR>

                            <% boolean odd = true;%>
                            <tces:mapIterator id="responseRow" mapList="<%=ProResponseList%>">
                                <TR>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="50%">
                                    <%=(String)responseRow.get("title")%>
                                  </TD>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                    <%=(String)responseRow.get("percent")%>
                                  </TD>
                                  <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                    <%=(String)responseRow.get("count")%>
                                  </TD>
                                </TR>
                            <% odd = !odd;; %>
                            </tces:mapIterator>
                        <% } %>
					</table>

                        <%
                          while (ProQuestionIterator.hasNext()) {
                            String question = (String)ProQuestionIterator.next();
                            List ProResponsesList = (List)ProQuestionMap.get(question);
                        %>
            		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">

                        <TR>
                          <TD class="screeningHeader" COLSPAN="3"><B><%=question%></B></TD>
                        </TR>

                        <% boolean odd = true; %>
                        <tces:mapIterator id="resp" mapList="<%=ProResponsesList%>">
                            <TR>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="50%">
                                <%=(String)resp.get("title")%>
                              </TD>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                <%=(String)resp.get("percent")%>
                              </TD>
                              <TD class="<%=odd?"screeningCellOdd":"screeningCellEven"%>" width="25%" align=right>
                                <%=(String)resp.get("count")%>
                              </TD>
                            </TR>
                        <% odd = !odd; %>
                        </tces:mapIterator>

					</table>
                        <%
                          }
                        %>


                   <% }else{ %>
            		<table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                        <TR>
                          <TD class="screeningTitle" COLSPAN="3">Professional (0)</TD>
                        </TR>

                        <TR>
                          <TD class="screeningCellOdd" COLSPAN="3"><BR></TD>
                        </TR>

                        <TR>
                          <TD class="screeningCellOdd" COLSPAN="3" align="center">No data available.</TD>
                        </TR>
                      </TABLE>
                    <% } %>

                </TD>
                </TR>
              </TABLE>

              <P><BR></P>
	    </TD>
  <!-- Center Column Ends -->
		<td class=homeRightPromos width="50%"><jsp:include page="right.jsp" /></td>
    </TR>
</TABLE>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
