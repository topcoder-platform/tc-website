<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows studio track advancers summary page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Studio Competition</title>

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
                        <jsp:param name="mainTab" value="studio"/>
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
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="advancers"/>
                                                <jsp:param name="tertiaryTab" value="summary"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Congratulations to djnapier!</h2>
                                                                <p><img src="/i/tournament/tco09/winners/tco09-winner-studio.png" alt="TCO09 Studio Champion" /></p>
                                                                <p>
                                                              <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                  <tr>
                                                                      <th class="first">&nbsp;</th>
                                                                   	  <th colspan="2">Congratulations Studio Design Winners!</th>
                                                                      <th class="last">&nbsp;</th>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText"><strong>Champion</strong></td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=djnapier" target="_blank">djnapier</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">2nd Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=oninkxronda" target="_blank">oninkxronda</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">3rd Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=djackmania" target="_blank">djackmania</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">4th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=mahestro" target="_blank">mahestro</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">5th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=Tricia_Tjia" target="_blank">Tricia_Tjia</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">6th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=abedavera" target="_blank">abedavera</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">7th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=sweetpea" target="_blank">sweetpea</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">8th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=oton" target="_blank">oton</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">9th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=Elizabethhee" target="_blank">Elizabethhee</a></td>
                                                               	    <td class="last">&nbsp;</td>
                                                                  </tr>
                                                                  <tr>
                                                                   	  <td class="first">&nbsp;</td>
                                                                   	  <td class="first last alignText">10th Place</td>
                                                                   	  <td class="first last alignText"><a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=foxyhu" target="_blank">foxyhu</a></td>
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
