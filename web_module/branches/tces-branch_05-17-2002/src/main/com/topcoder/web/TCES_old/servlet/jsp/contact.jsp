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
String firstName = objCoder.first_name;
String lastName = objCoder.last_name;
String address1 = "";
String address2 = "";
String city = "";
String state = "";
String zip = "";
String country = "";
String phone = "";
String handle = "";
String email = "";
String remail = "";
String quote = "";
boolean nextCompetition = true;
boolean competitionResults = true;
boolean employmentOpportunities = true;
boolean memberDevelopment = true;
boolean newsEvents = true;
String editor = "";
String language = "";
boolean student = true;
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
        
    <SELECT NAME="state" CLASS="dropdown" ONCHANGE="changeCountry()">
<OPTION VALUE=""></OPTION><OPTION VALUE="ZZ">Not In US</OPTION>
<OPTION VALUE="AL">Alabama</OPTION>
<OPTION VALUE="AK">Alaska</OPTION>
<OPTION VALUE="AZ">Arizona</OPTION>
<OPTION VALUE="AR">Arkansas</OPTION>
<OPTION VALUE="CA">California</OPTION>
<OPTION VALUE="CO">Colorado</OPTION>
<OPTION VALUE="CT">Connecticut</OPTION>
<OPTION VALUE="DE">Delaware</OPTION>
<OPTION VALUE="DC">District of Columbia</OPTION>
<OPTION VALUE="FL">Florida</OPTION>
<OPTION VALUE="GA">Georgia</OPTION>
<OPTION VALUE="HI">Hawaii</OPTION>
<OPTION VALUE="ID">Idaho</OPTION>
<OPTION VALUE="IL">Illinois</OPTION>
<OPTION VALUE="IN">Indiana</OPTION>
<OPTION VALUE="IA">Iowa</OPTION>
<OPTION VALUE="KS">Kansas</OPTION>
<OPTION VALUE="KY">Kentucky</OPTION>
<OPTION VALUE="LA">Louisiana</OPTION>
<OPTION VALUE="ME">Maine</OPTION>
<OPTION VALUE="MD">Maryland</OPTION>
<OPTION VALUE="MA">Massachusetts</OPTION>
<OPTION VALUE="MI">Michigan</OPTION>
<OPTION VALUE="MN">Minnesota</OPTION>
<OPTION VALUE="MS">Mississippi</OPTION>
<OPTION VALUE="MO">Missouri</OPTION>
<OPTION VALUE="MT">Montana</OPTION>
<OPTION VALUE="NE">Nebraska</OPTION>
<OPTION VALUE="NV">Nevada</OPTION>
<OPTION VALUE="NH">New Hampshire</OPTION>
<OPTION VALUE="NJ">New Jersey</OPTION>
<OPTION VALUE="NM">New Mexico</OPTION>
<OPTION VALUE="NY">New York</OPTION>
<OPTION VALUE="NC">North Carolina</OPTION>
<OPTION VALUE="ND">North Dakota</OPTION>
<OPTION VALUE="ZZ">Not in US</OPTION>
<OPTION VALUE="OH">Ohio</OPTION>
<OPTION VALUE="OK">Oklahoma</OPTION>
<OPTION VALUE="OR">Oregon</OPTION>
<OPTION VALUE="PA">Pennsylvania</OPTION>
<OPTION VALUE="PR">Puerto Rico</OPTION>
<OPTION VALUE="RI">Rhode Island</OPTION>
<OPTION VALUE="SC">South Carolina</OPTION>
<OPTION VALUE="SD">South Dakota</OPTION>
<OPTION VALUE="TN">Tennessee</OPTION>
<OPTION VALUE="TX">Texas</OPTION>
<OPTION VALUE="UT">Utah</OPTION>
<OPTION VALUE="VT">Vermont</OPTION>
<OPTION VALUE="VI">Virgin Islands</OPTION>
<OPTION VALUE="VA">Virginia</OPTION>
<OPTION VALUE="WA">Washington</OPTION>
<OPTION VALUE="WV">West Virginia</OPTION>
<OPTION VALUE="WI">Wisconsin</OPTION>
<OPTION VALUE="WY">Wyoming</OPTION>
</SELECT>
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
      
      <SELECT NAME="country" CLASS="dropdown">
<OPTION VALUE=""></OPTION><OPTION VALUE="840">United States</OPTION>
<OPTION VALUE="036">Australia</OPTION>
<OPTION VALUE="124">Canada</OPTION>
<OPTION VALUE=" ">-----------------------</OPTION>
<OPTION VALUE="004">Afghanistan</OPTION>
<OPTION VALUE="008">Albania</OPTION>
<OPTION VALUE="012">Algeria</OPTION>
<OPTION VALUE="016">American Samoa</OPTION>
<OPTION VALUE="020">Andorra</OPTION>
<OPTION VALUE="024">Angola</OPTION>
<OPTION VALUE="660">Anguilla</OPTION>
<OPTION VALUE="010">Antarctica</OPTION>
<OPTION VALUE="028">Antigua and Barbud</OPTION>
<OPTION VALUE="032">Argentina</OPTION>
<OPTION VALUE="051">Armenia</OPTION>
<OPTION VALUE="533">Aruba</OPTION>
<OPTION VALUE="040">Austria</OPTION>
<OPTION VALUE="031">Azerbaijan</OPTION>
<OPTION VALUE="044">Bahamas</OPTION>
<OPTION VALUE="048">Bahrain</OPTION>
<OPTION VALUE="050">Bangladesh</OPTION>
<OPTION VALUE="052">Barbados</OPTION>
<OPTION VALUE="112">Belarus</OPTION>
<OPTION VALUE="056">Belgium</OPTION>
<OPTION VALUE="084">Belize</OPTION>
<OPTION VALUE="204">Benin</OPTION>
<OPTION VALUE="060">Bermuda</OPTION>
<OPTION VALUE="064">Bhutan</OPTION>
<OPTION VALUE="068">Bolivia</OPTION>
<OPTION VALUE="070">Bosnia and Herzego</OPTION>
<OPTION VALUE="072">Botswana</OPTION>
<OPTION VALUE="074">Bouvet Island</OPTION>
<OPTION VALUE="076">Brazil</OPTION>
<OPTION VALUE="086">British Indian Oce</OPTION>
<OPTION VALUE="096">Brunei Darussalam</OPTION>
<OPTION VALUE="100">Bulgaria</OPTION>
<OPTION VALUE="854">Burkina Faso</OPTION>
<OPTION VALUE="108">Burundi</OPTION>
<OPTION VALUE="116">Cambodia</OPTION>
<OPTION VALUE="120">Cameroon</OPTION>
<OPTION VALUE="132">Cape Verde</OPTION>
<OPTION VALUE="136">Cayman Islands</OPTION>
<OPTION VALUE="140">Central African Re</OPTION>
<OPTION VALUE="148">Chad</OPTION>
<OPTION VALUE="152">Chile</OPTION>
<OPTION VALUE="156">China</OPTION>
<OPTION VALUE="162">Christmas Island</OPTION>
<OPTION VALUE="166">Cocos (Keeling) Is</OPTION>
<OPTION VALUE="170">Colombia</OPTION>
<OPTION VALUE="174">Comoros</OPTION>
<OPTION VALUE="178">Congo</OPTION>
<OPTION VALUE="184">Cook Islands</OPTION>
<OPTION VALUE="188">Costa Rica</OPTION>
<OPTION VALUE="384">Cote D'Ivoire</OPTION>
<OPTION VALUE="191">Croatia (Local Nam</OPTION>
<OPTION VALUE="192">Cuba</OPTION>
<OPTION VALUE="196">Cyprus</OPTION>
<OPTION VALUE="203">Czech Republic</OPTION>
<OPTION VALUE="208">Denmark</OPTION>
<OPTION VALUE="262">Djibouti</OPTION>
<OPTION VALUE="212">Dominica</OPTION>
<OPTION VALUE="214">Dominican Republic</OPTION>
<OPTION VALUE="626">East Timor</OPTION>
<OPTION VALUE="218">Ecuador</OPTION>
<OPTION VALUE="818">Egypt</OPTION>
<OPTION VALUE="222">El Salvador</OPTION>
<OPTION VALUE="226">Equatorial Guinea</OPTION>
<OPTION VALUE="232">Eritrea</OPTION>
<OPTION VALUE="233">Estonia</OPTION>
<OPTION VALUE="231">Ethiopia</OPTION>
<OPTION VALUE="238">Falkland Islands (</OPTION>
<OPTION VALUE="234">Faroe Islands</OPTION>
<OPTION VALUE="242">Fiji</OPTION>
<OPTION VALUE="246">Finland</OPTION>
<OPTION VALUE="250">France</OPTION>
<OPTION VALUE="254">French Guiana</OPTION>
<OPTION VALUE="258">French Polynesia</OPTION>
<OPTION VALUE="260">French Southern Te</OPTION>
<OPTION VALUE="266">Gabon</OPTION>
<OPTION VALUE="270">Gambia</OPTION>
<OPTION VALUE="268">Georgia</OPTION>
<OPTION VALUE="276">Germany</OPTION>
<OPTION VALUE="288">Ghana</OPTION>
<OPTION VALUE="292">Gibraltar</OPTION>
<OPTION VALUE="300">Greece</OPTION>
<OPTION VALUE="304">Greenland</OPTION>
<OPTION VALUE="308">Grenada</OPTION>
<OPTION VALUE="312">Guadeloupe</OPTION>
<OPTION VALUE="316">Guam</OPTION>
<OPTION VALUE="320">Guatemala</OPTION>
<OPTION VALUE="324">Guinea</OPTION>
<OPTION VALUE="624">Guinea-Bissau</OPTION>
<OPTION VALUE="328">Guyana</OPTION>
<OPTION VALUE="332">Haiti</OPTION>
<OPTION VALUE="334">Heard and Mc Donal</OPTION>
<OPTION VALUE="340">Honduras</OPTION>
<OPTION VALUE="344">Hong Kong</OPTION>
<OPTION VALUE="348">Hungary</OPTION>
<OPTION VALUE="352">Iceland</OPTION>
<OPTION VALUE="356">India</OPTION>
<OPTION VALUE="360">Indonesia</OPTION>
<OPTION VALUE="364">Iran (Islamic Repu</OPTION>
<OPTION VALUE="368">Iraq</OPTION>
<OPTION VALUE="372">Ireland</OPTION>
<OPTION VALUE="376">Israel</OPTION>
<OPTION VALUE="380">Italy</OPTION>
<OPTION VALUE="388">Jamaica</OPTION>
<OPTION VALUE="392">Japan</OPTION>
<OPTION VALUE="400">Jordan</OPTION>
<OPTION VALUE="398">Kazakhstan</OPTION>
<OPTION VALUE="404">Kenya</OPTION>
<OPTION VALUE="296">Kiribati</OPTION>
<OPTION VALUE="410">Korea, Democratic </OPTION>
<OPTION VALUE="408">Korea, Republic of</OPTION>
<OPTION VALUE="414">Kuwait</OPTION>
<OPTION VALUE="417">Kyrgyzstan</OPTION>
<OPTION VALUE="418">Lao People's Democ</OPTION>
<OPTION VALUE="428">Latvia</OPTION>
<OPTION VALUE="422">Lebanon</OPTION>
<OPTION VALUE="426">Lesotho</OPTION>
<OPTION VALUE="430">Liberia</OPTION>
<OPTION VALUE="434">Libyan Arab Jamahi</OPTION>
<OPTION VALUE="438">Liechtenstein</OPTION>
<OPTION VALUE="440">Lithuania</OPTION>
<OPTION VALUE="442">Luxembourg</OPTION>
<OPTION VALUE="446">Macau</OPTION>
<OPTION VALUE="807">Macedonia, Former </OPTION>
<OPTION VALUE="450">Madagascar</OPTION>
<OPTION VALUE="454">Malawi</OPTION>
<OPTION VALUE="458">Malaysia</OPTION>
<OPTION VALUE="462">Maldives</OPTION>
<OPTION VALUE="466">Mali</OPTION>
<OPTION VALUE="470">Malta</OPTION>
<OPTION VALUE="584">Marshall Islands</OPTION>
<OPTION VALUE="474">Martinique</OPTION>
<OPTION VALUE="478">Mauritania</OPTION>
<OPTION VALUE="480">Mauritius</OPTION>
<OPTION VALUE="175">Mayotte</OPTION>
<OPTION VALUE="484">Mexico</OPTION>
<OPTION VALUE="583">Micronesia, Federa</OPTION>
<OPTION VALUE="498">Moldova, Republic </OPTION>
<OPTION VALUE="492">Monaco</OPTION>
<OPTION VALUE="496">Mongolia</OPTION>
<OPTION VALUE="500">Montserrat</OPTION>
<OPTION VALUE="504">Morocco</OPTION>
<OPTION VALUE="508">Mozambique</OPTION>
<OPTION VALUE="104">Myanmar</OPTION>
<OPTION VALUE="516">Namibia</OPTION>
<OPTION VALUE="520">Nauru</OPTION>
<OPTION VALUE="524">Nepal</OPTION>
<OPTION VALUE="528">Netherlands</OPTION>
<OPTION VALUE="530">Netherlands Antill</OPTION>
<OPTION VALUE="540">New Caledonia</OPTION>
<OPTION VALUE="554">New Zealand</OPTION>
<OPTION VALUE="558">Nicaragua</OPTION>
<OPTION VALUE="562">Niger</OPTION>
<OPTION VALUE="566">Nigeria</OPTION>
<OPTION VALUE="570">Niue</OPTION>
<OPTION VALUE="574">Norfolk Island</OPTION>
<OPTION VALUE="580">Northern Mariana I</OPTION>
<OPTION VALUE="578">Norway</OPTION>
<OPTION VALUE="512">Oman</OPTION>
<OPTION VALUE="586">Pakistan</OPTION>
<OPTION VALUE="585">Palau</OPTION>
<OPTION VALUE="591">Panama</OPTION>
<OPTION VALUE="598">Papua New Guinea</OPTION>
<OPTION VALUE="600">Paraguay</OPTION>
<OPTION VALUE="604">Peru</OPTION>
<OPTION VALUE="608">Philippines</OPTION>
<OPTION VALUE="612">Pitcairn</OPTION>
<OPTION VALUE="616">Poland</OPTION>
<OPTION VALUE="620">Portugal</OPTION>
<OPTION VALUE="630">Puerto Rico</OPTION>
<OPTION VALUE="634">Qatar</OPTION>
<OPTION VALUE="638">Reunion</OPTION>
<OPTION VALUE="642">Romania</OPTION>
<OPTION VALUE="643">Russian Federation</OPTION>
<OPTION VALUE="646">Rwanda</OPTION>
<OPTION VALUE="659">Saint Kitts and Ne</OPTION>
<OPTION VALUE="662">Saint Lucia</OPTION>
<OPTION VALUE="670">Saint Vincent and </OPTION>
<OPTION VALUE="882">Samoa</OPTION>
<OPTION VALUE="674">San Marino</OPTION>
<OPTION VALUE="678">Sao Tome and Princ</OPTION>
<OPTION VALUE="682">Saudi Arabia</OPTION>
<OPTION VALUE="686">Senegal</OPTION>
<OPTION VALUE="690">Seychelles</OPTION>
<OPTION VALUE="694">Sierra Leone</OPTION>
<OPTION VALUE="702">Singapore</OPTION>
<OPTION VALUE="703">Slovakia (Slovak R</OPTION>
<OPTION VALUE="705">Slovenia</OPTION>
<OPTION VALUE="090">Solomon Islands</OPTION>
<OPTION VALUE="706">Somalia</OPTION>
<OPTION VALUE="710">South Africa</OPTION>
<OPTION VALUE="239">South Georgia and </OPTION>
<OPTION VALUE="724">Spain</OPTION>
<OPTION VALUE="144">Sri Lanka</OPTION>
<OPTION VALUE="654">St. Helena</OPTION>
<OPTION VALUE="666">St. Pierre and Miq</OPTION>
<OPTION VALUE="736">Sudan</OPTION>
<OPTION VALUE="740">Suriname</OPTION>
<OPTION VALUE="744">Svalbard and Jan M</OPTION>
<OPTION VALUE="748">Swaziland</OPTION>
<OPTION VALUE="752">Sweden</OPTION>
<OPTION VALUE="756">Switzerland</OPTION>
<OPTION VALUE="760">Syrian Arab Republ</OPTION>
<OPTION VALUE="158">Taiwan</OPTION>
<OPTION VALUE="762">Tajikistan</OPTION>
<OPTION VALUE="834">Tanzania, United R</OPTION>
<OPTION VALUE="764">Thailand</OPTION>
<OPTION VALUE="768">Togo</OPTION>
<OPTION VALUE="772">Tokelau</OPTION>
<OPTION VALUE="776">Tonga</OPTION>
<OPTION VALUE="780">Trinidad and Tobag</OPTION>
<OPTION VALUE="788">Tunisia</OPTION>
<OPTION VALUE="792">Turkey</OPTION>
<OPTION VALUE="795">Turkmenistan</OPTION>
<OPTION VALUE="796">Turks and Caicos I</OPTION>
<OPTION VALUE="798">Tuvalu</OPTION>
<OPTION VALUE="800">Uganda</OPTION>
<OPTION VALUE="804">Ukraine</OPTION>
<OPTION VALUE="784">United Arab Emirat</OPTION>
<OPTION VALUE="826">United Kingdom</OPTION>
<OPTION VALUE="581">United States Mino</OPTION>
<OPTION VALUE="858">Uruguay</OPTION>
<OPTION VALUE="860">Uzbekistan</OPTION>
<OPTION VALUE="548">Vanuatu</OPTION>
<OPTION VALUE="336">Vatican City State</OPTION>
<OPTION VALUE="862">Venezuela</OPTION>
<OPTION VALUE="704">Viet Nam</OPTION>
<OPTION VALUE="092">Virgin Islands (Br</OPTION>
<OPTION VALUE="850">Virgin Islands (U.</OPTION>
<OPTION VALUE="876">Wallis and Futuna </OPTION>
<OPTION VALUE="732">Western Sahara</OPTION>
<OPTION VALUE="887">Yemen</OPTION>
<OPTION VALUE="891">Yugoslavia</OPTION>
<OPTION VALUE="180">Zaire</OPTION>
<OPTION VALUE="894">Zambia</OPTION>
<OPTION VALUE="716">Zimbabwe</OPTION>
</SELECT>

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
    <TD COLPSAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="email" VALUE ="<%= email 
%>" size="30" 
maxlength="100"></TD>
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
    <TD COLSPAN="2" CLASS="statTextBig" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="quote" VALUE ="<%= remail 
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
        <INPUT TYPE="checkbox" NAME="notify_1" CLASS="statText" CHECKED />
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
        <INPUT TYPE="checkbox" NAME="notify_2" CLASS="statText" CHECKED />
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
        <INPUT TYPE="checkbox" NAME="notify_3" CLASS="statText" CHECKED />
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
        <INPUT TYPE="checkbox" NAME="notify_4" CLASS="statText" CHECKED />
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
        <INPUT TYPE="checkbox" NAME="notify_5" CLASS="statText" CHECKED />
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
        
    <SELECT NAME="editor" CLASS="dropdown">
<OPTION VALUE=""></OPTION><OPTION VALUE="1">JVI</OPTION>
<OPTION VALUE="0">Standard</OPTION>
</SELECT>
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
        
        <SELECT NAME="language" CLASS="dropdown">
<OPTION VALUE=""></OPTION><OPTION VALUE="1">Java</OPTION>
<OPTION VALUE="3">C ++</OPTION>
<OPTION VALUE="4">C#</OPTION>
</SELECT>
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
