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
           <jsp:param name="title" value="Skills"/>  
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
							User is ?<%= user %><BR>
							<%= user.getHandle() %> (<%= user.getUserId() %>)
							<BR><BR>

<!--trj insert 6/11/2002 1943 -->


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
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Contact 
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
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="city" value ="" size="30" 
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
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="zip" value ="" size="10" 
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
      
      <select name="country" class="dropdown" onChange="changeState()">
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
    <SCRIPT type="text/javascript">
  reg=window.document.frmReg;
  if ( window.navigator.userAgent.indexOf('Opera') ) {
    for(i=0;i<reg.country.length;i++){
      if(reg.country[i].value=="840"){usIndex=i;break;}
    }
  } else {
    for(i=0;i<reg.country.options.length;i++){
      if(reg.country.options[i].value=="840"){usIndex=i;break;}
    }
  }
    </SCRIPT>
  </tr>


    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" 
background="/i/steel_gray_bg.gif"><b>Phone</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" 
border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="phone" value ="" size="30" 
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
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="handle" value ="" 
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
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="email" value ="" size="30" 
maxlength="100"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Re-type 
Email</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="confirmEmail" value ="" 
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
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="quote" value ="" size="30" 
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
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Terms</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>

    <tr>
        <!-- <td></td>
        <td>
          <img src="/i/clear.gif" width="1" height="1" border="0">
        </td> -->
        <td colspan="4" class="errorText" align="center" valign="middle">
          <TEXTAREA NAME="TermDesc" Rows="10" COLS="80" READONLY CLASS="bodyText">
            ACCEPTANCE OF TERMS, REVISIONS

By using this Web site you are indicating your agreement to these Terms of Use ("Terms").  If you do not agree to these 
Terms, please do not use the site and exit now.

We may revise these Terms at any time without prior notice by updating this page and such revisions will be effective 
upon posting to this page.  Please check this page periodically for any changes.  Your continued use of this Web site 
following the posting of any revisions to these Terms will mean you accept those changes.  We reserve the right to 
alter, suspend or discontinue any aspect of www.topcoder.com, including your access to it.  Unless explicitly stated, 
any new features will be subject to these terms and conditions.


            PRIVACY

Because we value privacy as much as we value programmers, TopCoder is committed to protecting the privacy of our users.  
We want to provide a safe, secure user experience.  We will use reasonable commercial efforts to ensure that the 
information you submit to us remains private.  Your personal information is immediately transferred from our web server 
to behind our firewall, where it remains isolated from a direct connection to the Internet.

Our security and Privacy Commitment are periodically reviewed and enhanced as necessary.  However, you should understand 
that "perfect security" does not exist on the Internet.  The information that you submit to us is used only for the 
purposes as set forth herein, as required by law, or when we believe in good faith that disclosure is legally required 
to protect our rights.  We will not use your personal information for any other purpose other than as set out here 
without first obtaining your permission.  The following reflects our commitment to you.

Information About All TopCoder Visitors
We gather information about all of our users collectively, including (a) what area users visit most frequently, (b) 
their Internet domain and their computer's IP address, (c) the type of browser and operating system they use and (d) if 
the user linked to our Web site from another Web site, the address of that other Web site.  This information does not in 
any way personally identify a user; we only use this data anonymously and in the aggregate.  We use this information to 
analyze trends and statistics to help us improve our services, plan site enhancements and measure overall site 
effectiveness.  From time to time we may reveal general, anonymous, aggregated statistical information about our site, 
services and users, such as the number of visits and users and what site features they use.

Information About You Specifically
If you choose to register as a member in order to participate in TopCoder tournaments, you will provide us with 
additional information about yourself, including name and address.  If you are a winner, we will also request your date 
of birth.  In addition, if you are a U.S. person (including U.S resident aliens), we will request your social security 
number (or taxpayer identification number) on IRS form W-9.  If you are a winner, and you are not a U.S person, we will 
request a Certificate of Foreign Status of Beneficial Owner for United States Tax Withholding on IRS form W-8BEN.  We 
use this information to verify your eligibility to participate in specific tournaments, and to contact you and properly 
notify the IRS should you be a winner.  From time to time, we may use the contact information to alert members of new 
competitions and communicate news, events and reminders.  If you do not want to be alerted of any of these items, do not 
check the "Contest Notification" box on the registration form or at any time thereafter you can send us an e-mail asking 
to be removed from this notification listing to service@topcoder.com.  During competition, users participating will be 
shown and identified only by their handles, which are their public login names.  A TopCoder member's handle, rating, 
date registered, winnings to date, skill set, and personal quote will be publicly available to any participants of the 
TopCoder web site and competition applications.

Spectators are allowed to view the competition without identifying themselves, but competition participants must be 
members and must login to prove it.  All source code created during the competition will be available to anyone - 
spectators, members and sponsors and may be subject to challenge from other members.  Your performance in a competition 
will allow us to help balance the competition.  It will be recorded to calculate competition rating values and it will 
be posted on the web site and in the competition area.  Winners' names may also be released to governmental authorities 
as required by law and to those requesting such information from TopCoder.  At registration, we will ask you to answer 
questions regarding certain demographic information as it relates to your status as a student or a professional.

As a TopCoder member, you can create a more extensive profile that includes your work and educational experience, as 
well as your relevant technology skills.  You have the ability to update and change this information at any time and we 
encourage you to keep it updated.

Only TopCoder sponsors and subscribing employers will have access to view your demographic information, educational and 
work experience, and contact information.

TopCoder sponsors may contact you proactively based upon your skills, experience and TopCoder success.  TopCoder may 
decide to utilize a process through which TopCoder members may choose to review online inquiries from interested 
TopCoder sponsors or subscribing companies before being contacted by those companies.

The personal information you provide must be accurate and complete and all registration details (where applicable) must 
contain your real name, address and other requested details. You are solely responsible for your personal information 
and we may take any action with respect to your personal information we deem necessary or appropriate if we believe it 
may cause us to suffer any loss, liability or commercial damage.

Round Tables
TopCoder Round Tables make forum style discussion topics available to our members and sponsors.  These forums will 
identify TopCoder members by their user handles.  Those simply viewing the discussions may do so without identifying 
themselves, but those who wish to participate must be members or sponsors and must login to prove it.  Please remember 
that any information you disclose in these areas becomes public information.  Accordingly, you should always exercise 
caution when deciding to disclose any personal information.

Cookies
To enhance your experience at TopCoder, we may use a feature on your Internet browser called a "cookie".  As you may 
already know, cookies are small files that your Web browser places on your computer's hard drive.  We use cookies for 
remembering user names and passwords and preferences, tracking click streams, and for load balancing.  Because of our 
use of cookies, we can deliver faster service, consistent, updated results, and a more personalized site experience.  
You have the option of setting your browser to reject cookies.  However, doing this may hinder performance and 
negatively impact your experience on our site.

Feedback
TopCoder may ask you for feedback and comments about the site or the tournaments and we encourage your participation.  
Any feedback that is submitted becomes the property of TopCoder.  We may use this feedback, such as success stories, for 
marketing purposes, or to contact you for further feedback on the site.

Links to Other Sites
We may provide links to other Web sites that we believe can offer you useful information.   However, we are not 
responsible for the privacy policies of other Web sites, including those sites on which our logo or other information 
supplied by us appears.  We suggest that you access these sites' online policies regarding their data collection.

Access to Your Information
TopCoder will provide you with an opportunity to review at any time the information that it has compiled about you, as 
well as the opportunity to correct any erroneous information.  To view or correct your information, log in to the 
TopCoder web site, go to &quot;Update Profile&quot; under the &quot;Member Home&quot; page, or contact us at 
service@topcoder.com.

Privacy Commitment Changes
If we decide to change our privacy commitment for TopCoder, we will post those changes here so that you will always know 
what information we gather, how we might use that information, and whether we will disclose it to anyone.  In the event 
that we make any significant changes to our Privacy Statement, we will also provide you with the opportunity to consent 
to different uses of your personal information.  If, at any time, you have questions or concerns about TopCoder's 
privacy commitment, please feel free to e-mail us at service@topcoder.com.


            PROVISIONS APPLICABLE TO CHINESE CITIZENS AND EXPATRIATES RESIDING IN CHINA
TopCoder hereby incorporates into these Terms of Use and Privacy Policy the provisions of China's Decision on 
Safeguarding the Security of the Internet.  


According to Section 1 of Decision on Safeguarding the Security of the Internet, "to ensure operational security of the 
Internet, the person or organization perpetrating any of the following acts in violation of the criminal law shall be 
penalized according to the criminal code:

	(1) Unauthorized penetration into the computer and information system of the state affair, national defense or 
high-tech departments of the state;
	(2) Intentional composition or dissemination of computer virus or other destructive programs, or attacking the 
computer system or telecommunication network and resulting in damage or destruction of such computer systems or 
telecommunication network;
	(3) Unauthorized disruption of operation of the computer network or telecommunication service and resulting in 
malfunction of such network or telecommunication systems in violation of the laws or regulations of the state."  

According to Section 2 of Decision on Safeguarding the Security of the Internet (the "Decision"), "to protect national 
security and social stability, the person or organization perpetrating any of the following acts in violation of the 
criminal law shall be penalized according to the criminal code:

	(1) Disseminating rumor or slander on the Internet, or publishing or diffusing maleficent information to 
instigate subversion of the state power or socialist system, advocate abruption of the country or harm unity of the 
country;
	(2) Stealing or disclosing the national or military secrets on the Internet;
	(3) Instigating inter-ethnic enmity or prejudice, or disrupting ethnic unity on the Internet; and
	(4) Establishing or organizing heresies on the Internet and impeding the implementation of laws and regulations 
of the state."

Section 3 of the Decision also stipulates that "to safeguard the order of the socialist market economy and social 
stability, the person or organization perpetrating any of the following acts in violation of the criminal law shall be 
penalized according to the criminal code:

	(1) Selling fake or shoddy goods on the Internet or making false or misleading propaganda of commodities on the 
Internet;
	(2) Hurting others' commercial fame or reputation of products on the Internet;
	(3) Infringing upon others' intellectual property rights on the Internet;
	(4) Compiling and distributing false information on the Internet to affect securities or futures transactions or 
disrupt order of the financial markets; and
	(5) Establishing pornographic web sites or web pages, providing links to pornographic web sites, or 
disseminating pornographic magazines, films, audio and videos materials or graphics on the Internet."

Section 4 of the Decision stipulates that "to protect the legal rights of personal safety and property of individuals, 
legal persons and other organizations, the person or organization perpetrating any of the following acts in violation of 
the criminal law shall be penalized according to the criminal code:

	(1) Insulting others or drawing up slanders against others on the Internet;
	(2) Illegally intercepting, modifying or deleting others' emails or other database materials and infringing 
rights of the citizen of freedom and secrets in communicating and letter transmitting; and 
	(3) Perpetrating theft, fraud, or blackmailing on the Internet."


COPYRIGHT, TRADEMARK AND OTHER INTELLECTUAL PROPERTY

Protection
Except as otherwise indicated, this Web site and its entire contents (including, but not limited to, the text, 
information, software, graphics, images, sound, and animation are owned by us and are protected by domestic and 
international copyright, trademark, patent, and other intellectual property laws.  All copyrightable text and graphics, 
the selection, arrangement, and presentation of all materials (including information in the public domain), and the 
overall design of this Web site are &#169;2002 TopCoder.  All rights reserved.  Permission is granted to download and 
print materials from this Web site for the sole purposes of viewing, reading, and retaining for reference.  Any other 
copying, distribution, retransmission, or modification of information or materials on this Web site, whether in 
electronic or other form, without our express prior written permission is strictly prohibited.


Notice
All trademarks, service marks, and trade names are proprietary to us or other respective owners that have granted us the 
right and license to use their marks.

Copyright Complaints
We respect the intellectual property of others, and we ask you to do the same.  We may, in appropriate circumstances and 
at our sole discretion, terminate the access of users who infringe the copyright rights of others. 

If you believe that your work has been copied and is accessible at our Web site in a way that constitutes copyright 
infringement, or that our Web site contains links or other references to another online location that contains material 
or activity that infringes your copyright rights, you may notify us by providing our copyright agent the information 
required by the U.S. Online Copyright Infringement Liability Limitation Act of the U.S. Digital Millennium Copyright 
Act, 17 U.S.C.  &#167;512 Our agent for notice of claims of copyright infringement on or regarding this Web site can be 
reached as follows:

BY E-MAIL: service@topcoder.com
BY MAIL: John Hughes c/o Tanya Horgan TopCoder, Inc. 703 Hebron Avenue, Glastonbury, CT 06033
BY PHONE: 860.633.5540
Repeat infringers will be blocked from accessing the TopCoder web site.


INDEMNIFICATION AND RELEASE

By accessing our Web site, you agree to indemnify us and any parent, subsidiary or affiliated entities, our officers and 
employees, and officers and employees of any parent, subsidiary or affiliated entities and hold them harmless from any 
and all claims and expenses, including attorney's fees, arising from your use of our Web site including any material 
(including third party material) that you post on our Web site and any services or products available through our Web 
site.  In addition, you hereby release us and any parent, subsidiary or affiliated entities, our officers and employees, 
and officers and employees of any parent, subsidiary or affiliated entities from any and all claims, demands, debts, 
obligations, damages (actual or consequential), costs, and expenses of any kind or nature whatsoever, whether known or 
unknown, suspected or unsuspected, disclosed or undisclosed, that you may have against them arising out of or in any way 
related to such disputes and/or to any services or products available at our Web site.  You hereby agree to waive all 
laws that may limit the efficacy of such releases.


DISCLAIMER

THE MATERIALS AND SERVICES ON OUR WEB SITE ARE PROVIDED "AS IS" AND WITHOUT WARRANTIES OF ANY KIND EITHER EXPRESS OR 
IMPLIED.  TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, 
INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  WE DO NOT 
WARRANT THAT THE FUNCTIONS CONTAINED IN THE MATERIALS WILL BE UNINTERRUPTED OR ERROR-FREE, THAT DEFECTS WILL BE 
CORRECTED, OR THAT THIS WEB SITE OR THE SERVER(S) THAT MAKES OUR WEB SITE AVAILABLE OR ANY ADVERTISED OR HYPERLINKED 
SITE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT OUR SITE, SERVER(S), ADVERTISED OR HYPERLINKED SITES WILL 
BE ACCESSIBLE AT ALL TIMES.  WE DO NOT WARRANT THAT SUCH ERRORS, DEFECTS OR INTERRUPTIONS IN SERVICE WILL NOT AFFECT THE 
RESULTS OF OUR COMPETITIONS, AND WE DISCLAIM ANY RESPONSIBILITY FOR REDUCED PERFORMANCE IN COMPETITIONS DUE TO SUCH 
PROBLEMS.  WE DO NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF OUR WEB SITE WITH RESPECT 
TO CORRECTNESS, ACCURACY, RELIABILITY OR OTHERWISE.  YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR 
CORRECTION.  TO THE EXTENT THAT APPLICABLE LAW MAY NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, THE ABOVE EXCLUSIONS 
MAY NOT APPLY TO YOU.  

Documents, graphics and other materials appearing at our Web site may include technical inaccuracies, typographical 
errors, and out-of-date information and use of such documents, graphics or other materials is at your own risk.


LIMITATION OF LIABILITY
TO THE FULLEST EXTENT PERMISSIBLE PURSUANT TO APPLICABLE LAW, TOPCODER SHALL NOT BE LIABLE FOR ANY DAMAGES (INCLUDING, 
BUT NOT LIMITED TO, DIRECT, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES), INCLUDING, BUT NOT LIMITED TO, 
DAMAGES FOR LOSS OF WINNINGS, DATA OR OTHER DAMAGE TO ANY OTHER INTANGIBLE PROPERTY, EVEN IF TOPCODER HAS BEEN ADVISED 
OF THE POSSIBILITY OF SUCH DAMAGES, RESULTING FROM (i) THE USE OR INABILITY TO USE THIS WEB SITE, (ii) THE DISCLOSURE 
OF, UNAUTHORIZED ACCESS TO OR ALTERATION OF ANY TRANSMISSION OR DATA, (iii) THE STATEMENTS OR CONDUCT OF ANY THIRD PARTY 
OR (iv) ANY OTHER MATTER RELATING TO TOPCODER.


LINKS TO OTHER WEB SITES AND SERVICES

To the extent that our Web site contains links to other Web sites and outside services and resources, we do not control 
the availability and content of those Web sites, services or resources, nor do we necessarily review or endorse 
materials available at or through such other Web sites. Viewing other Web sites or utilizing outside services and 
resources is done at your own risk.  We shall not be liable for any loss or damage caused or alleged to be caused by or 
in connection with use of or reliance on any such content, goods or services available on or through any such site or 
resource.


MATERIALS POSTED BY VISITORS

You retain any rights to ownership in any materials posted, uploaded or otherwise sent to our Web site by you; TopCoder 
will not gain ownership rights to this material.  By posting, uploading or otherwise sending any source code to us or 
our Web site, you grant (or warrant that the owner of such rights has expressly granted) us a perpetual, royalty-free, 
irrevocable, non-exclusive right and license to use,  reproduce and publish such code into any form, medium or 
technology.

With respect to any other material posted, uploaded or otherwise sent, you grant (or warrant that the owner of such 
rights has expressly granted) us the same license as pertains to source code with the additional license to modify, 
adapt, translate, create derivative works from, and distribute such materials or incorporate such materials into any 
form, medium or technology. You waive any and all moral rights, including, without limitation, any rights arising under 
Chapter 7 of the Copyright and Related Rights Act 2000 applicable to European Union residents, and all rights of a 
similar nature in any jurisdiction in any material, including source code, which you post, upload or otherwise send to 
TopCoder or it's website, such waivers being in favor of TopCoder.

You are allowed to register only once and you must provide true and accurate registration information.  You are 
prohibited from misrepresenting your registration information or tampering with the registration process.

You are also prohibited from posting or otherwise uploading to our Web site:  any material that infringes on any 
copyright, trademark or other proprietary rights of another (including publicity and privacy rights); material that is 
obscene, offensive, libelous, pornographic, threatening, abusive, contains illegal content, or is otherwise 
objectionable, that would constitute or encourage a criminal offense, or that would otherwise give rise to liability or 
violates any law.  You also represent that you have all necessary rights to use any material that you post or otherwise 
upload to our Web site.

You are further forbidden from distributing or otherwise publishing any material on our Web site that contains any 
solicitation of funds, promotion, employment, advertising, or solicitation for goods or services; sending unsolicited 
commercial e-mail and other advertising, promotional materials or other forms of solicitation to other users of this 
site; harvesting names and e-mail addresses from other users of this site without their permission; soliciting passwords 
from other users; impersonating other users; or sending viruses or other destructive or expropriating content.

While we do not routinely review the contents of material posted or uploaded to our Web site, we nevertheless reserve 
the right to remove any postings or other uploaded materials in response to complaints of infringement, obscenity or 
defamation or to otherwise review or edit such materials as appropriate, in our sole discretion and without notice.


OTHER RESTRICTIONS ON CONDUCT

You agree not to disrupt, modify or interfere with the functioning of our Web site or any services provided on or 
through our Web site or with any associated software, hardware or servers in any way and you agree not to impede or 
interfere with others' use of our Web site. This includes your agreement that you will not cheat; that the idea for the 
code and/or challenge(s) submitted by you is yours alone.  This also includes your agreement that you will not provide 
your TopCoder information including, but not limited to, your TopCoder handle and rating, to any third party for the 
purpose of pursuing employment opportunities without the written consent of TopCoder. If you are contacted by a 
third-party regarding employment opportunities and/or media interest as a result in your participation in TopCoder 
competitions (including, but not limited to, Single Round Matches and tournaments), you agree to promptly notify 
TopCoder of such contact. You also agree not to alter or tamper with any information or materials on, or associated with 
our Web site or services provided on or through our Web site.

We do not necessarily endorse, support, sanction, encourage, verify or agree with the comments, opinions, or other 
statements made public at our Web site by users through  our competition or Round Tables or other interactive services 
available at our Web site.  Any information or material sent by users to such forums, including advice and opinions, 
represents the views and is the responsibility of those users and does not necessarily represent our views.

You agree that no impediment exists to you joining the TopCoder website, and your participation in TopCoder's website 
and the competitions it offers will not interfere with your performance of any other agreement or obligation which has 
been or will be made with any third party.


CHOICE OF LAW AND FORUM

This agreement is governed by the laws of the Commonwealth of Massachusetts.  You hereby agree to submit to the 
exclusive jurisdiction of the courts of the Commonwealth of Massachusetts.  To the extent that applicable laws have 
mandatory application to this agreement or give you the right to bring action in any other courts, the above limitations 
may not apply to you.  Use of this Web site is unauthorized in any jurisdiction that does not give full effect to all 
provisions of these Terms.


SEVERABILITY AND ENFORCEABILITY

If any provision or portion of these Terms is held illegal, invalid, or unenforceable, in whole or in part, it shall be 
modified to the minimum extent necessary to correct any deficiencies or replaced with a provision which is as close as 
is legally permissible to the provision found invalid or unenforceable and shall not affect the legality, validity or 
enforceability of any other provisions or portions of these Terms.


TERMINATION/EXCLUSION

We reserve the right, in our sole discretion, to revoke any and all privileges associated with accessing and/or 
competing on our web site, and to take any other action we deem appropriate including but not limited to terminating or 
suspending your use of www.topcoder.com, for no reason or any reason whatsoever, including improper use of this site or 
failure to comply with these Terms.

GENERAL

We may assign, novate or subcontract any or all of our rights and obligations under these terms and conditions at any 
time.

If you have any questions regarding these Terms, contact us at service@topcoder.com.


          </TEXTAREA>
        </td>
    </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" 
align="left" valign="middle"></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="top"><b>I Agree to the Terms and Conditions stated 
above</b>&nbsp;</td>
        
    <td colspan="2" class="statTextBig" align="left" valign="top"><input type="checkbox" name="terms" ><br><br></td>
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
