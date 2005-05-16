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
                        <li><a href="#main">Main TopCoder Site</a></li>
                        <ul>
                            <li><a href="#main1">How do I do a production move for the www.topcoder.com?</a></li>
                            <li><a href="#main2">How do I add a forum to the round tables?</a></li>
                            <li><a href="#main3">How do I delete a forum post?</a></li>
                            <li><a href="#main4">What do I do if I'm getting marshalling errors on jive filter objects?</a></li>
                            <li><a href="#main5">What do I do if I'm getting marshalling errors on ResultSetContainer objects?</a></li>
                            <li><a href="#main6">How do I put up new member photos?</a></li>
                            <li><a href="#main7">How do I take down a member photo?</a></li>
                            <li><a href="#main8">How do I build the code for www.topcoder.com?</a></li>
                            <li><a href="#main9">How do I add a report to the internal reporting site?</a></li>
                        </ul>
                        <li><a href="#cache">The Cache</a></li>
                        <ul>
                            <li><a href="#cache1">How do I do a production move for the cache?</a></li>
                            <li><a href="#cache2">How do I bounce the cache?</a></li>
                            <li><a href="#cache3">What is dependant on the cache?</a></li>
                            <li><a href="#cache4">What is dependant on the/a cache?</a></li>
                            <li><a href="#cache5">What is dependant on the cache?</a></li>
                        </ul>
                        <li><a href="#software">TopCoder Software</a></li>
                        <ul>
                            <li><a href="#software1">How do I do a production move for the www.topcodersoftware.com?</a></li>
                            <li><a href="#software2">What do I do if I'm getting marshalling errors on ResultSetContainer objects?</a></li>
                        </ul>
                        <li><a href="#techass">The Technical Assessment System</a></li>
                        <ul>
                            <li><a href="#techass1">How do I do a production move for the www.topcoder.com/techassess/techassess?</a></li>
                            <li><a href="#techass2">How do I bounce the Technical Assessment tool?</a></li>
                        </ul>
                        <li><a href="#email">The Mass Email System</a></li>
                        <ul>
                            <li><a href="#email1">Can I please have some general guidelines?</a></li>
                            <li><a href="#email2">Why aren't emails going out?</a></li>
                            <li><a href="#email3">Why does my email not work?</a></li>
                        </ul>
                        <li><a href="#misc">Misc.</a></li>
                        <ul>
                            <li><a href="#misc1">How do I put company branding in the TopCoder competition arena?</a></li>
                            <li><a href="#misc2">How do I put company branding in the Technical Assessment tool?</a></li>
                            <li><a href="#misc2">How do I kick someone out for cheating?</a></li>
                            <li><a href="#misc2">How do I kick someone out for having a duplicate account?</a></li>
                        </ul>
                    </ul>
                </div>

                <div id="detail">
                    <ul class="tier1">
                        <li class="tier1"><a name="main"></a>Main TopCoder Site</li>
                        <ul class="tier2">
                            <li class="tier2">
                                <a name="main1"></a>How do I do a production move for the www.topcoder.com?
                                <ol>
                                    <li>Telnet to 192.168.12.51</li>
                                    <li>Telnet to 192.168.12.52</li>
                                    <li>On both boxes <span class="input">cd web</span> to move to our base directory</li>
                                    <li>Execute <span class="input">./backup.sh</span> on both .51 and .52</li>
                                    <li><a href="#main8">Build the code</a></li>
                                    <li>ftp the build.jar to 192.168.12.51 in the ~/web directory</li>
                                    <li><a name="bu52">Bring up the .52 instance of weblogic</a>
                                        <ul>
                                            <li>In your telnet session to .52, type <span class="input">wl</span> to move to the weblogic home directory</li>
                                            <li><span class="input">start</span> to start this weblogic instance.  By running an instance on .52, it allows you to have a working website while you move code to the .51 box</li>
                                        </ul>
                                    </li>
                                    <li>Bring down the .51 instanceof weblogic</li>
                                        <ul>
                                            <li><span class="input">/usr/ucb/ps augxww | grep java | grep apps | grep 1024</span> locate the correct process id to kill</li>
                                            <li><span class="input">kill -9 &lt;pid&gt;</span> to kill the weblogic process</li>
                                            <li><span class="input">tn</span> this tails the weblogic log, the last thing you see should be "Killed", if not, you killed the wrong pid
                                        </ul>
                                    </li>
                                    <li>In your telnet session to .51, in the ~/web directory, explode the jar by typing <span class="input">jar xvf build.jar</span></li>
                                    <li>In your telnet session to .51, in the ~/web directory, move the files to the correct locations by typing <span class="input">ant move</span></li>
                                    <li>Bring up the .51 instance of weblogic similarly to how you <a href="#bu52">brought up .52</a></li>

                                </ol>
                            </li>
                            <li class="tier2"><a name="main2"></a>How do I add a forum to the round tables?</li>
                            <li class="tier2"><a name="main3"></a>How do I delete a forum post?</li>
                            <li class="tier2"><a name="main4"></a>What do I do if I'm getting marshalling errors on jive filter objects?</li>
                            <li class="tier2"><a name="main5"></a>What do I do if I'm getting marshalling errors on ResultSetContainer objects?</li>
                            <li class="tier2"><a name="main6"></a>How do I put up new member photos?</li>
                            <li class="tier2"><a name="main7"></a>How do I take down a member photo?</li>
                            <li class="tier2"><a name="main8"></a>How do I build the code for www.topcoder.com?
                                <ol>
                                    <li></li>
                                </ol>
                            </li>
                            <li class="tier2"><a name="main9"></a>How do I add a report to the internal reporting site?</li>


                        </ul>
                        <li class="tier1"><a name="cache"></a>The Cache</li>
                        <ul class="tier2">
                            <li class="tier2"><a name="cache1"></a>How do I do a production move for the cache?</li>
                            <li class="tier2"><a name="cache2"></a>How do I bounce the cache?</li>
                            <li class="tier2"><a name="cache3"></a>What is dependant on the cache?</li>
                            <li class="tier2"><a name="cache4"></a>What is dependant on the/a cache?</li>
                            <li class="tier2"><a name="cache5"></a>What is dependant on the cache?</li>
                        </ul>
                        <li class="tier1"><a name="software"></a>TopCoder Software</li>
                        <ul class="tier2">
                            <li class="tier2"><a name="software1"></a>How do I do a production move for the www.topcodersoftware.com?</li>
                            <li class="tier2"><a name="software2"></a>What do I do if I'm getting marshalling errors on ResultSetContainer objects?</li>
                        </ul>
                        <li class="tier1"><a name="techass"></a>The Technical Assessment System</li>
                        <ul class="tier2">
                            <li class="tier2"><a name="techass1"></a>How do I do a production move for the www.topcoder.com/techassess/techassess?</li>
                            <li class="tier2"><a name="techass2"></a>How do I bounce the Technical Assessment tool?</li>
                        </ul>
                        <li class="tier1"><a name="email"></a>The Mass Email System</li>
                        <ul class="tier2">
                            <li class="tier2"><a name="email1"></a>Can I please have some general guidelines?</li>
                            <li class="tier2"><a name="email2"></a>Why aren't emails going out?</li>
                            <li class="tier2"><a name="email3"></a>Why does my email not work?</li>
                        </ul>
                        <li class="tier1"><a name="misc"></a>Misc.</li>
                        <ul class="tier2">
                            <li class="tier2"><a name="misc1"></a>How do I put company branding in the TopCoder competition arena?</li>
                            <li class="tier2"><a name="misc2"></a>How do I put company branding in the Technical Assessment tool?</li>
                        </ul>
                    </ul>

                </div>
            </div>

        </div>


    </body>
</html>