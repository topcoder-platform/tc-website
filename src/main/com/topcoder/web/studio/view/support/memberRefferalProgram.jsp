<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="Overview of the Member Referral Program and how to start competing in graphic and web design competitions at TopCoder Studio" />
    <meta name="keywords" content="topcoder, studio, graphic competitions, graphic design contests, graphic design, web design, logo, contests, compete, prizes, cash, clients" />
    <title>TopCoder Studio | Member Referral Program</title>

     <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="howitworks" />
            </jsp:include>
        <br />
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                        
                        <div style="padding: 10px 0 20px 0;">
                          <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted">Overview</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=whyJoin">Why Join</a>
                        | Member Referral Program
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=newMemberFaqs">New Member FAQs</a>
                        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=startingACompetition">Starting a Competition</a>
                        </div>
        
                        
                        <div align="center">
                            <img alt="Member Referral Program" src="/i/v4/member-referral.jpg"/>
                        </div>
                        <h2>Member Referral Program</h2>
                        <p><strong>
                        Refer friends to Studio and you can receive a bonus every time your friend wins for the first year of their membership!
                        </strong></p>
                        <p>
                        The TopCoder Referral Program is designed to increase the number of top-performing coders who participate in TopCoder and Studio competitions, and to reward the TopCoder members who spread the word.
                        </p>

                        <p>
                        <strong>Example #1</strong>
                        You refer 3 new members. During the next 12 months, each of the 3 members you referred wins $500 in component and Studio competitions, totaling $1,500 in prize money awarded. You will receive a commission of $150.
                        </p>
                        <p>
                        <strong>Example #2</strong>
                        You refer a new member who wins one of the grand prizes of $25,000 in the TopCoder Open. You will receive $2,500!
                        </p>
                        
                        <h3>How it works</h3>
                        <p>
                        On the <a href="http://www.topcoder.com/reg/">new member registration page</a>, there is a "Referring Member" field. If you tell a fellow designer to register with TopCoder, ask him or her to provide your TopCoder username in the "Referring Member" field.
                        </p>
                        <p>
                        The referring member (you) will receive a referral commission equal to 10% of any amounts earned or won by the referred member during the 12 months following registration.
                        </p>
                        
                        <h3>Official Rules</h3>
                        <p>
                        Any eligible TopCoder member whose TopCoder username was provided in the "Referring Member" field of the TopCoder registration process will be placed into the Referral Program.
                        </p>
                        <p>TopCoder will pay a referral commission equal to 10% of any amount earned or won by a referred member during the 365-day period following the initial registration date of the referred member.
                        </p>
                        <p>
                        No additional referral compensation will be paid for a referred member's winnings following the one-year anniversary of the referred member's registration. 
                        </p>
                        <p>
                        To receive a referral commission, the TopCoder member must be 18 years of age or older and must not have been permanently suspended from participating in TopCoder competitions. Payment is contingent upon TopCoder receiving a completed affidavit of eligibility, verifying the member's eligibility to participate in the Referral Program, and a completed appropriate tax form. 
                        </p>
                        <p>
                        The "Referring Member" field in the registration may not be changed once the registration process has been completed. 
                        </p>
                        <p>
                        TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice people to register and participate at TopCoder. Sending such unsolicited emails may lead to your termination from the TopCoder Referral Program. 
                        </p>
                        <p>
                        TopCoder reserves the right to modify or cancel the TopCoder Referral Program at any time for any reason. TopCoder also reserves the right to disqualify any TopCoder member from the TopCoder Referral Program at any time for any reason.
                        </p>

                        
                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
