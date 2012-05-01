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
                <img src="/i/sponsor/citi/citi_topcoder_SRM2-4.jpg"
                    border="0" alt="Citi" />
                <br />
                <br />
                        <table width="600">
                            <tr>
                                <td>
                                    To remain competitive in our industry, we are in need of individuals that are capable of
                                    taking us to the next level. If you are a skilled engineer, mathematician, problem
                                    solver extraordinaire, then we would like to talk to you.<br>
                                    <br>
                                    Citi is a global company with several opportunities in our Capital Markets division
                                    in locations all around the world. We deal in complex financial algorithms and
                                    are constantly pushing the limits of our systems to gain the extra edge that keeps the
                                    competitors in our rear view mirror. The capital markets are lightning fast and
                                    we must consistently provide solutions that can keep pace.
                                    <br>
                                    <br>
                                    Some of the things that we do and value at Citi:<br>
                                    <center>
                                        <table cellpadding="8" cellspacing="0" style="padding-left: 20px; width: 100%; background: white url('/i/sponsor/citi/bg_text.gif')">
                                            <tr>
                                                <td valign="top">
                                                    <img src="/i/sponsor/citi/icon_technology.jpg" />
                                                </td>
                                                <td valign="top" style="padding: 10px 8px 5px 10px">
                                                    <span style="color: #666666; font-size: 12pt; font-weight: bold">Technology</span><br>
                                                    Building the next generation of High Frequency Trading technology
                                                    <br />
                                                    Using machine learning algorithms to analyze historical trading patterns<br />
                                                    Employing grid systems for processing massive amounts of financial data
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <img src="/i/sponsor/citi/icon_culture.jpg" />
                                                </td>
                                                <td valign="top" style="padding: 10px 8px 5px 10px">
                                                    <span style="color: #666666; font-size: 12pt; font-weight: bold">Culture</span><br>
                                                    Embracing the diversity of our global work force
                                                    <br />
                                                    Fostering an environment that encourages creative solutions through meritocracy
                                                    <br />
                                                    Engaging in conduct that is transparent, prudent, and dependable
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <img src="/i/sponsor/citi/icon_community.jpg" />
                                                </td>
                                                <td valign="top" style="padding: 10px 8px 5px 10px">
                                                    <span style="color: #666666; font-size: 12pt; font-weight: bold">Community</span><br>
                                                    Directing $50 Billion over 10 years to initiatives that help mitigate climate change<br />
                                                    Supporting the microfinance sector in more than 40 countries around the world
                                                    <br />
                                                    Committing more than $121 Million in total philanthropic giving in 2011<br />
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                        
                                    </center>
                                    <b>Come and be a part of a team committed to being the best players on the streets.</b><br /><br />
                                    <table cellspacing="0" cellpadding="0" style="border-top: #cccccc 2px dotted; border-bottom: #cccccc 2px dotted">
                                        <tr>
                                            <td valign="top">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="center">
                                                We will be sponsoring a single round match on <a href="http://community.topcoder.com/tc?module=MatchDetails&rd=14732">
                                                    April 11, 2012</a> so join us in the Competition Arena for a chat session to
                                                discuss our exciting career opportunities. Learn more about TopCoder SRMs <a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Overview">
                                                    here</a>. </p>
                                                <p>
                                                    For more information about Citi, please visit us at <a href="http://www.citigroup.com">www.citigroup.com</a>.<br>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                    <p>
                                        <a href="/tc?module=JobHit&jid=519&jt=1" class="button" style="width: 70px;">Apply Now</a>
                                    </p>
                                    <p>&nbsp;</p>
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