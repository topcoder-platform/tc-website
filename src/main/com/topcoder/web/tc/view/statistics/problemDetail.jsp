<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,
          com.topcoder.web.tc.Constants,
          com.topcoder.web.common.StringUtils"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer div1Lang = (ResultSetContainer) ((Map)request.getAttribute("div1Reslts")).get("problem_detail_by_language"); %>
<% ResultSetContainer div2Lang = (ResultSetContainer) ((Map)request.getAttribute("div1Reslts")).get("problem_detail_by_language"); %>
<% ResultSetContainer div1Overall = (ResultSetContainer) ((Map)request.getAttribute("div1Reslts")).get("problem_detail_overall"); %>
<% ResultSetContainer div2Overall = (ResultSetContainer) ((Map)request.getAttribute("div1Reslts")).get("problem_detail_overall"); %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<html>
 <head>
   <title>TopCoder Statistics - Problem Archive</title>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />

 </head>
 <body>
   <jsp:include page="../top.jsp" />
   <table WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Detail&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
         <table BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>

               <table BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <tr><td>Division 1</td></tr>
                 <TR>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"></TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><rsc:item name="language_name" row="<%=resultRow%>"/></TD>
                   </rsc:iterator>
                   <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10">Overall</TD>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Problems Submitted</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Submission Percentage</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="submission_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00#"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="submission_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00#"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Problems Correct</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Submission Accuracy</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Problems Failed by Challenge</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Problems Failed by System Test</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Challenge Attempts Made</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td WIDTH="10">Challenge Accuracy</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">Best Time</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="best_time" row="<%=resultRow%>" ifNull="" format="H:mm:ss.S"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="best_time" row="<%=resultRow%>" ifNull="" format="H:mm:ss.S"/></TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td VALIGN="middle" WIDTH="10">High Scorer</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </TD>
                   </rsc:iterator>
                 </TR>
                 <TR>
                   <td BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10">Average Correct Time</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="avg_time" row="<%=resultRow%>" ifNull="" format="H:mm:ss.S"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td VALIGN="middle" WIDTH="10"><rsc:item name="avg_time" row="<%=resultRow%>" ifNull="" format="H:mm:ss.S"/></TD>
                   </rsc:iterator>
                 </TR>


               </table>
             </TD>
           </TR>
           <TR>
             <td VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </table>

         <p><br></p>

         <!-- END BODY -->
       </TD>
       <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <td WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></td>
    <!-- Gutter Ends -->
     </TR>
   </table>
   <jsp:include page="../foot.jsp" />
 </body>
</html>


