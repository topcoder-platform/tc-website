<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,java.util.Map, com.topcoder.web.common.StringUtils"

%>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("QUERY_RESPONSE")).get("division_wins");
boolean div1 = !StringUtils.checkNull(request.getParameter("dn")).equals("2");
%>
<html>
<head>
   <TITLE>TopCoder Statistics - Most Division Wins</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
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
<BODY>
  <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="quick_stats"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
           </TR>
         </TABLE>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
            <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
              <TR>
                <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                  <P CLASS="statText">
                    This chart shows the coders with the most Division <%= div1 ? "I" : "II" %> wins.
                    <a href="/stat?c=division_wins&dn=<%= div1 ? "2" : "1" %>">See Division <%= div1 ? "II" : "I" %> wins</a>
                  </P>
                  
                  <!-- Stats Intro Begins -->
                  <jsp:include page="qsIntro.jsp" />

          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                    <TR>
                      <TD COLSPAN="3" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD background="/i/steel_gray_bg.gif" COLSPAN="3" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Division <%=div1 ? "I" : "II"%> Wins</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
                    <TR VALIGN="middle">
                        <TD class="statText">&nbsp;</TD><TD class="statText">Handle</TD><TD class="statText">Wins</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                    </TR>
                    <rsc:iterator list="<%=rsc%>" id="row">
                        <tr>
                        <td class="statText"><rsc:item name="rank" row="<%=row%>"/></td>
                        <td class="statText"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=HandleTag.ALGORITHM%>'/></td>
                        <td class="statText"><rsc:item name="wins" row="<%=row%>"/></td>
                        </tr>
                    </rsc:iterator>                                                            
                    <TR>
                      <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                    </TR>
                    <TR>
                      <TD CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                    </TR>
                  </TABLE>




           </TD>
           </TR>
              </TABLE>
            </TD>
           </TR>
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->

       </TD>
       <TD WIDTH="10"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
</body>
</html>



