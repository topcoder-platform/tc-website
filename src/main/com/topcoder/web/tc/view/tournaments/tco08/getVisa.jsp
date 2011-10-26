<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="joinus"/>
    <jsp:param name="tabLev3" value="getvisa"/>
    </jsp:include>


        
        
        <h2>Getting your Visa and Getting it Early</h2>
        
        <div class="sub_content">
        
            <h3>Do I need a visa?</h3>
            <p>All travelers entering the United States must present either a passport or a visa. If you do NOT have a passport, or you are from a country that does NOT participate in the Visa Waiver Program, you must apply for a visa.</p>
            <p>The following countries DO NOT require a visa to enter the United States:<br />
            <a target="_blank" href="<tc-webtag:linkTracking link='http://travel.state.gov/visa/temp/without/without_1990.html#countries' refer='tco08_getVisa' />">http://travel.state.gov/visa/temp/without/without_1990.html#countries</a></p>
            
            <h3>Why should I get it early?</h3>
            <p>Getting your travel documents well in advance of your travel dates is important. If you require a visa, the application process could be lengthy. In some countries, it can take over a month. <a target="_blank" href="/tc?module=Static&d1=features&d2=073007">We strongly suggest you begin the process as soon as possible.</A></p>
            
            <h3>What is involved in applying for a visa?</h3>
            <p>The visa application process is an interview at the US Embassy explaining your trip to the United States. You should apply for a travel/tourist visa and be sure to let them know that you are only staying in the United States for a short time. It's a good idea to have the following information available at your interview:</p>
            <ul>
                <li>An official letter of invitation from TopCoder (please see below)</li>
                <li>Proof of residency in your home country</li>
                <li>Evidence of employment and community ties, such as a copy of your marriage license or university documents</li>
                <li>Your resume</li>
            </ul>
            
            <h3>How do I get an official invitation letter from TopCoder?</h3>
            <p><strong>As stated in the rules, all competitors must request a visa invitation letter by 5:00 PM EDT (GMT/UTC -4) on Wednesday, March 12, 2008.</strong></p>
            <p><strong>Algorithm Competitors:</strong> All competitors who advance to Online Round 2 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
            <p><strong>Component Competitors:</strong> All competitors who pass submission on at least one component will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
            <p><strong>Marathon Competitors:</strong> All competitors who advance to Online Round 2 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
            <p><strong>Studio Design Competitors:</strong> All competitors who earned TCO SDC placement points by February 8, 2008 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
            
            <h3>How do I apply for a visa?</h3>
            <p>Begin by visiting: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.unitedstatesvisas.gov/obtainingvisa/index.html' refer='tco08_getVisa' />">www.unitedstatesvisas.gov/obtainingvisa/index.html</a> or find your nearest U.S. Embassy or Consulate: <a target="_blank" href="<tc-webtag:linkTracking link='http://usembassy.state.gov' refer='tco08_getVisa' />">http://usembassy.state.gov</a></p>
            <p><strong>Remember, if you become a finalist in any competition, you MUST show proof of your visa and/or passport by the finalist deadline before TopCoder will book a flight for you. If you do not have your visa and/or passport by March 26, 2008, you will be disqualified as a finalist. Please revisit the tournament rules for more information or email <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>.</strong></p>

        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
