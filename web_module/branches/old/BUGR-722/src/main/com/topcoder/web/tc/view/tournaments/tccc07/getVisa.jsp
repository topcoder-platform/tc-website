<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="joinus"/>
        <jsp:param name="tabLev3" value="getvisa"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Getting your Visa and Getting it Early</span></h1>
                
                <h2>Do I need a visa?</h2>
                <p>All travelers entering the United States must present either a passport or a visa. If you do NOT have a passport, or you are from a country that does NOT participate in the Visa Waiver Program, you must apply for a visa.</p>
                <p>The following countries DO NOT require a visa to enter the United States:<br />
                <a target="_blank" alt="Countries that DO NOT require a visa" href="<tc-webtag:linkTracking link='http://travel.state.gov/visa/temp/without/without_1990.html#countries' refer='TCCC07_getVisa' />">http://travel.state.gov/visa/temp/without/without_1990.html#countries</a></p>
                
                <h2>Why should I get it early?</h2>
                <p>Getting your travel documents well in advance of your travel dates is important. If you require a visa, the application process could be lengthy. In some countries, it can take over a month. <a href="/tc?module=Static&d1=features&d2=073007" target="_blank">We strongly suggest you begin the process as soon as possible.</a></p>
                
                <h2>What is involved in applying for a visa?</h2>
                <p>The visa application process is an interview at the US Embassy explaining your trip to the United States. You should apply for a travel/tourist visa and be sure to let them know that you are only staying in the United States for a short time. It's a good idea to have the following information available at your interview:</p>
                    <ul>
                        <li>An official letter of invitation from TopCoder (please see below)</li>
                        <li>Proof of residency in your home country</li>
                        <li>Evidence of employment and community ties, such as a copy of your marriage license or university documents</li>
                        <li>Your resume</li>
                    </ul>
                    
                <h2>How do I get an official invitation letter from TopCoder?</h2>
                <p style="font-weight:bold;">As stated in the rules, all competitors must request a visa invitation letter by 5:00 PM EDT (GMT/UTC -4) on Friday, September 14, 2007.</p>
                <p><span style="font-weight:bold;">Algorithm Competitors: </span>All competitors who advance to Online Round 1 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
                <p><span style="font-weight:bold;">Component Competitors: </span>All competitors who pass submission on at least one component will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
                <p><span style="font-weight:bold;">Marathon Match Competitors: </span>All competitors who advance to Online Round 1 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
                <p><span style="font-weight:bold;">Studio Design Competitors: </span>All competitors who earned TCCC SDC placement points by September 7, 2007 will receive a request form to fill out if they require a letter. As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.</p>
                
                <h2>How do I apply for a visa?</h2>
                <p>Begin by visiting: <a target="_blank" alt="Obtaining Visas" href="<tc-webtag:linkTracking link='http://www.unitedstatesvisas.gov/obtainingvisa/index.html' refer='TCCC07_getVisa' />">www.unitedstatesvisas.gov/obtainingvisa/index.html</a> or find your nearest U.S. Embassy or Consulate: <a target="_blank" alt="US Embassy or Consulate" href="<tc-webtag:linkTracking link='http://usembassy.state.gov' refer='TCCC07_getVisa' />">http://usembassy.state.gov</a></p>
                <p>Remember, if you become a finalist in any competition, you MUST show proof of your visa and/or passport by the finalist deadline before TopCoder will book a flight for you. If you do not have your visa and/or passport by the appropriate date, you will be disqualified as a finalist. Please revisit the tournament rules for more information or email <a href="mailto:jford@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>.</p>

                
            </div>
        
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
