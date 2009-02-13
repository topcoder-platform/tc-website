<%@  page 
  language="java"
  errorPage="/errorPage.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TCES</TITLE>
    <%@ include file="../script.jsp" %>
  </HEAD>
  <BODY BGCOLOR=#CCCCCC TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
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
      <TD CLASS="statTextBig" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="../body_top.jsp" >  
           <jsp:param name="image" value="registration"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Education"/>  
        </jsp:include>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
							<% //@ include file="nocache.jsp" %>
							<% //@ page errorPage="error.jsp" %>
							<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
							<%@ page import="com.topcoder.web.tces.servlet.*" %>
							<jsp:useBean id="TCES" scope="session" class="com.topcoder.web.tces.bean.TCES" />
							<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
							<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
							<BR><BR><BR>
							User is <%= user %><BR>
							<%= user.getHandle() %> (<%= user.getUserId() %>)
							<BR><BR>
<!--trj insert 0611 2200 -->

<%@ page import="javax.ejb.*,javax.naming.*,javax.rmi.*,com.topcoder.web.TCES.ejb.*,java.rmi.*,java.util.*" %>
<%@ page import="com.topcoder.web.tces.common.*" %>
<%

Lookup cities = new Lookup();
cities.addPair("0", "New York");
cities.addPair("1", "Los Angeles");


Lookup schools = new Lookup();
schools.addPair("0", "Harvard");
schools.addPair("1", "Stanford");


Lookup degreeTypes = new Lookup();
degreeTypes.addPair("0", "BA");
degreeTypes.addPair("1", "MA");


Lookup majors = new Lookup();
majors.addPair("0", "CS");
majors.addPair("1", "IS");


Lookup gpas = new Lookup();
gpas.addPair("0", "4.0");
gpas.addPair("1", "2.0");


Lookup months = new Lookup();
months.addPair("0", "January");
months.addPair("1", "February");

Lookup years = new Lookup();
years.addPair("0", "2002");
years.addPair("1", "2003");

String selectedCity = "";
String selectedSchool = "";
String selectedDegreeType = "";
String selectedMajor = "";
String selectedStartMonth = "";
String selectedStartYear = "";
String selectedGradMonth = "";
String selectedGradYear = "";




%>

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
<td colspan="5" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Education</td>
</tr>
  
<tr valign="middle">
<td colspan="5" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="18" border="0"></td>
</tr>
    
<tr>
<td><img src="/i/clear.gif" height="1" width="1" border="0"></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td colspan="3" class="errorText" align="left" valign="middle"></td>
</tr>
    
<tr>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 1: Select State/Area<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= cities.getSelectBox("", "", "", "") %>
</b><br><br>
<b>&nbsp;Country not listed?<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<input type="text"><br><br>
</td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td width="6%" align="center" valign="middle"><font color="#ffffff">&gt;&gt;</font></td>
<td align="center" width="2%"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td width="45%" class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 2: Select School<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= schools.getSelectBox("", "", "", "") %>
</b><br><br>
<b>&nbsp;School not listed?</b><br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<input type="text"><br><br>
</td>
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

<tr>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 3: Select Degree Type</b><br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= degreeTypes.getSelectBox("", "", "", "") %>
<br><br>
&nbsp;<b>GPA:</b><br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= gpas.getSelectBox("", "", "", "") %>
<br><br>
</td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td align="center" valign="middle"><font color="#ffffff">&gt;&gt;</font></td>
<td align="center"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 4: Select Major</b><br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= majors.getSelectBox("", "", "", "") %>
</td>
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

<tr>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 5: Select Start Date<br>
<img src="/i/clear.gif" height="3" width="1" border="0"><br>
&nbsp;<%= months.getSelectBox("", "", "", "") %>&nbsp;<%= years.getSelectBox("", "", "", "") %>
<br><br>
</b></td>
<td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td align="center" valign="middle"><font color="#ffffff">&gt;&gt;</font></td>
<td align="center"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
<td class="statTextBig" align="left" valign="top" background="/i/steel_gray_bg.gif"><b>&nbsp;Step 4: Select Graduation Date<br>
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




<!--trj end insert -->

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
