<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Computer Programming Tournament</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
  <jsp:param name="isSponsorPage" value="true"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="tourny"/>
                <jsp:param name="level2" value="pr"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">Tournaments - Public Relations</h2>

                        <p>Public relations is a key component of all tournament marketing. Outreach for every tournament 
                        begins immediately following the signing of a sponsor.</p>
                        
                        <p>TopCoder has received a significant amount of media coverage surrounding each of the two tournaments 
                        held to date. In addition to the releases sent out, media from around the country, including television 
                        stations, have run editorials on TopCoder, the membership, semifinalists and champions, and the 
                        business model in general.</p>
                        
                        <p>See our complete list of <a href="http://www.topcoder.com/index?t=news_events&amp;c=index" class="bodyText">press releases</a> 
                        and <a href="http://www.topcoder.com/index?t=news_events&amp;c=articles" class="bodyText">articles</a> to date.</p>
                    
                        <p>Following is a sample from the 2002 Collegiate Challenge.</p>
                        
                        <div align="center">
                        <table width="75%" border="0" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
                            <tr>
                                <td width="50%" class="bodyText" bgcolor="#CCCCCC"><strong>Focus:</strong></td>
                                <td width="50%" class="bodyText" bgcolor="#CCCCCC"><strong>Distribution:</strong></td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Announce sponsoring company</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Top 10 Schools</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Kickoff</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Regional Championship Results</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire<br/>
                                    Individual Campuses</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Semfinal/Championship Announcement</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Semifinal Results</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire<br/>
                                    Individual Campuses</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Semifinal Results "Final Four"</td>
                                <td class="bodyText" bgcolor="#FFFFFF">PRNewswire<br/>
                                    CollegeWire<br/>
                                    Individual Campuses</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Championship Results</td>
                                <td class="bodyText" bgcolor="#FFFFFF">Photo/Caption for AP1000</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Championship Results</td>
                                <td class="bodyText" bgcolor="#FFFFFF">Broadcast VNR</td>
                            </tr>
                    
                            <tr valign="top">
                                <td class="bodyText" bgcolor="#FFFFFF">Tournament Wrapup</td>
                                <td class="bodyText" bgcolor="#FFFFFF">Broadcast VNR<br/>
                                    Campus Promotion<br/>
                                    TopCoder.com<br/></td>
                            </tr>
                        </table>
                        </div>
                                                
                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">What is the SRM Program?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../includes/right.jsp">
                        <jsp:param name="level1" value="tourny"/>
                        <jsp:param name="level2" value="pr"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
