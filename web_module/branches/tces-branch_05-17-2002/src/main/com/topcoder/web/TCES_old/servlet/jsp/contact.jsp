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


<!--trj insert 6/11/2002 1943 -->
<%


CoderObject objCoder = tces.getCoderObject();
UserObject objUser = tces.getUserObject();
String firstName = objCoder.first_name;
String lastName = objCoder.last_name;
String address1 = objCoder.address1;
String address2 = objCoder.address2;
String city = objCoder.city;
String state = objCoder.state_code;
String zip = objCoder.zip;
String country = objCoder.country_code;
String phone = objCoder.home_phone;
String handle = objUser.handle;
String email = objUser.email;
String remail = email;
String quote = objCoder.quote;


//xxx todo: still have to find out where these are coming from
boolean nextCompetition = true;
boolean competitionResults = true;
boolean employmentOpportunities = true;
boolean memberDevelopment = true;
boolean newsEvents = true;
boolean student = true;

String editor = objCoder.editor_id.toString();
String language = objCoder.language_id.toString();


StateBean beanState = new StateBean();

Lookup states= new Lookup();
states.addPair("AL", "alabama");
/*
try {
    states = beanState.listStateCodeStateName();
} catch (SQLException exc) {
//xxx todo: add exception handling
}
*/

CountryBean beanCountry = new CountryBean();
Lookup countries= new Lookup();
countries.addPair("792", "Turkey");

/*
try {
    countries = beanCountry.listCountryCodeCountryName();
} catch (SQLException ecx) {
//xxx todo: add exception handling
}
*/

EditorBean beanEditor = new EditorBean();
Lookup editors = new Lookup();

editors.addPair("1", "jvi");
/*
try {
    editors = beanEditor.listEditorCodeEditorName();
} catch (SQLException exc) {
//xxx todo: add exception handling
}
*/


LanguageBean beanLanguage = new LanguageBean();
Lookup languages = new Lookup();
languages.addPair("1", "Java");
/*
try {
    languages = beanLanguage.listEditorCodeEditorName();
} catch (SQLException exc) {
//xxx todo: add exception handling
}
*/
%>

<FORM NAME="frm" ACTION="<%= TCESController.ALIAS %>?task=<%= tces.getCurrentNav().getTaskKey() %>" METHOD="POST">
  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" ALIGN="center">
  <TR>
    <TD CLASS="statTextBig" WIDTH="150" ALIGN="right" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="2" 
BORDER="0"></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">Required fields are in <B>bold</B></TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>   
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">
<%
ArrayList errors = tces.getErrors();
for (int i = 0; i < errors.size(); i++) {
    out.print(((String)errors.get(i)) + "<br>");
}
%></TD>
  </TR>   
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="16">&nbsp;User
Information</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>    
  

    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif"><B>First 
Name</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="firstName" VALUE ="<%= 
firstName %>" 
size="30" maxlength="30"></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif"><B>Last 
Name</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="lastName" VALUE ="<%= 
lastName %>" 
size="30" maxlength="30"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Address&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="address1" VALUE ="<%= 
address1 %>" 
size="30" maxlength="50"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="address2" VALUE ="<%= 
address2 %>"
size="30" maxlength="50"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">City&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="city" VALUE ="<%= city %>" 
size="30" 
maxlength="30"></TD>
  </TR>



    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">State&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="statTextBig">
        
<%= states.getSelectBox(state, "state", "dropdown", "changeCountry()") %>

</TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Zip&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="zip" VALUE ="<%= zip %>" 
size="10" 
maxlength="10"></TD>
  </TR>


   <TR>
     <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Country&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0
"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="statTextBig">
      
      
<%= countries.getSelectBox(country, "country", "dropdown", "") %>

    </TD>
  </TR>


    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Phone</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="phone" VALUE ="<%= phone 
%>" size="30" 
maxlength="20"></TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>  
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="16">&nbsp;Handle 
&amp; Password</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>  
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Handle</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="handle" VALUE ="<%= 
handle %>" 
size="30" maxlength="15"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Password</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="password" VALUE ="" SIZE="30" 
MAXLENGTH="15"></TD>
    <TD CLASS="statText" ALIGN="left" VALIGN="top">&nbsp;</TD>
  </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statText" ALIGN="left" VALIGN="top">Minimum&nbsp;of&nbsp;7&nbsp;characters<BR></TD>
  </TR>  
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif"><B>Re-type 
Password</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="confirmPassword" VALUE 
="" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Email</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD COLPSAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="email" VALUE ="<%= email %>" size="30" maxlength="100"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif"><B>Re-type 
Email</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLPSAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="confirmEmail" VALUE ="<%= 
remail %>" 
size="30" maxlength="100"></TD>
  </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account 
activation.<BR></TD>
  </TR>


  <TR>
    <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Quote&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="quote" VALUE ="<%= quote 
%>" size="30" 
maxlength="255"></TD>
  </TR>


  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="16">&nbsp;Email 
Notification</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>


  
    <TR>
      <TD></TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
      </TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Next 
Competition&nbsp;</TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">

<%
String checkedString;
if (nextCompetition) {
    checkedString = "checked=\"checked\"";
} else {
    checkedString = "";
}
%>
        <INPUT TYPE="checkbox" NAME="notify_1" CLASS="statText" <%= checkedString %> />
      </TD>
    </TR>
  
    <TR>
      <TD></TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
      </TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Competition 
Results&nbsp;</TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
<%

if (competitionResults) {
    checkedString = "checked=\"checked\"";
} else {
    checkedString = "";
}
%>
        <INPUT TYPE="checkbox" NAME="notify_2" CLASS="statText" <%= checkedString %> />
      </TD>
    </TR>
  
    <TR>
      <TD></TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
      </TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Employment 
Opportunities&nbsp;</TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
<%

if (employmentOpportunities) {
    checkedString = "checked=\"checked\"";
} else {
    checkedString = "";
}
%>
        <INPUT TYPE="checkbox" NAME="notify_3" CLASS="statText" <%= checkedString %> />
      </TD>
    </TR>
  
    <TR>
      <TD></TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
      </TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Member Development 
Opportunities&nbsp;</TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
<%

if (memberDevelopment) {
    checkedString = "checked=\"checked\"";
} else {
    checkedString = "";
}
%>
        <INPUT TYPE="checkbox" NAME="notify_4" CLASS="statText" <%= checkedString %> />
      </TD>
    </TR>
  
    <TR>
      <TD></TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
      </TD>
    </TR>
    <TR>
      <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">TopCoder News and 
Events&nbsp;</TD>
      <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
<%

if (newsEvents) {
    checkedString = "checked=\"checked\"";
} else {
    checkedString = "";
}
%>
        <INPUT TYPE="checkbox" NAME="notify_5" CLASS="statText" <%= checkedString %> />
      </TD>
    </TR>
  


  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>  
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="16">&nbsp;Editor 
&amp; Language</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>  


    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Default 
Editor&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
        
<%= editors.getSelectBox(editor, "editor", "dropdown", "") %>

</TD>
  </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of editor 
types. UNIX users comfortable with vi may opt for JVI. Those more familiar with the behavior of Windows Notepad should 
choose Standard.</TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">Default 
Language&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle">
        
<%= languages.getSelectBox(language, "language", "dropdown", "") %>

</TD>
  </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" VALIGN="middle" BACKGROUND="/i/steel_gray_bg.gif">&nbsp;</TD><TD><IMG 
SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of programming 
languages. The language you choose will be your default.</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>  
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" HEIGHT="16">&nbsp;Student or 
Professional (please choose one)</TD>
  </TR>
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statTextBig" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>  
    
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" CLASS="errorText" 
ALIGN="left" VALIGN="middle"></TD>
    </TR>
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" HEIGHT="18" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Student</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="radio" NAME="coderType" VALUE ="1" 
></TD>
  </TR>  
<!--
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">By indicating that you are a "Student" member, you must 
be enrolled full-time at an accredited college or university.</td>
  </tr>
-->
  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>      
  <TR>
    <TD CLASS="statTextBig" ALIGN="right" HEIGHT="18" VALIGN="middle" 
BACKGROUND="/i/steel_gray_bg.gif"><B>Professional</B>&nbsp;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" 
BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="radio" NAME="coderType" VALUE ="2" 
></TD>
  </TR>


  <TR VALIGN="middle">
    <TD COLSPAN="4" CLASS="statText" VALIGN="middle">&nbsp;</TD>
  </TR>
    <TR ALIGN="right" VALIGN="middle">
        <TD ALIGN="right" VALIGN="middle"></TD>
        <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="statText"><INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="[ SAVE &gt;" /></TD>
    </TR>
  </TABLE>

</FORM>

<!--trj insert end-->







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
