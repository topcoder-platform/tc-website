<% String appContext = request.getContextPath(); %> 
<A NAME="top"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">    
   <TR>
      <TD VALIGN="middle" BGCOLOR="#333333" CLASS="time" NOWRAP="0"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="5"/></TD>
      <TD VALIGN="middle" BGCOLOR="#333333" NOWRAP="0" CLASS="registerToday"><SPAN CLASS="time">&#160;</TD>
      <TD VALIGN="middle" BGCOLOR="#333333" WIDTH="100%" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0"> 
                <A HREF="http://www.topcodersoftware.com" TARGET="_parent" CLASS="globalNavSmall">TopCoder Software</A>&#160;&#160;&#160;|&#160;&#160;&#160;
                <A HREF="#" TARGET="_parent" CLASS="globalNavSmall">TopCoder High School</A>&#160;&#160;&#160;|&#160;&#160;&#160;
<A HREF="/?t=authentication&amp;c=login" CLASS="globalNavSmall" TARGET="_parent">Login</A>&#160;&#160;&#160;|&#160;&#160;&#160;
                <A HREF="<%=appContext%>/?module=static&d1=index" TARGET="_parent" CLASS="globalNavSmall">Home</A></TD>
      <TD WIDTH="15" BGCOLOR="#333333"><IMG SRC="/i/p/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
   </TR>
   <TR>
      <TD BGCOLOR="#000000" COLSPAN="4"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>                
</TABLE>
    <!-- Logo Bar Include Begins -->       
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">            
   <TR>
      <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A><IMG SRC="/i/p/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
      <TD WIDTH="206" BGCOLOR="#000000"><A HREF="<%=appContext%>/?module=static&d1=index" TARGET="_parent"><IMG SRC="/i/p/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="13"/></A></TD>
      <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="15"/></TD>
      <TD CLASS="time" VALIGN="bottom" NOWRAP="" ALIGN="right">
                  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                     <TR>
                        <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                        <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="time" ALIGN="right" VALIGN="bottom" WIDTH="190" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="190" HEIGHT="1" BORDER="0"/><BR/></TD>
                        <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                     </TR> 
                     <TR>
                        <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                        <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                        <TD CLASS="time" ALIGN="right" VALIGN="middle" WIDTH="190" BGCOLOR="#000000">&#160;
                           <FORM NAME="login" METHOD="POST" onSubmit="/<%=appContext%>/?module=login">
                              <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" ALIGN="center">
                                 <TR>
                                    <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right">User Name:&#160;&#160;</TD>
                                    <TD HEIGHT="20" VALIGN="TOP" COLSPAN="2">
                                    <INPUT CLASS="dropdown" MAXLENGTH="15" SIZE="12" NAME="Handle" TYPE="TEXT" VALUE="" onKeyPress="submitEnter(event)"/></TD>
                                 </TR>
                                 <TR>
                                    <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right">Password:&#160;&#160;</TD>
                                    <TD HEIGHT="20" VALIGN="TOP">
                                    <INPUT CLASS="dropdown" MAXLENGTH="15" SIZE="12" NAME="Password" TYPE="Password" VALUE="" onKeyPress="submitEnter(event)"/></TD>
                                    <TD CLASS="statTextBig" VALIGN="top">&#160;&#160;<A HREF="Javascript:login.submit()" CLASS="statTextBig"><FONT COLOR="#CCCCCC">Login </FONT></A></TD>                    
                                 </TR>
                              </TABLE>
                           </FORM>
                        </TD>
                        <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                     </TR>           
                    </TABLE>           
      </TD>        
   </TR>             
</TABLE>
<!-- Menu bar here -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
      <TD BACKGROUND="/i/p/graybv_lite_bg.gif" BGCOLOR="#666666"><A HREF="<%=appContext%>/?module=prim-reg"><IMG SRC="/i/p/menu_reg.gif" WIDTH="170" HEIGHT="21" BORDER="0"/></A></TD>
      <TD BACKGROUND="/i/p/graybv_lite_bg.gif" BGCOLOR="#666666"><A HREF="#"><IMG SRC="/i/p/menu_screen.gif" WIDTH="247" HEIGHT="21" BORDER="0"/></A></TD> 
      <TD WIDTH="100%" BACKGROUND="/i/p/graybv_lite_bg.gif" BGCOLOR="#666666"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="21" BORDER="0"/></TD>  
   </TR>
</TABLE>
<!-- Menu bar ends here -->
