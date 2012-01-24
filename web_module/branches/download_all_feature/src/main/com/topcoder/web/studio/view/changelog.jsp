<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
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

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
        
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<h1>Studio Website Changelog</h1>


<p>
    3.0.0 - 2008.04.22
    <ul>
        <li>Provide slideshow for submissions that include images in their preview file -dok</li>
        <li>Watermark and resize image files -dok</li>
        <li>Submissions must be zip files -dok</li>
        <li>Contest types -dok</li>
        <li>TC Direct integration -dok</li>
        <li>Admin site rework -dok</li>
        <li>Contest details rework -dok</li>
        <li>Assignment Document v2 released -pulky</li>
    </ul>

</p>


<p>
    2.1.4 - 2008.01.02
    <ul>
        <li>Always refresh cache after admin reviews a submission -dok</li>
    </ul>

</p>


<p>
    2.1.3 - 2007.12.20
    <ul>
        <li>Past contests default columns sort changed -pulky</li>
        <li>Make it possible to wrap up a contest that does not include online review -dok</li>
        <li>Don't show some of the fields in the admin site until the contest exists -dok</li>
    </ul>

</p>

<p>
    2.1.2 - 2007.10.16
    <ul>
        <li>Fix bug in admin tool where one couldn't correctly search by handle on submissions page after submissions went to OR -dok</li>
    </ul>

</p>

<p>
    2.1.1 - 2007.09.19
    <ul>
        <li>When submissions are not available we will no longer allow the winner to be downloaded. -dok</li>
    </ul>

</p>


<p>
    2.1.0 - 2007.09.06
    <ul>
        <li>Single Sign On -dok</li>
    </ul>

</p>


<p>
    2.0.9 - 2007.08.30
    <ul>
        <li>Fix NPE when attempting to download a submisson that was the client selection, but did not get another prize -dok</li>
    </ul>

</p>
<p>
    2.0.8 - 2007.08.21
    <ul>
        <li>Fix final submission processing so that it quietly deals with invalid mime types -dok</li>
    </ul>

</p>

<p>
    2.0.7 - 2007.08.13
    <ul>
        <li>Allow an admin to send a single submission to online review -dok</li>
    </ul>

</p>

<p>
    2.0.6 - 2007.08.07
    <ul>
        <li>Allow for a single submission to win more than one prize -dok</li>
    </ul>

</p>


<p>
    2.0.5 - 2007.08.06
    <ul>
        <li>Refresh the cache when scores are loaded from online review -dok</li>
        <li>Securely access online review web service -dok</li>
        <li>Be more lenient with mime types, if the client doesn't identify the mime type correctly look it up by file
            extension -dok
        </li>
    </ul>

</p>

<p>
    2.0.4 - 2007.08.02
    <ul>
        <li>Just show an X for submissions that failed screening on the submissions page -dok</li>
    </ul>

</p>

<p>
    2.0.3 - 2007.07.30
    <ul>
        <li>Allow admins to load results from online review -dok</li>
        <li>Don't re-rank submissions if one fails. -dok</li>
        <%--<li>Set compile and target jvm to 1.5 for jsp's -dok</li>--%>
    </ul>

</p>

<p>
    2.0.2 - 2007.07.25
    <ul>
        <li>Professionals registering for TCCC07 studio contests won't get the not-registered warning -pulky</li>
    </ul>

</p>

<p>
    2.0.1 - 2007.07.23
    <ul>
        <li>If a contest is not scored, show "n/a" on submissions and results pages in the score column -dok</li>
        <li>Send submissions to Online Review for scoring -dok</li>
    </ul>

</p>
<p>
    2.0.0 - 2007.07.20
    <ul>
        <li>Fix bug where date in review email indicated it was in the user's timezone but was really eastern time
            -dok
        </li>
        <li>Fix bug where the cache wasn't refreshed after an admin changed results -dok</li>
        <li>Allow and admin to remove the place of a submission -dok</li>
        <li>Add score to submissions page -dok</li>
        <li>Add score to winners page -dok</li>
        <li>Add submission results page -dok</li>
    </ul>
</p>


<p>
    1.3.3 - 2007.05.xxx
    <ul>
        <li>TCCC07 registration. - pulky</li>
        <li>figure out image sizes server size and let client resize rather than resizing via javascript -dok</li>
    </ul>
</p>
<p>
    1.3.2 - 2007.05.21
    <ul>
        <li>Use create date for submission date, and remove submission date field -dok</li>
        <li>Add the ability for a competitor to remove a submission -dok</li>
        <li>Go to the page the user is looking at after successful login -dok</li>
    </ul>
</p>
<p>
    1.3.2 - 2007.05.07
    <ul>
        <li>Adjust filename when downloading submissions. If it's not the user's own submission, save it as the
            submission id -dok
        </li>
        <li>Add Assignment Document functionality -pulky</li>
        <li>Rework forums packaging to reduce inapproriate dependencies -mktong</li>
        <li>Fix bug to allow admins to set submissions as belonging to cheaters successfully. -dok</li>
        <li>Add admin control over whether or not submitter names are viewable -dok</li>
        <li>Enhancements to the Assignment Document functionality in order to accelerate the process -pulky</li>
    </ul>
</p>

<p>
    1.3.1 - 2007.03.14
    <ul>
        <li>Fix bug in active contests where it did not use the cookie to determine if someone was registered for the
            contest - dok
        </li>
        <li>Fix bug in contest details where it did not use the cookie to determine if someone was registered for the
            contest - dok
        </li>
        <li>Add contest results page and link to it from past contests - dok</li>
        <li>Add processing image during submission - dok</li>
    </ul>
</p>

<p>
    1.3.0 - 2007.03.01
    <ul>
        <li>Make is possible to associate a contest with an event</li>
        <li>Add logic so that if someone is registering for a contest that is associated with an event
            that they are not registered for, warn them
        </li>
        <li>Make registration happen prior to submission rather than as part of submitting.</li>
        <li>Require one to be registered in order to gain access to documents.</li>
        <li>Refresh cache when a submission passes after the contest has ended.</li>
    </ul>
</p>

<p>
    1.2.2 - 2007.02.16
    <ul>
        <li>Include code for message for tco</li>
        <li>Track the dimensions of images that are submitted.</li>
    </ul>
</p>

<p>
    1.2.1 - 2007.01.08
    <ul>
        <li>Allow users to download their own submissions before the contest is over.</li>
    </ul>
</p>
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

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
