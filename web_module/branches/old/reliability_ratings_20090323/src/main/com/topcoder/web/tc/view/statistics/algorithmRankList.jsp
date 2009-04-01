<%@ page import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
                 com.topcoder.web.tc.Constants" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
 <% ResultSetContainer list = (ResultSetContainer)request.getAttribute("list"); %>
<html>
<head>
<title>TopCoder Statistics - Top Ranked Algorithm Competitors</title>
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
     document.coderRankForm.submit();
     return false;
    } else return true;
  }
  function next() {
    var myForm = document.coderRankForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.coderRankForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }

</script>
 </head>
<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="top_rated_algo"/>
            </jsp:include>
        </td>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Top Ranked Algorithm Competitors"/>
</jsp:include>

<div align="center">
Competitors
 | <A href="/stat?c=school_avg_rating" class="bcLink">Schools</A>
 | <A href="/stat?c=country_avg_rating" class="bcLink">Countries</A>
</div>

<form name="coderRankForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.COUNTRY_CODE%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
<tc-webtag:hiddenInput name="<%=Constants.COUNTRY_CODE%>"/>
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AlgoRank"/>

<div class="pagingBox">
<%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
 | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>

<table class="stat" width="510" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <th class="title" colspan="3">Top Ranked Algorithm Competitors</th>
    </tr>
    <tr>
        <th align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Rank</a></th>
        <th align="left" width="100%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Handle</a></th>
        <th align="right"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Rating</a></th>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=list%>" id="resultRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>' context="algorithm" darkBG="true" /></td>
        <td class="valueR" align="right"><rsc:item name="rating" row="<%=resultRow%>"/></td>
    </tr>
    <% even = !even;%>
    </rsc:iterator>
</tbody>
</table>

<div class="pagingBox">
<%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
 | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\">next &gt;&gt;</a>":"next &gt;&gt;")%>
<br><br>
View &#160;
<tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
&#160;at a time starting with &#160;
<tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
<a href="javascript:document.coderRankForm.submit();">&#160;[ submit ]</a>
</div>

</form>

</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>



<%--
         <table border="0" cellspacing="0" cellpadding="0" width="100%">
           <tr>
             <td width="11" height="26" align="left" valign="bottom"><img width="11" height="26" border="0" src="/i/steelblue_top_left1.gif"></td>
             <td valign="bottom" width="180" align="left"><img width="180" height="26" border="0" src="/i/header_statistics.gif"></td>
             <td class="bodyTextBold" valign="middle" width="100%">
               &#160;<SPAN class="bodySubhead">&#160;&#160;Coder Rankings&#160;&#160; <%if(request.getAttribute("countryName") != null) {%> - <%=request.getAttribute("countryName")%><%}%></SPAN>
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

               <div align="center" class="statText">
                  Competitors | 
                  <A href="/stat?c=school_avg_rating" class="gMetal">Schools</A> | 
                  <A href="/stat?c=country_avg_rating" class="gMetal">Countries</A>
               </div>
               <br><br>
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
                       <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                       &#160;at a time starting with &#160;
                       <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
                       <a href="javascript:document.coderRankForm.submit();" class="statText">&#160;[ submit ]</a>
                   </td>
                 </tr>
               </table>
            </form>
--%>