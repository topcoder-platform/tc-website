<%@ page
         contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet,
                 com.topcoder.web.corp.model.TransactionInfo"
         autoFlush="false"
         buffer="64kb"
         errorPage="../exc/InternalError.jsp"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
      <TD VALIGN="top"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" WIDTH="100%" valign="top"><IMG SRC="/i/p/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Registration</B></FONT><BR>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P><BR>
<FORM action="<%=request.getContextPath()+"/Tx/?"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TX_BEGIN%>" method="POST" name="frmTerms">
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <jsp:useBean id="TransactionInfo" scope="request" class="com.topcoder.web.corp.model.TransactionInfo" />

  <TR valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" background="/i/p/graybv_lite_bg.gif" HEIGHT="16">&#160;<FONT COLOR="#FFFFFF"><B>Terms of Use</B></FONT></TD>
  </TR>
  <TR align="right" valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" ALIGN="center" VALIGN="middle"><tc-webtag:textArea name="<%=Constants.KEY_TERMS%>" value="<%=TransactionInfo.getTerms()%>" rows="10" cols="80" readOnly="true" class="bodyText"/></TD>
  </TR>

    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="<%=Constants.KEY_AGREE_TO_TERMS%>"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>I Agree to the Terms and Conditions stated above</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:chkBox name="<%=Constants.KEY_AGREE_TO_TERMS%>"/></TD>
  </TR>

    <TR>
        <TD COLSPAN="3"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0" /></TD>
        <INPUT type="hidden" name="module" value="Registration"/>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
       <input type="hidden" name="back-to" value="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>"/>
       <input type="hidden" name="prod-id" value="<jsp:getProperty name="TransactionInfo" property="productID"/>"/>
       <input type="hidden" name="utype-id" value="<jsp:getProperty name="TransactionInfo" property="unitTypeID"/>"/>

     <TD COLSPAN="3" ALIGN="center" VALIGN="middle" CLASS="statText"><input type="submit" onClick="" name="submit" value=" Submit "></td>
  </TR>
</TABLE>
</FORM>

<P><BR></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG SRC="/i/p/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
