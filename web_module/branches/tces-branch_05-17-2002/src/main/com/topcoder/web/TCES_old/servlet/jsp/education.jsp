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
<%@ page import="com.topcoder.web.TCES.common.*" %>
<%
/*
Lookup cities = new Lookup();
cities.add("0", "New York");
cities.add("1", "Los Angeles");


Lookup schools = new Lookup();
cities.add("0", "Harvard");
cities.add("1", "Stanford");


Lookup degreeTypes = new Lookup();
degreeTypes.add("0", "BA");
degreeTypes.add("1", "MA");


Lookup majors = new Lookup();
majors.add("0", "CS");
majors.add("1", "IS");


Lookup gpas = new Lookup();
gpas.add("0", "4.0");
gpas.add("1", "2.0");


Lookup months = new Lookup();
months.add("0", "January");
months.add("1", "February");

Lookup years = new Lookup();
years.add("0", "2002");
years.add("1", "2003");

*/
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
    <td class="statTextBig" width="150" align="right" valign="middle"><img src="/i/clear.gif" width="150" height="2" 
border="0"></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">Required fields are in <b>bold</b></td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>    
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Education</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>    
  

    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>First 
Name</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="firstName" value ="" 
size="30" maxlength="30"></td>
    </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Last 
Name</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="lastName" value ="" 
size="30" maxlength="30"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Address&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="address1" value ="" 
size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="address2" value =""
size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">City&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="city" value ="" 
size="30" 
maxlength="30"></td>
  </tr>



    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">State&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" align="left" valign="middle" class="statTextBig">
        
    <select name="state" class="dropdown" onChange="changeCountry()">
<option value=""></option><option value="ZZ">Not In US</option>
<option value="AL">Alabama</option>
<option value="AK">Alaska</option>
<option value="AZ">Arizona</option>
<option value="AR">Arkansas</option>
<option value="CA">California</option>
<option value="CO">Colorado</option>
<option value="CT">Connecticut</option>
<option value="DE">Delaware</option>
<option value="DC">District of Columbia</option>
<option value="FL">Florida</option>
<option value="GA">Georgia</option>
<option value="HI">Hawaii</option>
<option value="ID">Idaho</option>
<option value="IL">Illinois</option>
<option value="IN">Indiana</option>
<option value="IA">Iowa</option>
<option value="KS">Kansas</option>
<option value="KY">Kentucky</option>
<option value="LA">Louisiana</option>
<option value="ME">Maine</option>
<option value="MD">Maryland</option>
<option value="MA">Massachusetts</option>
<option value="MI">Michigan</option>
<option value="MN">Minnesota</option>
<option value="MS">Mississippi</option>
<option value="MO">Missouri</option>
<option value="MT">Montana</option>
<option value="NE">Nebraska</option>
<option value="NV">Nevada</option>
<option value="NH">New Hampshire</option>
<option value="NJ">New Jersey</option>
<option value="NM">New Mexico</option>
<option value="NY">New York</option>
<option value="NC">North Carolina</option>
<option value="ND">North Dakota</option>
<option value="ZZ">Not in US</option>
<option value="OH">Ohio</option>
<option value="OK">Oklahoma</option>
<option value="OR">Oregon</option>
<option value="PA">Pennsylvania</option>
<option value="PR">Puerto Rico</option>
<option value="RI">Rhode Island</option>
<option value="SC">South Carolina</option>
<option value="SD">South Dakota</option>
<option value="TN">Tennessee</option>
<option value="TX">Texas</option>
<option value="UT">Utah</option>
<option value="VT">Vermont</option>
<option value="VI">Virgin Islands</option>
<option value="VA">Virginia</option>
<option value="WA">Washington</option>
<option value="WV">West Virginia</option>
<option value="WI">Wisconsin</option>
<option value="WY">Wyoming</option>
</select>
</td>
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
