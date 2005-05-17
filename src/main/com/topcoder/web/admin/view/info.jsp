<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
    <head>
        <title>TopCoder Admin</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <div id="container">
            <jsp:include page="top.jsp"/>

            <div id="leftNav">
            </div>

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
                                <li><a href="#cache4">What is dependant on the/a cache?</a></li>
                                <li><a href="#cache5">How do I remove objects from the cache?</a></li>
                                <li><a href="#cache6">How do I clear the cache?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#software">TopCoder Software</a>
                            <ul>
                                <li><a href="#software1">How do I do a production move for the www.topcodersoftware.com?</a></li>
                                <li><a href="#software2">What do I do if I'm getting marshalling errors on ResultSetContainer objects?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#techass">The Technical Assessment System</a>
                            <ul>
                                <li><a href="#techass1">How do I do a production move for the www.topcoder.com/techassess/techassess?</a></li>
                                <li><a href="#techass2">How do I bounce the Technical Assessment tool?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#email">The Mass Email System</a>
                            <ul>
                                <li><a href="#email1">Can I please have some general guidelines?</a></li>
                                <li><a href="#email2">Why aren't emails going out?</a></li>
                                <li><a href="#email3">Why does my email not work?</a></li>
                                <li><a href="#email4">What is the key information for the new placement email?</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#misc">Misc.</a>
                            <ul>
                                <li><a href="#misc1">How do I put company branding in the TopCoder competition arena?</a></li>
                                <li><a href="#misc2">How do I put company branding in the Technical Assessment tool?</a></li>
                                <li><a href="#misc2">How do I kick someone out for cheating?</a></li>
                                <li><a href="#misc2">How do I kick someone out for having a duplicate account?</a></li>
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
                                                <li>Load <a href="http://www.topcoder.com/jive/skins/admin/index.jsp">the jive admin site</a></span></li>
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
                                            Load <a href="http://www.topcoder.com">our site</a> and search for every coder
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
                                <li class="tier2"><a name="main8"></a>How do I load information into the warehouse after a round?
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
                                        <li></li>
                                        <li></li>
                                        <li></li>
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
                                <li class="tier2"><a name="software1"></a>How do I do a production move for the www.topcodersoftware.com?</li>
                                <li class="tier2"><a name="software2"></a>What do I do if I'm getting marshalling errors on ResultSetContainer objects?</li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="techass"></a>The Technical Assessment System
                            <ul class="tier2">
                                <li class="tier2"><a name="techass1"></a>How do I do a production move for the www.topcoder.com/techassess/techassess?</li>
                                <li class="tier2"><a name="techass2"></a>How do I bounce the Technical Assessment tool?</li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="email"></a>The Mass Email System
                            <ul class="tier2">
                                <li class="tier2"><a name="email1"></a>Can I please have some general guidelines?</li>
                                <li class="tier2"><a name="email2"></a>Why aren't emails going out?</li>
                                <li class="tier2"><a name="email3"></a>Why does my email not work?</li>
                            </ul>
                        </li>
                        <li class="tier1"><a name="misc"></a>Misc.
                            <ul class="tier2">
                                <li class="tier2"><a name="misc1"></a>How do I put company branding in the TopCoder competition arena?</li>
                                <li class="tier2"><a name="misc2"></a>How do I put company branding in the Technical Assessment tool?</li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>

        </div>


    </body>
</html>




