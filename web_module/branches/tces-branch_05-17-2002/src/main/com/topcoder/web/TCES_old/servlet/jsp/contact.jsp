<%@  page 
  language="java"
  errorPage="/errorPage.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
		<jsp:useBean id="TCES" scope="session" class="com.topcoder.web.tces.bean.TCES" />
		<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
		<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
		<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
		<%@ page import="com.topcoder.web.tces.servlet.*" %>
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
           <jsp:param name="title" value="Contact Info"/>  
        </jsp:include>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
							<% //@ include file="nocache.jsp" %>
							<% //@ page errorPage="error.jsp" %>
							<BR><BR><BR>

							User is ?<%= user %><BR>
							<%= user.getHandle() %> (<%= user.getUserId() %>)
							<%
									CoderBean beanHandle = new CoderBean();
									CoderObject obj = new CoderObject();
									obj.coder_id = new Long( (long)user.getUserId() );
									obj = beanHandle.request( Coder.SELECT, obj );
							%>
							
							<%= obj.last_name %>, <%= obj.first_name %>
							<BR><BR>

<!--trj insert 6/11/2002 1943 -->


<%

String firstName = "";
String lastName = "";
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
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;User
Information</td>
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
      <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="firstName" value ="<%= 
firstName %>" 
size="30" maxlength="30"></td>
    </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Last 
Name</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="lastName" value ="<%= 
lastName %>" 
size="30" maxlength="30"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Address&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="address1" value ="<%= 
address1 %>" 
size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="address2" value ="<%= 
address2 %>"
size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">City&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="city" value ="<%= city %>" 
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
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Zip&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="zip" value ="<%= zip %>" 
size="10" 
maxlength="10"></td>
  </tr>


   <tr>
     <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
  </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Country&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0
"></td>
    <td colspan="2" align="left" valign="middle" class="statTextBig">
      
      <select name="country" class="dropdown">
<option value=""></option><option value="840">United States</option>
<option value="036">Australia</option>
<option value="124">Canada</option>
<option value=" ">-----------------------</option>
<option value="004">Afghanistan</option>
<option value="008">Albania</option>
<option value="012">Algeria</option>
<option value="016">American Samoa</option>
<option value="020">Andorra</option>
<option value="024">Angola</option>
<option value="660">Anguilla</option>
<option value="010">Antarctica</option>
<option value="028">Antigua and Barbud</option>
<option value="032">Argentina</option>
<option value="051">Armenia</option>
<option value="533">Aruba</option>
<option value="040">Austria</option>
<option value="031">Azerbaijan</option>
<option value="044">Bahamas</option>
<option value="048">Bahrain</option>
<option value="050">Bangladesh</option>
<option value="052">Barbados</option>
<option value="112">Belarus</option>
<option value="056">Belgium</option>
<option value="084">Belize</option>
<option value="204">Benin</option>
<option value="060">Bermuda</option>
<option value="064">Bhutan</option>
<option value="068">Bolivia</option>
<option value="070">Bosnia and Herzego</option>
<option value="072">Botswana</option>
<option value="074">Bouvet Island</option>
<option value="076">Brazil</option>
<option value="086">British Indian Oce</option>
<option value="096">Brunei Darussalam</option>
<option value="100">Bulgaria</option>
<option value="854">Burkina Faso</option>
<option value="108">Burundi</option>
<option value="116">Cambodia</option>
<option value="120">Cameroon</option>
<option value="132">Cape Verde</option>
<option value="136">Cayman Islands</option>
<option value="140">Central African Re</option>
<option value="148">Chad</option>
<option value="152">Chile</option>
<option value="156">China</option>
<option value="162">Christmas Island</option>
<option value="166">Cocos (Keeling) Is</option>
<option value="170">Colombia</option>
<option value="174">Comoros</option>
<option value="178">Congo</option>
<option value="184">Cook Islands</option>
<option value="188">Costa Rica</option>
<option value="384">Cote D'Ivoire</option>
<option value="191">Croatia (Local Nam</option>
<option value="192">Cuba</option>
<option value="196">Cyprus</option>
<option value="203">Czech Republic</option>
<option value="208">Denmark</option>
<option value="262">Djibouti</option>
<option value="212">Dominica</option>
<option value="214">Dominican Republic</option>
<option value="626">East Timor</option>
<option value="218">Ecuador</option>
<option value="818">Egypt</option>
<option value="222">El Salvador</option>
<option value="226">Equatorial Guinea</option>
<option value="232">Eritrea</option>
<option value="233">Estonia</option>
<option value="231">Ethiopia</option>
<option value="238">Falkland Islands (</option>
<option value="234">Faroe Islands</option>
<option value="242">Fiji</option>
<option value="246">Finland</option>
<option value="250">France</option>
<option value="254">French Guiana</option>
<option value="258">French Polynesia</option>
<option value="260">French Southern Te</option>
<option value="266">Gabon</option>
<option value="270">Gambia</option>
<option value="268">Georgia</option>
<option value="276">Germany</option>
<option value="288">Ghana</option>
<option value="292">Gibraltar</option>
<option value="300">Greece</option>
<option value="304">Greenland</option>
<option value="308">Grenada</option>
<option value="312">Guadeloupe</option>
<option value="316">Guam</option>
<option value="320">Guatemala</option>
<option value="324">Guinea</option>
<option value="624">Guinea-Bissau</option>
<option value="328">Guyana</option>
<option value="332">Haiti</option>
<option value="334">Heard and Mc Donal</option>
<option value="340">Honduras</option>
<option value="344">Hong Kong</option>
<option value="348">Hungary</option>
<option value="352">Iceland</option>
<option value="356">India</option>
<option value="360">Indonesia</option>
<option value="364">Iran (Islamic Repu</option>
<option value="368">Iraq</option>
<option value="372">Ireland</option>
<option value="376">Israel</option>
<option value="380">Italy</option>
<option value="388">Jamaica</option>
<option value="392">Japan</option>
<option value="400">Jordan</option>
<option value="398">Kazakhstan</option>
<option value="404">Kenya</option>
<option value="296">Kiribati</option>
<option value="410">Korea, Democratic </option>
<option value="408">Korea, Republic of</option>
<option value="414">Kuwait</option>
<option value="417">Kyrgyzstan</option>
<option value="418">Lao People's Democ</option>
<option value="428">Latvia</option>
<option value="422">Lebanon</option>
<option value="426">Lesotho</option>
<option value="430">Liberia</option>
<option value="434">Libyan Arab Jamahi</option>
<option value="438">Liechtenstein</option>
<option value="440">Lithuania</option>
<option value="442">Luxembourg</option>
<option value="446">Macau</option>
<option value="807">Macedonia, Former </option>
<option value="450">Madagascar</option>
<option value="454">Malawi</option>
<option value="458">Malaysia</option>
<option value="462">Maldives</option>
<option value="466">Mali</option>
<option value="470">Malta</option>
<option value="584">Marshall Islands</option>
<option value="474">Martinique</option>
<option value="478">Mauritania</option>
<option value="480">Mauritius</option>
<option value="175">Mayotte</option>
<option value="484">Mexico</option>
<option value="583">Micronesia, Federa</option>
<option value="498">Moldova, Republic </option>
<option value="492">Monaco</option>
<option value="496">Mongolia</option>
<option value="500">Montserrat</option>
<option value="504">Morocco</option>
<option value="508">Mozambique</option>
<option value="104">Myanmar</option>
<option value="516">Namibia</option>
<option value="520">Nauru</option>
<option value="524">Nepal</option>
<option value="528">Netherlands</option>
<option value="530">Netherlands Antill</option>
<option value="540">New Caledonia</option>
<option value="554">New Zealand</option>
<option value="558">Nicaragua</option>
<option value="562">Niger</option>
<option value="566">Nigeria</option>
<option value="570">Niue</option>
<option value="574">Norfolk Island</option>
<option value="580">Northern Mariana I</option>
<option value="578">Norway</option>
<option value="512">Oman</option>
<option value="586">Pakistan</option>
<option value="585">Palau</option>
<option value="591">Panama</option>
<option value="598">Papua New Guinea</option>
<option value="600">Paraguay</option>
<option value="604">Peru</option>
<option value="608">Philippines</option>
<option value="612">Pitcairn</option>
<option value="616">Poland</option>
<option value="620">Portugal</option>
<option value="630">Puerto Rico</option>
<option value="634">Qatar</option>
<option value="638">Reunion</option>
<option value="642">Romania</option>
<option value="643">Russian Federation</option>
<option value="646">Rwanda</option>
<option value="659">Saint Kitts and Ne</option>
<option value="662">Saint Lucia</option>
<option value="670">Saint Vincent and </option>
<option value="882">Samoa</option>
<option value="674">San Marino</option>
<option value="678">Sao Tome and Princ</option>
<option value="682">Saudi Arabia</option>
<option value="686">Senegal</option>
<option value="690">Seychelles</option>
<option value="694">Sierra Leone</option>
<option value="702">Singapore</option>
<option value="703">Slovakia (Slovak R</option>
<option value="705">Slovenia</option>
<option value="090">Solomon Islands</option>
<option value="706">Somalia</option>
<option value="710">South Africa</option>
<option value="239">South Georgia and </option>
<option value="724">Spain</option>
<option value="144">Sri Lanka</option>
<option value="654">St. Helena</option>
<option value="666">St. Pierre and Miq</option>
<option value="736">Sudan</option>
<option value="740">Suriname</option>
<option value="744">Svalbard and Jan M</option>
<option value="748">Swaziland</option>
<option value="752">Sweden</option>
<option value="756">Switzerland</option>
<option value="760">Syrian Arab Republ</option>
<option value="158">Taiwan</option>
<option value="762">Tajikistan</option>
<option value="834">Tanzania, United R</option>
<option value="764">Thailand</option>
<option value="768">Togo</option>
<option value="772">Tokelau</option>
<option value="776">Tonga</option>
<option value="780">Trinidad and Tobag</option>
<option value="788">Tunisia</option>
<option value="792">Turkey</option>
<option value="795">Turkmenistan</option>
<option value="796">Turks and Caicos I</option>
<option value="798">Tuvalu</option>
<option value="800">Uganda</option>
<option value="804">Ukraine</option>
<option value="784">United Arab Emirat</option>
<option value="826">United Kingdom</option>
<option value="581">United States Mino</option>
<option value="858">Uruguay</option>
<option value="860">Uzbekistan</option>
<option value="548">Vanuatu</option>
<option value="336">Vatican City State</option>
<option value="862">Venezuela</option>
<option value="704">Viet Nam</option>
<option value="092">Virgin Islands (Br</option>
<option value="850">Virgin Islands (U.</option>
<option value="876">Wallis and Futuna </option>
<option value="732">Western Sahara</option>
<option value="887">Yemen</option>
<option value="891">Yugoslavia</option>
<option value="180">Zaire</option>
<option value="894">Zambia</option>
<option value="716">Zimbabwe</option>
</select>

    </td>
  </tr>


    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Phone</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="phone" value ="<%= phone 
%>" size="30" 
maxlength="20"></td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Handle 
&amp; Password</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Handle</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="handle" value ="<%= 
handle %>" 
size="30" maxlength="15"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Password</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td class="statTextBig" align="left" valign="middle"><input type="password" name="password" value ="" size="30" 
maxlength="15"></td>
    <td class="statText" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">Minimum&nbsp;of&nbsp;7&nbsp;characters<br></td>
  </tr>  
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Re-type 
Password</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="password" name="confirmPassword" value 
="" size="30" maxlength="15"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Email</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="email" value ="<%= email 
%>" size="30" 
maxlength="100"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Re-type 
Email</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="confirmEmail" value ="<%= 
remail %>" 
size="30" maxlength="100"></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">An email will be sent to authorize your account 
activation.<br></td>
  </tr>


  <tr>
    <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Quote&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="quote" value ="<%= remail 
%>" size="30" 
maxlength="255"></td>
  </tr>


  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Email 
Notification</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>


  
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Next 
Competition&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <input type="checkbox" name="notify_1" class="statText" checked />
      </td>
    </tr>
  
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Competition 
Results&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <input type="checkbox" name="notify_2" class="statText" checked />
      </td>
    </tr>
  
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Employment 
Opportunities&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <input type="checkbox" name="notify_3" class="statText" checked />
      </td>
    </tr>
  
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Member Development 
Opportunities&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <input type="checkbox" name="notify_4" class="statText" checked />
      </td>
    </tr>
  
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">TopCoder News and 
Events&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <input type="checkbox" name="notify_5" class="statText" checked />
      </td>
    </tr>
  


  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Editor 
&amp; Language</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  


    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Default 
Editor&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">
        
    <select name="editor" class="dropdown">
<option value=""></option><option value="1">JVI</option>
<option value="0">Standard</option>
</select>
</td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">The competition applet allows for a choice of editor 
types. UNIX users comfortable with vi may opt for JVI. Those more familiar with the behavior of Windows Notepad should 
choose Standard.</td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Default 
Language&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">
        
        <select name="language" class="dropdown">
<option value=""></option><option value="1">Java</option>
<option value="3">C ++</option>
<option value="4">C#</option>
</select>
</td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">The competition applet allows for a choice of programming 
languages. The language you choose will be your default.</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Student or 
Professional (please choose one)</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  
    
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" height="18" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Student</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="radio" name="coderType" value ="1" 
></td>
  </tr>  
<!--
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img 
src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">By indicating that you are a "Student" member, you must 
be enrolled full-time at an accredited college or university.</td>
  </tr>
-->
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
  </tr>      
  <tr>
    <td class="statTextBig" align="right" height="18" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Professional</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="radio" name="coderType" value ="2" 
></td>
  </tr>


  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>
    <tr align="right" valign="middle">
        <td align="right" valign="middle"></td>
        <td colspan="2" align="left" valign="middle" class="statText"><input type="button" 
onClick="if(checkInputs())reg.submit();" name="continueButton" value="[ continue &gt;" /></td>
    </tr>
  </table>


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
