<?xml version="1.0" encoding="utf-8"?>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="processorDefaultsKey" value="<%=BaseProcessor.DEFAULTS_KEY%>"/>
<c:set var="memberProfileKey" value="<%=Constants.MEMBER_PROFILE%>"/>
<c:set var="processorDefaults" value="${requestScope[processorDefaultsKey]}"/>
<c:set var="profile" value="${processorDefaults[memberProfileKey]}"/>
<c:set var="stats" value="${profile.statistics}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
         <title>TopCoder Studio : Studio Profile</title>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_studio_profile"/>
        </jsp:include>
        
        <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
        <script type="text/javascript">
                $(document).ready(function(){
                    //Run the script to preload images from CSS
                    $.preloadCssImages(); 
                });
        </script>
        <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
        <script type="text/javascript" src="/js/jcarousel/jquery.jcarousel.pack.js"></script>
        
        <script type="text/javascript">
            // carousel
            jQuery(document).ready(function() {
                    jQuery('#mycarousel').jcarousel({
                });
            });
            
            // stats management
            var currentTab = -1;

            var typeIds = new Array();
            typeIds[0] = "overall";
            <c:forEach items="${stats}" var="stat" varStatus="index">
                typeIds[${index.index}+1] = ${stat.value.contestType.id};
            </c:forEach>

            var statistics = new Object();
            var overall = new Object();
            for (var i=1; i<8; i++) {
                overall["stat" + i] = 0;
            }
            overall.contestsWithSubmissions = 0;
            <c:forEach items="${stats}" var="stat" varStatus="index">
                statistics.s${stat.value.contestType.id} = new Object();
                statistics.s${stat.value.contestType.id}.stat1 = ${stat.value.contestsRegistered};
                statistics.s${stat.value.contestType.id}.stat2 = ${stat.value.numberOfSubmissions};
                statistics.s${stat.value.contestType.id}.stat3 = ${stat.value.submissionPercentage};
                statistics.s${stat.value.contestType.id}.stat4 = ${stat.value.submissionPassedScreening};
                statistics.s${stat.value.contestType.id}.stat5 = ${stat.value.passedScreeningPercentage};
                statistics.s${stat.value.contestType.id}.stat6 = ${stat.value.numberOfWins};
                statistics.s${stat.value.contestType.id}.stat7 = ${stat.value.winPercentage};
                
                overall.stat1 += ${stat.value.contestsRegistered}
                overall.stat2 += ${stat.value.numberOfSubmissions};
                overall.contestsWithSubmissions += Math.round(${stat.value.contestsRegistered} * (${stat.value.submissionPercentage} / 100));
                overall.stat4 += ${stat.value.submissionPassedScreening};
                overall.stat6 += ${stat.value.numberOfWins};
            </c:forEach>
            if (overall.stat1 > 0) {
                overall.stat3 = Math.round((overall.contestsWithSubmissions / overall.stat1) * 100);
            }
            if (overall.stat2 > 0) {
                overall.stat5 = Math.round((overall.stat4 / overall.stat2) * 100);
                overall.stat7 = Math.round((overall.stat6 / overall.stat2) * 100);
            }
            statistics["soverall"] = overall;

            function selectType(index) {
                if (index < typeIds.length) {
                    var typeId = typeIds[index];
                    updateStat(typeId, 1, '');
                    updateStat(typeId, 2, '');
                    updateStat(typeId, 3, '%');
                    updateStat(typeId, 4, '');
                    updateStat(typeId, 5, '%');
                    updateStat(typeId, 6, '');
                    updateStat(typeId, 7, '%');
                    if (currentTab > 0) {
                        document.getElementById('carouselItem' + currentTab).className = 
                            document.getElementById('carouselItem' + currentTab).className + "active";
                    }
                    currentTab = index;
                    if (currentTab > 0) {
                        document.getElementById('carouselItem' + index).className = 
                            document.getElementById('carouselItem' + index).className + " active";
                    }
                }
            }

            function updateStat(typeId, index, appendix) {
                var stats = statistics['s' + typeId];
                var stat = document.getElementById('stat' + index);
                if (stat != null) {
                    clearElement(stat);
                    stat.appendChild(document.createTextNode('' + stats['stat' + index] + appendix));
                }
            }

            function clearElement(element) {
                while (element.firstChild) {
                    element.removeChild(element.firstChild);
                }
            }
        </script>
        
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
<body onload="selectType(0)">
    <div id="page-wrap">
        <div align="center">
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="profile" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content"><div class="contentTop"><div class="contentMiddle"><div class="container">
                <!-- member search input -->
                <div class="box">
                    <div class="member_search">
                        <form action="/" method="get" name="SearchProfileForm" id="SearchProfileForm">
                        <input type="hidden" name="module" value="ViewMemberProfile"/>
                            <span>Member Handle:</span>
                            <input type="text" name="<%=Constants.HANDLE%>" value="Handle:" onblur="if(this.value=='')this.value='Handle:';" onfocus="if(this.value=='Handle:')this.value='';"/>
                            <a href="#" onclick="document.SearchProfileForm.submit();return false;"><img src="/i/profile/btnSearch.png" alt="Search" /></a>
                        </form>
                    </div> <!-- member_search -->
                </div> <!-- box -->

                <!-- member profile -->
                <div class="box">
                    <div class="box_title">
                        <img src="/i/profile/member-profile-title.png" alt="Member Profile" />
                    </div> <!-- box_title -->
                
                    <div class="box_content">
                        <div class="box_title_separator"></div>

                        <div class="box_content_container">
                          <c:if test="${profile ne null}">
                            <div class="member_image">
                                <img src="${profile.imageUrl}" alt="" width="126" height="140" />
                           </div>
                            <div class="member_content">
                                <div>
                                    <span class="member_content special handle">${profile.handle}</span>
                                </div>
                                <div>
                                    <span class="member_content special">Member since:</span>
                                    <span class="member_content">
                                        <fmt:formatDate value="${profile.memberSince}" pattern="yyyy"/>
                                    </span>
                                </div>
                                <div>

                                  <c:if test="${not empty profile.quote}">
                                    <span class="member_content special">Quote:</span>
                                    <span class="member_content">&quot;${profile.quote}&quot;</span>
                                  </c:if>
                                </div>

                            </div> <!-- member_content -->

                            <div class="clear"></div>
                          </c:if>
                          <c:if test="${profile eq null}">
                            <div class="memberNotFound"><span class="memberNotFound">Member not found</span></div>
                          </c:if>
                        </div> <!-- box_content_container -->

                    </div> <!-- box_content -->

                    <div class="box_bottom"></div>

                </div> <!-- box -->

<!--
              <c:if test="${profile ne null}">
                <!-- stats -->
                <div class="box">
                    <div class="box_title">
                        <img src="/i/profile/member-stats-title.png" alt="Member Stats" />
                    </div> <!-- box_title -->
                    

                    <div class="box_content">
                        <div class="box_title_separator"></div>

                        <div class="box_content_container">

                          <c:if test="${empty stats}">
                            <div class="notCompeted"><span class="notCompeted">Member has not competed in TopCoder Studio.</span></div>
                          </c:if>
                          <c:if test="${not empty stats}">
                            <div class="stats_description">
                                <a href="#" onclick="selectType(0);return false;" >
                                  <img src="/i/profile/btnViewStats.png" alt="View Overall Stats"/>
                                </a>
                                <span class="member_stats">Contest Participation.</span><br />
                                <span class="member_stats_intro">Please choose a contest type below to see the individual stats.</span>
                                <div class="clear"></div>
                            </div>

                            <div class="carousel">
                                <ul id="mycarousel" class="jcarousel-skin-stats">
                                    <c:forEach items="${stats}" var="stat" varStatus="index">
                                        <li id="li${index.index + 1}"><div id="carouselItem${index.index + 1}" class="carousel-item">
                                            <a href="#" onclick="selectType(${index.index + 1});return false;">${stat.value.contestType.description}</a>
                                        </div></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="clear">&nbsp;</div>
                            <div class="stats_content">
                                <div class="column spacing">&nbsp;</div> <!-- for ie 6 -->
                                <div class="column left">
                                    <div>
                                        <span class="member_content special">Contests Registered: </span>
                                        <span id="stat1" class="member_content"></span>
                                    </div>
                                    <div>
                                        <span class="member_content special">Number of Wins:</span>
                                        <span id="stat6" class="member_content"></span>
                                    </div>
                                    <div>
                                        <span class="member_content special">Win Percentage:</span>
                                        <span id="stat7" class="member_content"></span>
                                    </div>
                                </div>
                                <div class="column right">
                                    <div>
                                        <span class="member_content special">Number of Submissions:</span>
                                        <span id="stat2" class="member_content"></span>
                                    </div>
                                    <div>
                                        <span class="member_content special">Submission Percentage:</span>
                                        <span id="stat3" class="member_content"></span>
                                    </div>
                                    <div>
                                        <span class="member_content special">Submissions that Passed Screening:</span>
                                        <span id="stat4" class="member_content"></span>
                                    </div>
                                    <div>
                                        <span class="member_content special">Passed Screening Percentage:</span>
                                        <span id="stat5" class="member_content"></span>
                                    </div>
                                </div>                          
                                <div class="clear">&nbsp;</div>
                            </div> <!-- stats content -->
                          </c:if>                          
                        </div> <!-- box_content_container -->
                    </div> <!-- box_content -->
                    
                    <div class="box_bottom">&nbsp;</div>
                    
                </div> <!-- box -->
              </c:if>
-->              
                </div><!-- container -->
                </div><!-- content middle -->
                
               </div><!-- content top -->
            </div> <!-- content -->
       

        <jsp:include page="foot.jsp"/>
   
    
</body>
</html>

