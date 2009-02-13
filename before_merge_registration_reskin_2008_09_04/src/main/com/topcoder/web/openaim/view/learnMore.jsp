<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="openaimTop.jsp"/>

                <div class="contentWithLeft" align="right">
                    <div class="contentTexture">
                        <jsp:include page="leftBox.jsp"/>
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxHalf">

    
<div align="center" style="margin: 10px 0 20px 0;">
    <img src="/i/events/openaim/openaim_logo_white.png" alt="Open AIM Developer Challenge, Powered by TopCoder" />
</div>

<p align="center">
<span style="font-weight:bold; font-size: 16px;">$100,000 in prize money</span>
<br />March 5th through May 6th, 2008
<br />Winners to be announced at the TopCoder Open
<br />in Las Vegas on May 15
</p>

<p>
    To mark the launch of Open AIM 2.0, AOL has teamed up with TopCoder to put the Open AIM APIs in the hands of the best developers in the world. Now's your chance to show us what you've got for a piece of $100,000 in prize money!
</p>
<p>
    We will award nine (9) $10,000 prizes and twenty (20) $500 prizes for the most creative, successful and ingenious submissions - plus we'll give a TopCoder/Open AIM T-Shirt to anyone who submits. Winning submissions will also be featured on the <a href="http://dev.aol.com">AOL Developer Network Homepage</a> and <a href="http://gallery.aim.com/">gallery.aim.com</a>. We'll put your app within the reach of millions of AIM users.
</p>
<%--
<p>
    Additionally, Open AIM will give participants an easy way to generate income through AIM Money, a new advertising revenue sharing platform expected to debut in April. 
</p>
--%>
<%--
<p align="center">
    <a href="">Read the AOL/TopCoder announcement</a>
</p>
--%>

<h2>How to Compete</h2>
<p>
    Be sure to read the full contest <a href="${sessionInfo.servletPath}?module=Static&amp;d1=rules">rules and terms & conditions</a>.
</p>
<p>
    <a href="/reg/?module=Main&amp;rt=8">Register as a TopCoder member</a> THEN <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;ct=1001">register for the Open AIM Developer Challenge</a>.
</p>
<p>
    Check out the APIs at <a href="http://dev.aol.com/apis">dev.aol.com</a> and get a <a href="http://dev.aol.com/openAIM">usage key</a> - your unique identifier giving you access to the AIM network. The keys let AOL know how popular your Plugin or Custom Client is.
</p>
<p align="center">
    <a href="http://developer.aim.com/faq#keys">Learn more about AIM keys</a>
</p>
<p>
    Then, build your mashup, widget, game or custom application and put it where we can see it. Upload it to the <a href="http://gallery.aim.com/">AIM Gallery</a>, put it on your own site or blog, or any one of the social network sites such as Facebook, MySpace, Friendster, BEBO, Cyworld, Skyblog, Hi5, Orkut, or Live Journal.
</p>
<p>
    Your application must incorporate at least two of the five most popular and valuable AIM features below into their web-based or downloadable AIM software and mashups. Developers have the flexibility to choose and match the value-added feature that best fits with their application and desired user experiences.
</p>

<ol>
    <li>An ad to appear alongside AIM</li>
    <li>AIM Toolbar</li>
    <li>AIM Expressions, including wallpapers and buddy icons</li>
    <li>Buddy Info</li>
    <li>Display AIM Dashboard (http://dashboard.aim.com) as start page at launch</li>
</ol>

<p>
    You may enter as many submissions as you like, but each application may only be submitted once.
</p>
<p align="center">
    <a href="${sessionInfo.servletPath}?module=Static&amp;d1=rules">Full Official Contest Rules and Terms & Conditions</a>
</p>

<h2>How to Submit</h2>

<p>
    Once your app is live, submit it to the contest here.
</p>

<p>
    You will need to submit a zip file to TopCoder which includes:
</p>

<ul>
<li>A text document containing:
    <ul>
    <li>Your TopCoder handle name</li>
    <li>Your AIM screename</li>
    <li>Your unique AIM API key</li>
    <li>A title and brief overview of the application to be used as an online description</li>
    <li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
    </ul>
</li>
<li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels).</li>
</ul>

<p>
    Submit early, then tell a friend - in fact, tell a hundred friends, because a large percentage of your score will depend on how many people use your app.
</p>

<p align="center">
    <a href="${sessionInfo.servletPath}?module=Static&amp;d1=rules">Full Official Contest Rules and Terms & Conditions</a>
</p>

<h2>How Your App will be Scored</h2>

<p>Submissions will be judged by the Competition judging team. Submissions will be evaluated using a scorecard that includes the following criteria: </p>

<ul>
<li><strong>Usage (20%):</strong> Usage will be determined based on usage statistics.  It is strictly prohibited to manufacture or attempt to manufacture usage in any way.  Usage and activity shall be subject to audit by TopCoder and/or AOL.</li>
<li><strong>Innovation (20%):</strong> Determined by the Competition judges</li>
<li><strong>Best Use of APIs (20%):</strong>  Best use of the functionality provided by the Specified Technology</li>
<li><strong>AOL favorite (20%):</strong> Popularity among AOL staff</li>
<li><strong>TopCoder Community Favorite (20%):</strong> Popularity among the TopCoder Community</li>
</ul>

<p align="center">
    <a href="${sessionInfo.servletPath}?module=Static&amp;d1=rules">Full Official Contest Rules and Terms & Conditions</a>
</p>

<h2>What You Can Build</h2>

<p>
    Anything!
</p>
<p>
    Key components of the new Open AIM 2.0 include:
</p>

<ul>
    <li><strong>Public Access to the OSCAR Protocol:</strong> As part of the new openness, AOL is publishing at http://dev.aol.com/openaim the OSCAR protocol, AOLs proprietary instant messaging and presence information protocol used by AIM. This will enable developers to build fully-compatible, full-featured and secure AIM services for use on platforms that also host other chat services both on the desktop and on mobile devices. Were also giving developers freedom of choice to connect to the AIM network using APIs in either AOL-provided libraries or open-source libraries.</li>
    <li><strong>Relaxed Usage Limits:</strong> Per-day and per-month usage limits have been removed to offer developers more flexibility. Users can now also use the new Open AIM SDK and APIs to build AIM chat services designed for international use.</li>
<%--
    <li><strong>Revenue Share:</strong> Developers will have an opportunity to earn advertising revenue through a new revenue share platform called AIM Money that is expected to launch next month. More details on this exciting new program are available at http://dev.aol.com/openaim.</li>
--%>
    <li><strong>Support for Third-Party Chat Services:</strong> Developers can use the Open AIM SDK and APIs to create one unified instant messaging application that supports multiple chat services so that users can organize all their buddies in one place.</li>
    <li><strong>Enterprise & Mobile Applications:</strong> Third-party developers can use the existing SDK and APIs to build custom software designed for enterprise use as well as for AIM users who access the messaging network from their cell phones. We have also put in place protections in our license agreements to ensure that mobile applications built on the AIM platform remain free and open in line with the Open AIM program goals.</li>
    <li><strong>Open-Source Opportunities:</strong> Open AIM APIs are now accessible for open-source software use.</li>
</ul>

<p align="center">
    <a href="${sessionInfo.servletPath}?module=Static&amp;d1=rules">Full Official Contest Rules and Terms & Conditions</a>
</p>



                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>