<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Powered by TopCoder Events</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="pbtc_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center">
   <div style="width: 550px; text-align: left; margin: 0px 15px 0px 15px;">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="tc_pbtc"/>
    </jsp:include>

<%-- Current Tournaments begins --%>

         <div class="sectionHeader">Current</div>
         
           <hr width="100%" size="1" noshade="noshade" />
         
           <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://topcoder.com/home/alcatel/web-mashup-challenge/' refer='pbtc page' />" target="_blank"><img src="/i/events/alcatel-web-mashup.png" alt="Alcatel-Lucent WEb Mashup Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Alcatel-Lucent Web Mashup Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        September 24 - October 12, 2010 <br />
                        <A href="<tc-webtag:linkTracking link='http://topcoder.com/home/alcatel/web-mashup-challenge/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
           <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://topcoder.com/home/alcatel/100-apps-in-100-days/' refer='pbtc page' />" target="_blank"><img src="/i/events/alcatel-100-apps.png" alt="Alcatel-Lucent 100 Apps in 100 Days" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Alcatel-Lucent 100 Apps in 100 Days </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        September - December 2010 <br />
                        <A href="<tc-webtag:linkTracking link='http://topcoder.com/home/alcatel/100-apps-in-100-days/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
           <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://topcoder.com/home/x/' refer='pbtc page' />" target="_blank"><img src="/i/events/paypal-x.png" alt="PayPal X Powered by topCoder" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>PayPal X Powered by TopCoder</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        Started August 2010 <br />
                        <A href="<tc-webtag:linkTracking link='http://topcoder.com/home/x/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            <br><br>

<%-- Past Tournaments begins --%>

         <div class="sectionHeader" width="100%">Past</div>
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='tc?module=Static&d1=sponsors&d2=NSAOverview' refer='pbtc page' />" target="_blank"><img src="/i/sponsor/nsa/nsa-mm-banner-small.png" alt="NSA Marathon Match Event" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>NSA Marathon Match Event </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        September - December 2009 <br />
                        <A href="<tc-webtag:linkTracking link='tc?module=Static&d1=sponsors&d2=NSAOverview' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
           <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://topcoder.com/home/remixchallenge/' refer='pbtc page' />" target="_blank"><img src="/i/events/bby-remix-logo.png" alt="Best Buy REMIX Challenge" border="0" /></A></td>
                  <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Best Buy REMIX Challenge </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        2009<br />
                        <A href="<tc-webtag:linkTracking link='http://topcoder.com/home/remixchallenge/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
           <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=sponsors&d2=NVIDIAOverview' refer='pbtc page' />" target="_blank"><img src="/i/events/nvidia_logo-sm.jpg" alt="NVIDIA CUDA Superhero Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>NVIDIA CUDA Superhero Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        September - December 2009 <br />
                        <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=sponsors&d2=NVIDIAOverview' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
           <hr width="100%" size="1" noshade="noshade" />

         
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://killerappchallenge.ribbit.com/' refer='pbtc page' />" target="_blank"><img src="/i/events/ribbit-killer-app-logo.png" alt="Ribbit Killer App Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Ribbit Killer App Challenge </strong></font></td>
             </tr>
                <tr valign="top">
                    <td class="bodyText">
                        11/17/2008 - 3/12/2009 <br />
                        <A href="<tc-webtag:linkTracking link='http://killerappchallenge.ribbit.com/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
           
           <hr width="100%" size="1" noshade="noshade" />
           
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://sensations.aol.com/' refer='pbtc page' />" target="_blank"><img src="/i/events/aol-sensations-logo.png" alt="AOL/TopCoder Sensations Developer Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>AOL/TopCoder Sensations Developer Challenge </strong></font></td>
             </tr>
                <tr valign="top">
                    <td class="bodyText">
                        January 2009 - June 2009 <br />
                        <A href="<tc-webtag:linkTracking link='http://sensations.aol.com/' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
           
           <hr width="100%" size="1" noshade="noshade" />
           
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://winningformula.espn.com/?module=ViewStandings' refer='pbtc page' />" target="_blank"><img src="/i/events/espn-winning-formula-logo.png" alt="ESPN Winning Formula Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>ESPN Winning Formula Challenge</strong></font></td>
             </tr>
                <tr valign="top">
                    <td class="bodyText">
                        July - December 2008 <br />
                        <A href="<tc-webtag:linkTracking link='http://winningformula.espn.com/?module=ViewStandings' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
           
           <hr width="100%" size="1" noshade="noshade" />
           
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='/threadfest' refer='pbtc page' />" target="_blank"><img src="/i/events/amdMCT_logo.png" alt="AMD Multicore Threadfest" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>AMD Multicore Threadfest</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        2008<br />
                        <A href="<tc-webtag:linkTracking link='/threadfest' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
           
           <hr width="100%" size="1" noshade="noshade" />
           
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='/truveo' refer='pbtc page' />" target="_blank"><img src="/i/events/truveo_logo.png" alt="Truveo Developer Challenge" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Truveo Developer Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        May 13 - July 21, 2008<br />
                        <A href="<tc-webtag:linkTracking link='/truveo' refer='pbtc page' />" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
                <hr width="100%" size="1" noshade="noshade" />
                
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr valign="top">
                   <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='/openaim/' refer='pbtc page' />" target="_blank"><img src="/i/events/openaim.jpg" alt="Open Aim Developer Challenge" border="0" /></A></td>
                   <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                   <td width="99%" class="bodyText"><font size="3"><strong>Open AIM Developer Challenge</strong></font></td>
               </tr>
               <tr valign="top">
                   <td class="bodyText">
                       March 5 - May 6, 2008<br />
                       <A href="<tc-webtag:linkTracking link='/openaim/' refer='pbtc page' />" target="_blank">Summary</A>
                   </td>
               </tr>
           </table>
           
                <hr width="100%" size="1" noshade="noshade" />
           
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
               <tr valign="top">
                   <td width="274" rowspan="2"><A href="<tc-webtag:linkTracking link='http://csf.topcoder.com/' refer='pbtc page' />" target="_blank"><img src="/i/events/csfLogo.png" alt="Microsoft Connected Services Framework Competition Series" border="0" /></A></td>
                   <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                   <td width="99%" class="bodyText"><font size="3"><strong>Microsoft Connected Services Framework Competition Series</strong></font></td>
               </tr>
               <tr valign="top">
                   <td class="bodyText">
                       March 6, 2007 -<br />
                       <A href="<tc-webtag:linkTracking link='http://csf.topcoder.com/' refer='pbtc page' />" target="_blank">Summary</A>
                   </td>
               </tr>
           </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=gcjsa07&d2=overview" target="_blank"><img src="/i/events/gcjla07.gif" alt="GCJLA" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam Latin America 2007</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 1, 2007<br />
                        Belo Horizonte, Brazil<br/>
                        <A href="/pl/?module=Static&d1=gcjsa07&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=google06&d2=overview" target="_blank"><img src="/i/events/gcj06.gif" alt="GCJ06" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam 2006</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        October 27, 2006<br />
                        New York City, NY, USA<br/>
                        <A href="/pl/?module=Static&d1=google06&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />
         
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=gecj06&d2=overview" target="_blank"><img src="/i/events/gecj06.gif" alt="GCJE" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam Europe</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 29, 2006<br />
                        Dublin, Ireland<br/>
                        <A href="/pl/?module=Static&d1=gecj06&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />
         
           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=gicj06&d2=overview" target="_blank"><img src="/i/events/gicj06.gif" alt="GCJI" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam India</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        April 7, 2006<br />
                        Bangalore, India<br/>
                        <A href="/pl/?module=Static&d1=gicj06&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>
            
                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=gccj05&d2=ZH_overview" target="_blank"><img src="/i/events/gcjc05.gif" alt="GCJC" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam China</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        January 20, 2006<br />
                        <A href="/pl/?module=Static&d1=gccj05&d2=ZH_overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google05&d2=overview" target="_blank"><img src="/i/events/gcj05.gif" alt="GCJ 05" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google Code Jam 2005</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        September 23, 2005<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google05&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank"><img src="/i/events/2005javaone_logo.gif" alt="2005 JavaOne" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2005 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 27-29, 2005<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?&module=Static&d1=javaone05&d2=overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=gicj05&d2=overview" target="_blank"><img src="/i/events/gicj05/index_logo.gif" alt="GICJ05" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; India Code Jam 2005</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 26th, 2005<br />
                        Bangalore, India<br/>
                        <A href="/pl/?&module=Static&d1=gicj05&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=doubleclick05&d2=overview" target="_blank"><img src="/i/events/doubleclick05/index_dccc05.gif" alt="DCCC05" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>DoubleClick&#153; 2005 Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 2, 2005<br />
                        DoubleClick Headquarters<br/>
                        New York<br/>
                        <A href="/pl/?&module=Static&d1=doubleclick05&d2=overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google04&d2=overview" target="_blank"><img src="/i/events/google2004/indexLogo.gif" alt="2003 GECC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; Code Jam 2004 </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        October 15th, 2004<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google04&d2=overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=javaone04&d2=javaone_overview" target="_blank"><img src="/i/events/2004javaone_logo.gif" alt="2004 JavaOne" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2004 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 28-30, 2004<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?&module=Static&d1=javaone04&d2=javaone_overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" target="_blank"><img src="/i/events/doubleclick/index_dccc.gif" alt="DCCC" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>DoubleClick&#153; 2004 Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        February 27, 2004<br />
                        DoubleClick Headquarters<br/>
                        New York<br/>
                        <A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" target="_blank">Details</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=google&d2=google_overview" target="_blank"><img src="/i/events/google2003/index_google.gif" alt="2003 GECC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Google&#153; Code Jam 2003 </strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 14, 2003<br />
                        Google headquarters<br/>
                        Mountain View, California<br />
                        <A href="/pl/?&module=Static&d1=google&d2=google_overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" target="_blank"><img src="/i/events/verizon2003/index_verizon.gif" alt="Verizon" width="274" height="100" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>Verizon&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 7, 2003<br />
                        Verizon Chennai Facility<br/>
                        Chennai, India<br />
                        <A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" target="_blank">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=javaone03&d2=summary"><img src="/i/events/index_2003javaone.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2003 Javaone&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        June 10-12, 2003<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?module=Static&d1=javaone03&d2=summary">Summary</A>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/pl/?module=Static&d1=javaone02&d2=summary"><img src="/i/events/index_2002sunnetwork.gif" alt="2003 TCCC" width="274" height="66" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText"><font size="3"><strong>2002 SunNetwork&#153; Coding Challenge</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        Sept 18-20, 2002<br />
                        Moscone Convention Center<br/>
                        San Francisco, California<br />
                        <A href="/pl/?module=Static&d1=javaone02&d2=summary">Summary</A>
                    </td>
                </tr>
            </table>

   <br><br>
   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
