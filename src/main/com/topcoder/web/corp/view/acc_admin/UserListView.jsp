<%@ page contentType="text/html; charset=ISO-8859-1"
         language="java"
         import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.shared.dataAccess.resultSet.*,
                 java.util.Map,
                 com.topcoder.web.corp.Constants"
         autoFlush="false"
         buffer="64kb"
         errorPage="../exc/InternalError.jsp" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%    
        ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("companyUsers");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder Corporate</TITLE>
<script language="JavaScript" src="/js/script.js"></script>
</HEAD>
<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="../includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Account Administration - User List</B></FONT><BR>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" width="100%">
        <TR>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15"><B>&#160;Handle</B></TD>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15"><B>First Name</B></TD>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15"><B>Last Name</B></TD>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15"><B>&#160;</B></TD>             
        </TR>

        <% /* Setup variables used for row alternating background colors */
                boolean isGreyBGCOLOR = true; 
                String bgColor = new String();
        %>

        <tc-webtag:iterator list="<%=rsc%>" id="resultRow" >
        <% 
                bgColor = isGreyBGCOLOR ? "#CCCCCC" : "#FFFFFF";
                isGreyBGCOLOR = !isGreyBGCOLOR; // change BGCOLOR for next row.
        %>
          <TR>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">&#160;
                        <tc-webtag:item row="<%=resultRow%>" name="handle"/></TD>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">
                        <tc-webtag:item row="<%=resultRow%>" name="first_name"/></TD>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">
                        <tc-webtag:item row="<%=resultRow%>" name="last_name"/></TD>
                <% boolean isPrim = Double.parseDouble(resultRow.getItem("isnot_admin").toString())==0.0; %>
                <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>"> <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=<%= isPrim? "Registration" : "UserEdit" %>&id=<tc-webtag:item row="<%=resultRow%>" name="user_id"/>" CLASS="bodyText">Edit</A></TD>          
          </TR>
        </tc-webtag:iterator>

        <TR>
                <TD COLSPAN="4" VALIGN="middle" CLASS="bodyText" HEIGHT="15" ALIGN="center"><A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit" CLASS="bodyText">Add</A></TD>         
        </TR>                           
</TABLE>
<P><BR></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG SRC="/i/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
