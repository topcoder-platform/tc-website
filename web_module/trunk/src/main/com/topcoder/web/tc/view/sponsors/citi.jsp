<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsor</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value=""/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%" align="center">


    <center>
        <div style="padding: 15px; text-align: left">
            <center>
                <table style="width: 650px">
                    <tr>
                        <td>
                            <img src="/i/sponsor/citi/logo_citi.png"
                                alt="Cici" />
                        </td>
                    </tr>
                </table>
                <br />
                <img src="/i/sponsor/citi/citi_topcoder_banner.jpg" border="0" alt="Citi" />
                <br />
                <br />
                <table width="600">
                    <tr>
                        <td>
                            To remain a world leader in financial services, we are looking for <span style="font-weight: bold;
                                color: #B34444;">talented</span> individuals who have the innate ability to identify
                            creative ideas and solutions that will further <span style="font-weight: bold; color: #023C59;">
                                advance innovation at Citi</span>.
                            <br />
                            <br />
                            Being one of the largest financial institutions in the world, we provide excellent
                            career prospects in key global locations such as <span style="font-weight: bold; color: #023C59;">
                                London, Toronto, New York, Singapore, and Tokyo.</span>
                            <br />
                            <br />
                            At Citi, you will be given the <span style="font-weight: bold; color: #B34444;">opportunity
                                to demonstrate your talent </span>in a fast moving and dynamic environment.<br />
                            <br />
                            <table cellpadding="0" cellspacing="0" style="width: 90%; background: white url('/i/sponsor/citi/bg_text.gif')">
                                <tr>
                                    <td valign="top" style="padding: 10px 8px 5px 10px">
                                        <img src="/i/sponsor/citi/icon_development.png" align="right" />
                                        <span style="font-family: Verdana; font-size: 13px; color: #1f5cae; font-weight: bold">
                                            We are looking for individuals who are passionate about: </span>
                                        <br />
                                        <ul style="line-height: 11px">
                                            <li style="margin-left:15px">Bringing innovative ideas to market</li>
                                            <li style="margin-left:15px">Providing elegant solutions to highly complex problems</li>
                                            <li style="margin-left:15px">Leveraging technology to deliver high impact results</li>
                                            <li style="margin-left:15px">Working alongside some of the best minds in the industry</li>
                                        </ul>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; height: 1px; background: #cccccc">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 35px; background: white" valign="middle">
                                        <p>
                                            Citi will be sponsoring two single round matches on <a href="http://community.topcoder.com/tc?module=MatchDetails&rd=14730">March 17</a> and
                                            <a href="http://community.topcoder.com/tc?module=MatchDetails&rd=14732">April 11</a>, 2012 so join them in the Competition Arena for chat sessions to discuss their exciting career opportunities.
                                            Learn more about TopCoder SRMs <a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Overview">here</a>.
                                        </p>
                                        <p>
                                            For more information, please visit us at <a href="http://www.citigroup.com">www.citigroup.com</a>.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%; height: 1px; background: #cccccc">
                                    </td>
                                </tr>
                            </table>
                            <p>
                                <a href="/tc?module=JobHit&jid=519&jt=1" class="button" style="width: 70px;">Apply Now</a>
                            </p>
                            <p>
                                &nbsp;
                            </p>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </center>



</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>