<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.web.common.StringUtils"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<html>
<head>
<title>Submit - <%=request.getAttribute(Constants.CLASS_NAME)%></title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>
<script language="javascript">
	function submit() {
		document.codingForm.<%=Constants.ACTION_KEY%>.value="submit";
		document.codingForm.submit();
	}
	function save() {
		document.codingForm.<%=Constants.ACTION_KEY%>.value="save";
		document.codingForm.submit();
	}
</script>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value="topcoder"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD class="statTableSpacer" width="100%" valign="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Coding Area"/>
</jsp:include>
<%
    Boolean stat = ((Boolean)request.getAttribute(Constants.COMPILE_STATUS));
    String error = StringUtils.checkNull((String)request.getAttribute(Constants.COMPILE_MESSAGE));
    String status = "";
    if(stat != null){
        status = stat.booleanValue()?"Your code compile successfully.<br>":"Your code did not compile successfully.<br>";
    }
    
    int checked = (request.getAttribute(Constants.SELECTED_LANGUAGE) == null ? -1 : Integer.parseInt((String)request.getAttribute(Constants.SELECTED_LANGUAGE)));
    ResultSetContainer langs = (ResultSetContainer)request.getAttribute(Constants.LANGUAGES);

	String msg = (request.getAttribute(Constants.MESSAGE)!=null?""+request.getAttribute(Constants.MESSAGE):"");
%>
<%=msg%>
<%=status%>
<%=error%>
<div align="center">
   <div style="width: 580px;">
      <div style="float: left; padding-bottom: 5px; width: 100%:">
         <div style="float: left; text-align:left;">
         <span class="bodyTitle">Coding Area</span><br>
         <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>&popup=false<%=(checked!=-1?"&lid="+checked:"")%>" class="statLink">Problem Statement</A>
         (<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>&popup=true<%=(checked!=-1?"&lid="+checked:"")%>"  class="statLink">new window</A>)
         </div>
         <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="codingForm">
         <input type="hidden" name="<%=Constants.MODULE%>" value="<%=Constants.RP_SUBMIT%>">
         <input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
         <input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
         <input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
   		 <input type="hidden" name="<%=Constants.ACTION_KEY%>" value="">
         <div style="float:right; text-align:left;">Choose your language:
         <rsc:iterator list="<%=langs%>" id="resultRow">
         <input type="radio" <%=resultRow.getIntItem("language_id") == checked ? "checked ":""%>
         name="<%=Constants.SELECTED_LANGUAGE%>" value="<%=resultRow.getIntItem("language_id")%>"><%=resultRow.getStringItem("language_name")%>
         </rsc:iterator>
         </div>
      </div>

      <div style="float:left; text-align:left; padding-bottom: 5px;">
      <b>Problem Name: <%=request.getAttribute(Constants.CLASS_NAME)%><br>
      Method Name: <%=request.getAttribute(Constants.METHOD_NAME)%></b>
      </div>

      <div style="float:right; text-align:left; padding-bottom: 5px;">
      <b>Return Type: <%=request.getAttribute(Constants.RETURN_TYPE)%><br>
      Arg Types: <%=request.getAttribute(Constants.ARG_TYPES)%></b>
      </div>

      <div align="right">

<%if(request.getAttribute(Constants.CODE) == null || request.getAttribute(Constants.CODE).toString().equals("")) {%>
<textarea cols="70" rows="20" name="code">
</textarea>
<%} else {%>
<textarea cols="70" rows="20" name="code">
<%=request.getAttribute(Constants.CODE)%></textarea>

<%}%>
      </div>
      <div style="float:right; padding: 5px 0px 0px 5px;"><A href="javascript: submit();"><img src="/i/interface/btn_submit.gif" alt="Submit" border="0" /></A></div>
      <div style="float:right; padding: 5px 0px 0px 5px;"><A href="javascript: save();"><img src="/i/interface/btn_save.gif" alt="Save" border="0" /></A></div>
      </form>
   </div>
</div>
<br><br>
        </td>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp" />
</body>
</html>

