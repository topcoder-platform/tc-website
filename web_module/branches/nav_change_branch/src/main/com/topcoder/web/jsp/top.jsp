<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.CoderRegistration,
          com.topcoder.ejb.DataCache.*,
          com.topcoder.common.web.util.*,
          java.text.DecimalFormat,
          com.topcoder.common.web.data.Navigation" %>
<%
   String color = "#cccccc";
   DataCache dcHome = com.topcoder.common.web.util.Cache.get();
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
   if ( nav.getLoggedIn() )
   {
     HashMap h = null;
     if (nav.getUser() != null) h = nav.getUser().getUserTypeDetails();
     if ( h!=null && h.containsKey("Coder") )
     {
       int rating = ((CoderRegistration)h.get("Coder")).getRating().getRating();
       if ( rating > 2199 ) {
         color = "#ff0000";
       } else if ( rating > 1499 && rating < 2200 ) {
         color = "#ffff00";
       } else if ( rating > 1199 && rating < 1500 ) {
         color = "#66cccc";
       } else if ( rating > 899 && rating < 1200 ) {
         color = "#ccff99";
       } else {
         color = "#cccccc";
       }
     }
   }
%>

<A NAME="top"/>
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">    
            <TR>
<!--
          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_blank" HREF="http://www.topcodersoftware.com"><IMG SRC="/i/tcs_button.gif" ALT="" WIDTH="144" HEIGHT="17" BORDER="0"/></A></TD>            


          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute><IMG SRC="/i/tces_button.gif" ALT="" WIDTH="102" HEIGHT="17" BORDER="0"/></A></TD>
-->           <TD VALIGN="middle" BGCOLOR="#333333" CLASS="time" NOWRAP="0"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="5"/></TD>
              <TD VALIGN="middle" BGCOLOR="#333333" NOWRAP="0" CLASS="registerToday"><SPAN CLASS="time">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <%=new DecimalFormat("#,##0").format(dcHome.getMemberCount())%> - <%@ include file="date_time.jsp" %><a href="Javascript:tcTime()" class="statText">[Get Time]</a></TD>
              <TD VALIGN="middle" BGCOLOR="#333333" WIDTH="100%" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0">
                <!-- <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>
                  About [TC]
                </A>&#160;&#160;&#160;:&#160;&#160;&#160; -->  
                <A HREF="http://www.topcodersoftware.com" TARGET="_parent" CLASS="globalNavSmall">TopCoder Software</A>&#160;&#160;&#160;|&#160;&#160;&#160;
                <A HREF="#" TARGET="_parent" CLASS="globalNavSmall">TopCoder High School</A>&#160;&#160;&#160;|&#160;&#160;&#160;
<% if ( nav.getLoggedIn() ) { %>
<A HREF="/?t=authentication&amp;c=submit_logout" CLASS="globalNavSmall" TARGET="_parent">Logout</A>
<% } else { %>
<A HREF="/?t=authentication&amp;c=login" CLASS="globalNavSmall" TARGET="_parent">Login</A><%}%>&#160;&#160;&#160;|&#160;&#160;&#160;
                <!-- <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>
                  Contacts
                </A>
                &#160;&#160;&#160;:&#160;&#160;&#160; -->
                <A HREF="/" TARGET="_parent" CLASS="globalNavSmall">Home</A>
              </TD>
              <TD WIDTH="15" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
            </TR>
            <TR>
              <TD BGCOLOR="#000000" COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                
    </TABLE>
    <!-- Logo Bar Include Begins -->       
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">            
      <TR>
        <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="206" BGCOLOR="#000000"><A HREF="/?&amp;t=home&amp;c=public_home" TARGET="_parent"><IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="13"/></A></TD>
        <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="15"/></TD>
        <TD CLASS="time" VALIGN="bottom" NOWRAP="" ALIGN="right"><!-- <BR/>
              <SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> -->
<% if ( nav.getLoggedIn() ) { %>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="75" BORDER="0"/></TD>
                          <TD BACKGROUND="/i/top_div1_badge.jpg" WIDTH="100%" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="75" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="middle" WIDTH="150" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/><BR/>
                             <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                                <TR>
                                   <TD class="time" HEIGHT="18" VALIGN="middle" ALIGN="center" BGCOLOR="#000000">                                                                           
                    <!-- Welcome <SPAN CLASS="smallBrackets">[ </SPAN> --> 
<A href="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=<%=nav.getUser().getUserId()%>" class="statText" TARGET="_parent"><FONT color="<%=color%>"><B><%=nav.getUser().getHandle()%></B></FONT></A>  
                    <!-- <SPAN CLASS="smallBrackets">]</SPAN> -->
                                   </TD>
                                 </TR>
                                <TR>
                                   <TD class="time" HEIGHT="18" VALIGN="middle" ALIGN="center">                                                                         
    <form name="selectform">
      <select name="myfeatures" size="1" class="dropdown" onchange="goTo(this)">
        <OPTION value="SELECTED"> Select a Feature: </OPTION>
        <OPTION value="alltimewin">&#160;Profile</OPTION>
        <OPTION value="winningdebuts">&#160;Ratings History</OPTION>
        <OPTION value="impressivedebuts">&#160;Earnings History</OPTION>
        <OPTION value="hightesttotal">&#160;Room Statistics</OPTION>
        <OPTION value="ratingpointgain">&#160;Round Statistics</OPTION>	
        <OPTION value="consecwins">&#160;Advanced Member Search</OPTION>
        <OPTION value="submissionaccuracy">&#160;Affidavits</OPTION>
        <OPTION value="challengesuccess">&#160;My Referrals</OPTION>
        <OPTION value="challengesuccess">&#160;Development</OPTION>
        <OPTION value="challengesuccess">&#160;TCES (jobs)</OPTION>
      </select>
    </form>
                                   </TD>                                   
                                 </TR>                                 
                               </TABLE>
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR>             
                    </TABLE>
<% } else { %>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                          <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="bottom" WIDTH="190" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="190" HEIGHT="1" BORDER="0"/><BR/>     
                    <!-- <SPAN CLASS="smallBrackets">[ </SPAN> 
                    <A TARGET="_parent" CLASS="registerToday">
                      <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
                      Register Today
                    </A> : -->

                    <!-- <SPAN CLASS="smallBrackets">]</SPAN> -->
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR> 
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                          <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="middle" WIDTH="190" BGCOLOR="#000000">     
&#160;
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR>           
                    </TABLE>                    
<% }%>               
        </TD>        
      </TR>             
    </TABLE>
<%@ include file="menu.jsp" %>
