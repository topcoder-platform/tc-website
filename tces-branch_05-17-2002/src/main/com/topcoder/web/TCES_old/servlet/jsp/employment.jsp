<%@  page 
  language="java"
  errorPage="/errorPage.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
		<%@ include file="nocache.jsp" %>
		<%@ page errorPage="error.jsp" %>
		<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
		<%@ page import="com.topcoder.web.tces.servlet.*" %>
		<%@ page import="com.topcoder.web.tces.common.*" %>
		<%@ page import="com.topcoder.web.tces.bean.*" %>
		<%@ page import="javax.ejb.*,javax.naming.*,javax.rmi.*,java.rmi.*,java.util.*" %>

		<%@ page import="com.topcoder.web.TCES.ejb.*" %>
		<%
			if (session.getAttribute("tces") == null || !(session.getAttribute("tces") instanceof TCES)) {
				response.sendRedirect(TCESController.ALIAS);
			}
			TCES tces = (TCES)session.getAttribute("tces");
		%>

    <TITLE>TCES</TITLE>
    <%@ include file="../script.jsp" %>
  </HEAD>
  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
	<jsp:usebean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />

  <%@ include file="../top.jsp" %>
  <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <%@ include file="left.jsp" %>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD CLASS="statTextBig" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="../body_top.jsp" >  
           <jsp:param name="image" value="registration"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="<%= tces.getCurrentNav().getPageTitle() %>"/>  
        </jsp:include>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>


<%

ProfileExperienceObject profExp = tces.getProfileExperienceObject();
	// load fields from bean
	Lookup gpas = new Lookup();
	gpas.addPair("0", "4.0");
	gpas.addPair("1", "2.0");
	
	
	Lookup months = new Lookup();
	months.addPair("0", "January");
	months.addPair("1", "February");
	
	Lookup years = new Lookup();
	years.addPair("0", "2002");
	years.addPair("1", "2003");
	
	
	Lookup cities = new Lookup();
	cities.addPair("1", "Katmandu");
	cities.addPair("2", "Kalamazoo");
	
	Lookup states = new Lookup();
	states.addPair("1", "Alabama");
	states.addPair("2", "North Dakota");
	
	
	Lookup countries = new Lookup();
	states.addPair("1", "Lithuania");
	states.addPair("2", "Norway");
	
	Lookup titles = new Lookup();
	titles.addPair("1", "Software Engineer");
	titles.addPair("2", "Janitor");
	
	Lookup roles = new Lookup();
	titles.addPair("1", "QA");
	titles.addPair("2", "Developer");
	
	Lookup managed = new Lookup();
	managed.addPair("1", "Yes");
	managed.addPair("2", "No");
	
	Lookup numberPeople = new Lookup();
	numberPeople.addPair("1", "1-5");
	numberPeople.addPair("2", "2342 - 123123");
	
	Lookup industries = new Lookup();
	industries.addPair("1", "Finance");
	industries.addPair("2", "Adult");
	
	String company = profExp.organization_name;
	String city = profExp.city;
	String selectedState = profExp.state_code;
	String selectedCountry = profExp.country_code;
	String selectedIndustry = profExp.industry_id.toString();
	String url = profExp.organization_url;
	String selectedTitle = profExp.job_title;
	String selectedRole = profExp.job_role_id.toString();
	String selectedManagement = profExp.job_type_id.toString();
	String selectedNumberPeople = profExp.organization_size_id.toString();
	
        Calendar c = new GregorianCalendar();
        c.setTime((java.util.Date)profExp.date_start);
	String startMonth = Integer.toString(c.get(Calendar.MONTH) + 1);
	String startYear = Integer.toString(c.get(Calendar.YEAR) + 1900);
        c.setTime((java.util.Date)profExp.date_end);
	String endMonth = Integer.toString(c.get(Calendar.MONTH) + 1);
	String endYear = Integer.toString(c.get(Calendar.YEAR) + 1900);
%>

<FORM NAME="frm" ACTION="<%= TCESController.ALIAS %>?task=<%= tces.getCurrentNav().getTaskKey() %>" METHOD="POST">
<table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">

<tr>
<td class="statTextBig" width="45%" align="right" valign="middle"><img src="/i/clear.gif" width="150" height="2" border="0"></td>
<td width="2%"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td width="53%" colspan="3" class="statTextBig" align="left" valign="middle">Required fields are in <b>bold</b></td>
</tr>
  
<tr valign="middle">
<td colspan="5" class="statText" valign="middle">&nbsp;</td>
</tr>    
  
<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Work History</td>
</tr>
  
<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>
    
<tr>
<td><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>


<% // COMPANY %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="left" valign="middle" background="/i/steel_gray_bg.gif"><b>Step 1: Enter Company Name and Information</b></td>
<td colspan="2"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
</tr>
<tr><td colspan="3"><img src="/i/clear.gif" height="1" width="1" border="0"></td></tr>
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Company&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><input type="text" name="company" value="<%= company %>" size="30" maxlength="30"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>



<% // city %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">City&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><input type="text" name="city" value="<%= city %>" size="30" maxlength="30"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>


<% // states %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">State&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= states.getSelectBox(selectedState, "state", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>


<% // country %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Country&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= countries.getSelectBox(selectedCountry, "country", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>



<% // industry %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Industry&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= industries.getSelectBox(selectedIndustry, "industry", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>



<% // URL %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">URL&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><input type="text" name="url" value="<%= url %>" size="30" maxlength="30"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>

<%// big line %>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;</td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<%//step 2 %>
<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="left" valign="middle" background="/i/steel_gray_bg.gif"><b>Step 2: Your Position</b></td>
<td colspan="2"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
</tr>
<tr><td colspan="3"><img src="/i/clear.gif" height="1" width="1" border="0"></td></tr>
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Title&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= titles.getSelectBox("", "", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>


<% // role %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Role&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= roles.getSelectBox("", "", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>

<% // management %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Management?&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= managed.getSelectBox("", "", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>

<% // numberPeople %>

<tr>
<td colspan="5"><table width="100%" cellpadding="1" cellspacing="0" border="0">
<tr>
<td width="150" class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">People Managed&nbsp;</td>
<td width="1"><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td class="statTextBig" align="left" valign="middle"><%= numberPeople.getSelectBox("", "", "", "") %></td>
</tr>
</table>
</td>
</tr>
<tr>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>


<%// big line %>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;</td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>



<tr>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Term of Employment: Select Start Date<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= months.getSelectBox("", "", "", "") %>&nbsp;<%= years.getSelectBox("", "", "", "") %>
<br><br>
</b></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td align="center" valign="middle"><font color="#ffffff">&gt;&gt;</font></td>
<td align="center"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Next: End Date<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= months.getSelectBox("", "", "", "") %>&nbsp;<%= years.getSelectBox("", "", "", "") %>
<br><br>
</b></td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;</td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<% // buttons %>
<tr valign="middle">
<td colspan="5" align="right"><input type="button" value="Clear Form">&nbsp;<input type="button" value="Save and Add">&nbsp;<input type="button" value="Done"></td>
</tr>
<% // end buttons %>


<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;</td>
</tr>

<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>


<tr>
<td colspan="2" class="statTextBig" align="left" valign="middle" background="/i/steel_gray_bg.gif">History</td>
<td>&nbsp;</td>
<td colspan="2" class="statTextBig" align="left" valign="middle" background="/i/steel_gray_bg.gif">History</td>
</tr>

</table>

</FORM>


		    		</TD>
		    		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
			  	</TR>
			  	<TR>
			    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" 			BORDER="0"/></TD>
			  	</TR>     
			  <TR>
			    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
			    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" 			BORDER="0"/></TD>
			    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
			    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
			  </TR>  
			  <TR>
			    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
			    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
			    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
			    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
			  </TR>
			</TABLE>
        
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"><BR>
  <!-- <IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/> -->       
        <!-- Right Column Include Begins -->

          <%@ include file="reg_legal.jsp"%>

        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  <%@ include file="../foot.jsp" %>

  </BODY>
</HTML>
