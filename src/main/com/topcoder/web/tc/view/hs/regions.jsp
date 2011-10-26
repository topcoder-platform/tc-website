<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_hs_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="cardCell" width="100%" align="center" style="padding: 0px 0px 0px 0px;">
<div class="myTCBody">

<div align="center" style="margin-top: 15px;">
    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
</div>

<p>

<span class="title">TopCoder High School Regions</span>

<p align="center"><A href="#alpha">Alpha</A>&#160;|&#160;<A href="#beta">Beta</A>&#160;|&#160;<A href="#gamma">Gamma</A>&#160;|&#160;<A href="#delta">Delta</A>
</p>

<a name="alpha"></a>
<span class="bodySubtitle">Alpha</span><br/>
Bahamas<br/>
Belize<br/>
Canada<br/>
Cayman Islands<br/>
Colombia<br/>
Cook Islands<br/>
Costa Rica<br/>
Cuba<br/>
Dominican Republic<br/>
Ecuador<br/>
El Salvador<br/>
French Polynesia<br/>
Guatemala<br/>
Haiti<br/>
Honduras<br/>
Jamaica<br/>
Kiribati<br/>
Mexico<br/>
Nicaragua<br/>
Niue<br/>
Panama<br/>
Peru<br/>
Pitcairn<br/>
Samoa<br/>
Tokelau<br/>
Turks and Caicos Islands<br/>
United States
<br/><br/>
<a name="beta"></a>
<span class="bodySubtitle">Beta</span><br/>
Albania<br/>
Algeria<br/>
Andorra<br/>
Angola<br/>
Anguilla<br/>
Antigua and Barbuda<br/>
Argentina<br/>
Aruba<br/>
Austria<br/>
Barbados<br/>
Belgium<br/>
Benin<br/>
Bermuda<br/>
Bolivia<br/>
Bosnia and Herzegowina<br/>
Botswana<br/>
Bouvet Island<br/>
Brazil<br/>
Bulgaria<br/>
Burkina Faso<br/>
Burundi<br/>
Cameroon<br/>
Cape Verde<br/>
Central African Republic<br/>
Chad<br/>
Chile<br/>
Congo<br/>
Cote D'Ivoire<br/>
Croatia<br/>
Cyprus<br/>
Czech Republic<br/>
Denmark<br/>
Dominica<br/>
Egypt<br/>
Equatorial Guinea<br/>
Estonia<br/>
Falkland Islands (Malvinas)<br/>
Faroe Islands<br/>
Finland<br/>
France<br/>
French Guiana<br/>
Gabon<br/>
Gambia<br/>
Germany<br/>
Ghana<br/>
Gibraltar<br/>
Greece<br/>
Greenland<br/>
Grenada<br/>
Guadeloupe<br/>
Guinea<br/>
Guinea-Bissau<br/>
Guyana<br/>
Hungary<br/>
Iceland<br/>
Ireland<br/>
Israel<br/>
Italy<br/>
Jordan<br/>
Latvia<br/>
Lebanon<br/>
Lesotho<br/>
Liberia<br/>
Libyan Arab Jamahiriya<br/>
Liechtenstein<br/>
Lithuania<br/>
Luxembourg<br/>
Macedonia, Former Yugoslav Rep. of<br/>
Malawi<br/>
Mali<br/>
Malta<br/>
Martinique<br/>
Mauritania<br/>
Monaco<br/>
Montenegro<br/>
Montserrat<br/>
Morocco<br/>
Mozambique<br/>
Namibia<br/>
Netherlands<br/>
Netherlands Antilles<br/>
Niger<br/>
Nigeria<br/>
Norway<br/>
Paraguay<br/>
Poland<br/>
Portugal<br/>
Puerto Rico<br/>
Romania<br/>
Rwanda<br/>
Saint Kitts and Nevis<br/>
Saint Lucia<br/>
Saint Vincent and The Grenadines<br/>
San Marino<br/>
Sao Tome and Principe<br/>
Senegal<br/>
Serbia<br/>
Sierra Leone<br/>
Slovakia<br/>
Slovenia<br/>
South Africa<br/>
South Georgia and The S.Sandwich Is.<br/>
Spain<br/>
St. Helena<br/>
St. Pierre and Miquelon<br/>
Sudan<br/>
Suriname<br/>
Svalbard and Jan Mayen Islands<br/>
Swaziland<br/>
Sweden<br/>
Switzerland<br/>
Syrian Arab Republic<br/>
Togo<br/>
Trinidad and Tobago<br/>
Tunisia<br/>
United Kingdom<br/>
Uruguay<br/>
Vatican City State (Holy See)<br/>
Venezuela<br/>
Virgin Islands (British)<br/>
Virgin Islands (U.S.)<br/>
Western Sahara<br/>
Zaire<br/>
Zambia<br/>
Zimbabwe
<br/><br/>
<a name="gamma"></a>
<span class="bodySubtitle">Gamma</span><br/>
Afghanistan<br/>
Armenia<br/>
Azerbaijan<br/>
Bahrain<br/>
Bangladesh<br/>
Belarus<br/>
Bhutan<br/>
British Indian Ocean Territory<br/>
Cambodia<br/>
Christmas Island<br/>
Cocos (Keeling) Islands<br/>
Comoros<br/>
Djibouti<br/>
Eritrea<br/>
Ethiopia<br/>
French Southern Territories<br/>
Georgia<br/>
Guam<br/>
Heard and Mc Donald Islands<br/>
India<br/>
Iran (Islamic Republic of)<br/>
Iraq<br/>
Kazakhstan<br/>
Kenya<br/>
Kuwait<br/>
Kyrgyzstan<br/>
Lao People's Democratic Republic<br/>
Madagascar<br/>
Maldives<br/>
Mauritius<br/>
Mayotte<br/>
Moldova, Republic of<br/>
Myanmar<br/>
Nepal<br/>
Oman<br/>
Pakistan<br/>
Qatar<br/>
Reunion<br/>
Russian Federation<br/>
Saudi Arabia<br/>
Seychelles<br/>
Somalia<br/>
Sri Lanka<br/>
Tajikistan<br/>
Tanzania, United Republic of<br/>
Thailand<br/>
Turkey<br/>
Turkmenistan<br/>
Uganda<br/>
Ukraine<br/>
United Arab Emirates<br/>
Uzbekistan<br/>
Yemen
<br/><br/>
<a name="delta"></a>
<span class="bodySubtitle">Delta</span><br/>
American Samoa<br/>
Antarctica<br/>
Australia<br/>
Brunei Darussalam<br/>
China<br/>
East Timor<br/>
Fiji<br/>
Hong Kong<br/>
Indonesia<br/>
Japan<br/>
Korea, Democratic People's Rep. of<br/>
Korea, Republic of<br/>
Macau<br/>
Malaysia<br/>
Marshall Islands<br/>
Micronesia, Federated States of<br/>
Mongolia<br/>
Nauru<br/>
New Caledonia<br/>
New Zealand<br/>
Norfolk Island<br/>
Northern Mariana Islands<br/>
Palau<br/>
Papua New Guinea<br/>
Philippines<br/>
Singapore<br/>
Solomon Islands<br/>
Taiwan<br/>
Tonga<br/>
Tuvalu<br/>
United States Minor Outlying Islands<br/>
Vanuatu<br/>
Viet Nam<br/>
Wallis and Futuna Islands<br/>
<br/><br/>
</p>

</div>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="tchs"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
