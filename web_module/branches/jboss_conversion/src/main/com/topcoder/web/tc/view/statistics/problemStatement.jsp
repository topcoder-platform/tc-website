<%@ page
  language="java"
  import="com.topcoder.web.tc.controller.legacy.stat.common.JSPUtils
         ,com.topcoder.shared.dataAccess.*
         ,com.topcoder.shared.dataAccess.resultSet.*
         ,com.topcoder.shared.problem.*
         ,com.topcoder.shared.language.*
         ,com.topcoder.shared.problemParser.*
         ,com.topcoder.web.common.render.ProblemRenderer,
          java.awt.*,
          java.io.StringReader"
%>

<%@ taglib uri="struts-bean.tld" prefix="bean" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder Statistics - Problem Statement</TITLE>
   <jsp:include page="baseHRef.jsp" />
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="../script.jsp" />
 </HEAD>
 <body text="#FFFFFF">
   <jsp:include page="../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="180" VALIGN="top">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
       </TD>
       <TD WIDTH="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR>

         <!-- BEGIN BODY -->
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" SRC="/i/steelblue_top_left1.gif"></TD>
             <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" SRC="/i/header_statistics.gif"></TD>
             <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
               &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Problem Statement&#160;&#160;</SPAN>
             </TD>
             <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"></TD>
           </TR>
         </TABLE>
<bean:define name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map" scope="request"/>
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
//  System.out.println(arrProblemComponent[0].getMessages());
  problem = new Problem();
  problem.setProblemComponents(arrProblemComponent);
}

%>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <% if (sClassName == null) { %>
                     <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="7" HEIGHT="18">&#160;</TD>
                   <% } else { %>
                     <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="7" HEIGHT="18">&#160;Problem Statement for <%=sClassName%></TD>
                   <% } %>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="problemText" VALIGN="middle" ALIGN="left">
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
                   <TD COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
           </TR>
           <TR>
             <TD WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
         </TABLE>

         <p><br></p>

         <!-- END BODY -->

       </TD>
       <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="../foot.jsp" />
 </BODY>
</HTML>


