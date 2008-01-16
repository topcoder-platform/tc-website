<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="getVisa"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Getting your Visa and Getting it Early</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <h3>Do I need a Visa?</h3>
            <p>All travelers entering the United States must present either a passport or a visa. If you do NOT have a passport or you are from a country that does NOT participate in the Visa Waiver Program, you must apply for a visa.</p>
            <p>The following countries DO NOT require a visa to enter the United States:<br />
            <a target="_blank" href="<tc-webtag:linkTracking link='http://travel.state.gov/visa/temp/without/without_1990.html#countries' refer='tchs08_getVisa' />">http://travel.state.gov/visa/temp/without/without_1990.html#countries</a></p>
    
            <h3>Why Should I Get it Early?</h3>
            <p>Getting your travel documents well in advance of your travel dates is important. If you require a visa, the application process could be lengthy. In some countries, it can take over a month. <a href="/tc?module=Static&d1=features&d2=073007">We strongly suggest you begin the process as soon as possible.</a></p>
            
            <h3>What is involved in applying for a visa?</h3>
            <p>The visa application process is an interview at the US Embassy in your country explaining your trip to the United States. You should apply for a travel/tourist visa and be sure to let them know that you are only staying in the United States for a short time. It's a good idea to have the following information available at your interview:</p>
                <ul>
                    <li>An official letter of invitation from TopCoder (please see below)</li>
                    <li>Proof of residency in your home country</li>
                    <li>Evidence of employment and community ties, such as a copy of your marriage license or school documents</li>
                    <li>Your resume</li>
                </ul>
            
            <h3>How do I get an official invitation letter from TopCoder?</h3>
            <p>After Online Round 1, competitors advancing to Round 2 will receive a request form to fill out. As soon as a competitor fills out the form in entirety, the letter will be shipped out by FedEx International Priority mail. Competitors have until 5:00 PM EST (GMT/UTC -5) on Friday January 25, 2008 to request a letter. Requests made after that date will not be honored.</p>
            
            <h3>How do I apply for a visa?</h3>
            <p>Begin by visiting: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.unitedstatesvisas.gov/obtainingvisa/index.html' refer='tchs08_getVisa' />">www.unitedstatesvisas.gov/obtainingvisa/index.html</a> or find your nearest U.S. Embassy or Consulate: <a target="_blank" href="<tc-webtag:linkTracking link='http://usembassy.state.gov' refer='tchs08_getVisa' />">http://usembassy.state.gov</a></p>
            <p><strong>Remember, if you become a finalist, you MUST show proof of your visa and/or passport to be an eligible finalist. If you do not have your visa and/or passport by Friday February 8, 2008, you will be disqualified as a finalist. Please revisit the tournament rules for more information or email <a href="mailto:jdamato@topcoder.com?subject=Confirmation of Attendance/Proof of Travel Documents">Jessie D'Amato Ford</a>.</strong></p>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>