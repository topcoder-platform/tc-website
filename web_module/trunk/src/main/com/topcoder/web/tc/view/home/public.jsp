<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the public home page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${not empty isNewStyle && isNewStyle}">
        <!DOCTYPE HTML>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>topcoder</title>
            <jsp:include page="../script.jsp" />
            <jsp:include page="../style.jsp">
                <jsp:param name="key" value="tc_home"/>
            </jsp:include>
        </head>

        <body>

        <div id="wrapper">

        <jsp:include page="../top.jsp" />

        <div class="content">

        <div id="main">

        <article id="mainContent">
        <div class="container tc-index-container">

        <div class="grid-3">

        <div class="grid-b">

            <section class="top-brand">
                <h3>Top 10</h3>

                <div class="actions">
                    <ul>
                        <li class="first-item"><a href="javascript:;" class="active">Development</a></li>
                        <li><a href="javascript:;">Data Science</a></li>
                    </ul>
                </div>
                <div class="brand-container">
                    <jsp:include page="top_template.jsp" >
                        <jsp:param name="title" value="Assembly" />
                        <jsp:param name="name" value="top_assemblers" />
                        <jsp:param name="id" value="topAssembly" />
                        <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedAssemblers" />
                        <jsp:param name="ctxt" value="assembly" />
                    </jsp:include>

                    <jsp:include page="top_coders.jsp" />

                </div>
            </section>
            <!-- End .top-brand -->

        </div>
        <!-- End .grid-b -->

        <div class="grid-c">

            <%--
            <jsp:include page="big_promo.jsp" />
            --%>
            <!-- End .banner -->

            <div class="post-container">
                <section class="post postTemplate" style="display: none">
                    <h4><a href="javascript:;" class="title"></a></h4>

                    <div class="meta">
                        <div class="date"><span></span></div>
                        <div class="author">By : <span class="handle"></span></div>
                        <div class="category">In : <a href="javascript:;"></a></div>
                        <div class="clear"></div>
                    </div>
                    <div class="article">
                        <a href="javascript:;" class="figure"><img src="/i/thumbnail.png"
                                                                   alt=""/></a>

                        <div class="details">

                            <div class="more">
                                <a href="javascript:;" class="continue-reading">Continue reading</a>
                                <span class="share"><em>Share via:</em> <a class="ico-share email" href="javascript:;"></a><a class="ico-share facebook" href="javascript:;"></a><a class="ico-share twitter" href="javascript:;"></a><a class="ico-share google" href="javascript:;"></a></span>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </section>
            </div>
            <!-- End .post-container -->

            <%--<jsp:include page="news_archives.jsp" />--%>


        </div>
        <!-- End .grid-c -->

        <div class="clear"></div>

        </div>
        <!-- Gird 3 Column Layout -->

        </div>
        </article>
        <!-- End #mainContent -->

        </div>
        <!-- End #main -->

        </div>
        <!-- End .content -->


        <jsp:include page="../foot.jsp" />
        <!-- /#footer -->

        </div>
        <!-- End #wrapper -->

        </body>
        </html>

    </c:when>
    <c:otherwise>
    <html>
    <head>
        <meta http-equiv="X-UA-Compatible">
        <title>Programming Challenges, Software Development, and Employment Services at TopCoder</title>
        <link rel="stylesheet" href="http://www.topcoder.com/news/wp-content/themes/tc2/style.css" type="text/css" media="screen" />
        <jsp:include page="../script.jsp" />
        <jsp:include page="../style.jsp">
            <jsp:param name="key" value="tc_home"/>
        </jsp:include>
        <script type="text/javascript" src="/js/main.js"  ></script>
        <script type="text/javascript" src="/js/cookie.js"  ></script>
        <script type="text/javascript" src="/js/slashtc20080411.js"  ></script>
        <script src="/js/home/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            function swapTopTen(topTenID){
                currTopTen = document.getElementById(topTenID);
                hide('topTenAlgo');
                hide('topTenAlgoSchools');
                hide('topTenAlgoCountries');
                hide('topTenDes');
                hide('topTenDev');
                hide('topTenMM');
                hide('topTenConceptualization');
                hide('topTenSpecification');
                hide('topArchitecture');
                hide('topAssembly');
                hide('topTestSuites');
                showBlock(topTenID);
                createCookie('defaultTopTen',topTenID,365);
            }

            function init() {
                id = readCookie('defaultTopTen');
                if (id == null) id = 'topTenAlgo';

                for (var i = 0; i < document.f.topTen.length; i++) {
                    if (document.f.topTen.options[i].value == id) {
                        document.f.topTen.selectedIndex = i;
                        break;
                    }
                }

                swapTopTen(id);
            }
        </script>
    </head>

    <body onLoad="init();MM_preloadImages('/i/home/catcDigitalRunV2.png','/i/home/catcDesignV2.png','/i/home/catcDevelopmentV2.png','/i/home/catcAssemblyV2.png','/i/home/catcBugracesV2.png','/i/home/catcMarathonV2.png','/i/home/catcAlgorithmV2.png','/i/home/catcStudioV2.png')">

    <jsp:include page="../top.jsp" >
        <jsp:param name="level1" value=""/>
    </jsp:include>

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <!-- Left Column Begins-->
            <td width="180">
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="node" value="competition_home"/>
                </jsp:include>
                <jsp:include page="coder_of_month.jsp" />
            </td>
            <!-- Left Column Ends -->

            <!-- Gutter Begins -->
            <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt="" /></td>
            <!-- Gutter Ends -->

            <!-- Center Column Begins -->
            <td width="100%" align="center">
                <jsp:include page="big_promo.jsp" />
                <br /><br />
                <table border="0" cellspacing="0" cellpadding="0" width="525">
                    <tr>
                        <td class="newsTitle" align="right" colspan="2"><em>TopCoder News</em></td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div id="replaced">
                            </div>
                            <script type="text/javascript" language="javascript">

                                $(document).ready(function () { 
                                            $.get("/blog/", function (data) {
                                                $("#replaced").html($(data + '').find(".grid-2-3").html());
                                            });
                                        }
                                );

                            </script>
                        </td>
                    </tr>

                </table>
                <br /><br />
                <jsp:include page="news_archives.jsp" />
                <br /><br />
                <jsp:include page="arena.jsp" />
            </td>
            <!-- Center Column Ends -->

            <!-- Gutter -->
            <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt="" /></td>
            <!-- Gutter Ends -->

            <!-- Right Column Begins -->
            <td width="180">

                <jsp:include page="activeContestsBox.jsp" />

                <div>
                    <img src="/i/interface/rightNavTop.png" alt="" style="display: block;" />
                </div>

                <div class="rightNav">
                    <div class="setWidth">
                        <div class="contain">

                            <div align="center">
                                <img src="/i/home/top10.png" alt="Top 10" style="display:block;" />
                            </div>

                            <div style="padding-bottom: 10px;" align="center">
                                <form name="f" action="#">
                                    <select name="topTen" onChange="swapTopTen(this.value)">
                                        <option value="topTenAlgo" selected="selected">Algorithm</option>
                                        <option value="topTenAlgoSchools">Algorithm Schools</option>
                                        <option value="topTenAlgoCountries">Algorithm Countries</option>
                                        <option value="topTenDes">Design</option>
                                        <option value="topTenDev">Development</option>
                                        <option value="topTenMM">Marathon Matches</option>
                                        <option value="topTenConceptualization">Conceptualization</option>
                                        <option value="topTenSpecification">Specification</option>
                                        <option value="topArchitecture">Architecture</option>
                                        <option value="topAssembly">Assembly</option>
                                        <option value="topTestSuites">Test Suites</option>
                                    </select>
                                </form>
                            </div>

                            <jsp:include page="top_coders.jsp" />
                            <jsp:include page="top_schools.jsp" />
                            <jsp:include page="top_countries.jsp" />
                            <jsp:include page="top_designers.jsp" />
                            <jsp:include page="top_developers.jsp" />
                            <jsp:include page="top_mm_coders.jsp" />

                            <jsp:include page="top_template.jsp" >
                                <jsp:param name="title" value="Conceptualization" />
                                <jsp:param name="name" value="top_conceptors" />
                                <jsp:param name="id" value="topTenConceptualization" />
                                <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedConceptors" />
                                <jsp:param name="ctxt" value="conceptualization" />
                            </jsp:include>
                            <jsp:include page="top_template.jsp" >
                                <jsp:param name="title" value="Specification" />
                                <jsp:param name="name" value="top_specificators" />
                                <jsp:param name="id" value="topTenSpecification" />
                                <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedSpecificators" />
                                <jsp:param name="ctxt" value="specification" />
                            </jsp:include>
                            <jsp:include page="top_template.jsp" >
                                <jsp:param name="title" value="Architecture" />
                                <jsp:param name="name" value="top_architects" />
                                <jsp:param name="id" value="topArchitecture" />
                                <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedArchitects" />
                                <jsp:param name="ctxt" value="architecture" />
                            </jsp:include>
                            <jsp:include page="top_template.jsp" >
                                <jsp:param name="title" value="Assembly" />
                                <jsp:param name="name" value="top_assemblers" />
                                <jsp:param name="id" value="topAssembly" />
                                <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedAssemblers" />
                                <jsp:param name="ctxt" value="assembly" />
                            </jsp:include>
                            <jsp:include page="top_template.jsp" >
                                <jsp:param name="title" value="Test Suites" />
                                <jsp:param name="name" value="top_testers" />
                                <jsp:param name="id" value="topTestSuites" />
                                <jsp:param name="help" value="/tc?module=Static&d1=statistics&d2=info&d3=topRatedTesters" />
                                <jsp:param name="ctxt" value="test_suites" />
                            </jsp:include>

                        </div>
                    </div>
                </div>

                <div>
                    <img src="/i/interface/rightNavBottom.png" alt="" style="display: block;" />
                </div>

            </td>
            <!-- Right Column Ends -->

        </tr>
    </table>

    <jsp:include page="../foot.jsp" />

    </body>
    </html>
    </c:otherwise>
</c:choose>
