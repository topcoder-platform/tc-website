<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% //common code that pulls out the request bean.
com.topcoder.web.stat.bean.StatRequestBean srb = (com.topcoder.web.stat.bean.StatRequestBean) request.getAttribute("REQUEST_BEAN");
%>

<html>
<head>
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
<BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
  <%@ include file="/top.jsp" %>
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <%@ include file="left.jsp" %>
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
                    Top-25 Overall 
                  </P>
                  <P CLASS="statText">
	            This chart represents the members who have made the most impressive debuts in a Single Round Match. 
                  </P>
                  <!-- Stats Intro Begins -->
                  <%@ include file="qsIntro.jsp" %>

          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" background="/i/steel_darkblue_bg.gif" WIDTH="100%">
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Impressive Rating Debuts</TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
                    <TR VALIGN="middle">
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>            
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
            <a href="/stat?c=impressive_debuts&sq=Impressive_Debuts&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Handle</A>
            </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
              <a href="/stat?c=impressive_debuts&sq=Impressive_Debuts&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Rating Points</A>
            </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
              <a href="/stat?c=impressive_debuts&sq=Impressive_Debuts&sc=7&sd=<%= "7".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Round</A>
            </TD>
                      <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">
              <a href="/stat?c=impressive_debuts&sq=Impressive_Debuts&sc=6&sd=<%= "6".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>" class="statText">Date</A>
            </TD>
                    </TR>
          <TR>
                      <TD background="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
<logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
  <logic:equal name="queryEntries" property="key" value="Impressive_Debuts">
  <logic:present name="queryEntries" property="value">
    <bean:define id="resultSet" name="queryEntries" property="value" type="com.topcoder.web.stat.common.ResultSetContainer" />
    <logic:iterate name="resultSet" id="resultRow" type="com.topcoder.web.stat.common.ResultSetContainer.ResultSetRow"> 
    <tr valign="middle">
            <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 3 /*"coder_score"*/ + "]" %>'/>
          <td CLASS="smallFoot" align="right" height="13"><bean:write name="resultRow" property='<%= "item[" + 8 /*"rank"*/ + "]" %>'/>&nbsp;</td>
          <td><A HREF="/stat?c=member_profile&cr=<bean:write name="resultRow" property='<%= "item[" + 1 /*"coder_id"*/ + "]" %>'/>" CLASS="<bean:write name="nameColor" property='<%= "style[" + coderrank.toString() + "]" %>'/>"> <bean:write name="resultRow" property='<%= "item[" + 0 /* handle */ + "]" %>'/></A></td>
 <TD CLASS="statText" ALIGN="center"><bean:write format="0" name="resultRow" property='<%= "item[" + 3 /*"points"*/ + "].resultData" %>'/></TD>  
        <TD CLASS="statText" ALIGN="center"><bean:write name="resultRow" property='<%= "item[" + 7 /*"srm"*/ + "]" %>'/></TD>
                <TD CLASS="statText" ALIGN="center"><bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 6 /*"date"*/ + "].resultData" %>'/></TD>
    </tr>
    </logic:iterate>
  </logic:present>
  </logic:equal>
</logic:iterate>
</logic:present>
<TR>
                      <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="5"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                    </TR>
                  </TABLE>
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









