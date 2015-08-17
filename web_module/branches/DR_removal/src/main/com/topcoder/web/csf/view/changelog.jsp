<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="home"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>


            <div class="contentSpacer">
                <p>
                    1.2.0 - 2006.12.04
                    <ul>
                        <li>Add user submission ranking system.</li>
                        <li>Add submission limit system.</li>
                        <li>Fix subject of the review response email so that it only contains the word "submission"
                            once.
                        </li>
                        <li>For contests where there are submission limits, only include those that count in the
                            submissions column of active and past contests pages.
                        </li>
                        <li>For contests where there are submission limits, only include those that
                            count on the submissions page.
                        </li>

                    </ul>
                </p>
                <p>
                    1.1.2 - 2006.09.xx
                    <ul>
                        <li>Cache submissions on submission page for full length. No need to only cache for 1
                            hour since we don't show them until submission phase is closed.
                        </li>
                        <li>Fix bug on submissions page where it only showed 19 submission per page.</li>
                    </ul>
                </p>

                <p>
                    1.1.1 - 2006.09.19
                    <ul>
                        <li>Do not allow the viewing of submissions until the contest is over</li>
                        <li>Show image files directly on the admin submission detail page rather than requiring a
                            click
                        </li>
                        <li>When declaring winners, refresh the cached home page data</li>
                    </ul>
                </p>

                <p>
                    1.1.0 - 2006.09.05
                    <ul>
                        <li>Add the ability for admins to specify what types of files will be allowed on a per contest
                            basis
                        </li>
                        <li>Add the ability for admins to specify whether submissions are viewable or not</li>
                        <li>Show winners on active contests page</li>
                        <li>Show winners on past contests page</li>
                        <li>Improve permissions error message hinting that not being registered for Studio could be a
                            factor
                        </li>
                        <li>Add # submissions to active contest pages</li>
                        <li>Add # submissions to past contest pages</li>
                        <li>Attempt to fix login bug where the cookie doesn't last as long as it should.</li>
                        <li>Remove submit link from contest details page if the contest is over</li>
                        <li>Provide detailed error message if one attempts to submit on an inactive contest</li>
                        <li>Add recent winners to home page</li>
                        <li>Add submissions page</li>
                    </ul>
                </p>

                <p>
                    1.0.1 - 2006.08.xx
                    <ul>
                        <li>Fix bug in admin tool where documents didn't get the selected type in the db.</li>
                    </ul>
                </p>

                <p>
                    1.0.0 - 2006.08.14
                    <ul>
                        <li>Launch!</li>
                    </ul>
                </p>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>