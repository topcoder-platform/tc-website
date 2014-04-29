<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
    <c:when test="${not empty isNewStyle && isNewStyle}">

        <section class="news-archive">
            <h3>News Archive</h3>

            <div class="archive-container">
                <ul>
                    <li><a href="http://www.topcoder.com/aboutus/news/">General TopCoder News</a></li>
                    <li><a href="http://www.topcoder.com/aboutus/press-room/">Press Releases &amp; Articles</a></li>
                    <li><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_alg">Algorithm Competition News</a></li>
                    <li><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_comp">Component Competition News</a></li>
                    <li><a href="http://community.topcoder.com/tc?&module=SurveyList">Surveys</a></li>
                    <li><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis">Problem Sets &amp; Analyses</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=home&d2=news_archive_tournie">Tournament News</a></li>
                </ul>
                <ul class="last-column">
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=home&d2=news_archive_employment">Employment Opportunities</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=alg_index">Tutorial</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=features&d2=archive">Feature Article</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=home&d2=news_archive_movies">Movies</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=home&d2=news_archive_podcast">Podcasts</a></li>
                    <li><a href="http://community.topcoder.com/tc?module=Static&d1=home&d2=news_archive_long">Marathon Match News</a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </section>
        <!-- End .news-archive -->
    </c:when>
    <c:otherwise>

        <table align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" width="525">
            <tr>
                <td class="sidebarTitle" colspan="4">News Archives</td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="http://www.topcoder.com/aboutus/news/"><img src="/i/home/icons/v2/general.png" alt="General TopCoder News" border="0"/></a>
                </td>
                <td width="50%"><a href="http://www.topcoder.com/aboutus/news/">General TopCoder News</a></td>
                <td>
                    <a href="http://www.topcoder.com/aboutus/press-room/"><img src="/i/home/icons/v2/pressroom.png" alt="Press Releases &amp; Articles" border="0"/></a>
                </td>
                <td width="50%"><a href="http://www.topcoder.com/aboutus/press-room/">Press Releases &amp; Articles</a></td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_alg"><img src="/i/home/icons/v2/alg.png" alt="Algorithm Competition News" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_alg">Algorithm Competition News</a></td>
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_comp"><img src="/i/home/icons/v2/software.png" alt="Component Competition News" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_comp">Component Competition News</a></td>
            </tr>
            <tr class="bodyText">
                <td><a href="/tc?&module=SurveyList"><img src="/i/home/icons/v2/survey.png" alt="Surveys" border="0"/></a></td>
                <td><a href="/tc?&module=SurveyList">Surveys</a></td>
                <td>
                    <a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set &amp; Analysis" border="0"/></a>
                </td>
                <td><a href="http://apps.topcoder.com/wiki/display/tc/Algorithm+Problem+Set+Analysis">Problem Sets &amp; Analyses</a></td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_tournie"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_tournie">Tournament News</a></td>
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_employment"><img src="/i/home/icons/v2/employment.png" alt="Employment Opportunities" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_employment">Employment Opportunities</a></td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index"><img src="/i/home/icons/v2/tutorial.png" alt="Educational Content" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=tutorials&amp;d2=alg_index">Tutorial</a></td>
                <td>
                    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive"><img src="/i/home/icons/v2/feature.png" alt="Educational Content" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Feature Article</a></td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_movies"><img src="/i/home/icons/v2/movie.png" alt="TopCoder Movies" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_movies">Movies</a></td>
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_podcast"><img src="/i/home/icons/v2/audio.png" alt="Podcasts" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_podcast">Podcasts</a></td>
            </tr>
            <tr class="bodyText">
                <td>
                    <a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_long"><img src="/i/home/icons/v2/marathon.png" alt="Marathon Match News" border="0"/></a>
                </td>
                <td><a href="/tc?module=Static&amp;d1=home&amp;d2=news_archive_long">Marathon Match News</a></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </c:otherwise>
</c:choose>



