<%@ page language="java"%>
<%@ page errorPage="/errorPage.jsp"%>
<%@ page import="com.topcoder.web.resume.servlet.*,
                 com.topcoder.shared.util.TCContext,
                 com.topcoder.ejb.ResumeServices.ResumeServicesHome,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.ejb.ResumeServices.ResumeServices,
                 javax.naming.Context,
                 com.topcoder.web.resume.bean.ResumeTaskException,
                 java.util.ArrayList" %>


<HTML>
  <BODY BGCOLOR="#CCCCCC">
    <TABLE WIDTH="100%" HEIGHT="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TR>
        <TD>
         <font color="#FFFFFF">
          <form name="upload_form" enctype="multipart/form-data" method="POST" action="<%=Controller.ALIAS%>">
            <input type="hidden" name="<%=Controller.TASK%>" value="<%=Controller.RESUME_UPLOAD_TASK%>">
            <br/>Resume: <input type=file name=file1>
            <br/>File Type: <select name="fileType" class="dropdown">
            <%
                ArrayList al = null;
                Context context = null;
                try{
                    context = TCContext.getInitial();
                    ResumeServicesHome resumeServicesHome = (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
                    ResumeServices resumeServices = resumeServicesHome.create();
                    al = resumeServices.getFileTypes();
                }catch(Exception e){
                    e.printStackTrace();
                }
                for(int i = 0; i<al.size();i++){
            %>
            <option value="<%= al.get(i++) %>"><%= al.get(i) %></option>
            <%}%>
            </select>
            <br/><input type="submit" value="Upload">
            </form>
          </FONT>
        </TD>
      </TR>
    </TABLE>
  </BODY>
</HTML>
