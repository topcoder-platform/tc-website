<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
    <head>
        <title>TopCoder Admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <div id="container">
            <jsp:include page="top.jsp"/>
            <jsp:include page="left.jsp"/>

            <div id="mainContent">
                <div id="tableOfContents">
                    <ul>
                        <li>
                            <a href="#main">Main TopCoder Site</a>
                            <ul>
                                <li><a href="#main1">How do I do a production move for the www.topcoder.com?</a></li>
                                <li><a href="#main3">How do I delete a forum post?</a></li>
                                <li><a href="#main4">What do I do if I'm getting marshalling errors on jive filter objects?</a></li>
                                <li><a href="#main5">What do I do if I'm getting marshalling errors on ResultSetContainer objects?</a></li>
                                <li><a href="#main6">How do I put up new member photos?</a></li>
                                <li><a href="#main7">How do I take down a member photo?</a></li>
                                <li><a href="#main8">How do I build the code for www.topcoder.com?</a></li>
                                <li><a href="#main9">How do I load information into the warehouse after a round?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#cache">The Cache</a>
                            <ul>
                                <li><a href="#cache1">How do I do a production move for the cache?</a></li>
                                <li><a href="#cache2">How do I bounce the cache?</a></li>
                                <li><a href="#cache3">What is dependant on the cache?</a></li>
                                <li><a href="#cache4">What is dependant on a cache?</a></li>
                                <li><a href="#cache5">How do I remove objects from the cache?</a></li>
                                <li><a href="#cache6">How do I clear the cache?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#software">TopCoder Software</a>
                            <ul>
                                <li><a href="#software1">How do I do a production move for the www.topcodersoftware.com?</a></li>
                                <li><a href="#software2">What do I do if I'm getting marshalling errors on ResultSetContainer objects?</a></li>
                                <li><a href="#software3">How do I build the code for www.topcodersoftware.com?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#techass">The Technical Assessment System</a>
                            <ul>
                                <li><a href="#techass1">How do I do a production move for the www.topcoder.com/techassess/techassess?</a></li>
                                <li><a href="#techass2">How do I bounce the Technical Assessment tool?</a></li>
                                <li><a href="#techass3">How do I bounce the Application Server?</a></li>
                                <li><a href="#techass4">How do I bounce the Procesor?</a></li>
                                <li><a href="#techass5">How do I bounce the Testers?</a></li>
                                <li><a href="#techass6">How do I bounce the Compilers?</a></li>
                                <li><a href="#techass7">How do I bounce the Cache?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#email">The Mass Email System</a>
                            <ul>
                                <li><a href="#email2">How do I set up an email?</a></li>
                                <li><a href="#email3">Why aren't emails going out?</a></li>
                                <li><a href="#email4">How do I send the new placement email?</a></li>
                                <li><a href="#email5">How do I send the next match email?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#misc">Misc.</a>
                            <ul>
                                <li><a href="#misc1">How do I put company branding in the TopCoder competition arena?</a></li>
                                <li><a href="#misc2">How do I put company branding in the Technical Assessment tool?</a></li>
                                <li><a href="#misc3">How do I kick someone out for cheating?</a></li>
                                <li><a href="#misc4">How do I kick someone out for having a duplicate account?</a></li>
                                <li><a href="#misc5">How do I clear private data from the dev database after a data load?</a></li>
                                <li><a href="#misc6">How do I make someone an admin?</a></li>
                                <li><a href="#misc8">What do I do if someone complains school information isn't correct (for ranking etc.)?</a></li>
                                <li><a href="#misc9">How do I find out someone's password that is encrypted in the database?</a></li>
                                <li><a href="#misc10">How do I set someone's password that is encrypted in the database?</a></li>
                                <li><a href="#misc12">How do I create a query in the query system?</a></li>
                                <li><a href="#misc13">How do I modify a query in the query system?</a></li>
                                <li><a href="#misc14">How do I deactivate bad email addresses?</a></li>
                                <li><a href="#misc15">How do I clear out problem data from the dev database after a data load?</a></li>
                                <li><a href="#misc16">How do I figure out the basic Coder of the Month?</a></li>
                                <li><a href="#misc17">How do I track hits to particular links on the website?</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>

                <div id="detail">
                    <ul class="tier1">
                        <li class="tier1"><a name="main"></a>Main TopCoder Site
                            <ul class="tier2">
                                <li class="tier2">
                                    <a name="main1"></a>How do I do a production move for the www.topcoder.com?
                                    <ol>
                                        <li>Telnet to 192.168.12.51 and login as apps</li>
                                        <li>Telnet to 192.168.12.52 and login as apps</li>
                                        <li>On both boxes <span class="input">cd web</span> to move to our base directory</li>
                                        <li>Execute <span class="input">./backup.sh</span> on both .51 and .52</li>
                                        <li><a href="#main8">Build the code</a></li>
                                        <li>ftp the topcoder.jar to 192.168.12.51 in the ~/web directory</li>
                                        <li><a name="bu52">Bring up the .52 instance of weblogic</a>
                                            <ul>
                                                <li>
                                                    In your telnet session to .52, type <span class="input">wl</span> to move
                                                    to the weblogic home directory
                                                </li>
                                                <li>
                                                    <span class="input">start</span> to start this weblogic instance.
                                                    By running an instance on .52, it allows you to have a working website
                                                    while you move code to the .51 box
                                                </li>
                                            </ul>
                                        </li>
                                        <li>Bring down the .51 instanceof weblogic
                                            <ul>
                                                <li>
                                                    <span class="input">/usr/ucb/ps augxww | grep java | grep apps | grep 1024</span>
                                                    locate the correct process id to kill
                                                </li>
                                                <li><span class="input">kill -9 &lt;pid&gt;</span> to kill the weblogic process</li>
                                                <li>
                                                    <span class="input">tn</span> this tails the weblogic log, the last thing you
                                                    see should be "Killed", if not, you killed the wrong pid
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            In your telnet session to .51, in the ~/web directory, explode the jar by typing
                                            <span class="input">jar xvf build.jar</span>
                                        </li>
                                        <li>
                                            In your telnet session to .51, in the ~/web directory, move the files to the correct
                                            locations by typing <span class="input">ant move</span>
                                        </li>
                                        <li>Bring up the .51 instance of weblogic similarly to how you <a href="#bu52">brought up .52</a></li>

                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="main3"></a>How do I delete a forum post?
                                    <p>
                                        If the message is the first message in a thread, then you'll need to delete the message,
                                        the thread, and update the forum so that the most recent message is correct.<br />
                                        <br />
                                        If the message not the first message in a thread, then you'll need to delete the message,
                                        and if it's the most recent post, you should update the thread and forum so that they are correct.
                                    </p>
                                    <ol>
                                        <li>
                                            Delete a thread - <span class="input">delete from jivethread where threadid =
                                            (select threadid from jivemessage where messageid = &lt;mid&gt;);</span>
                                        </li>
                                        <li>Delete a message - <span class="input">delete from jivemessage where messageid = &lt;mid&gt;;</span></li>
                                        <li>
                                            Delete references to that message from the hierarchy -
                                            <span class="input">delete from jivemessagetree where childid = &lt;mid&gt;;</span>
                                        </li>
                                        <li>
                                            Delete references to that message from the hierarchy if it has been replied to -
                                            <span class="input">delete from jivemessagetree where parentid = &lt;mid&gt;;</span>
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="main4"></a>What do I do if I'm getting marshalling/serialization errors on jive filter objects?
                                    <p>
                                        In all likelihood, this means that the machine you build the code on is not the same (same OS) as the
                                        machine the code was last built on.  Jive filter objects are stored in the database, so the objects
                                        that are currently stored in the database are not the same as the objects you have put on the file system.
                                        This means that you will have to remove the objects from the database, and recreate them.  Also, keep in
                                        mind to use the same machine to build the code in the future.
                                    </p>
                                    <ol>
                                        <li>Delete the existing filters with <span class="input">delete from jivefilter</span></li>
                                        <li>
                                            Create the filters on each of the forums using the jive admin tool (this is gonna be fun)
                                            <ul>
                                                <li>Load <a href="http://www.topcoder.com/jive/skins/admin/index.jsp" target="_blank">the jive admin site</a></span></li>
                                                <li>
                                                    The first login prompt that pops up is for weblogic, login as system, you can get the
                                                    password from 192.168.12.51 in ~/weblogic_apps/weblogic.properties
                                                </li>
                                                <li>
                                                    The next login page is for jive, login as Administrator you can get the password
                                                    with <span class="input">select password from user where handle = 'Administrator';</span> in informixoltp
                                                </li>
                                                <li>
                                                    In the upper left corner, there are 3 missing images.  The one to the lower
                                                    right in the group is a link to forum maintenance
                                                    (when you mouse over you'll see http://www.topcoder.com/jive/skins/admin/sidebar.jsp?tree=forum)
                                                </li>
                                                <li>Once in forum maintenance, click "Filters" in the left navigation</li>
                                                <li>Choose the forum you would like to work with from the drop down</li>
                                                <li>Using the list box at the bottom of the screen, add the HTML Filter and the Newline Converter</li>
                                                <li>Rinse and repeat for each of the forums</li>
                                            </ul>
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="main5"></a>What do I do if I'm getting marshalling errors on ResultSetContainer objects?
                                    <p>
                                        This means that there is a difference between the ResultSetContainer object that the cache has
                                        and the ResultSetContainer object that the application server has.  The solution is the match them
                                        up by updating the classes in the cache's classpath and restarting it.
                                    </p>
                                    <ol>
                                        <li>You need the current code, if you don't have it, <a href="#main8">build it</a></li>
                                        <li>
                                            It's likely that you just did a move to the application server and therefore
                                            that code is the latest.  You should just move up the classes.jar and shared.jar from that
                                            build to the cache server.  In that case, use the instructions for the link above
                                            starting with the moving of files, skip the actual build.
                                        </li>
                                        <li><a href="#cache2">Bounce the cache</a></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="main6"></a>How do I put up new member photos?
                                    <ol>
                                        <li>
                                            Get the list of email subject lines from the Graphics Design team member
                                            currently assigned to the task.
                                        </li>
                                        <li>In informixoltp database</li>
                                        <li>
                                            When someone submits their member photo, the subject helps determine that the person
                                            is who they say they are.  Use the following query to get a list of activation codes
                                            and compare them to the subject of each email to be sure no one submits a photo as
                                            someone else.
                                            <p class="input">
                                                select c.activation_code || ' | [ ' || u.handle || ' | ' || u.user_id<br />
                                                  from user u, coder c<br />
                                                 where c.coder_id = u.user_id<br />
                                                   and u.user_id in (&lt;user_id list&gt;);
                                            </p>
                                        </li>
                                        <li>
                                            Now you need to insert records into the image table for each of new member photos.
                                            There is no sequence for this, so you have to create the id's by hand.  Use the following
                                            query to figure out what id to start with.
                                            <p class="input">
                                                select max(image_id)+1<br />
                                                  from image<br />
                                                 where image_id &lt; 10000;
                                            </p>
                                        </li>
                                        <li>
                                            This query will generate the insert statements for the image table.  You'll just have
                                            to replace the xxx's with the id's you are manually coming up with.
                                            <p class="input">
                                                select 'insert into image (image_id, file_name, image_type_id, path_id) ' ||<br />
                                                       ' values (xxx, ''' || handle || '_big.jpg'', 1, 1);--', user_id, handle<br />
                                                  from user<br />
                                                 where user_id in (&lt;user_id list&gt;)<br />
                                                 order by user_id;
                                            </p>
                                        </li>
                                        <li>
                                            If the graphic designer had to change any of the file names, that should have been
                                            communicated to you.  At this point, you'll want to adjust each of the insert statements
                                            that you just generated to have to correct file name.  Likely it's just what was
                                            generated with a 2 appended before the extension.
                                        </li>
                                        <li>
                                            Generate the insert statement for the coder_image_xref table
                                            <p class="input">
                                                select 'insert into coder_image_xref (coder_id, image_id, display_flag) ' ||<br />
                                                       'values (' || user_id || ', xxx, 1);--', user_id, handle<br />
                                                  from user<br />
                                                 where user_id in (&lt;user_id list&gt;)<br />
                                                 order by user_id;
                                            </p>
                                        </li>
                                        <li>
                                            Adjust to insert statements by replacing the xxx's with image_ids.  The statements
                                            are in the same order as the ones you generated for image's, so you can just work
                                            your way down incrementing by one each time.
                                        </li>
                                        <li>
                                            Execute to following to make sure after you insert all the new images, no one
                                            has more than one set to display at the same time.
                                            <p class="input">
                                                update coder_image_xref set display_flag = 0<br />
                                                 where image_type_id = 1<br />
                                                   and coder_id in (&lt;user_id list&gt;);
                                            </p>
                                        </li>
                                        <li>Execute all the insert statements for image</li>
                                        <li>Execute all the insert statements for coder_image_xref</li>
                                        <li>
                                            Load the image information into the data warehouse by running the coder load.
                                            You can see how to run the warehouse load <a href="#main9">here</a>, but in this
                                            case you only need to load coders.
                                        </li>
                                        <li>
                                            Using the key "member_profile" <a href="#cache5">refresh the cache</a>
                                        </li>
                                        <li>
                                            Load <a href="http://www.topcoder.com" target="_blank">our site</a> and search for every coder
                                            you just put an image up for and make sure it worked.
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="main7"></a>How do I take down a member photo?
                                    <ol>
                                        <li>
                                            Execute the following sql statement in both the transactional and data warehouse
                                            databases
                                            <p class="input">
                                                update coder_image_xref set display_flag = 0<br />
                                                 where image_type_id = 1<br />
                                                   and coder_id in (&lt;user_id&gt;);
                                            </p>
                                        </li>
                                        <li>
                                            Using the key &lt;user_id&gt; <a href="#cache5">refresh the cache</a>
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="main8"></a>How do I build the code for www.topcoder.com?
                                    <ol>
                                        <li>
                                            Be sure you build on the same OS and Java version as it was last built on, or you'll have to deal
                                            with <a href="#main4">marshalling/serialization errors</a>
                                        </li>
                                        <li>
                                            You'll need the web source tree, I'll assume you can check that out.  Be sure you
                                            have this in a seperate place so that it's not contaminated with some code you're
                                            currently working on.  Also, having a seperate spot for this build will mean that
                                            you can see what code is running in prod at the current time.
                                        </li>
                                        <li><span class="input">cd web</span></li>
                                        <li>
                                            <span class="input">ant -f move.xml package-topcoder</span> This ant target will
                                            delete old files, get the latest from cvs, build it and jar it up so that it can
                                            be moved to the production servers.
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="main9"></a>How do I load information into the warehouse after a round?
                                    <ol>
                                        <li>Telnet to 192.168.14.51 and login as coder</li>
                                        <li><span class="input">cd /usr/web/scripts/dwload</span></li>
                                        <li>
                                            <span class="input">vi loadaggregate.xml</span> and change the roundid
                                            parameter to the round you are loading
                                        </li>
                                        <li>
                                            <span class="input">vi loadround.xml</span> and change the roundid
                                            parameter to the round you are loading
                                        </li>
                                        <li>
                                            <span class="input">vi loadrank.xml</span> and change the roundid
                                            parameter to the round you are loading
                                        </li>
                                        <li><span class="input">./loadround.sh</span> and wait for it to complete, it will tell you</li>
                                        <li><span class="input">./loadaggregate.sh</span> and wait for it to complete, it will tell you</li>
                                        <li>
                                            <span class="input">./loadcoders.sh</span> and wait for it to complete, you
                                            can check it with <span class="input">tail -f coder_load.log</span>
                                        </li>
                                        <li><span class="input">./loadrank.sh</span> and wait for it to complete, it will tell you</li>
                                        <li><a href="#cache6">clear all cached data</a> so that the site will get the latest</li>
                                    </ol>
                                </li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="cache"></a>The Cache
                            <ul class="tier2">
                                <li class="tier2">
                                    <a name="cache1"></a>How do I do a production move for the cache?
                                    <ol>
                                        <li><a href="#main8">Build the code</a></li>
                                        <li><span class="input">cd ./lib/bin</span></li>
                                        <li><span class="input">ftp 192.168.12.61</span> and login as apps</li>
                                        <li><span class="input">cd ~/web/llb/bin</span></li>
                                        <li><span class="input">put classes.jar</span></li>
                                        <li><span class="input">put shared.jar</span></li>
                                        <li><span class="input">put classes.jar</span></li>
                                        <li><span class="input">quit</span></li>
                                        <li><a href="#cache2">Bounce the cache</a></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="cache2"></a>How do I bounce the cache?
                                    <ol>
                                        <li>Telnet to 192.168.12.61 and login as apps</li>
                                        <li><span class="input">cd ~/web/scripts</span></li>
                                        <li><span class="input">./runcache.sh stop</span></li>
                                        <li><span class="input">./runcache.sh start</span></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="cache3"></a>What is dependant on the cache?
                                    <p>
                                        Generally "the cache" refers to the distributed cache that runs on 192.168.12.61.
                                        There are a number of different parts of our system that depend on it.
                                        www.topcoder.com uses it to cache statistics, user information that would usually
                                        be looked up by the security tool, round table users (until we replace them with jive 4.x),
                                        graph images and more.  software.topcoder.com uses the cache for it's homepage list
                                        of top downloads.
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="cache4"></a>What is dependant on a cache?
                                    <p>
                                        We also have a distributed cache instance running for the technical assessment tool.
                                        This is used by both the candidate interface code and the server side processor.
                                        It can be bounced similarly to "the cache" as indicated <a href="#cache2">href</a>
                                        but it is running on 192.168.10.57
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="cache5"></a>How do I remove objects from the cache?
                                    <ol>
                                        <li>Telnet to 192.168.12.51 and login as apps</li>
                                        <li>
                                            <span class="input">java com.topcoder.shared.distCache.SimpleClient removelike &lt;key&gt;</span>
                                            where &lt;key&gt; is some part of the key used to store an object in the cache.
                                            <p>
                                                For example, if you wanted to refresh the site so that the system would go
                                                to the database the next time a user loaded any coder's member profile you would
                                                execute <span class="input">java com.topcoder.shared.distCache.SimpleClient removelike member_profile</span>
                                                because the data for the member profile page is stored with a key that contains
                                                the string "member_profile".  You could remove nearly all the data about a particular
                                                coder by executing <span class="input">java com.topcoder.shared.distCache.SimpleClient removelike &lt;user_id&gt;</span>
                                                because data that is stored on a per-user basis is likely to have their user_id
                                                as part of the key in the cache.
                                            </p>
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="cache6"></a>How do I clear the cache?
                                    <ol>
                                        <li>Telnet to 192.168.12.51 and login as apps</li>
                                        <li><span class="input">java com.topcoder.shared.distCache.SimpleClient clear</span></li>
                                    </ol>
                                </li>
                            </ul>
                        </li>


                        <li class="tier1"><a name="software"></a>TopCoder Software
                            <ul class="tier2">
                                <li class="tier2">
                                    <a name="software1"></a>How do I do a production move for the www.topcodersoftware.com?
                                    <ol>
                                        <li>Telnet to 192.168.10.151 and login as apps</li>
                                        <li><span class="input">cd stage</span></li>
                                        <li>
                                            Backup what is currently deployed so that you have a copy in case there is a problem
                                            <span class="input">cp dde.ear dde.ear.&lt;yyyymmdd&gt;</span>
                                        </li>
                                        <li>On the box where you build the code, <span class="input">cd ./build/dist</span></li>
                                        <li>ftp the dde.ear file to 192.168.10.151 in the ~/stage directory</li>
                                        <li>On .151 in ~/stage deploy the ear by executing <span class="input">cp dde.ear $JBOSS_HOME/server/default/deploy</span></li>
                                        <li>Bring down the jboss instance
                                            <ul>
                                                <li>
                                                    <span class="input">/usr/ucb/ps augxww | grep java | grep jboss.Main</span>
                                                    locate the correct process id to kill
                                                </li>
                                                <li><span class="input">kill -9 &lt;pid&gt;</span> to kill the jboss process</li>
                                            </ul>
                                        </li>
                                        <li>Move to the jboss directory with <span class="input">jbb</span></li>
                                        <li>Start jboss with <span class="input">./run.sh</span></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="software2"></a>What do I do if I'm getting marshalling errors on ResultSetContainer objects?
                                    <p>
                                        This means that there is a difference between the ResultSetContainer object that the cache has
                                        and the ResultSetContainer object that the application server has.  In this case, it's likely that the
                                        application server is out of date, so you'll need to match it up with the cache.
                                    </p>
                                    <ol>
                                        <li>Telnet to 192.168.10.151 as apps</li>
                                        <li><span class="input">cd $JBOSS_HOME/server/default/lib</span></li>
                                        <li>
                                            get the current shared.jar from the cache server by ftping it from
                                            192.168.12.61 in the ~/web/lib/bin directory
                                        </li>
                                        <li>Restart the application server, you can pick out the details <a href="#software1">href</a></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="software3"></a>How do I build the code for www.topcodesoftware.com?
                                    <ol>
                                        <li>
                                            You'll need the web source tree, I'll assume you can check that out.  Be sure you
                                            have this in a seperate place so that it's not contaminated with some code you're
                                            currently working on.  Also, having a seperate spot for this build will mean that
                                            you can see what code is running in prod at the current time.
                                        </li>
                                        <li><span class="input">cd web</span></li>
                                        <li>
                                            <span class="input">ant -f move.xml package-software</span> This ant target will
                                            delete old files, get the latest from cvs, build it so that it can
                                            be moved to the production server.
                                        </li>

                                    </ol>
                                </li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="techass"></a>The Technical Assessment System
                            <p>
                                The Technical Assessment System is composed of a number of pieces.  The application server
                                contains the EJB's that are called by the processor(s).  It also takes care of the front
                                end jsp/servlet layer.  The processor layer takes care of all the business logic.  It puts
                                items on testing/compiler queues, makes EJB calls to persist data to the database etc.
                                There are of course, testers and compilers.  Finally, there is a distributed cache that is
                                used by both the processor layer and the servlet layer.
                            </p>
                            <ul class="tier2">
                                <li class="tier2">
                                    <a name="techass1"></a>How do I do a production move for the www.topcoder.com/techassess/techassess?
                                </li>
                                <li class="tier2"><a name="techass2"></a>How do I bounce the Technical Assessment tool?
                                    <p>To fully bounce the Technical Assessment Tool you have to bounce all of the following</p>
                                    <ol>
                                        <li><a href="#techass3">The Application Server</a></li>
                                        <li><a href="#techass4">The Processor</a></li>
                                        <li><a href="#techass5">The Testers</a></li>
                                        <li><a href="#techass6">The Compilers</a></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="techass3"></a>How do I bounce the Application Server?
                                    <ol>
                                        <li>Telnet to 192.168.10.57 and login as apps</li>
                                        <li><span class="input">jbb</span> to get to the jboss directory</li>
                                        <li>
                                            <span class="input">/usr/ucb/ps augxww | grep java | grep jboss.Main</span>
                                            to figure out which process needs killin'
                                        </li>
                                        <li><span class="input">kill -9 &lt;pid&gt;</span></li>
                                        <li><span class="input">./start.sh</span></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="techass4"></a>How do I bounce the Processor?
                                    <ol>
                                        <li>Telnet to 192.168.10.57 and login as apps</li>
                                        <li><span class="input">gts</span> to get to the scripts directory</li>
                                        <li>
                                            <span class="input">/usr/ucb/ps augwwx | grep java | grep ScreeningProcessorMain</span>
                                            to figure out which process needs killin'
                                        </li>
                                        <li><span class="input">kill -9 &lt;pid&gt;</span></li>
                                        <li><span class="input">./runScreeningProcessor.sh</span></li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="techass5"></a>How do I bounce the Testers?
                                    <ol>
                                        <li>ask <a href="mailto:rfairfax@topcoder.com">rfairfax@topcoder.com</a></li>
                                        <li>ask him to fill out this FAQ response with the details</li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="techass6"></a>How do I bounce the Compilers?
                                    <ol>
                                        <li>ask <a href="mailto:rfairfax@topcoder.com">rfairfax@topcoder.com</a></li>
                                        <li>ask him to fill out this FAQ response with the details</li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="techass7"></a>How do I bounce the Cache?
                                    <ol>
                                        <li>Telnet to 192.168.10.57 and login as apps</li>
                                        <li><span class="input">cd ~/web/scripts</span> to get to the scripts directory</li>
                                        <li><span class="input">./runcache.sh stop</span> to stop the cache</li>
                                        <li><span class="input">./runcache.sh start</span> to start it back up</li>
                                    </ol>
                                </li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="email"></a>The Mass Email System
                            <ul class="tier2">
                                <li class="tier2"><a name="email2"></a>How do I set up an email??
                                    <ol>
                                        <li>
                                            Go to <a href="http://wwww.topcoder.com/tc" target="_blank">TopCoder</a> and login, you'll
                                            have to be an admin and logged in to set up an email.
                                        </li>
                                        <li>
                                            Load the <a href="http://www.topcoder.com/email/emailServlet" target="_blank">Email Tool</a> I
                                            recommend you do this in IE as I believe mozilla doesn't like some of the
                                            javascript.
                                        </li>
                                        <li>
                                            Create an email template (this is the content that you'll sent to the recipients
                                            <ul>
                                                <li>Click "Email Templates"</li>
                                                <li>Click "create a new message template"</li>
                                                <li>Enter a name for your template</li>
                                                <li>Choose a group for you template</li>
                                                <li>
                                                    Enter your template text.  The email content should have been provided
                                                    to you using one of the templates available on the corporate drive.
                                                    Those templates include the necessary xsl code to make everything work.
                                                    Often times, m$ will add extra bad characters to the content, to solve
                                                    this, I recommend you paste the template to a basic non-microsoft editor
                                                    (like gvim) and this will either fix the characters that are bad, or
                                                    allow you to see which need fixing.  You can then copy from this editor
                                                    to the text area.  Some of the characters to watch for are ' " and -
                                                    m$ converts them to something odd.
                                                </li>
                                                <li>Click "create"</li>
                                            </ul>
                                        </li>
                                        <li>
                                            If you haven't created the distribution list yet, and it doesn't exist, you'll
                                            need to create it.  You do this by either <a href="#misc12">creating a command</a>
                                            in the query tool or setting up a static address list.
                                            There are a few things that are extremely important when writing a query.
                                            <ol>
                                                <li>Your command must be created in the Transactional database</li>
                                                <li>Your command must belong to the command group "Email"</li>
                                                <li>You should use the "email_user" view, not the user table</li>
                                                <li>
                                                    You must constrain on status='A' in your query.  People that are
                                                    not active must not get email
                                                </li>
                                                <li>
                                                    In all likelihood, you need to constrain on coder_notify.  Only those
                                                    that have signed up for your email should get it.
                                                </li>
                                                <li>
                                                    You have to alias the email address to "email_address" in order for
                                                    it to work, see below for an example.
                                                </li>
                                            </ol>
                                            Here's an example query:
                                            <p>
                                                SELECT u.email AS email_address<br />
                                                     , u.handle<br />
                                                  FROM email_user u<br />
                                                     , coder_notify n<br />
                                                 WHERE u.user_id = n.coder_id<br />
                                                   AND u.status = 'A'<br />
                                                   AND n.notify_id = 1
                                            </p>
                                            <p>Creating a static address list</p>
                                            <ul>
                                                <li>On the main menu, click "Mailing Lists"</li>
                                                <li>Click "create new mailing list"</li>
                                                <li>Enter a name for you list</li>
                                                <li>Choose a group for your list</li>
                                                <li>
                                                    Enter any additional fields you might need.  Our emails
                                                    generally address the recipient by handle, so you may need to add
                                                    a handle field
                                                </li>
                                                <li>Click "create"</li>
                                                <li>
                                                    Now you add records to your list.  You can do that in single entry
                                                    mode or bulk entry.  It's pretty straight forward.  You just need
                                                    to fill in data for the necessary fields.
                                                </li>
                                                <li>click "done" when you are</li>
                                            </ul>
                                        </li>
                                        <li>On the main menu, click "Scheduled Jobs".  We're going to actually set up the job now.</li>
                                        <li>You're now looking at upcoming and recent jobs.  Click "schedule new job".</li>
                                        <li>
                                            Enter the name that will be displayed on the email recipient's system as the sender.
                                            Example: "TopCoder Competition"
                                        </li>
                                        <li>
                                            Enter the email address that the email will come from.
                                            Example: competitions@topcoder.com
                                            competition@topcoder.com is a good address to use because bounce backs
                                            will get reported and will will disable those accounts which helps us
                                            avoid getting put into spam lists etc.
                                        </li>
                                        <li>Enter the subject of your email</li>
                                        <li>
                                            Choose a start time, this is when the email will go out.  Give yourself some
                                            time to receive the test email and check it over to be sure everything is perfect.
                                            I would recommend giving yourself more than an hour.
                                        </li>
                                        <li>
                                            Choose an end time.  This is when the system will stop trying to send your
                                            email.  Make this a day after your start time.  That will be plenty.
                                        </li>
                                        <li>Uncheck "Schedule Reminder"</li>
                                        <li>Uncheck "Schedule Report"</li>
                                        <li>
                                            Click either "choose static address list" or "choose predefined query" depending
                                            on what you have set up to use.
                                        </li>
                                        <li>Choose your list</li>
                                        <li>Choose your template</li>
                                        <li>
                                            Choose your test list.  This is the list of people that will get a test email
                                            you can create your own by creating a static address list in the "test" group.
                                            This list should include all the people that need to proof read your email.
                                        </li>
                                        <li>
                                            You're done.  Wait for you test email and check it over.  If there is a problem
                                            cancel the job, and you can start the process again.
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="email3"></a>Why aren't emails going out?
                                    <p>
                                        If you've scheduled an email and it attempted to go out, but there were errors
                                        the most likely cause is having bad characters in your template.  If there are any
                                        &amp; characters in the template, you need to "escape" them.  You should also be
                                        sure you don't have any characters that aren't part of basic ascii.  To escape a
                                        chunk of text put it within the following &lt;![CDATA[&lt;your text here&gt;]]&gt;.
                                        Likely culsprits are urls.
                                    </p>
                                    <p>
                                        If that's not the problem, then perhaps the email scheduler has crapped out.
                                        In this case, you'll want to restart it.
                                        <ol>
                                            <li>Telnet to 192.168.12.51 and login as apps</li>
                                            <li><span class="input">cd web/scripts/email</span></li>
                                            <li><span class="input">/usr/ucb/ps augxww | grep java | grep EmailJobScheduler</span></li>
                                            <li>
                                                If it's alive, this probably isn't the problem, but you shoud look at the log in
                                                this directory to see if anything is up.
                                            </li>
                                            <li>If it's not alive, then start it.  <span class="input">./emailEngine.sh</span></li>
                                            <li>Rinse and repeat on 192.168.12.52</li>
                                        </ol>
                                    </p>
                                </li>
                                <li>
                                    <a name="email4"></a>How do I send the new placement email?
                                    <p>
                                        See <a href="#email2">this</a> for details on setting up a job.  The relevant
                                        information is:
                                        <ul>
                                            <li>Sender: TopCoder Employment Services</li>
                                            <li>Email: competitions@topcoder.com</li>
                                            <li>Subject: TopCoder Employment Opportunities</li>
                                            <li>Query: new_placement_people</li>
                                            <li>Template:  placement message for new participants</li>
                                        </ul>
                                    </p>
                                </li>
                                <li>
                                    <a name="email5"></a>How do I send the next match email?
                                    <p>
                                        See <a href="#email2">this</a> for details on setting up a job.  The relevant
                                        information is:
                                        <ul>
                                            <li>Sender: TopCoder Competitions</li>
                                            <li>Email: competitions@topcoder.com</li>
                                            <li>Subject: &lt;mike will tell you&gt;</li>
                                            <li>Query: Next Competition</li>
                                            <li>Template:   SRM Match Notification</li>
                                        </ul>
                                    </p>
                                </li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="misc"></a>Misc.
                            <ul class="tier2">
                                <li class="tier2">
                                    <a name="misc1"></a>How do I put company branding in the TopCoder competition arena?
                                    <ol>
                                        <li>
                                            There are 5 seperate images that the applet uses to for sponsor logos.  Each
                                            Each of them have to be created by a graphics design staff member.  Once you have
                                            the images, you can proceed.
                                        </li>
                                        <li>
                                            Each of the files should be named similar to the following example, if they are
                                            not, please do so.<br />
                                            companyname_CodingFrame.gif<br />
                                            companyname_WatchRoom.gif<br />
                                            companyname_Lobby.gif<br />
                                            companyname_Login.gif<br />
                                            companyname_ScoreBoard.gif
                                        </li>
                                        <li>ftp the files to 192.168.12.51 and 192.168.12.52 in the ~/web/images/sponsor directory</li>
                                        <li>check the images into cvs they go in the web module.</li>
                                        <li>Now it's time to create records for the images in the informixoltp database.
                                            <ul>
                                                <li>
                                                    Your insert statements will look like the following:
                                                    <p class="input">
                                                        insert into image (image_id, file_name, image_type_id, path_id) values (xxx, 'companyname_CodingFrame.gif', 4, 4);<br />
                                                        insert into image (image_id, file_name, image_type_id, path_id) values (xxx, 'companyname_WatchRoom.gif', 5, 4);<br />
                                                        insert into image (image_id, file_name, image_type_id, path_id) values (xxx, 'companyname_Lobby.gif', 2, 4);<br />
                                                        insert into image (image_id, file_name, image_type_id, path_id) values (xxx, 'companyname_Login.gif', 7, 4);<br />
                                                        insert into image (image_id, file_name, image_type_id, path_id) values (xxx, 'companyname_ScoreBoard.gif', 3, 4);
                                                    </p>
                                                </li>
                                                <li>
                                                    You'll need to replace the "xxx" in the insert statements with actual
                                                    image_id values.  You can figure out the next image id to use by executing
                                                    the following in the informixoltp datbase <span class="input">
                                                    select max(image_id)+1 from image where image_id &lt; 10000</span>
                                                </li>
                                                <li>execute those insert statements</li>
                                            </ul>
                                        </li>
                                        <li>
                                            Next, you need to associate the images with the TopCoder company record.  You do
                                            this by executing the following in the informixoltp database:
                                            <p class="input">
                                                delete from company_image_xref where company_id = 1;<br />
                                                insert into company_image_xref values (1, xxx, 1);<br />
                                                insert into company_image_xref values (1, xxx, 1);<br />
                                                insert into company_image_xref values (1, xxx, 1);<br />
                                                insert into company_image_xref values (1, xxx, 1);<br />
                                                insert into company_image_xref values (1, xxx, 1);
                                            </p>
                                            Where "xxx" is the image_id's you used for the insert statements.
                                        </li>
                                        <li>Finally, <a href="#cache5">refresh the cache</a> with key "sponsor_image"</li>
                                        <li>Login to the competition arena and check that the images are there.</li>
                                    </ol>
                                    <p>
                                        If you need to set there to be no sponsor, then use the following in the informixoltp database.<br />
                                        <span class="input">
                                            delete from company_image_xref where company_id = 1;<br />
                                            insert into company_image_xref values (1, 1882, 1);<br />
                                            insert into company_image_xref values (1, 1883, 1);<br />
                                            insert into company_image_xref values (1, 1884, 1);<br />
                                            insert into company_image_xref values (1, 1885, 1);<br />
                                            insert into company_image_xref values (1, 1886, 1);
                                        </span>
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="misc2"></a>How do I put company branding in the Technical Assessment tool?
                                    <ol>
                                        <li>
                                            There is only one logo image for the testing tool.  You'll need to have a
                                            graphics design staff member create it for you.
                                        </li>
                                        <li>
                                            We've been much less regimented in the naming for these logos, but they
                                            should (at a minimum) contain the name of the company.
                                        </li>
                                        <li>ftp the files to 192.168.12.51 and 192.168.12.52 in the ~/web/images/testing directory</li>
                                        <li>Check the image in to cvs in the web module.</li>
                                        <li>
                                            Insert a record for this image in the informixoltp database:
                                            <p class="input">
                                                insert into image (image_id, file_name, image_type_id, path_id, height, width) values
                                                (xxx, 'companyname_Logo.gif', 12, 18, 85, 325);
                                            </p>
                                        </li>
                                        <li>
                                            You can figure out what to put in for "xxx" by executing the following in the
                                            informixoltp database:
                                            <p class="input">
                                                select max(image_id)+1 from image where image_id < 10000;
                                            </p>
                                        </li>
                                        <li>Finally, <a href="#cache5">refresh the cache</a> with key "sponsor_image"</li>
                                        <li>
                                            Login to the technical assessment tool (for a session under the company you're
                                            working with and check that the images are there.
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="misc3"></a>How do I kick someone out for cheating?
                                    <ol>
                                        <li>
                                            If you've found this dirty scoundrel immediately following a match then you need
                                            to take them out of the match with the following procedure:
                                            <ul>
                                                <li>
                                                    In the informixoltp database <span class="input">update room_result set
                                                    rated_flag = 0, point_total = 0, placed = 20, division_placed = 500,
                                                    new_rating = old_rating, attended = 'N', advanced = 'N' where coder_id = &lt;coder_id&gt;
                                                    and round_id = &lt;round_id&gt;;</span>
                                                </li>
                                                <li>
                                                    Have the contest administrator restore ratings in the admin tool and
                                                    re-run ratings
                                                </li>
                                                <li>
                                                    Then you need to set them attended again so that they show up in the
                                                    database.  In informixoltp <span class="input">update room_result
                                                    set attended = 'N' where coder_id = &lt;coder_id&gt;
                                                    and round_id = &lt;round_id&gt;;</span>
                                                </li>
                                                <li>Run the warehouse load for this round</li>
                                                <li>
                                                    Create user achievement records in the common_oltp database:
                                                    <p class="input">
                                                        insert into user_achievement (user_id, achievement_date, achievement_type_id, description)
                                                        values (&lt;user_id&gt;, mdy(mm,dd,yyyy), 2, 'xxx');
                                                    </p>
                                                    The achievement date should be the date of the contest.  The description should follow
                                                    the format of what is currently in the database.  It shoud explain what the violoation
                                                    was and who was involved.
                                                </li>
                                                <li>
                                                    Email mike and let me know who need to be emailed about having been kicked out.
                                                    If mike decides to suspend them, that information should be added to their
                                                    user achievement record.
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            Deactivate their account with the following queries:
                                            <p class="input">
                                                update informixltp:user set status = '6' where user_id = &lt;user_id&gt;;<br />
                                                update common_oltp:user set status = '6' where user_id = &lt;user_id&gt;;
                                            </p>
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="misc4"></a>How do I kick someone out for having a duplicate account?
                                    <p>
                                        If you have N accounts that are duplicates and only 1 of those accounts has
                                        competed, simple execute the sql below.  If more than one accounts have competed
                                        then you have to decide which accounts get wacked.  In general, you should
                                        keep the account with the most rated events and wack the others.  If there is a
                                        tie, then keep the older account and wack the newer.
                                    </p>
                                    <p class="input">
                                       update informixltp:user set status = '5' where user_id = &lt;user_id&gt;;<br />
                                       update common_oltp:user set status = '5' where user_id = &lt;user_id&gt;;
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="misc5"></a>How do I clear private data from the dev database after a data load?
                                    <ul>
                                        <li>For informixoltp:
                                            <p class="input">
                                                update user set email = 'foo@fooonyou.com', password = 'password';<br />
                                                update coder set address1 = '123 foo street'
                                                , address2 = 'foo town', first_name = 'first foo'
                                                , last_name = 'last foo',
                                                home_phone = '999 888 777',
                                                work_phone= '999 888 777',
                                                middle_name= 'middle foo',
                                                activation_code= '988737'
                                                where first_name != 'first foo';<br />
                                                update coder set city='foo city', zip='666', state_code = 'CT';<br />
                                                delete from audit_coder;
                                                delete from resume;
                                            </p>
                                            You also need to clear out <a href="#misc15">problem data</a>
                                        </li>
                                        <li>For common_oltp:
                                            <p class="input">
                                                update email set address  = 'foo@fooonyou.com' where 1=1;<br />
                                                update address set address1 = '123 foo street', address2 = 'foo town',
                                                city='foo city', state_code = 'CT', zip='00000', country_code = '840' where 1=1;<br />
                                                update user set first_name = 'first foo', last_name = 'last foo',
                                                activation_code= '988737', password='password' where 1=1;<br />
                                                update contact set title ='foo title' where 1=1;<br />
                                                update phone set phone_number='5551212' where 1=1;<br />
                                                update company set company_name = 'foo company' where 1=1;<br />
                                                delete from user_note_xref;<br />
                                                delete from note;<br />
                                                update security_user set password = '3aP9HbGId8UQhwHEid8pew==';
                                            </p>
                                        </li>
                                    </ul>
                                </li>
                                <li class="tier2">
                                    <a name="misc6"></a>How do I make someone an admin?
                                    <p class="input">
                                        insert into common_oltp:user_role_xref values (&lt;user_role_id&gt;, &lt;user_id&gt;, 1, 132456);<br />
                                        insert into common_oltp:user_group_xref values (&lt;user_group_id&gt;, &lt;user_id&gt;, 2000115, 132456);<br />
                                        update informixoltp:rating set rating =-1 where coder_id = &lt;user_id&gt;;<br />
                                        insert into informixoltp:group_user values (13, &lt;user_id&gt;);
                                    </p>
                                    <p>
                                        You can figure out the user_role_id with <span class="input">select
                                        max(user_role_id)+1 from common_oltp:user_role_xref where user_role_id < 1000</span>
                                        You can figure out the user_group_id with <span class="input">select max(user_group_id)+1
                                        from user_group_xref where user_group_id < 100</span>
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="misc8"></a>What do I do if someone complains school information isn't correct (for ranking etc.)?
                                    <p>
                                        Most likely, this means that the school in question needs to be normalized.  During
                                        registration, if the user doesn't enter the exactly correct school name, then
                                        a new school record gets created for them.  Occasionally, we need to go through
                                        and make all the people who are associated with a school record that is not *the*
                                        record for the school join the crowd.
                                    </p>
                                    <ol>
                                        <li>
                                            You can root out all the school records that are extra by executing a query like
                                            <span class="input">select * from school where lower(name) like '%xxx%'</span>
                                            in the informixoltp database where 'xxx' is a substring of the correct school name.
                                            You can proceeed like that to figure out all the school
                                            records that should be normalized.  The correct school will be the one with the lowest
                                            school_id, it will also have a user_id=0 if we've ever normalized for this school
                                            before.  user_id=0 basically means that the school is system generated or approved
                                            by TopCoder.
                                        </li>
                                        <li>
                                            Once you know *the* school, and have your list of school_id's
                                            you can run the following <span class="input">update current_school set school_id = &lt;school_id&gt;
                                            where school_id in (&lt;school_id_list&gt;);</span>
                                        </li>
                                        <li>
                                            School information is also stored in the demographic_response tables.  You can
                                            also normalize this data.  You can figure out which coder's should be normalized
                                            by running <span class="input">select * from demographic_response where demographic_question_id = 20
                                            and demographic_response like '%xxx%''</span> where 'xxx' is a substring of the correct
                                            school name.  This will give you a list of users that can be updated with <span class="input">
                                            update current_school set school_id = &lt;school_id&gt; and coder_id in (&lt;user_id_list&gt;);</span>
                                            school_id is *the* school.
                                        </li>
                                        <li>
                                            Once you have updated the current school records, you need to load the warehouse
                                            with the data.  You only need to run the coder load, you can see details <a href="#main9">here</a>.

                                        </li>
                                        <li>After the warehouse has been updated, you need to <a href="#cache6">clear the cache</a>.</li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="misc9"></a>How do I find out someone's password that is encrypted in the database?
                                    <ol>
                                        <li>Telnet to 192.168.12.52 and login as apps</li>
                                        <li><span class="input">./pass.sh &lt;handle&gt;</li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="misc10"></a>How do I set someone's password that is encrypted in the database?
                                    <ol>
                                        <li>Telnet to 192.168.12.52 and login as apps</li>
                                        <li><span class="input">./setpass.sh &lt;handle&gt; &lt;new_password&lt;</li>
                                        <li>
                                            If this user is a topcoder member, then you'll need to update their user
                                            record in informixoltp as well.  <span class="input">update user set password =
                                            &lt;password&gt; where user_id = &lt;user_id&gt;;
                                        </li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="misc12"></a>How do I create a query in the query system?
                                    <p>
                                        The query tool contains queries which one can execute programatically and fetch
                                        the results.  One can associate a number of queries with a single command.
                                        In this way, if you have a single page that needs a number of different datasets
                                        you can associate all the relevant queries with a single command.  When the command
                                        is executed, you will get the results from each of your queries in seperate
                                        ResultSetContainer objects.  See the codebase for examples, this is used
                                        throughout the web site middle tier code.
                                    </p>
                                    <ol>
                                        <li>Make sure you are logged in to www.topcoder.com/tc</li>
                                        <li><a href="http://www.topcoder.com/query/query" target="_blank">Load the query tool</a></li>
                                        <li>Choose the database that you would like to contain your query</li>
                                        <li>Click "New Query"</li>
                                        <li>
                                            Enter a name for your query.  You will use this name to programatically reference
                                            the results of this query.
                                        </li>
                                        <li>
                                            If you would like to have ranking information added to your results, choose
                                            true for ranking
                                        </li>
                                        <li>
                                            If you choose true for ranking, you will have to tell the system which column
                                            you would like to rank.  For example if you would like to rank coders by
                                            rating, you would enter the index of the rating column.  This is a 1-based
                                            index.
                                        </li>
                                        <li>Enter the text of the query.</li>
                                        <li>Click "save"</li>
                                        <li>If your query takes any input, click "edit query input"</li>
                                        <li>Add whatever inputs your query takes.</li>
                                        <li>
                                            If any of your query parameters are optional, set them as such and add
                                            a default value.
                                        </li>
                                        <li>Set sort values.  They need to be unique, you should just count from 1 up</li>
                                        <li>Click "save"</li>
                                        <li>Click "New Command"</li>
                                        <li>Enter a name for your command</li>
                                        <li>Select the appropriate command group</li>
                                        <li>Click "save"</li>
                                        <li>Click "edit command query"</li>
                                        <li>Associate the query(s) with your new command</li>
                                    </ol>
                                </li>
                                <li class="tier2"><a name="misc13"></a>How do I modify a query in the query system?
                                    <p>
                                        Check <a href="#misc12">here</a>, I bet you can figure it out.
                                    </p>
                                </li>
                                <li class="tier2"><a name="misc14"></a>How do I deactivate bad email addresses?
                                    <ol>
                                        <li>In common_oltp</li>
                                        <li>
                                            <span class="input">
                                                select 'update email set status_id = 3 where lower(address) = ''' || lower(to_address) || ''';'<br />
                                                , 'update email_bounce_log set processed_ind = 1 where processed_ind = 0 ' ||<br />
                                                  'and lower(to_address) = ''' || lower(to_address) || ''';--'<br />
                                                , count(*)<br />
                                                    from email_bounce_log<br />
                                                    where processed_ind = 0<br />
                                                and bounce_type <> 'NB'<br />
                                                group by 1,2<br />
                                                having count(*) > 4<br />
                                                order by 3 desc<br />
                                            </span>
                                        </li>
                                        <li>Execute the queries that the prior query generated.</li>
                                    </ol>
                                </li>
                                <li class="tier2">
                                    <a name="misc15"></a>How do I clear out problem data from the dev database after a data load?
                                    <p>
                                        Prior to running any of the following, get a list of solution_id's.  You will need to plug this
                                        in to the 5th query.  <span class="input">select solution_id || ',' from problem_solution
                                        where problem_id in (select problem_id from problem where status_id < 90)</span>
                                    </p>
                                    <p class="input">
                                        delete from solution_history where solution_id in (select solution_id from
                                        problem_solution where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from component_solution_xref where solution_id in (select solution_id from
                                        problem_solution where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from solution_class_file where solution_id in (select solution_id from
                                        problem_solution where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from problem_solution where problem_id in (select problem_id from problem
                                        where status_id < 90);<br />
                                        delete from solution where solution_id in (&lt;solution_id list&gt;);<br />
                                        delete from round_component where component_id in (select component_id from
                                        component where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from challenge where component_id in (select component_id from component
                                        where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from system_test_result where test_case_id in (select test_case_id from
                                        system_test_case where component_id  in (select component_id from component where
                                        problem_id in (select problem_id from problem where status_id < 90)));<br />
                                        delete from system_test_case where component_id in (select component_id from
                                        component where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from problem_statement_history where problem_id  in (select problem_id
                                        from problem where status_id < 90);<br />
                                        delete from correspondence_read_xref;<br />
                                        update correspondence set reply_id = null;<br />
                                        delete from correspondence;<br />
                                        delete from mpsqas_chat_history  where problem_id in (select problem_id from
                                        problem where status_id < 90);<br />
                                        delete from component_user_xref where component_id  in (select component_id from
                                        component where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from compilation where component_state_id in (select component_state_id
                                        from component_state where component_id in (select component_id from component
                                        where problem_id in (select problem_id from problem where status_id < 90)));<br />
                                        delete from submission_class_file where component_state_id in (select component_state_id
                                        from component_state where component_id in (select component_id from component
                                        where problem_id in (select problem_id from problem where status_id < 90)));<br />
                                        delete from submission where component_state_id in (select component_state_id from
                                        component_state where component_id in (select component_id from component where
                                        problem_id in (select problem_id from problem where status_id < 90)));<br />
                                        delete from compilation_class_file where component_state_id in (select component_state_id
                                        from component_state where component_id in (select component_id from component where
                                        problem_id in (select problem_id from problem where status_id < 90)));<br />
                                        delete from component_state where component_id in (select component_id from component
                                        where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from broadcast where component_id in (select component_id from component
                                        where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from component_web_service_xref where component_id in (select component_id
                                        from component where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from component_category_xref where component_id in (select component_id from
                                        component where problem_id in (select problem_id from problem where status_id < 90));<br />
                                        delete from component where problem_id in (select problem_id from problem where status_id < 90);<br />
                                        delete from problem_user_request where problem_id  in (select problem_id from
                                        problem where status_id < 90);<br />
                                        delete from problem_payment where problem_id in (select problem_id from problem where status_id < 90);<br />
                                        delete from problem_web_service_xref where problem_id in (select problem_id from problem where status_id < 90);<br />
                                        delete from problem_rating where problem_id in (select problem_id from problem where status_id < 90);<br />
                                        delete from problem where status_id < 90;
                                    </p>

                                </li>
                                <li class="tier2">
                                    <a name="misc16"></a>How do I figure out the basic Coder of the Month?
                                    <p>
                                        The following query finds the people with the highest average rating gain.<br />
                                        <span class="input">
                                            select sum(case when rr.old_rating > 0 then rr.new_rating-rr.old_rating else 0 end)<br />
                                                 /sum(case when rr.old_rating > 0 then 1 else 0 end)<br />
                                                 , c.coder_id<br />
                                                 , count(*)<br />
                                                 , c.handle<br />
                                              from room_result rr<br />
                                                 , coder c<br />
                                                 , round r<br />
                                                 , calendar cal<br />
                                             where cal.month_numeric = &lt;month&gt;<br />
                                               and cal.year = &lt;year&gt;<br />
                                               and rr.coder_id = c.coder_id<br />
                                               and cal.calendar_id = r.calendar_id<br />
                                             and r.round_id =rr.round_id<br />
                                             group by c.coder_id, c.handle<br />
                                            having count(*) > 2<br />
                                             order by 1 desc
                                        </span>
                                    </p>
                                </li>
                                <li class="tier2">
                                    <a name="misc17"></a>How do I track hits to particular links on the site?
                                    <ol>
                                        <p>
                                            Create the link similar to the following<br />
                                            &lt;a href="http://www.topcoder.com/?t=sponsor&c=link&link=&lt;link&gt;&refer=&lt;id&lt;"&gt;&lt;text&gt;&lt/a&gt;<br />
                                            &lt;link&gt; is the link you would like to track.  It's where the user will be taken if they click this.<br />
                                            &lt;id&gt; is an identifier so that you can tell where the person click on it.
                                            For example, lets say you have a number of links to www.topcoder.com, using the id
                                            you can identify which links where actually clicked.  Keep in mind that the system does
                                            not track clicks by people in the topcoder office network, so if you're looking for
                                            the results, you're out of luck.  You can see the results
                                            <a href="http://www.topcoder.com/tc?module=LegacyReport&t=report_result&report_id=15" target="_blank">here</a>.
                                        </p>
                                    </ol>
                                </li>

                            </ul>
                        </li>
                    </ul>

                </div>
            </div>

        </div>


    </body>
</html>




