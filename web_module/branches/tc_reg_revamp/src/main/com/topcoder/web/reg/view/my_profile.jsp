<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">My Profile</s:param>
	</s:include>
	
	<s:if test="%{user.contact != null && user.contact.company != null}" >
		<s:set name="company" value="user.contact.company.name"/>
	</s:if>
	<s:if test="%{user.homeAddress != null}" >
		<s:set name="address" value="user.homeAddress.address1"/>
	</s:if>
	<s:if test="%{user.coder != null && user.coder.compCountry != null}" >
		<s:set name="country" value="user.coder.compCountry.name"/>
	</s:if>
	<s:if test="%{user.coder != null && user.coder.coderReferral != null && user.coder.coderReferral.referral != null}" >
		<s:set name="representedCountry" value="user.coder.coderReferral.referral.description"/>
	</s:if>
	<s:if test="%{user.timeZone != null}" >
		<s:set name="timeZone" value="user.timeZone.description"/>
	</s:if>
	<s:if test="%{user.primaryPhoneNumber != null}" >
		<s:set name="phone" value="user.primaryPhoneNumber.number"/>
	</s:if>
	
	<body class="myProfilePage">
	<div class="wrapper">

	<div id="header">
		<div class="inner">
			<h1><a href="javascript:;" class="logo" title="TopCoder">TopCoder</a></h1>
		</div>
	</div><!-- #header -->

	<div id="container">
		<div id="main">
			<!-- #mainTitle -->
			<div id="mainTitle">
				<div class="mainTitleRight">
					<div class="mainTitleCenter">
						<h2><span class="titleWrapper"><img src="i/font-mainTitle-profile.png" alt="MY PROFILE" /></span></h2>
					</div>
				</div>
			</div>
			<!-- end #mainTitle -->
			
			<!-- #mainContent -->
			<div id="mainContent">
			
				<div class="mainContentInner">
					<form id="formMyProfile" action="#" method="post">
						<div class="nameContact">
							<div class="profileBox">
								<div class="profileBoxInner">
									<span class="label">Profile Completeness</span>
									<div class="profileCompleteness">
										<div class="profileCompletenessBar"></div>
									</div>
									<div class="completenessPercent">50%</div>
									<a href="javascript:;" rel="popUp0" class="helpTips">help</a>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="contentMyProfile">
							
								<div id="sideBar">
								
									<div class="userHandle"><strong><s:property value="user.handle" /></strong> (2010)</div>
									<div class="userPhoto"><img src="i/photo-user.jpg" alt="user photo" /></div>
									<div class="userCommandBox">
										<a href="javascript:;" class="button grayBtn userUploadPhotoBtn"><span><span>Upload Photo</span></span></a>
										<div class="clear"></div>
									</div>
									
									<div class="userOperation">
										<ul>
											<li class="expand"><a href="javascript:;" class="topMenu">My Account</a>
												<ul>
													<li><a class="current" href='<s:url value="/displayProfileAction.action"/>'>Name and Contact</a></li>
													<li><a href="demographicInformation.html">Demographic Information</a></li>
													<li><a href="accountInformation.html">Account Info</a></li>
												</ul>
											</li>
											<li><a href="javascript:;" class="topMenu">Preferences</a>
												<ul>
													<li><a href="privacy.html">Privacy</a></li>
													<li><a href="emailNotification.html">Email Notification</a></li>
													<li><a href="paymentPreference.html">Payment Preferences</a></li>
													<li><a href="javascript:;">Registration Preferences</a></li>
													<li><a href="javascript:;">Forum Preferences</a></li>
												</ul>
											</li>
											<li><a href="javascript:;" class="topMenu">Documentation</a>
												<ul>
													<li><a href="javascript:;">Affidavits</a></li>
													<li><a href="javascript:;">Payments</a></li>
													<li><a href="javascript:;">Assignment documents</a></li>
													<li><a href="javascript:;">Visa letter status</a></li>
												</ul>
											</li>
											<li><a href="javascript:;" class="topMenu">Community</a>
												<ul>
													<li><a href="javascript:;">Referrals</a></li>
													<li><a href="javascript:;">Card / Badges</a></li>
												</ul>
											</li>
										</ul>
									</div>
									
								</div>
								<div class="profileMainContent nameAndContact">
									<div class="profileContentTitle">NAME AND CONTACT</div>
									
									<div class="nameAndContactList userInformationList">
										<div class="topCommandBox">
											<a href="javascript:;" class="button redBtn rightFloat editButton"><span><span>Edit</span></span></a>
											<div class="clear"></div>
										</div>
										<div class="elemLine">
											<label>First Name :</label>
											<span class="userContactInformation"><s:property value="user.firstName" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Last Name :</label>
											<span class="userContactInformation"><s:property value="user.lastName" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>E-mail :</label>
											<span class="userContactInformation"><s:property value="user.primaryEmailAddress.address" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Company :</label>
											<span class="userContactInformation"><s:property value="#company"/></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Address :</label>
											<span class="userContactInformation"><s:property value="#address"/></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Country :</label>
											<span class="userContactInformation"><s:property value="#country"/></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Represented Country :</label>
											<span class="userContactInformation"><s:property value="#representedCountry"/></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Timezone :</label>
											<span class="userContactInformation"><s:property value="#timeZone"/></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Phone Number :</label>
											<span class="userContactInformation"><s:property value="#phone"/></span>
											<div class="clearAll"></div>
										</div>
									</div>
									<div class="nameAndContactEdit userEditList">
										<div class="editErrorBox">
											<div class="editErrorNotice">Please Fill the required fields [ e-mail ]</div>
										</div>
										<div class="elemLine">
											<label>First Name :</label>
											<span class="userContactInformation userLabelDisable">Lorem</span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Last Name :</label>
											<span class="userContactInformation userLabelDisable">Ipsum</span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>E-mail <span class="red">*</span>:</label>
											<span class="userContactInformation"><input id="email" type="text" class="text textNormal" value="ley_a_yumi@yahoo.com" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Company :</label>
											<span class="userContactInformation"><input type="text" class="text textNormal" value="Pixar, Inc" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Address :</label>
											<span class="userContactInformation"><input type="text" class="text textNormal" value="Lorem ipsum dolor sit amet" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Country :</label>
											<span class="userContactInformation"><input type="text" class="text textNormal" value="Indonesia" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Represented Country :</label>
											<span class="userContactInformation"><input type="text" class="text textNormal" value="Indonesia" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Timezone :</label>
											<span class="userContactInformation">
												<select name="tz" id="timezoneSelect" class="selectNormal">
													<option value="">Select</option>
													<option value="6" selected="selected">Africa/Abidjan</option>
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
													<option value="548">US/Eastern</option>
													<option value="549">US/Hawaii</option>
													<option value="550">US/Indiana-Starke</option>
													<option value="551">US/Michigan</option>
													<option value="552">US/Mountain</option>
													<option value="553">US/Pacific</option>
													<option value="554">US/Pacific-New</option>
													<option value="555">US/Samoa</option>
												</select>
											</span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label>Phone Number :</label>
											<span class="userContactInformation"><input id="phoneNumber" type="text" class="text textNormal" value="(+62) 61 75142300" /></span>
											<div class="clearAll"></div>
										</div>
										<div class="elemLine">
											<label class="red">&nbsp;* required field</label>
											<span class="userContactInformation">
												<a href="javascript:;" class="button grayBtn discardUserContactButton"><span><span>Discard</span></span></a>
												<a href="javascript:;" class="button redBtn saveUserContactButton"><span><span>Save</span></span></a>
											</span>
											<div class="clear"></div>
										</div>

									</div>
									
								</div>
								
								<div class="clear"></div>
								
							</div>
							
							
						</div>
					</form>
					
					
				</div>
				
			</div>
			<!-- end #mainContent -->
			
			<!-- #mainFooter -->
			<div id="mainFooter">
				<div class="mainFooterRight">
					<div class="mainFooterCenter"></div>
				</div>
			</div>
			<!-- end #mainFooter -->
			
		</div>
	</div><!-- #container -->

	<div id="footer">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc vitae magna augue. Cras luctus, enim eget egestas vulputate, est diam
	</div><!-- #footer -->

	</div><!-- .wrapper -->

	<div id="popUp0" class="popUp">
		<div class="popUpInner">
			<div class="arrow"></div>
			<div class="popUpContent">
				<dl>
					<dt>Please complete the task below to<br />make your profile complete:</dt>
					<dd class="finish">Complete Account Information</dd>
					<dd class="finish">Provide Contact Information</dd>
					<dd>Send Assignment Document</dd>
					<dd>Fill demographic information</dd>
					<dd>Upload your Photo</dd>
				</dl>
			</div>
		</div>
	</div>

	<div id="modal">
		<div id="modalUploadPhoto" class="outLay">
			<div class="modalHeader">UPLOAD YOUR PHOTO</div>
			<div class="modalContainer">
				<div class="modalContainerInner">
					
					<div class="popUpUploadPhotoLeft">
						<div class="inner">
							<img id="photoPreview" src="i/bg-photo-upload.png" alt="" />
							<span class="label">Preview<br />Image</span>
						</div>
					</div>
					<div class="popUpUploadPhotoRight">
						<div class="fileUpload">
							<div class="fileTxt"></div>
							<input type="file" class="documentUploadFile" name="file" />
							<a href="javascript:;" class="button grayBtn browseFileButton"><span><span>Browse</span></span></a>
							<div class="clear"></div>
						</div>
						<div class="popUpUploadPhotoTips">
							Photo should be in *.JPG format file which is the width is xx pixel and the height is xx pixel.
						</div>
						<div class="modalCommand">
							<a href="javascript:;" class="button redBtn uploadModalButton"><span><span>Upload</span></span></a>
							<a href="javascript:;" class="button grayBtn cancelModalButton"><span><span>Cancel</span></span></a>
							<div class="clear"></div>
						</div>
					</div>
					
					<div class="clear"></div>
					
				</div>
			</div>
		</div>
	</div>



	</body>
</html>