<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows moddash track advancers summary page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Mod Dash</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="moddash"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                                <jsp:param name="tertiaryTab" value="summary"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Congratulations to PE!</h2>
                                                                <p><img src="/i/tournament/tco09/winners/tco09-winner-moddash.png" alt="TCO09 Mod Dash Champion" /></p>
                                                                <p>
                                                              <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                  <tr>
                                                                      <th class="first">&nbsp;</th>
                                                                   	  <th colspan="2">Congratulations Mod Dash Winners!</th>
                                                                      <th class="last">&nbsp;</th>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText"><strong>Champion</strong></td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9998760" target="_blank">PE</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">2nd Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7545675" target="_blank">cucu</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">3rd Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22651137" target="_blank">Margarita</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">4th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=21932422" target="_blank">saarixx</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">5th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=20092786" target="_blank">enefem21</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">6th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15604762" target="_blank">Yeung</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">7th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7463987" target="_blank">ShindouHikaru</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">8th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22653962" target="_blank">will.xie</a></td>
                                                                   	  <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                </table>
                                                               </p>
                                                            </div>
                                                        </div>
                                                 </div>
                                                </div>       
                                                
                                                <jsp:include page="../../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../../footer.jsp"/>
</body>
</html>
