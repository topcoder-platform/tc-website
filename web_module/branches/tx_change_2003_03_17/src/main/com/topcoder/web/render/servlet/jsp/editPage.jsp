<%@ page session="true" errorPage="error.jsp" %>
<%@ page import="com.topcoder.web.render.bean.CmFormHelperBean" %>
<%@ page import="com.topcoder.web.render.bean.Resource" %>
<jsp:useBean id="state" scope="session" class="com.topcoder.web.render.bean.CmStateBean" />
<%
   if (request.getAttribute("dispatched") == null) {
      request.setAttribute("message", "Use the navigation controls");
%>
   <jsp:forward page="blank.jsp" />
<% } %>
<%
   if ( ! state.isAuthenticated() ) {
      request.setAttribute("message", "You must log in to use PageBuilder");
%>
   <jsp:forward page="login.jsp" />
<% } %>
<%
   if ( ! state.isPageLoaded()) {
   request.setAttribute("message", "You must create or load a page before you can edit it.");
%>
  <jsp:forward page="loadPage.jsp" />
<% } %>
    
<!-- edit page page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Edit Page</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <h1 class="header">&#160;Edit Page</h1>
    <p class="pageInstructions">
      &#160;Use the controls below to move, replace, delete, or add content items,
      or to modify general page properties.
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="editPage" />
      <input type="hidden" name="country" value="840" />
      <input type="hidden" name="language" value="EN" />
      <input type="hidden" name="parent" value="0" />
      <input type="hidden" name="order" value="0" />
      <div class="bodyTextBig"><b>&#160;Page Properties</b></div>
      <table class="bodyText">
        <tr>
          <td>File</td>
          <td><%=state.getPageFile()%></td>
        </tr><tr>
          <td>System</td>
          <td><input name="system" type="text" size="25" maxlength="25" value="<%=state.getPageSystem()%>" /></td>
        </tr><tr>
          <td>Link</td>
          <td><input name="link" type="text" size="50" maxlength="255" value="<%=state.getPageLink()%>" /></td>
        </tr><tr>
          <td>Status</td>
          <td>
            <select name="webstatus" size="">
              <%= CmFormHelperBean.optionList(state.getStatuses(), state.getPageStatusIndex(), false)%>
            </select>
          </td>
        </tr><tr>
          <td>Status Code</td>
          <td><input name="filestatus" type="text" size="1" maxlength="1" value="<%=state.getPageStatus()%>" /></td>
        </tr><tr>
          <td>Web Site</td>
          <td><%=state.getPageSite()%></td>
        </tr><tr>
          <td>Page Name</td>
          <td><input name="name" type="text" size="50" maxlength="100" value="<%=state.getPageName()%>" /></td>
        </tr><tr>
          <td>Page Title</td>
          <td><input name="title" type="text" size="50" maxlength="100" value="<%=state.getPageTitle()%>" /></td>
        </tr><tr>
          <td>Description</td>
          <td><input name="desc" type="text" size="50" maxlength="50" value="<%=state.getPageDesc()%>" /></td>
        </tr><tr>
          <td>JSP Code</td>
          <td><textarea name="text" rows="10" cols="80" class="bodyText"><%=state.getPageText()%></textarea></td>
<%-- 
        </tr><tr>
          <td>Parent</td>
          <td>
            <select name="parent" size="">
              <%= CmFormHelperBean.optionList(state.getSitePages(), -1, true) %>
            </select>
          </td>
        </tr><tr>
          <td>Order</td>
          <td><input name="order" type=text size="3" maxlength="3" /></td>
--%>
        </tr>
      </table>
      <div class="formSection"><b>&#160;Current Page Contents</b></div>
      <table>
        <tr>
        </tr><tr align="left">
<%
   if (state.isPageEditable()) {
%>
          <td>name</td><td>type</td><td>description</td><td>replace with</td><%--<td>move after</td>--%>
<%
     List pageContents = state.getPageContents(); 
     List availableResources = state.getResources();
     for (int i = 0; i < pageContents.size(); i++) {
        out.println("</tr><tr>\n");
        Resource r = (Resource) pageContents.get(i);
%>
          <td><%=r.getName()%></td><td><%=r.getType()%></td><td><%=r.getDesc()%></td>
          <td>
            <select name="r<%=i%>" size="">
              <option value="-1">-- delete item --</option>
              <%=CmFormHelperBean.optionList(availableResources, r.hashCode(), true, false)%>
            </select>
<%--
          </td><td>
            <select name="m<%=i%>" size="">
              <option value="-1" <%=(i==0) ? "selected='yes'" : ""%>>-- top of page --</option>
              <%=CmFormHelperBean.optionList(pageContents, i-1, true)%>
            </select>
--%>
          </td>
        </tr>
      </table>
      <br />
      <div class="formSection">Add Resource(s)</div>
      <table>
        <tr>
          <td>Add</td><td>After</td>
        </tr><tr>
          <td valign="top">
            <select name="add" size="<%=Math.min(10, availableResources.size())%>" multiple="yes">
              <%= CmFormHelperBean.optionList(availableResources, -1, true) %>
            </select>
          </td><td valign="top">
            <select name="after" size="">
              <option value="-1" <%=(pageContents.size()==0)?"selected='yes'":""%>>-- top of page --</option>
              <%=CmFormHelperBean.optionList(pageContents, pageContents.size()-1, true)%>
            </select>
          </td>
<%
     }
   } else {
%>
          <td>Not available</td>
<% } %>
        </tr>
      </table>
      <br />
      <input type="submit" name="submit" value="Apply Edit" />
      <input type="submit" name="submit" value="Save Page" />
      <input type="reset" value="Abandon Changes" />
    </form>
  </body>
</html>
