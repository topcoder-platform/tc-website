<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map,
          com.topcoder.web.tc.Constants,
          com.topcoder.web.common.StringUtils,
          java.text.SimpleDateFormat,
          java.util.Date"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% ResultSetContainer generalInfo = null;
   generalInfo = (ResultSetContainer) ((Map)request.getAttribute("div1Results")).get("general_problem_info");
   if (generalInfo.isEmpty()) generalInfo = (ResultSetContainer) ((Map)request.getAttribute("div21Results")).get("general_problem_info");%>
<% ResultSetContainer divisionInfo = (ResultSetContainer) ((Map)request.getAttribute("div1Results")).get("problem_division_info"); %>

<% ResultSetContainer div1Lang = (ResultSetContainer) ((Map)request.getAttribute("div1Results")).get("problem_detail_by_language"); %>
<% ResultSetContainer div2Lang = (ResultSetContainer) ((Map)request.getAttribute("div2Results")).get("problem_detail_by_language"); %>
<% ResultSetContainer div1Overall = (ResultSetContainer) ((Map)request.getAttribute("div1Results")).get("problem_detail_overall"); %>
<% ResultSetContainer div2Overall = (ResultSetContainer) ((Map)request.getAttribute("div2Results")).get("problem_detail_overall"); %>
<% SimpleDateFormat sdfTime = new SimpleDateFormat("H:mm:ss.S");
   sdfTime.setTimeZone(java.util.TimeZone.getTimeZone("GMT"));%>
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
     <tr>
       <td WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
       </TD>
       <td WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <td CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
         <!-- BEGIN BODY -->
         <table BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <tr>
             <td WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <td VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <td CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Detail&#160;&#160;</SPAN>
             </TD>
             <td VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </tr>
         </table>

         <table BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <tr>
             <td class="statText">
               Problem Name:
             </td>
             <td class="statText">
               <A HREF="/stat?c=problem_statement&pm=<rsc:item set="<%=generalInfo%>" name="problem_id"/>&rd=<rsc:item set="<%=generalInfo%>" name="round_id" class="statText"/>" class="statText"><rsc:item set="<%=generalInfo%>" name="class_name" /></A>
               <A HREF="Javascript:void openProblemRating(<rsc:item set="<%=generalInfo%>" name="problem_id"/>)" class="statText"><img src="/i/rate_it_blue.gif" width="60" height="18" border="0" hspace="10"/></A>

             </td>
           </tr>
           <tr>
             <td class="statText">
               Used In:
             </td>
             <td class="statText">
               <A HREF="/stat?c=round_overview&rd=<rsc:item set="<%=generalInfo%>" name="round_id" />" class="statText"><rsc:item set="<%=generalInfo%>" name="event_name" /></A>
             </td>
           </tr>
           <tr>
             <td class="statText">
               Used As:
             </td>
             <td class="statText">
               <rsc:item set="<%=generalInfo%>" name="div1_use" /> <%=generalInfo.getItem(0, "div2_use").getResultData()!=null&&generalInfo.getItem(0, "div1_use").getResultData()!=null?", ":""%><rsc:item set="<%=generalInfo%>" name="div2_use" />
             </td>
           </tr>
         <table>

         <table BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">

           <tr>
             <td></td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="division" row="<%=resultRow%>"/></TD>
             </rsc:iterator>
           </tr>
           <tr>
             <td class="statText">
               Competitors
             </td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="competitors" row="<%=resultRow%>" ifNull="0"/></TD>
             </rsc:iterator>
           </tr>
           <tr>
             <td class="statText">
               Opens
             </td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="problems_opened" row="<%=resultRow%>" ifNull="0"/></TD>
             </rsc:iterator>
           </tr>
           <tr>
             <td class="statText">
               Percent Open
             </td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="open_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/></TD>
             </rsc:iterator>
           </tr>
           <tr>
             <td class="statText">
               Percent Submitted
             </td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="submission_percentage" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/></TD>
             </rsc:iterator>
           </tr>
           <tr>
             <td class="statText">
               Overall Accuracy
             </td>
             <rsc:iterator list="<%=divisionInfo%>" id="resultRow">
               <td class="statText"><rsc:item name="overall_accuracy" row="<%=resultRow%>" ifNull="0.00%" format="0.00%"/></TD>
             </rsc:iterator>
           </tr>
         <table>



         <table BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <tr>
             <td VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR>

             <% if (!div1Lang.isEmpty()) { %>
               <table BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <tr><td class="statText">Division I</td></tr>
                 <tr>
                   <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText"></TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText"><rsc:item name="language_name" row="<%=resultRow%>"/></TD>
                   </rsc:iterator>
                   <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText">Overall</TD>
                 </tr>
                 <tr>
                   <td class="statText">Problems Submitted</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Correct</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Submission Accuracy</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Failed by Challenge</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Failed by System Test</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Challenge Attempts Made</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Challenge Accuracy</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></TD>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Best Time</TD>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("best_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %></TD>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("best_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">High Scorer</td>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Top Submission</td>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=problem_solution&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&rm=<rsc:item row="<%=resultRow%>" name="room_id"/>&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=problem_solution&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&rm=<rsc:item row="<%=resultRow%>" name="room_id"/>&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Average Correct Time</td>
                   <rsc:iterator list="<%=div1Lang%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("avg_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div1Overall%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("avg_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %></td>
                   </rsc:iterator>
                 </tr>
               </table>
               <% } %>


               <br/><br/>
               <br/><br/>

               <% if (!div2Lang.isEmpty()) { %>
               <table BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                 <tr><td class="statText">Division II</td></tr>
                 <tr>
                   <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText"></td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText"><rsc:item name="language_name" row="<%=resultRow%>"/></td>
                   </rsc:iterator>
                   <td BACKGROUND="/i/steel_bluebv_bg.gif" class="statText">Overall</td>
                 </tr>
                 <tr>
                   <td class="statText">Problems Submitted</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_submitted" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Correct</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_correct" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Submission Accuracy</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="submission_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Failed by Challenge</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_challenge" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Problems Failed by System Test</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="problems_failed_by_system_test" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Challenge Attempts Made</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_attempts_made" row="<%=resultRow%>" ifNull="0"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Challenge Accuracy</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><rsc:item name="challenge_accuracy" row="<%=resultRow%>" ifNull="0.00" format="0.00%"/></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Best Time</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("best_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("best_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("best_time"))) %></td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">High Scorer</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=member_profile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Top Submission</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=problem_solution&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&rm=<rsc:item row="<%=resultRow%>" name="room_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText">
                     <% if (resultRow.getItem("coder_id").getResultData()!=null) { %>
                         <a href="/stat?c=problem_solution&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>&rm=<rsc:item row="<%=resultRow%>" name="room_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>" class="statText">view</a>
                     <% } %>
                     </td>
                   </rsc:iterator>
                 </tr>
                 <tr>
                   <td class="statText">Average Correct Time</td>
                   <rsc:iterator list="<%=div2Lang%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("avg_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %></td>
                   </rsc:iterator>
                   <rsc:iterator list="<%=div2Overall%>" id="resultRow">
                     <td class="statText"><%= resultRow.getItem("avg_time").getResultData()==null?"":sdfTime.format(new java.sql.Time(resultRow.getLongItem("avg_time"))) %></td>
                   </rsc:iterator>
                 </tr>


               </table>
               <% } %>



             </td>
           </tr>
           <tr>
             <td VALIGN="top" BGCOLOR="#001B35" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></td>
           </tr>
         </table>

         <p><br></p>

         <!-- END BODY -->
       </td>
       <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></td>
       <td WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </td>
    <!-- Gutter -->
    <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></td>
    <!-- Gutter Ends -->
     </tr>
   </table>
   <jsp:include page="../foot.jsp" />
 </body>
</html>


