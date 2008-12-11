<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="joinus"/>
                    <jsp:param name="tabLev3" value="getvisa"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Getting your Visa and Getting it Early</span></h1>
                        <h2>Do I need a visa?</h2>
                        <p>
                        All travelers entering the United States must present either a passport or a visa. If you do NOT have a passport, or you are from a country that does NOT participate in the Visa Waiver Program, you must apply for a visa.
                        </p>
                        <p>
                        The following countries DO NOT require a visa to enter the United States: <br>
                        <a target="_blank" href="<tc-webtag:linkTracking link='http://travel.state.gov/visa/temp/without/without_1990.html#countries/' refer='tco_getVisa' />">http://travel.state.gov/visa/temp/without/without_1990.html#countries</a>

                        <h2>Why should I get it early?</h2>
                        <p>
                        Getting your travel documents well in advance of your travel dates is important. If you require a visa, the application process could be lengthy. In some countries, it can take over a month. We strongly suggest you begin the process as soon as possible. 
                        </p>
                        
                       <h2> What is involved in applying for a visa?</h2>
                        <p>
                        The visa application process is an interview at the US Embassy explaining your trip to the United States.  You should apply for a travel/tourist visa and be sure to let them know that you are only staying in the United States for a short time.  It's a good idea to have the following information available at your interview: 
                        <ul>
                        <li>An official letter of invitation from TopCoder (please see below)</li>
                        <li>Proof of residency in your home country </li>
                        <li>Evidence of employment and community ties, such as a copy of your marriage license or university documents </li>
                        <li>Your resume </li>
                        </ul>
                        </p>
                        
                        <h2>How do I get an official invitation letter from TopCoder?</h2>
                        <p>
                        <b>As stated in the rules, all competitors must request a visa invitation letter by 5:00 PM EDT (GMT/UTC -4) on Monday, April 23, 2007.</b>
                        </p>
                        <p>
                        <b>Algorithm Competitors:</b>  All competitors who advance to Online Round 1 will receive a request form to fill out if they require a letter.  As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail.
                        </p>
                        <p>
                        <b>Component Competitors:</b>  All competitors who pass submission on at least one component will receive a request form to fill out if they require a letter.  As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail. 
                        </p>
                        <p>
                        <b>Marathon Match Competitors:</b>  All competitors who advance to Online Round 4 will receive a request form to fill out if they require a letter.  As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail. 
                        </p>
                        <p>
                        <b>Studio Design Competitors:</b>  All competitors who pass screening on at least 2 designs will receive a request form to fill out if they require a letter.  As soon as a competitor fills out the form in its entirety, the letter will be shipped out by FedEx International Priority mail. 
                        </p>
                        <p>
                       <h2>How do I apply for a visa?</h2>
                        <p>
                        Begin by visiting: <a target="_blank" href="<tc-webtag:linkTracking link='http://www.unitedstatesvisas.gov/obtainingvisa/index.html' refer='tco_getVisa' />">www.unitedstatesvisas.gov/obtainingvisa/index.html</a> or find your nearest U.S. Embassy or Consulate: <a target="_blank" href="<tc-webtag:linkTracking link='http://usembassy.state.gov' refer='tco_getVisa' />">http://usembassy.state.gov</a> 
                        </p>
                        <p>
                        <b>Remember, if you become a finalist in any competition, you MUST show proof of your visa and/or passport by the finalist deadline before TopCoder will book a flight for you.  If you do not have your visa and/or passport by the appropriate date, you will be disqualified as a finalist.   Please revisit the tournament rules for more information or email <A href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</A>.</b>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
