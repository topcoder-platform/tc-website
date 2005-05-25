<%@ page import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer list = (ResultSetContainer)request.getAttribute("list"); %>
<html>
 <head>
   <title>TopCoder Statistics - Coder Rankings</title>
   <jsp:include page="../script.jsp" />
 </head>
 <body>
   <jsp:include page="../top.jsp" />
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr>
       <td width="180" valign="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="coder_ratings"/>
            </jsp:include>
       </td>
       <td width="10" valign="top"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
       <td class="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" border="0"><BR/>

         <table border="0" cellspacing="0" cellpadding="0" width="100%">
           <tr>
             <td width="11" height="26" align="left" valign="bottom"><img width="11" height="26" border="0" src="/i/steelblue_top_left1.gif"></td>
             <td valign="bottom" width="180" align="left"><img width="180" height="26" border="0" src="/i/header_statistics.gif"></td>
             <td class="bodyTextBold" valign="middle" width="100%">
               &#160;<SPAN class="bodySubhead">&#160;&#160;Coder Rankings&#160;&#160;</SPAN>
             </td>
             <td valign="top" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"></td>
           </tr>
         </table>
         <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
           <tr>
             <td valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><BR>
            <form name="coderRankForm" action="/stat" method="get">
               <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                 <tr>
                   <td background="/i/steel_bluebv_bg.gif" valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" width="20%" height="18">Rank</td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="left" width="48%">
				   Handle
				   </td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="20%">
				   Rating
				   </td>
                   <td background="/i/steel_bluebv_bg.gif" valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                 </tr>

                 <rsc:iterator list="<%=list%>" id="resultRow">
                     <tr>
                       <td valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                       <td class="statText" height="13"><rsc:item name="rank" row="<%=resultRow%>"/></td>
                       <td class="statText" valign="middle" align="left">
                        <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="algorithm"/>
                       </td>
                       <td class="statText" valign="middle" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                       <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                     </tr>
                 </rsc:iterator>
               </table>
			   </form>
             </td>
           </tr>
           <tr>
             <td valign="top" bgcolor="#001B35" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
           </tr>
         </table>

         <p><br></p>
         <!-- END BODY -->
       </td>
       <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
       <td width="180" valign="top"><img src="/i/clear.gif" width="180" height="1" border="0">
         <jsp:include page="../public_right.jsp" />
       </td>
    <!-- Gutter -->
    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->
     </tr>
   </table>
   <jsp:include page="../foot.jsp" />
 </body>
</html>


