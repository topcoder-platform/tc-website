<%@ page session="true" errorPage="error.jsp" %>
<%@ page import="com.topcoder.web.render.bean.CmFormHelperBean" %>
<%@ page import="com.topcoder.web.render.bean.Resource" %>
<jsp:useBean id="state" scope="session" class="com.topcoder.web.render.bean.CmStateBean" />
<%
   if (request.getAttribute("dispatched") == null) {
      request.setAttribute("message", "Use the navigation controls");
%>
   <jsp:forward page="blank.jsp" />
<% } 
   if ( ! state.isAuthenticated() ) {
      request.setAttribute("message", "You must log in to use PageBuilder");
%>
   <jsp:forward page="login.jsp" />
<% } %>
<!-- edit resource page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Edit Resource</title>
    <jsp:include page="script.jsp" />
  </head>
  <body>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <h1 class="header">Edit Resource</h1>
    <p class="bodyText">
      Edit the resource's parameters with the form below.  When satisfied,
      click the "Save Modifications" at the bottom of the form.
    </p>
    <form name="editForm" method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="selectResource" />
<% Resource resource = state.getSelectedResource(); %>
      <table>
        <tr>
          <td class="bodyText">Name:</td>
          <td><input type="text" name="name" size="50" maxlength="50" 
                     value="<%=resource.getName()%>" /></td>
        </tr><tr>
          <td class="bodyText">Description:</td>
          <td><input type="text" name="desc" size="50" maxlength="50"
                     value="<%=resource.getDesc()%>" /></td>
        </tr>
<% if (resource.isFile()) { %>
        <tr>
          <td class="bodyText">System:</td>
          <td><input type="text" name="system" size="25" maxlength="25"
                     value="<%=resource.getSystem()%>" /></td>
        </tr><tr>
          <td class="bodyText">Path:</td>
          <td><input type="text" name="path" size="50" maxlength="255"
                     value="<%=resource.getPath()%>" /></td>
        </tr><tr>
          <td class="bodyText">Link:</td>
          <td><input type="text" name="link" size="50" maxlength="255"
                     value="<%=resource.getLink()%>" /></td>
        </tr><tr>
          <td class="bodyText">Status:</td>
          <td><input type="text" name="filestatus" size="1" maxlength="1" 
                     value="<%=resource.getStatus()%>" /></td>
        </tr><tr>
          <td class="bodyText">Height:</td>
          <td><input type="text" name="height" size="5" maxlength="5"
                     value="<%=resource.getHeight()%>" /></td>
        </tr><tr>
          <td class="bodyText">Width:</td>
          <td><input type="text" name="width" size="5" maxlength="5"
                     value="<%=resource.getWidth()%>" /></td>
        </tr>
<% } else { %>
        <tr>
          <td class="bodyText">group:</td>
          <td>
            <select name="group" size="">
              <%= CmFormHelperBean.optionList(state.getWebGroups(), resource.getGroupIndex().intValue(), false) %>
            </select>
          </td>
        </tr><tr>
          <td class="bodyText">status:</td>
          <td>
            <select name="webstatus" size="">
              <%= CmFormHelperBean.optionList(state.getStatuses(), resource.getStatusIndex().intValue(), false) %>
            </select>
          </td>
        </tr><tr>
          <td colspan="2">
            <textarea name="content" rows="15" cols="80"><%= resource.getContent() %></textarea>
          </td>
        </tr>
<% } %>
	<tr>
          <td colspan="2">
            <input type="submit" name="submit" value="Save Modifications" />
            <input type="reset" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <br/><input type="submit" name="submit" value="Move to Development" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <br/><input type="submit" name="submit" value="Move to QA" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <!--<SCRIPT type="text/javascript">alert(this.form.name)</SCRIPT>-->
            <br/><input type="submit" name="submit" value="Move to Production" onClick="return confirm('Move to Production.  Are you sure?');" />
          </td>
        </tr>

      </table>
    </form>
  </body>
</html>
