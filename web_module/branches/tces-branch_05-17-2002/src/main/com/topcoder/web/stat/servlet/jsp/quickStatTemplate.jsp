<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<html>
<head>
<%@include file="baseHRef.jsp" %>
   <TITLE>TopCoder :: Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <%@ include file="/script.jsp" %>
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>
</HEAD>
</HEAD>
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <%@ include file="/top.jsp" %>
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <template:get name="left"/>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" BGCOLOR="#CCCCCC" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
           <TR>
            <TD BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/> 

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
              <TR>
                <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                  <P CLASS="statText">
                    <template:get name="startDesc"/>
                  </P>
                  <P CLASS="statText">
                    <template:get name="midDesc"/>
                  </P>
                  <!-- Stats Intro Begins -->
                  <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                    <TR>
                      <TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="100%">
                        <P CLASS="statText">
		                    <template:get name="endDesc"/>
                          </P>
                      </TD>
                      <TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="20"><IMG src="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
                      <TD CLASS="statTextBig" VALIGN="top" WIDTH="170"><B>Quick Stats:</B>
                      <IMG src="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="1"/><BR/>
                      </TD>
                    </TR>
                    <TR>
                      <TD VALIGN="top" WIDTH="170" CLASS="statTextBig">
                      <!-- Quick Stat Pulldown Begins -->
					  <form name="QSTATFORM">
                        <select name="quickstat" onchange="goTo(this)" size="1" class="dropdown">
                          <OPTION value="#" selected> Select a Stat: </OPTION>
	                    <template:get name="qsList"/>						  
                        </select>
                     <!-- Quick Stat Pulldown Ends -->
                      </TD>
                    </TR>
					<TR><TD COLSPAN="3" CLASS="statText" BACKGROUND="/i/steel_darkblue_bg.gif"><br><%@include file="/coderLegend.html" %>
					</TD></TR>
                  </TABLE>

                    <template:get name="statContent"/>
				   </TD>
              </TABLE>      
            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
           </TR>
           <TR>
             <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>     
           <TR>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
             <TD background="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG src="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
             <TD background="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
           </TR>  
           <TR>
             <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG src="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG src="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
             <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <!-- END BODY -->

       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG src="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <%@ include file="/public_right.jsp" %>
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <%@ include file="/foot.jsp" %> 
</body>
</html>
