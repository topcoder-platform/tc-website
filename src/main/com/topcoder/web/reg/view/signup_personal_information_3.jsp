<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Signup Personal Information</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
                </div>
            </div>
            
            <div id="box-body">
            
                <form name="form" method="post" action="signup_demographics.jsp">
                    <div class="block">
                        <div class="sidebar">
                            <p>We use this information in order to communicate with you, so please make sure it's up-to-date and accurate.</p>
                            <p>Your information will be used only as specified in our <a href="javascript:popUp('privacy_policy.jsp');" title="Privacy Policy">privacy policy</a>.</p>
                            <p><span class="required">*</span> = required information</p>
                      </div>
                        <div class="content">
                            <h4><span>Name and Contact</span><span class="end">&nbsp;</span></h4>
                            <div class="content-body">
                                <ul>
                                    <li class="form-row">
                                        <label for="first_name">* First Name:</label>
                                        <input type="text" name="first_name" id="first_name" size="40" value="Ralph" />
                                        <span>&nbsp;</span>
                                        <p class="label-description">Given Name</p>
                                    </li>
                                    <li class="form-row">
                                        <label for="last_name">* Last Name:</label>
                                        <input type="text" name="last_name" id="last_name" size="40" value="Crammer" />
                                        <span>&nbsp;</span>
                                        <p class="label-description">Surname</p>
                                    </li>
                                    <li class="form-row">
                                        <label for="address_1">* Address 1:</label>
                                        <input name="address_1" type="text" id="address_1" value="1234 Streetname" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="address_2">Address 2:</label>
                                        <input type="text" name="address_2" id="address_2" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="address_3">Address 3:</label>
                                        <input type="text" name="address_3" id="address_3" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="city">* City:</label>
                                        <input name="city" type="text" id="city" value="Cityname" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="state">State (US Only):</label>
                                        <input type="text" name="state" id="state" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="postal_code">Postal Code:</label>
                                        <input type="text" name="postal_code" id="postal_code" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="province">Province:</label>
                                        <input type="text" name="province" id="province" size="40" />
                                    </li>
                                  <li class="form-row">
                                      <label for="country">* Country:</label>
                                      <select name="country" id="country">
                                        <option value=""></option>
                                        <option value="004">Afghanistan</option>
                                        <option value="008">Albania</option>
                                        <option value="012">Algeria</option>
                                        <option value="016">American Samoa</option>
                                        <option value="020">Andorra</option>
                                        <option value="024">Angola</option>
                                        <option value="660">Anguilla</option>
                                        <option value="010">Antarctica</option>
                                        <option value="028">Antigua and Barbuda</option>
                                        <option value="032">Argentina</option>
                                        <option value="051">Armenia</option>
                                        <option value="533">Aruba</option>
                                        <option value="036">Australia</option>
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
                                        <option value="070">Bosnia and Herzegowina</option>
                                        <option value="072">Botswana</option>
                                        <option value="074">Bouvet Island</option>
                                        <option value="076">Brazil</option>
                                        <option value="086">British Indian Ocean Territory</option>
                                        <option value="096">Brunei Darussalam</option>
                                        <option value="100">Bulgaria</option>
                                        <option value="854">Burkina Faso</option>
                                        <option value="108">Burundi</option>
                                        <option value="116">Cambodia</option>
                                        <option value="120">Cameroon</option>
                                        <option value="124">Canada</option>
                                        <option value="132">Cape Verde</option>
                                        <option value="136">Cayman Islands</option>
                                        <option value="140">Central African Republic</option>
                                        <option value="148">Chad</option>
                                        <option value="152">Chile</option>
                                        <option value="156">China</option>
                                        <option value="162">Christmas Island</option>
                                        <option value="166">Cocos (Keeling) Islands</option>
                                        <option value="170">Colombia</option>
                                        <option value="174">Comoros</option>
                                        <option value="178">Congo</option>
                                        <option value="184">Cook Islands</option>
                                        <option value="188">Costa Rica</option>
                                        <option value="384">Cote D&#039;Ivoire</option>
                                        <option value="191">Croatia</option>
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
                                        <option value="238">Falkland Islands (Malvinas)</option>
                                        <option value="234">Faroe Islands</option>
                                        <option value="242">Fiji</option>
                                        <option value="246">Finland</option>
                                        <option value="250">France</option>
                                        <option value="254">French Guiana</option>
                                        <option value="258">French Polynesia</option>
                                        <option value="260">French Southern Territories</option>
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
                                        <option value="334">Heard and Mc Donald Islands</option>
                                        <option value="340">Honduras</option>
                                        <option value="344">Hong Kong</option>
                                        <option value="348">Hungary</option>
                                        <option value="352">Iceland</option>
                                        <option value="356">India</option>
                                        <option value="360">Indonesia</option>
                                        <option value="364">Iran</option>
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
                                        <option value="414">Kuwait</option>
                                        <option value="417">Kyrgyzstan</option>
                                        <option value="418">Lao People&#039;s Democratic Republic</option>
                                        <option value="428">Latvia</option>
                                        <option value="422">Lebanon</option>
                                        <option value="426">Lesotho</option>
                                        <option value="430">Liberia</option>
                                        <option value="434">Libya</option>
                                        <option value="438">Liechtenstein</option>
                                        <option value="440">Lithuania</option>
                                        <option value="442">Luxembourg</option>
                                        <option value="446">Macau</option>
                                        <option value="807">Macedonia, Former Yugoslav Rep. of</option>
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
                                        <option value="583">Micronesia, Federated States of</option>
                                        <option value="498">Moldova, Republic of</option>
                                        <option value="492">Monaco</option>
                                        <option value="496">Mongolia</option>
                                        <option value="895">Montenegro</option>
                                        <option value="500">Montserrat</option>
                                        <option value="504">Morocco</option>
                                        <option value="508">Mozambique</option>
                                        <option value="104">Myanmar</option>
                                        <option value="516">Namibia</option>
                                        <option value="520">Nauru</option>
                                        <option value="524">Nepal</option>
                                        <option value="528">Netherlands</option>
                                        <option value="530">Netherlands Antilles</option>
                                        <option value="540">New Caledonia</option>
                                        <option value="554">New Zealand</option>
                                        <option value="558">Nicaragua</option>
                                        <option value="562">Niger</option>
                                        <option value="566">Nigeria</option>
                                        <option value="570">Niue</option>
                                        <option value="574">Norfolk Island</option>
                                        <option value="410">North Korea</option>
                                        <option value="580">Northern Mariana Islands</option>
                                        <option value="578">Norway</option>
                                        <option value="512">Oman</option>
                                        <option value="586">Pakistan</option>
                                        <option value="585">Palau</option>
                                        <option value="900">Palestine</option>
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
                                        <option value="659">Saint Kitts and Nevis</option>
                                        <option value="662">Saint Lucia</option>
                                        <option value="670">Saint Vincent and The Grenadines</option>
                                        <option value="882">Samoa</option>
                                        <option value="674">San Marino</option>
                                        <option value="678">Sao Tome and Principe</option>
                                        <option value="682">Saudi Arabia</option>
                                        <option value="686">Senegal</option>
                                        <option value="891">Serbia</option>
                                        <option value="690">Seychelles</option>
                                        <option value="694">Sierra Leone</option>
                                        <option value="702">Singapore</option>
                                        <option value="703">Slovakia</option>
                                        <option value="705">Slovenia</option>
                                        <option value="090">Solomon Islands</option>
                                        <option value="706">Somalia</option>
                                        <option value="710">South Africa</option>
                                        <option value="239">South Georgia and The S.Sandwich Is.</option>
                                        <option value="408">South Korea</option>
                                        <option value="724">Spain</option>
                                        <option value="144">Sri Lanka</option>
                                        <option value="654">St. Helena</option>
                                        <option value="897">St. Kitts and Nevis</option>
                                        <option value="898">St. Lucia</option>
                                        <option value="666">St. Pierre and Miquelon</option>
                                        <option value="899">St. Vincent and Grenadines</option>
                                        <option value="736">Sudan</option>
                                        <option value="740">Suriname</option>
                                        <option value="744">Svalbard and Jan Mayen Islands</option>
                                        <option value="748">Swaziland</option>
                                        <option value="752">Sweden</option>
                                        <option value="756">Switzerland</option>
                                        <option value="760">Syria</option>
                                        <option value="158">Taiwan</option>
                                        <option value="762">Tajikistan</option>
                                        <option value="834">Tanzania, United Republic of</option>
                                        <option value="764">Thailand</option>
                                        <option value="768">Togo</option>
                                        <option value="772">Tokelau</option>
                                        <option value="776">Tonga</option>
                                        <option value="780">Trinidad and Tobago</option>
                                        <option value="788">Tunisia</option>
                                        <option value="792">Turkey</option>
                                        <option value="795">Turkmenistan</option>
                                        <option value="796">Turks and Caicos Islands</option>
                                        <option value="798">Tuvalu</option>
                                        <option value="800">Uganda</option>
                                        <option value="804">Ukraine</option>
                                        <option value="784">United Arab Emirates</option>
                                        <option value="826">United Kingdom</option>
                                        <option value="840" selected="selected">United States</option>
                                        <option value="581">United States Minor Outlying Islands</option>
                                        <option value="858">Uruguay</option>
                                        <option value="860">Uzbekistan</option>
                                        <option value="548">Vanuatu</option>
                                        <option value="336">Vatican City State (Holy See)</option>
                                        <option value="862">Venezuela</option>
                                        <option value="704">Viet Nam</option>
                                        <option value="092">Virgin Islands (British)</option>
                                        <option value="850">Virgin Islands (U.S.)</option>
                                        <option value="876">Wallis and Futuna Islands</option>
                                        <option value="732">Western Sahara</option>
                                        <option value="887">Yemen</option>
                                        <option value="180">Zaire</option>
                                        <option value="894">Zambia</option>
                                        <option value="716">Zimbabwe</option>
                                      </select>
                                  </li>
                                    <li class="form-row">
                                        <label for="country_rep">* Country to represent:</label>
                                        <select name="country_rep" id="country_rep">
                                          <option value=""></option>
                                          <option value="004">Afghanistan</option>
                                          <option value="008">Albania</option>
                                          <option value="012">Algeria</option>
                                          <option value="016">American Samoa</option>
                                          <option value="020">Andorra</option>
                                          <option value="024">Angola</option>
                                          <option value="660">Anguilla</option>
                                          <option value="010">Antarctica</option>
                                          <option value="028">Antigua and Barbuda</option>
                                          <option value="032">Argentina</option>
                                          <option value="051">Armenia</option>
                                          <option value="533">Aruba</option>
                                          <option value="036">Australia</option>
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
                                          <option value="070">Bosnia and Herzegowina</option>
                                          <option value="072">Botswana</option>
                                          <option value="074">Bouvet Island</option>
                                          <option value="076">Brazil</option>
                                          <option value="086">British Indian Ocean Territory</option>
                                          <option value="096">Brunei Darussalam</option>
                                          <option value="100">Bulgaria</option>
                                          <option value="854">Burkina Faso</option>
                                          <option value="108">Burundi</option>
                                          <option value="116">Cambodia</option>
                                          <option value="120">Cameroon</option>
                                          <option value="124">Canada</option>
                                          <option value="132">Cape Verde</option>
                                          <option value="136">Cayman Islands</option>
                                          <option value="140">Central African Republic</option>
                                          <option value="148">Chad</option>
                                          <option value="152">Chile</option>
                                          <option value="156">China</option>
                                          <option value="162">Christmas Island</option>
                                          <option value="166">Cocos (Keeling) Islands</option>
                                          <option value="170">Colombia</option>
                                          <option value="174">Comoros</option>
                                          <option value="178">Congo</option>
                                          <option value="184">Cook Islands</option>
                                          <option value="188">Costa Rica</option>
                                          <option value="384">Cote D&#039;Ivoire</option>
                                          <option value="191">Croatia</option>
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
                                          <option value="238">Falkland Islands (Malvinas)</option>
                                          <option value="234">Faroe Islands</option>
                                          <option value="242">Fiji</option>
                                          <option value="246">Finland</option>
                                          <option value="250">France</option>
                                          <option value="254">French Guiana</option>
                                          <option value="258">French Polynesia</option>
                                          <option value="260">French Southern Territories</option>
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
                                          <option value="334">Heard and Mc Donald Islands</option>
                                          <option value="340">Honduras</option>
                                          <option value="344">Hong Kong</option>
                                          <option value="348">Hungary</option>
                                          <option value="352">Iceland</option>
                                          <option value="356">India</option>
                                          <option value="360">Indonesia</option>
                                          <option value="364">Iran</option>
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
                                          <option value="414">Kuwait</option>
                                          <option value="417">Kyrgyzstan</option>
                                          <option value="418">Lao People&#039;s Democratic Republic</option>
                                          <option value="428">Latvia</option>
                                          <option value="422">Lebanon</option>
                                          <option value="426">Lesotho</option>
                                          <option value="430">Liberia</option>
                                          <option value="434">Libya</option>
                                          <option value="438">Liechtenstein</option>
                                          <option value="440">Lithuania</option>
                                          <option value="442">Luxembourg</option>
                                          <option value="446">Macau</option>
                                          <option value="807">Macedonia, Former Yugoslav Rep. of</option>
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
                                          <option value="583">Micronesia, Federated States of</option>
                                          <option value="498">Moldova, Republic of</option>
                                          <option value="492">Monaco</option>
                                          <option value="496">Mongolia</option>
                                          <option value="895">Montenegro</option>
                                          <option value="500">Montserrat</option>
                                          <option value="504">Morocco</option>
                                          <option value="508">Mozambique</option>
                                          <option value="104">Myanmar</option>
                                          <option value="516">Namibia</option>
                                          <option value="520">Nauru</option>
                                          <option value="524">Nepal</option>
                                          <option value="528">Netherlands</option>
                                          <option value="530">Netherlands Antilles</option>
                                          <option value="540">New Caledonia</option>
                                          <option value="554">New Zealand</option>
                                          <option value="558">Nicaragua</option>
                                          <option value="562">Niger</option>
                                          <option value="566">Nigeria</option>
                                          <option value="570">Niue</option>
                                          <option value="574">Norfolk Island</option>
                                          <option value="410">North Korea</option>
                                          <option value="580">Northern Mariana Islands</option>
                                          <option value="578">Norway</option>
                                          <option value="512">Oman</option>
                                          <option value="586">Pakistan</option>
                                          <option value="585">Palau</option>
                                          <option value="900">Palestine</option>
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
                                          <option value="659">Saint Kitts and Nevis</option>
                                          <option value="662">Saint Lucia</option>
                                          <option value="670">Saint Vincent and The Grenadines</option>
                                          <option value="882">Samoa</option>
                                          <option value="674">San Marino</option>
                                          <option value="678">Sao Tome and Principe</option>
                                          <option value="682">Saudi Arabia</option>
                                          <option value="686">Senegal</option>
                                          <option value="891">Serbia</option>
                                          <option value="690">Seychelles</option>
                                          <option value="694">Sierra Leone</option>
                                          <option value="702">Singapore</option>
                                          <option value="703">Slovakia</option>
                                          <option value="705">Slovenia</option>
                                          <option value="090">Solomon Islands</option>
                                          <option value="706">Somalia</option>
                                          <option value="710">South Africa</option>
                                          <option value="239">South Georgia and The S.Sandwich Is.</option>
                                          <option value="408">South Korea</option>
                                          <option value="724">Spain</option>
                                          <option value="144">Sri Lanka</option>
                                          <option value="654">St. Helena</option>
                                          <option value="897">St. Kitts and Nevis</option>
                                          <option value="898">St. Lucia</option>
                                          <option value="666">St. Pierre and Miquelon</option>
                                          <option value="899">St. Vincent and Grenadines</option>
                                          <option value="736">Sudan</option>
                                          <option value="740">Suriname</option>
                                          <option value="744">Svalbard and Jan Mayen Islands</option>
                                          <option value="748">Swaziland</option>
                                          <option value="752">Sweden</option>
                                          <option value="756">Switzerland</option>
                                          <option value="760">Syria</option>
                                          <option value="158">Taiwan</option>
                                          <option value="762">Tajikistan</option>
                                          <option value="834">Tanzania, United Republic of</option>
                                          <option value="764">Thailand</option>
                                          <option value="768">Togo</option>
                                          <option value="772">Tokelau</option>
                                          <option value="776">Tonga</option>
                                          <option value="780">Trinidad and Tobago</option>
                                          <option value="788">Tunisia</option>
                                          <option value="792">Turkey</option>
                                          <option value="795">Turkmenistan</option>
                                          <option value="796">Turks and Caicos Islands</option>
                                          <option value="798">Tuvalu</option>
                                          <option value="800">Uganda</option>
                                          <option value="804">Ukraine</option>
                                          <option value="784">United Arab Emirates</option>
                                          <option value="826">United Kingdom</option>
                                          <option value="840" selected="selected">United States</option>
                                          <option value="581">United States Minor Outlying Islands</option>
                                          <option value="858">Uruguay</option>
                                          <option value="860">Uzbekistan</option>
                                          <option value="548">Vanuatu</option>
                                          <option value="336">Vatican City State (Holy See)</option>
                                          <option value="862">Venezuela</option>
                                          <option value="704">Viet Nam</option>
                                          <option value="092">Virgin Islands (British)</option>
                                          <option value="850">Virgin Islands (U.S.)</option>
                                          <option value="876">Wallis and Futuna Islands</option>
                                          <option value="732">Western Sahara</option>
                                          <option value="887">Yemen</option>
                                          <option value="180">Zaire</option>
                                          <option value="894">Zambia</option>
                                          <option value="716">Zimbabwe</option>
                                        </select>
                                    </li>
                                    <li class="form-row">
                                        <label for="timezone">* Timezone:</label>
                                        <select name="timezone" id="timezone">
                                          <option value=""></option>
                                          <option value="6">Africa/Abidjan</option>
                                          <option value="7">Africa/Accra</option>
                                          <option value="8">Africa/Addis_Ababa</option>
                                          <option value="9">Africa/Algiers</option>
                                          <option value="10">Africa/Asmera</option>
                                          <option value="11">Africa/Bamako</option>
                                          <option value="12">Africa/Bangui</option>
                                          <option value="13">Africa/Banjul</option>
                                          <option value="14">Africa/Bissau</option>
                                          <option value="15">Africa/Blantyre</option>
                                          <option value="16">Africa/Brazzaville</option>
                                          <option value="17">Africa/Bujumbura</option>
                                          <option value="18">Africa/Cairo</option>
                                          <option value="19">Africa/Casablanca</option>
                                          <option value="20">Africa/Ceuta</option>
                                          <option value="21">Africa/Conakry</option>
                                          <option value="22">Africa/Dakar</option>
                                          <option value="23">Africa/Dar_es_Salaam</option>
                                          <option value="24">Africa/Djibouti</option>
                                          <option value="25">Africa/Douala</option>
                                          <option value="26">Africa/El_Aaiun</option>
                                          <option value="27">Africa/Freetown</option>
                                          <option value="28">Africa/Gaborone</option>
                                          <option value="29">Africa/Harare</option>
                                          <option value="30">Africa/Johannesburg</option>
                                          <option value="31">Africa/Kampala</option>
                                          <option value="32">Africa/Khartoum</option>
                                          <option value="33">Africa/Kigali</option>
                                          <option value="34">Africa/Kinshasa</option>
                                          <option value="35">Africa/Lagos</option>
                                          <option value="36">Africa/Libreville</option>
                                          <option value="37">Africa/Lome</option>
                                          <option value="38">Africa/Luanda</option>
                                          <option value="39">Africa/Lubumbashi</option>
                                          <option value="40">Africa/Lusaka</option>
                                          <option value="41">Africa/Malabo</option>
                                          <option value="42">Africa/Maputo</option>
                                          <option value="43">Africa/Maseru</option>
                                          <option value="44">Africa/Mbabane</option>
                                          <option value="45">Africa/Mogadishu</option>
                                          <option value="46">Africa/Monrovia</option>
                                          <option value="47">Africa/Nairobi</option>
                                          <option value="48">Africa/Ndjamena</option>
                                          <option value="49">Africa/Niamey</option>
                                          <option value="50">Africa/Nouakchott</option>
                                          <option value="51">Africa/Ouagadougou</option>
                                          <option value="52">Africa/Porto-Novo</option>
                                          <option value="53">Africa/Sao_Tome</option>
                                          <option value="54">Africa/Timbuktu</option>
                                          <option value="55">Africa/Tripoli</option>
                                          <option value="56">Africa/Tunis</option>
                                          <option value="57">Africa/Windhoek</option>
                                          <option value="58">America/Adak</option>
                                          <option value="59">America/Anchorage</option>
                                          <option value="60">America/Anguilla</option>
                                          <option value="61">America/Antigua</option>
                                          <option value="62">America/Araguaina</option>
                                          <option value="63">America/Aruba</option>
                                          <option value="64">America/Asuncion</option>
                                          <option value="65">America/Atka</option>
                                          <option value="66">America/Bahia</option>
                                          <option value="67">America/Barbados</option>
                                          <option value="68">America/Belem</option>
                                          <option value="69">America/Belize</option>
                                          <option value="70">America/Boa_Vista</option>
                                          <option value="71">America/Bogota</option>
                                          <option value="72">America/Boise</option>
                                          <option value="73">America/Buenos_Aires</option>
                                          <option value="74">America/Cambridge_Bay</option>
                                          <option value="75">America/Campo_Grande</option>
                                          <option value="76">America/Cancun</option>
                                          <option value="77">America/Caracas</option>
                                          <option value="78">America/Catamarca</option>
                                          <option value="79">America/Cayenne</option>
                                          <option value="80">America/Cayman</option>
                                          <option value="81">America/Chicago</option>
                                          <option value="82">America/Chihuahua</option>
                                          <option value="83">America/Cordoba</option>
                                          <option value="84">America/Costa_Rica</option>
                                          <option value="85">America/Cuiaba</option>
                                          <option value="86">America/Curacao</option>
                                          <option value="87">America/Danmarkshavn</option>
                                          <option value="88">America/Dawson</option>
                                          <option value="89">America/Dawson_Creek</option>
                                          <option value="90">America/Denver</option>
                                          <option value="91">America/Detroit</option>
                                          <option value="92">America/Dominica</option>
                                          <option value="93">America/Edmonton</option>
                                          <option value="94">America/Eirunepe</option>
                                          <option value="95">America/El_Salvador</option>
                                          <option value="96">America/Ensenada</option>
                                          <option value="97">America/Fort_Wayne</option>
                                          <option value="98">America/Fortaleza</option>
                                          <option value="99">America/Glace_Bay</option>
                                          <option value="100">America/Godthab</option>
                                          <option value="101">America/Goose_Bay</option>
                                          <option value="102">America/Grand_Turk</option>
                                          <option value="103">America/Grenada</option>
                                          <option value="104">America/Guadeloupe</option>
                                          <option value="105">America/Guatemala</option>
                                          <option value="106">America/Guayaquil</option>
                                          <option value="107">America/Guyana</option>
                                          <option value="108">America/Halifax</option>
                                          <option value="109">America/Havana</option>
                                          <option value="110">America/Hermosillo</option>
                                          <option value="111">America/Indiana/Indianapolis</option>
                                          <option value="112">America/Indiana/Knox</option>
                                          <option value="113">America/Indiana/Marengo</option>
                                          <option value="114">America/Indiana/Vevay</option>
                                          <option value="115">America/Indianapolis</option>
                                          <option value="116">America/Inuvik</option>
                                          <option value="117">America/Iqaluit</option>
                                          <option value="118">America/Jamaica</option>
                                          <option value="119">America/Jujuy</option>
                                          <option value="120">America/Juneau</option>
                                          <option value="121">America/Kentucky/Louisville</option>
                                          <option value="122">America/Kentucky/Monticello</option>
                                          <option value="123">America/Knox_IN</option>
                                          <option value="124">America/La_Paz</option>
                                          <option value="125">America/Lima</option>
                                          <option value="126">America/Los_Angeles</option>
                                          <option value="127">America/Louisville</option>
                                          <option value="128">America/Maceio</option>
                                          <option value="129">America/Managua</option>
                                          <option value="130">America/Manaus</option>
                                          <option value="131">America/Martinique</option>
                                          <option value="132">America/Mazatlan</option>
                                          <option value="133">America/Mendoza</option>
                                          <option value="134">America/Menominee</option>
                                          <option value="135">America/Merida</option>
                                          <option value="136">America/Mexico_City</option>
                                          <option value="137">America/Miquelon</option>
                                          <option value="138">America/Monterrey</option>
                                          <option value="139">America/Montevideo</option>
                                          <option value="140">America/Montreal</option>
                                          <option value="141">America/Montserrat</option>
                                          <option value="142">America/Nassau</option>
                                          <option value="143">America/New_York</option>
                                          <option value="144">America/Nipigon</option>
                                          <option value="145">America/Nome</option>
                                          <option value="146">America/Noronha</option>
                                          <option value="147">America/North_Dakota/Center</option>
                                          <option value="148">America/Panama</option>
                                          <option value="149">America/Pangnirtung</option>
                                          <option value="150">America/Paramaribo</option>
                                          <option value="151">America/Phoenix</option>
                                          <option value="152">America/Port-au-Prince</option>
                                          <option value="153">America/Port_of_Spain</option>
                                          <option value="154">America/Porto_Acre</option>
                                          <option value="155">America/Porto_Velho</option>
                                          <option value="156">America/Puerto_Rico</option>
                                          <option value="157">America/Rainy_River</option>
                                          <option value="158">America/Rankin_Inlet</option>
                                          <option value="159">America/Recife</option>
                                          <option value="160">America/Regina</option>
                                          <option value="161">America/Rio_Branco</option>
                                          <option value="162">America/Rosario</option>
                                          <option value="163">America/Santiago</option>
                                          <option value="164">America/Santo_Domingo</option>
                                          <option value="165">America/Sao_Paulo</option>
                                          <option value="166">America/Scoresbysund</option>
                                          <option value="167">America/Shiprock</option>
                                          <option value="168">America/St_Johns</option>
                                          <option value="169">America/St_Kitts</option>
                                          <option value="170">America/St_Lucia</option>
                                          <option value="171">America/St_Thomas</option>
                                          <option value="172">America/St_Vincent</option>
                                          <option value="173">America/Swift_Current</option>
                                          <option value="174">America/Tegucigalpa</option>
                                          <option value="175">America/Thule</option>
                                          <option value="176">America/Thunder_Bay</option>
                                          <option value="177">America/Tijuana</option>
                                          <option value="178">America/Toronto</option>
                                          <option value="179">America/Tortola</option>
                                          <option value="180">America/Vancouver</option>
                                          <option value="181">America/Virgin</option>
                                          <option value="182">America/Whitehorse</option>
                                          <option value="183">America/Winnipeg</option>
                                          <option value="184">America/Yakutat</option>
                                          <option value="185">America/Yellowknife</option>
                                          <option value="186">Antarctica/Casey</option>
                                          <option value="187">Antarctica/Davis</option>
                                          <option value="188">Antarctica/DumontDUrville</option>
                                          <option value="189">Antarctica/Mawson</option>
                                          <option value="190">Antarctica/McMurdo</option>
                                          <option value="191">Antarctica/Palmer</option>
                                          <option value="192">Antarctica/Rothera</option>
                                          <option value="193">Antarctica/South_Pole</option>
                                          <option value="194">Antarctica/Syowa</option>
                                          <option value="195">Antarctica/Vostok</option>
                                          <option value="196">Arctic/Longyearbyen</option>
                                          <option value="197">Asia/Aden</option>
                                          <option value="198">Asia/Almaty</option>
                                          <option value="199">Asia/Amman</option>
                                          <option value="200">Asia/Anadyr</option>
                                          <option value="201">Asia/Aqtau</option>
                                          <option value="202">Asia/Aqtobe</option>
                                          <option value="203">Asia/Ashgabat</option>
                                          <option value="204">Asia/Ashkhabad</option>
                                          <option value="205">Asia/Baghdad</option>
                                          <option value="206">Asia/Bahrain</option>
                                          <option value="207">Asia/Baku</option>
                                          <option value="208">Asia/Bangkok</option>
                                          <option value="209">Asia/Beirut</option>
                                          <option value="210">Asia/Bishkek</option>
                                          <option value="211">Asia/Brunei</option>
                                          <option value="212">Asia/Calcutta</option>
                                          <option value="213">Asia/Choibalsan</option>
                                          <option value="214">Asia/Chongqing</option>
                                          <option value="215">Asia/Chungking</option>
                                          <option value="216">Asia/Colombo</option>
                                          <option value="217">Asia/Dacca</option>
                                          <option value="218">Asia/Damascus</option>
                                          <option value="219">Asia/Dhaka</option>
                                          <option value="220">Asia/Dili</option>
                                          <option value="221">Asia/Dubai</option>
                                          <option value="222">Asia/Dushanbe</option>
                                          <option value="223">Asia/Gaza</option>
                                          <option value="224">Asia/Harbin</option>
                                          <option value="225">Asia/Hong_Kong</option>
                                          <option value="226">Asia/Hovd</option>
                                          <option value="227">Asia/Irkutsk</option>
                                          <option value="228">Asia/Istanbul</option>
                                          <option value="229">Asia/Jakarta</option>
                                          <option value="230">Asia/Jayapura</option>
                                          <option value="231">Asia/Jerusalem</option>
                                          <option value="232">Asia/Kabul</option>
                                          <option value="233">Asia/Kamchatka</option>
                                          <option value="234">Asia/Karachi</option>
                                          <option value="235">Asia/Kashgar</option>
                                          <option value="236">Asia/Katmandu</option>
                                          <option value="237">Asia/Krasnoyarsk</option>
                                          <option value="238">Asia/Kuala_Lumpur</option>
                                          <option value="239">Asia/Kuching</option>
                                          <option value="240">Asia/Kuwait</option>
                                          <option value="241">Asia/Macao</option>
                                          <option value="242">Asia/Macau</option>
                                          <option value="243">Asia/Magadan</option>
                                          <option value="244">Asia/Makassar</option>
                                          <option value="245">Asia/Manila</option>
                                          <option value="246">Asia/Muscat</option>
                                          <option value="247">Asia/Nicosia</option>
                                          <option value="248">Asia/Novosibirsk</option>
                                          <option value="249">Asia/Omsk</option>
                                          <option value="250">Asia/Oral</option>
                                          <option value="251">Asia/Phnom_Penh</option>
                                          <option value="252">Asia/Pontianak</option>
                                          <option value="253">Asia/Pyongyang</option>
                                          <option value="254">Asia/Qatar</option>
                                          <option value="255">Asia/Qyzylorda</option>
                                          <option value="256">Asia/Rangoon</option>
                                          <option value="257">Asia/Riyadh</option>
                                          <option value="258">Asia/Riyadh87</option>
                                          <option value="259">Asia/Riyadh88</option>
                                          <option value="260">Asia/Riyadh89</option>
                                          <option value="261">Asia/Saigon</option>
                                          <option value="262">Asia/Sakhalin</option>
                                          <option value="263">Asia/Samarkand</option>
                                          <option value="264">Asia/Seoul</option>
                                          <option value="265">Asia/Shanghai</option>
                                          <option value="266">Asia/Singapore</option>
                                          <option value="267">Asia/Taipei</option>
                                          <option value="268">Asia/Tashkent</option>
                                          <option value="269">Asia/Tbilisi</option>
                                          <option value="270">Asia/Tehran</option>
                                          <option value="271">Asia/Tel_Aviv</option>
                                          <option value="272">Asia/Thimbu</option>
                                          <option value="273">Asia/Thimphu</option>
                                          <option value="274">Asia/Tokyo</option>
                                          <option value="275">Asia/Ujung_Pandang</option>
                                          <option value="276">Asia/Ulaanbaatar</option>
                                          <option value="277">Asia/Ulan_Bator</option>
                                          <option value="278">Asia/Urumqi</option>
                                          <option value="279">Asia/Vientiane</option>
                                          <option value="280">Asia/Vladivostok</option>
                                          <option value="281">Asia/Yakutsk</option>
                                          <option value="282">Asia/Yekaterinburg</option>
                                          <option value="283">Asia/Yerevan</option>
                                          <option value="284">Atlantic/Azores</option>
                                          <option value="285">Atlantic/Bermuda</option>
                                          <option value="286">Atlantic/Canary</option>
                                          <option value="287">Atlantic/Cape_Verde</option>
                                          <option value="288">Atlantic/Faeroe</option>
                                          <option value="289">Atlantic/Jan_Mayen</option>
                                          <option value="290">Atlantic/Madeira</option>
                                          <option value="291">Atlantic/Reykjavik</option>
                                          <option value="292">Atlantic/South_Georgia</option>
                                          <option value="293">Atlantic/St_Helena</option>
                                          <option value="294">Atlantic/Stanley</option>
                                          <option value="295">Australia/ACT</option>
                                          <option value="296">Australia/Adelaide</option>
                                          <option value="297">Australia/Brisbane</option>
                                          <option value="298">Australia/Broken_Hill</option>
                                          <option value="299">Australia/Canberra</option>
                                          <option value="300">Australia/Darwin</option>
                                          <option value="301">Australia/Hobart</option>
                                          <option value="302">Australia/LHI</option>
                                          <option value="303">Australia/Lindeman</option>
                                          <option value="304">Australia/Lord_Howe</option>
                                          <option value="305">Australia/Melbourne</option>
                                          <option value="306">Australia/NSW</option>
                                          <option value="307">Australia/North</option>
                                          <option value="308">Australia/Perth</option>
                                          <option value="309">Australia/Queensland</option>
                                          <option value="310">Australia/South</option>
                                          <option value="311">Australia/Sydney</option>
                                          <option value="312">Australia/Tasmania</option>
                                          <option value="313">Australia/Victoria</option>
                                          <option value="314">Australia/West</option>
                                          <option value="315">Australia/Yancowinna</option>
                                          <option value="318">Brazil/Acre</option>
                                          <option value="319">Brazil/DeNoronha</option>
                                          <option value="320">Brazil/East</option>
                                          <option value="321">Brazil/West</option>
                                          <option value="328">Canada/Atlantic</option>
                                          <option value="329">Canada/Central</option>
                                          <option value="330">Canada/East-Saskatchewan</option>
                                          <option value="331">Canada/Eastern</option>
                                          <option value="332">Canada/Mountain</option>
                                          <option value="333">Canada/Newfoundland</option>
                                          <option value="334">Canada/Pacific</option>
                                          <option value="335">Canada/Saskatchewan</option>
                                          <option value="336">Canada/Yukon</option>
                                          <option value="337">Chile/Continental</option>
                                          <option value="338">Chile/EasterIsland</option>
                                          <option value="382">Europe/Amsterdam</option>
                                          <option value="383">Europe/Andorra</option>
                                          <option value="384">Europe/Athens</option>
                                          <option value="385">Europe/Belfast</option>
                                          <option value="386">Europe/Belgrade</option>
                                          <option value="387">Europe/Berlin</option>
                                          <option value="388">Europe/Bratislava</option>
                                          <option value="389">Europe/Brussels</option>
                                          <option value="390">Europe/Bucharest</option>
                                          <option value="391">Europe/Budapest</option>
                                          <option value="392">Europe/Chisinau</option>
                                          <option value="393">Europe/Copenhagen</option>
                                          <option value="394">Europe/Dublin</option>
                                          <option value="395">Europe/Gibraltar</option>
                                          <option value="396">Europe/Helsinki</option>
                                          <option value="397">Europe/Istanbul</option>
                                          <option value="398">Europe/Kaliningrad</option>
                                          <option value="399">Europe/Kiev</option>
                                          <option value="400">Europe/Lisbon</option>
                                          <option value="401">Europe/Ljubljana</option>
                                          <option value="402">Europe/London</option>
                                          <option value="403">Europe/Luxembourg</option>
                                          <option value="404">Europe/Madrid</option>
                                          <option value="405">Europe/Malta</option>
                                          <option value="406">Europe/Minsk</option>
                                          <option value="407">Europe/Monaco</option>
                                          <option value="408">Europe/Moscow</option>
                                          <option value="409">Europe/Nicosia</option>
                                          <option value="410">Europe/Oslo</option>
                                          <option value="411">Europe/Paris</option>
                                          <option value="412">Europe/Prague</option>
                                          <option value="413">Europe/Riga</option>
                                          <option value="414">Europe/Rome</option>
                                          <option value="415">Europe/Samara</option>
                                          <option value="416">Europe/San_Marino</option>
                                          <option value="417">Europe/Sarajevo</option>
                                          <option value="418">Europe/Simferopol</option>
                                          <option value="419">Europe/Skopje</option>
                                          <option value="420">Europe/Sofia</option>
                                          <option value="421">Europe/Stockholm</option>
                                          <option value="422">Europe/Tallinn</option>
                                          <option value="423">Europe/Tirane</option>
                                          <option value="424">Europe/Tiraspol</option>
                                          <option value="425">Europe/Uzhgorod</option>
                                          <option value="426">Europe/Vaduz</option>
                                          <option value="427">Europe/Vatican</option>
                                          <option value="428">Europe/Vienna</option>
                                          <option value="429">Europe/Vilnius</option>
                                          <option value="430">Europe/Warsaw</option>
                                          <option value="431">Europe/Zagreb</option>
                                          <option value="432">Europe/Zaporozhye</option>
                                          <option value="433">Europe/Zurich</option>
                                          <option value="444">Indian/Antananarivo</option>
                                          <option value="445">Indian/Chagos</option>
                                          <option value="446">Indian/Christmas</option>
                                          <option value="447">Indian/Cocos</option>
                                          <option value="448">Indian/Comoro</option>
                                          <option value="449">Indian/Kerguelen</option>
                                          <option value="450">Indian/Mahe</option>
                                          <option value="451">Indian/Maldives</option>
                                          <option value="452">Indian/Mauritius</option>
                                          <option value="453">Indian/Mayotte</option>
                                          <option value="454">Indian/Reunion</option>
                                          <option value="466">Mexico/BajaNorte</option>
                                          <option value="467">Mexico/BajaSur</option>
                                          <option value="468">Mexico/General</option>
                                          <option value="469">Mideast/Riyadh87</option>
                                          <option value="470">Mideast/Riyadh88</option>
                                          <option value="471">Mideast/Riyadh89</option>
                                          <option value="483">Pacific/Apia</option>
                                          <option value="484">Pacific/Auckland</option>
                                          <option value="485">Pacific/Chatham</option>
                                          <option value="486">Pacific/Easter</option>
                                          <option value="487">Pacific/Efate</option>
                                          <option value="488">Pacific/Enderbury</option>
                                          <option value="489">Pacific/Fakaofo</option>
                                          <option value="490">Pacific/Fiji</option>
                                          <option value="491">Pacific/Funafuti</option>
                                          <option value="492">Pacific/Galapagos</option>
                                          <option value="493">Pacific/Gambier</option>
                                          <option value="494">Pacific/Guadalcanal</option>
                                          <option value="495">Pacific/Guam</option>
                                          <option value="496">Pacific/Honolulu</option>
                                          <option value="497">Pacific/Johnston</option>
                                          <option value="498">Pacific/Kiritimati</option>
                                          <option value="499">Pacific/Kosrae</option>
                                          <option value="500">Pacific/Kwajalein</option>
                                          <option value="501">Pacific/Majuro</option>
                                          <option value="502">Pacific/Marquesas</option>
                                          <option value="503">Pacific/Midway</option>
                                          <option value="504">Pacific/Nauru</option>
                                          <option value="505">Pacific/Niue</option>
                                          <option value="506">Pacific/Norfolk</option>
                                          <option value="507">Pacific/Noumea</option>
                                          <option value="508">Pacific/Pago_Pago</option>
                                          <option value="509">Pacific/Palau</option>
                                          <option value="510">Pacific/Pitcairn</option>
                                          <option value="511">Pacific/Ponape</option>
                                          <option value="512">Pacific/Port_Moresby</option>
                                          <option value="513">Pacific/Rarotonga</option>
                                          <option value="514">Pacific/Saipan</option>
                                          <option value="515">Pacific/Samoa</option>
                                          <option value="516">Pacific/Tahiti</option>
                                          <option value="517">Pacific/Tarawa</option>
                                          <option value="518">Pacific/Tongatapu</option>
                                          <option value="519">Pacific/Truk</option>
                                          <option value="520">Pacific/Wake</option>
                                          <option value="521">Pacific/Wallis</option>
                                          <option value="522">Pacific/Yap</option>
                                          <option value="543">US/Alaska</option>
                                          <option value="544">US/Aleutian</option>
                                          <option value="545">US/Arizona</option>
                                          <option value="546">US/Central</option>
                                          <option value="547">US/East-Indiana</option>
                                          <option value="548" selected="selected">US/Eastern</option>
                                          <option value="549">US/Hawaii</option>
                                          <option value="550">US/Indiana-Starke</option>
                                          <option value="551">US/Michigan</option>
                                          <option value="552">US/Mountain</option>
                                          <option value="553">US/Pacific</option>
                                          <option value="554">US/Pacific-New</option>
                                          <option value="555">US/Samoa</option>
                                        </select>
                                    </li>
                                    <li class="form-row">
                                        <label for="phone">Phone Number:</label>
                                        <input type="text" name="phone" id="phone" size="40" />
                                    </li>
                                    <li class="form-row">
                                        <label for="email">* Email Address:</label>
                                        <input type="text" name="email" id="email" size="40" value="ralph@mycompany.com" />
                                        <span>&nbsp;</span>                                    </li>
                                    <li class="form-row">
                                        <label for="email_confirm">* Confirm Email Address:</label>
                                        <input type="text" name="email_confirm" id="email_confirm" size="40" value="ralph@mycompany.com" />
                                        <span>&nbsp;</span>                                    </li>
                                    <li class="form-row">
                                        <label for="email_notify">Email Notifications:</label>
                                          <input type="checkbox" name="TC_studio" id="TC_studio" />TopCoder Studio Competitions
                                    </li>
                                    <li class="form-row">
                                        <label for="email_notify"></label>
                                        <input type="checkbox" name="TC_news" id="TC_news" />TopCoder News & Events
                                    </li>
                                    <li class="form-row">
                                      <label for="enable_contact">Enable Member Contact:</label>
                                        <input type="radio" name="radio" id="radio" value="radio" />Yes        
                                      <input type="radio" name="radio2" id="radio2" value="radio2" />No
                                    </li>
                                    <li class="form-row">
                                      <label for="earnings">Show/Hide Earnings:</label>
                                        <input type="radio" name="radio" id="radio" value="radio" />Show        
                                        <input type="radio" name="radio2" id="radio2" value="radio2" />Hide
                                    </li>
                                </ul>
                          </div>
                      </div>
                    </div>

                    <div class="block">
                        <div class="sidebar">
                            <p>Choose your username carefully. It cannot be changed, and it is a violation of our <a href="javascript:popUp('terms_of_use.jsp');" title="Terms of Use">Terms of Use</a> to create more than one account.</p>
                            <p>If you ever forget your password and you do not have access to the email address in our system, you will be asked to answer this question in order to reset your password.</p>
                        </div>
                        <div class="content">
                            <h4><span>Account</span><span class="end">&nbsp;</span></h4>
                            <div class="content-body">
                                <ul>
                                    <li class="form-row">
                                        <label for="username">* Username:</label>
                                        <input type="text" name="username" id="username" size="40" value="SuperSmoothie" />
                                        <span>SuperSmoothie is available</span>
                                        <p class="label-description"><em>Username specifications are listed here</em></p>
                                    </li>
                                    <li class="form-row">
                                        <label for="password">* Password:</label>
                                        <input type="password" name="password" id="password" size="40" value="password" />
                                        <span>&nbsp;</span>
                                        <p class="label-description"><em>Password specifications are listed here</em></p>
                                    </li>
                                    <li class="form-row">
                                        <label for="password_confirm">* Confirm Password:</label>
                                        <input type="password" name="password_confirm" id="password_confirm" size="40" value="password" />
                                        <span>&nbsp;</span>                                    </li>
                                    <li class="form-row">
                                        <label for="secret_question">* Secret Question:</label>
                                        <select name="secret_question" id="secret_question">
                                            <option>select a question</option>
                                            <option value="1">What was your first car?</option>
                                            <option value="2">What is the name of your first school?</option>
                                            <option value="3">What is the name of your first pet?</option>
                                            <option value="4">What is the name of your hometown?</option>
                                            <option value="5">What is your father's middle name?</option>
                                            <option value="6">What is the house number where you grew up?</option>
                                            <option value="7" selected="selected">What is your favorite drink?</option>
                                        </select>                        
                                        <span>&nbsp;</span>                                    </li>
                                    <li class="form-row">
                                        <label for="secret_question_response">* Secret Question Response:</label>
                                        <input type="password" name="secret_question_response" id="secret_question_response" size="40" value="secretquestion" />
                                        <span>&nbsp;</span>                                    </li>
                                    <li class="form-row">
                                        <label for="student_professional">* Student/Professional:</label>
                                        <select name="student_professional" id="student_professional">
                                          <option></option>
                                          <option value="student" selected="selected">student</option>
                                          <option value="professional">professional</option>
                                      </select>
                                    </li>
                                    <li class="form-bottom">
                                        <input type="checkbox" name="agree" id="agree" onclick="enableSubmit();" checked="checked" />
                                        <label for="agree">I have read and accept the <a href="javascript:popUp('terms_of_use.jsp');" title="Terms of Use">Terms of Use</a></label><br />
                                        <button type="submit" id="submit">Submit</button>
                                        <p>
                                            Or cancel and go to 
                                            <a href="index.jsp" title="TopCoder">TopCoder</a> or 
                                            <a href="studio_home.jsp" title="Studio">Studio</a>                                        </p>
                                    </li>
                                </ul>
                          </div>
                      </div>
                    </div>
                    
                </form>
            
            </div>
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
