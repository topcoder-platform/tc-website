<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.*,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  ResultSetContainer rookieBoard = (ResultSetContainer) request.getAttribute(Constants.CODER_LIST_KEY);
  ResultSetContainer seasons = (ResultSetContainer) request.getAttribute("seasons");
  String type = (String)request.getAttribute(Constants.TYPE_KEY);
%>

<html>
    <head>
        <title>Digital Run - Rookie Board</title>
        <jsp:include page="/script.jsp" />
        <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
        <script type="text/javascript">
            function submitEnter(e) {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if (keycode == 13) {
                 document.rookieBoardForm.submit();
                 return false;
                } else return true;
              }
              function next() {
                var myForm = document.rookieBoardForm;
                myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
                myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
                myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
                myForm.submit();
              }
              function previous() {
                var myForm = document.rookieBoardForm;
                myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
                myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
                myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
                myForm.submit();
              }
        </script>
    </head>
<body>
     <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
       <tr>
         <td valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><BR>
        <form name="rookieBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
           <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RookieBoard"/>
           <tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
           <!--tc-webtag:hiddenInput name="<%=Constants.SEASON_ID%>"/-->
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
           <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

           <br><br>
           <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
            <tr>
                <td>
                    <B>Please select a season</B><BR/>
                    <SELECT CLASS="dropdown" NAME="<%=Constants.SEASON_ID%>" onchange="document.rookieBoardForm.submit()">
                         <rsc:iterator list="<%=seasons%>" id="resultRow">
                            <% if (String.valueOf(resultRow.getLongItem("season_id")).equals(request.getParameter(Constants.SEASON_ID))) { %>
                              <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>" selected><rsc:item name="name" row="<%=resultRow%>"/></OPTION>
                            <% } else { %>
                              <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>"><rsc:item name="name" row="<%=resultRow%>"/></OPTION>
                            <% } %>
                        </rsc:iterator>
                    </SELECT>
               </td>
             </tr>
             <tr>
                <td background="/i/steel_blue_bg.gif" class="statText" height="16" colspan="5" align="center">
                    <%=(rookieBoard.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                    | <%=(rookieBoard.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>":"next &gt;&gt;")%>
               </td>
             </tr>
             <tr>
               <td background="/i/steel_bluebv_bg.gif" valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
               <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" width="20%" height="18">
                   <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>" class="statText">Rank</a>
               </td>
               <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="left" width="48%">
                   <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>" class="statText">Handle</a>
               </td>
               <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="20%">
                   <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>" class="statText">Points</a>
               </td>
               <td background="/i/steel_bluebv_bg.gif" valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
             </tr>

             <rsc:iterator list="<%=rookieBoard%>" id="resultRow">
                 <tr>
                   <td valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                   <td class="statText" height="13">
                        <rsc:item name="rank" row="<%=resultRow%>"/>
                   </td>
                   <td class="statText" valign="middle" align="left">
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context='<%=type%>' darkBG="true" />
                    <%if (resultRow.getLongItem("confirmed_ind")== 0) {%>*<%}%>
                   </td>
                   <td class="statText" valign="middle" align="right"><rsc:item name="total_points" row="<%=resultRow%>"/></td>
                   <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                 </tr>
             </rsc:iterator>
             <tr>
                   <td valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
             </tr>
             <tr>
                   <td valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"></td>
                   <td class="statText" height="13" colspan="4">
                    * Not confirmed.
                   </td>
             </tr>
             
             <tr>
               <td colspan="5" align="center" class="statText">
                   View &#160;
                   <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                   &#160;at a time starting with &#160;
                   <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                   <a href="javascript:document.rookieBoardForm.submit();" class="statText">&#160;[ submit ]</a>
               </td>
             </tr>
           </table>
        </form>
         </td>
       </tr>
     </table>
</body>
</html>
