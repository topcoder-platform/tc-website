<%@ include file="head.inc" %>
<%@ page import="java.awt.Color,
                 com.topcoder.common.web.render.ProblemRenderer,
                 com.topcoder.shared.language.JavaLanguage"%>

<%@ include file="body.inc" %>

         <!-- BEGIN BODY -->

<P><B>Problem Statement</B></P>

<%
ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Statement");
ResultSetContainer.ResultSetRow resultRow_0 = null;
String sClassName = null;
String sProblemText = null;
Problem problem = null;
if (rsc!=null && !rsc.isEmpty()) {
  resultRow_0 = rsc.isValidRow(0)? rsc.getRow(0):null;
  sClassName = resultRow_0!=null?resultRow_0.getItem("class_name").toString():"";
  sProblemText = resultRow_0!=null?resultRow_0.getItem("problem_text").toString():"";
  // jeddie 09/05/02 - put problem text into a Reader, create default language, and use ProblemComponentRenderer
  StringReader reader = new StringReader(sProblemText);
  ProblemComponent arrProblemComponent[] = new ProblemComponent[1];
  arrProblemComponent[0] = new ProblemComponentFactory().buildFromXML(reader, true);
  problem = new Problem();
  problem.setProblemComponents(arrProblemComponent);
}
%>

         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"  WIDTH="100%">
           <TR>
             <TD  VALIGN="top" WIDTH="11"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top"  WIDTH="100%"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0"  WIDTH="100%">
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <% if (sClassName == null) { %>
                     <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="7" HEIGHT="18">&nbsp;</TD>
                   <% } else { %>
                     <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" COLSPAN="7" HEIGHT="18">&nbsp;Problem Statement for <%=sClassName%></TD>
                   <% } %>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" VALIGN="middle" ALIGN="left">
                    <% if (problem!=null) {
                        ProblemRenderer pr = new ProblemRenderer(problem);
                        pr.setTdClass("statText");%>
              		<%= pr.toHTML(JavaLanguage.JAVA_LANGUAGE) %>
                      <% } else { %>
                        Problem Statement not available.
                      <% } %>
                   </TD>
                 </TR>
                 <TR>
                   <TD  COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD  CLASS="statText" COLSPAN="7"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG src="/i/hs/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

         <!-- END BODY -->

<%@ include file="tail.inc" %>
