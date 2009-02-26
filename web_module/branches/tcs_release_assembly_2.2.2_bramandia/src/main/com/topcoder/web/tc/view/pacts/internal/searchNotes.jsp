<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>

    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>

</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>

<% int noteTypeRowCount = 0;
   ResultSetContainer noteType = (ResultSetContainer) request.getAttribute(PactsConstants.NOTE_TYPE_LIST);
   if (noteType == null) {
      out.println("No Note Type List!");
      //noteType = new ResultSetContainer();
   }
   else noteTypeRowCount = noteType.getRowCount();
   ResultSetContainer.ResultSetRow rsr;
%>
<h1 align="center">PACTS</h1>
<h2 align="center">Search Notes</h2>

<center>
<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center">
<% out.println("      <form method=\"GET\" action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\">"); %>
        <table border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td>Handle:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Submitted by:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.SUBMITTING_HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Creation Date:</td>
			<td>Between <input type="text" name="<%= PactsConstants.EARLIEST_CREATION_DATE %>" id="<%= PactsConstants.EARLIEST_CREATION_DATE %>" size="10">
				<button id="trigger_<%= PactsConstants.EARLIEST_CREATION_DATE %>">Set</button>			
			and <input type="text" name="<%= PactsConstants.LATEST_CREATION_DATE %>" id="<%= PactsConstants.LATEST_CREATION_DATE %>" size="10">
				<button id="trigger_<%= PactsConstants.LATEST_CREATION_DATE %>">Set</button></td>

          </tr>
          <tr>
            <td>In-Depth Search by Handle:</td>
<% out.println("            <td><input type=\"text\" name=\""+PactsConstants.IN_DEPTH_HANDLE+"\" size=\"20\"></td>"); %>
          </tr>
          <tr>
            <td>Type:</td>
<% out.println("            <td><select name=\""+PactsConstants.TYPE_CODE+"\">");
   out.println("              <option value=\"\" selected>Any</option>");
   for (int n = 0; n < noteTypeRowCount; n++) {
      rsr = noteType.getRow(n);
      out.println("              <option value=\""+TCData.getTCInt(rsr,"note_type_id",0,true)+"\">"+TCData.getTCString(rsr,"note_type_desc","default status",true)+"</option>");
   } %>
              </select></td>
          </tr>
        </table>
        <p><br>
        <input type="submit" value="Submit" name="B1"><input type="reset" value="Reset" name="B2">
        </p>
<% out.println("        <input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.NOTE_CMD+"\"><input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.LIST_TASK+"\">"); %>
      </form>
    </td>
  </tr>
</table>
</center>

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "<%= PactsConstants.EARLIEST_CREATION_DATE %>",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_<%= PactsConstants.EARLIEST_CREATION_DATE %>",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);

Calendar.setup(
{
 inputField  : "<%= PactsConstants.LATEST_CREATION_DATE %>",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_<%= PactsConstants.LATEST_CREATION_DATE %>",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);

-->
</script>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>

