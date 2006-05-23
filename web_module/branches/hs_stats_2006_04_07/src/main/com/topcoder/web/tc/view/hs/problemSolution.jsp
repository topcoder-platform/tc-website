<%@ page
  language="java"
  import="com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils,com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.StringTokenizer,
          com.topcoder.web.common.StringUtils, com.topcoder.web.tc.Constants, java.util.Map"

%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>

<%
Map queryEntries = (Map) request.getAttribute("QUERY_RESPONSE");

//common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
String sCoderId = srb.getProperty("cr","");
String sRoomId = srb.getProperty("rm","");
String sRoundId = srb.getProperty("rd","");
String sProblemId = srb.getProperty("pm","");

int pm = Integer.parseInt(srb.getProperty("pm",""));

//get the Header info

ResultSetContainer rscHdr = (ResultSetContainer) queryEntries.get("Room_Header_Information");
ResultSetContainer image = (ResultSetContainer) queryEntries.get("Round_Sponsor_Image");

ResultSetContainer.ResultSetRow resultRowHdr = rscHdr.isValidRow(0)? rscHdr.getRow(0) : null;

String sHeader = "";

if (resultRowHdr != null) {
 sHeader = resultRowHdr.getItem(0).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(1).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(2).toString() + "&nbsp;&gt;&nbsp;" + resultRowHdr.getItem(3).toString();
}

//get the Problem Name info
ResultSetContainer rscInfo = (ResultSetContainer) queryEntries.get("Problem_Data");
ResultSetContainer.ResultSetRow resultRow_Info = rscInfo.isValidRow(0)? rscInfo.getRow(0):null;
String sClassName = resultRow_Info!=null?resultRow_Info.getItem(0).toString():"";

//get the solution text
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Submission");
ResultSetContainer.ResultSetRow resultRow_0 = rsc.isValidRow(0)? rsc.getRow(0):null;
String sSolutionText = resultRow_0!=null?resultRow_0.getItem("submission_text").toString():"";

ResultSetContainer rscSubmissions = (ResultSetContainer) queryEntries.get("Coder_Problems");
ResultSetContainer rscSysTest = (ResultSetContainer) queryEntries.get("System_Tests");
ResultSetContainer rscDefense = (ResultSetContainer) queryEntries.get("Problem_Defenses");
boolean even = false;
%>
<%!
  private String addSpace(String text) {
      int i=-1;
      text = JSPUtils.htmlEncode(text);
      while((i = text.indexOf("\n\n"))>=0){
        text = text.substring(0,i+1) + "&#160;" + text.substring(i+1);

      }

    StringTokenizer strtok = new StringTokenizer(text,"\n");
    StringBuffer stBuffer = new StringBuffer(text.length());
    String sTemp = "";
    while (strtok.hasMoreTokens()){
      sTemp = strtok.nextToken();
      for (i=0; i<sTemp.length(); i++){
        if (sTemp.charAt(i)==' ')
          stBuffer.append("&#160;");
        else
          stBuffer.append(sTemp.charAt(i));
      }
      stBuffer.append("<BR>");
    }
    return stBuffer.toString();
  }
%>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_hs_stats"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Problem Solution"/>
</jsp:include>

<span class="bodySubtitle">High School Statistics > <A href="/tc?module=HSRoundOverview" class="bcLink">Match Overview</A> >
<A href="/tc?module=HSRoomStats&rd=<%=sRoundId%>&rm=<%=sRoomId%>" class="bcLink">Room Statistics</A> > Problem Solution</span></span>
<br><br>
<strong>Match:</strong> <A href="" class="bcLink">FIX HS SRM 1 > Round 1</A><br>
<strong>Room:</strong> <A href="" class="bcLink">4 FIX</A><br>
<strong>Coder:</strong> <tc-webtag:handle coderId="<%= sCoderId %>" context='hs_algorithm' /><br>
<a href="http://forums.dev.topcoder.com/?module=ThreadList&amp;forumID=505540" class="bcLink">FIX Discuss this contest</a>
<br><br>


<table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
   <tr>
      <td class="title" colspan="6">
         Problem Solutions
      </td>
   </tr>
   <tr>
      <td class="header">&#160;
      </td>
      <td class="header">
         Class Name
      </td>
      <td class="header">
         Method Name
      </td>
      <td class="header">
         Difficulty
      </td>
      <td class="header">
         Status
      </td>
      <td class="headerR">
         Points
      </td>
   </tr>

   <rsc:iterator list="<%= rscSubmissions %>" id="resultRow">
   <% even = !even;
      boolean selected = resultRow.getIntItem("problem_id") == pm;
   %>
   <tr class='<%= selected? "highlight" : (even? "light" : "dark") %>'>
      <td class="value" style="vertical-align: middle;">
         <A href='/tc?module=HSProblemSolution&rm=<%= sRoomId %>&rd=<%= sRoundId %>&pm=<%= resultRow.getIntItem("problem_id") %>&cr=<%= sCoderId %>'>
            <img src='<%= "/i/interface/" + (selected? "exp_ed_w.gif" : "exp_w.gif") %>' alt="" />
         </A>
      </td>
      <td class="value">
        <rsc:item name="class_name" row="<%=resultRow%>"/>
      </td>
      <td class="value">
         <rsc:item name="method_name" row="<%=resultRow%>"/>
      </td>
      <td class="value">
         <rsc:item name="level_desc" row="<%=resultRow%>"/>
      </td>
      <td class="value">
       <rsc:item name="end_status_text" row="<%=resultRow%>"/>
      </td>
      <td class="valueR">
         <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/>
      </td>
   </tr>
   </rsc:iterator>
</table>

<br><br>

<div style="float:right;"><A href="/tc?module=HSProblemStatement&pm=<%=sProblemId%>&rd=<%=sRoundId%>">view problem statement</A></div>
<span class="title">> <tc-webtag:handle coderId="<%= sCoderId %>" context='hs_algorithm'/>'s solution to <%=sClassName%></span>
<br><br>

<pre>
<%= sSolutionText.trim().length()==0?"Solution Not Available":addSpace(sSolutionText) %>
</pre>


<% if (rscDefense.size() > 0) { %>
    <table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
       <tr>
          <td class="title" colspan="4">
              Defense Results
          </td>
       </tr>
       <tr>
          <td class="header">
             Challenger
          </td>
          <td class="header">
             Challenge Arguments
          </td>
          <td class="headerR">
             Expected Result
          </td>
          <td class="headerR">
             Succeeded
          </td>
       </tr>
       <rsc:iterator list="<%= rscDefense %>" id="resultRow">
       <% even = !even; %>
           <tr class="<%=even?"dark":"light"%>">
              <td class="value">
                 <%= JSPUtils.htmlEncode(resultRow.getItem("args"))%>
              </td>
              <td class="valueR">
                 <%= JSPUtils.htmlEncode(resultRow.getItem("expected_result"))%>
              </td>
              <td class="valueR">
                 <%= resultRow.getItem("succeeded").toString().equals("1")?"Passed":"<span class=bigRed>FAILED - Result:&#160;&#160;&#160;&#160;"+JSPUtils.htmlEncode(resultRow.getItem("received"))+"</span>"%>
              </td>
           </tr>
       </rsc:iterator>
    </table>
<% } %>


<br>

<% if (rscSysTest.size() > 0) { %>
    <table cellpadding="0" cellspacing="0" border="0" class="stat" width="100%">
       <tr>
          <td class="title" colspan="3">
              System Test Results
          </td>
       </tr>
       <tr>
          <td class="header">
             Test Arguments
          </td>
          <td class="headerR">
             Expected Results
          </td>
          <td class="headerR">
             Success
          </td>
       </tr>
       <rsc:iterator list="<%= rscSysTest %>" id="resultRow">
       <% even = !even; %>
           <tr class="<%=even?"dark":"light"%>">
              <td class="value">
                   <tc-webtag:handle coderId='<%= resultRow.getIntItem("challenger_id") %>' context='hs_algorithm'/>
              </td>
              <td class="value">
                 <%= JSPUtils.htmlEncode(resultRow.getItem("args"))%>
              </td>
              <td class="valueR">
                 <%= JSPUtils.htmlEncode(resultRow.getItem("expected"))%>
              </td>
              <td class="valueR">
                 <%= resultRow.getItem("succeeded").toString().equals("Y")?"Yes": ("No - Result:&#160;&#160;&#160;&#160;"+JSPUtils.htmlEncode(resultRow.getItem("received"))) %>
              </td>
           </tr>
       </rsc:iterator>
    </table>
<% } %>


</td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>

    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
