<%@ page isErrorPage="true" %>

<HTML>
<HEAD>
<TITLE>Error</TITLE>
<jsp:include page="../includes/css.jsp" />
</HEAD>

<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
<jsp:include page="../includes/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/transparent_1pix.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/transparent_1pix.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BGCOLOR="#000000">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0">
    <TR>
        <TD>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
            <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                </TABLE>
            </TD>
            <TD CLASS="bodyText" VALIGN="top">
            <!--body starts here-->

<%
   if(exception==null) exception = (Exception)request.getAttribute("exception");
   String message = (String)request.getAttribute("message");
   if(message==null && exception!=null) message = exception.getMessage();
   if(message==null) message = "";
%>
<font color="white">
<h3>Error: <%= message %></h3>
<p>Your request could not be processed.  Please inform TopCoder.</p>
<%--
<h3>Exception: <%= exception.toString() %></h3>
<h3>Trace:</h3>
<p><pre> <% exception.printStackTrace(new PrintWriter(out)); %> </pre></p>
--%>
</font>

            <!--body ends here-->                        
            </TD>
             <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                </TABLE>    
            </TD>
           </TR>
          </TABLE>
         </TD>
        </TR>

       </TABLE>
        </TD>
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
