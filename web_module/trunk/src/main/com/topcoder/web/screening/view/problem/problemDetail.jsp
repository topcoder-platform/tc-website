<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="/script.jsp"/>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">
   <TR>
      <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A><IMG SRC="/i/ev/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
      <TD WIDTH="206" BGCOLOR="#000000"><IMG SRC="/i/ev/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="13"/></TD>
      <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>
</TABLE>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Problem Detail</B></FONT><BR/>
<P>
               Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
               ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci.
</P>
<!-- <P>
<A HREF="/eval/prob_list.jsp" CLASS="bodyText">Problem List</A>
</P> -->
<FORM>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>


            <jsp:useBean id="problemInfo" type="com.topcoder.web.screening.model.ProblemInfo" scope="request" />
            <TR>
              <TD COLSPAN="6" CLASS="statText" HEIGHT="15" BGCOLOR="#666666">&#160;<B><jsp:getProperty name="problemInfo" property="problemName" /></B></TD>
           </TR>
	        <TR>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>
		       <TD COLSPAN="3" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;TopCoder Submission %</B></TD>
		       <TD COLSPAN="2" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>		       
	        </TR>	        
            <TR>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Overall Accuracy %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. Acc. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. %</B></TD>		       		       		       		       
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Algorithmic Categories</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Business Categories</B></TD>
            </TR>
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="divisionDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="difficultyDesc" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="overallAccuracy" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="submissionAccuracy" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="submission" />%</TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="algorithmicCategoryList" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<jsp:getProperty name="problemInfo" property="businessCategoryList" /></TD>
            </TR>
           <TR>
              <TD COLSPAN="6"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30" BORDER="0"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD CLASS="bodyText" VALIGN="middle" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<b>Problem Statement:</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" VALIGN="top">
<screen:problemStatement text="<%=problemInfo.getProblemStatement()%>" language="Java" />
              </TD>
           </TR>
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>
</FORM>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
