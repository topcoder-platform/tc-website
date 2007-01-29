<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value=""/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>About TopCoder</h1>

                <p>TopCoder is fast becoming the major league for programming competitions. TopCoder brings members
                    together once a week to compete online
                    &#40;Single Round Match&#41; and twice a year both online and on location &#40;Tournaments&#41;.</p>

                <h2>Why Online Competitions</h2>
                Competitions provide an understanding of a person's capabilities through a demonstration of skill. What
                was lacking in the world of programming
                competitions was a format that offered immediate and objective scoring. The solution was the creation of
                a "Single Round Match".
            </p>

            <p>In addition to regular Single Round Matches, TopCoder holds two major multiple-round, elimination
                tournaments each year. These tournaments span many weeks and include significant prize purses along
                three independent tracks of competition: algorithm, component design, and component development.</p>

            <h2>How Members Benefit</h2>

            <ul>
                <li><A href="/tc?module=Static&d1=about&d2=whyjoin"><strong>Competition</strong></A><br/>
                    Each Single Round Match offers a fun, time-based, and challenging set of problems that put a
                    developer's skills to the test. This, coupled
                    with Divisions,
                </A>
                offer a more level
                field of competition for newer members in order to build ratings and move into potential
                <A href="/tc?module=Static&d1=tournaments&d2=home">Tournament</A> opportunities.
            </li>
            <br/>

            <li><A href="/tc?module=ViewActiveContests&ph=112"><strong>Design</strong></A> and
                <A href="/tc?module=ViewActiveContests&ph=113"><strong>Development</strong></A><br/>
                Rated TopCoder members are eligible to participate in TopCoder Component Development. Members submit
                design and development solutions
                for these challenging and potentially lucrative projects. Winning solutions are rewarded with cash
                payouts and royalties. For every
                commercial sale, TopCoder will pay the members who designed and developed the component a percentage of
                the sale.
            </li>
            <br/>

        </ul>

        <h2>How Companies Benefit</h2>

        <ul>
            <li><A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=tces_home"><strong>Employment
                Services</strong></A><br/>
                The market for developers is either feast or famine. Regardless of how many developers there are or how
                many are available,
                the issue remains the same&#151;how to determine which candidate is best suited to the needs of your
                organization. While
                certification has offered some credibility, competitions that test a developer's skills in real-world
                challenges goes much
                further to differentiating one candidate from another.
            </li>

            <li>
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp"><strong>Software</strong></A><br/>
                The best way to drive down the cost of software development is through re-use. The
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/index.jsp">Component Catalog</A>
                is a tool for increasing re-use and developer productivity within an organization. The component catalog
                continues to grow on a weekly basis as component
                requirements are generated through requests from catalog customers, research from TopCoder Product
                Managers and from application development.
            </li>

            <li>
                <A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>Sponsorship</strong></A><br/>
                Reaching the developer community is a difficult task at best. Marketing budgets are limited and with the
                advent of the Internet,
                the expectation for measuring results has only grown. TopCoder offers companies a means of targeting
                this desired community
                through the targeted sponsorship of Single Round Matches
                and
                <A href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournaments.</A>
            </li>
        </ul>

    </div>
    <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>

<jsp:include page="../foot.jsp"/>

<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>