<%@ page import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.web.tc.Constants" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
 <% ResultSetContainer list = (ResultSetContainer)request.getAttribute("list"); %>
<html>
 <head>
   <title>TopCoder Statistics - Coder Rankings</title>
   <jsp:include page="../script.jsp" />
<script type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.coderRankForm.submit();
     return false;
    } else return true;
  }
  function next() {
    var myForm = document.coderRankForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.coderRankForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }

</script>
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
            <form name="coderRankForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
               <tc-webtag:hiddenInput name="<%=Constants.COUNTRY_CODE%>"/>
               <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
               <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
               <tc-webtag:hiddenInput name="<%=Constants.COUNTRY_CODE%>"/>
               <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AlgoRank"/>
               <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                 <tr>
                    <td background="/i/steel_blue_bg.gif" class="statText" height="16" colspan="5" align="center">
                        <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                        | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
                   </td>
                 </tr>
                 <tr>
                   <td background="/i/steel_bluebv_bg.gif" valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" width="20%" height="18">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>" class="statText">Rank</a>
                   </td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="left" width="48%">
				   <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>" class="statText">Handle</a>
				   </td>
                   <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="20%">
				   <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>" class="statText">Rating</a>
				   </td>
                   <td background="/i/steel_bluebv_bg.gif" valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                 </tr>

                 <rsc:iterator list="<%=list%>" id="resultRow">
                     <tr>
                       <td valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                       <td class="statText" height="13"><rsc:item name="rank" row="<%=resultRow%>"/></td>
                       <td class="statText" valign="middle" align="left">
                        <tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="algorithm" darkBG="true" />
                       </td>
                       <td class="statText" valign="middle" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                       <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                     </tr>
                 </rsc:iterator>

                 <tr>
                   <td colspan="5" align="center" class="statText">
                       View &#160;
                       <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onkeypress="submitEnter(event)"/>
                       &#160;at a time starting with &#160;
                       <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onkeypress="submitEnter(event)"/>
                       <a href="javascript:document.coderRankForm.submit();" class="statText">&#160;[ submit ]</a>
                   </td>
                 </tr>
               </table>
			   </form>
             </td>
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


