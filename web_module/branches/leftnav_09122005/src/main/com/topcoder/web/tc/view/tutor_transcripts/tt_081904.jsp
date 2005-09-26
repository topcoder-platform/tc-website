<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tutor Transcripts</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="tutor_transcripts"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">

            <h2>SRM 208 Tutor Transcript</h2>

			<table width="100%" border="0" cellspacing="0" class=bodyText>
				<tr><td class=tutorHeader>Handle</td><td width="100%" class=tutorHeader>Comment</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>howdy folks</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>I don't have any real format planned here.  If anybody has any questions or comments, shoot.</td></tr>
<tr><td class=tutorOdd><b>mike</b></td><td class=tutorOdd>lively crowd</td></tr>
<tr><td class=tutorEven><b>NeverMore</b></td><td class=tutorEven>heh</td></tr>
<tr><td class=tutorOdd><b>NeverMore</b></td><td class=tutorOdd>not too big a crowd either. :S</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>Ok, I'll make a comment to start with.  I really wish "reachable queen" had been defined in the 500.  :-)</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>ok, so my first question. did you draw picture before you solved 1k?</td></tr>
<tr><td class=tutorEven><b>NeverMore</b></td><td class=tutorEven>there was a broadcast, wasn't there... ?</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>Not on this one, but I very often do.</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>or did anybody who solved it?</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>NeverMore: yes, in response to my clarification question</td></tr>
<tr><td class=tutorEven><b>NeverMore</b></td><td class=tutorEven>vorthys: cool</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>In Java you can make huge arrays like int[][][][]</td></tr>
<tr><td class=tutorEven><b>Tron3k</b></td><td class=tutorEven>but in C++ you have to do ridiculous things like</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>vector&lt;vector&lt;vector&lt;int&gt; &gt; &gt;</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>Tron3k: you can still use arrays, but then you don't have all the convenient methods you get with vectors</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>because I can't believe that i didn't see that we are actually finding 3 paths from (0,0) to (n,m)</td></tr>
<tr><td class=tutorEven><b>Tron3k</b></td><td class=tutorEven>vorthys: let's say I wanted an int[1000000] or something. would it be ok if i made it global?</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>vorthys: i.e. no stack overflow?</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>marian: yeah, having the 2nd pass be backwards was (deliberately) misleading</td></tr>
<tr><td class=tutorOdd><b>antimatter</b></td><td class=tutorOdd>Tron3k: do you mean "ok" as in "won't run out of memory"?</td></tr>
<tr><td class=tutorEven><b>Tron3k</b></td><td class=tutorEven>yeah i guess</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>i usually would do vector&lt;int&gt; v(1000000)</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>Tron3k: when you define it as global, you're ok</td></tr>
<tr><td class=tutorOdd><b>antimatter</b></td><td class=tutorOdd>the memory limits are 64MB, so it's perfectly fine either way.</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>antimatter: be careful because stack is smaller</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>Should I declare it inside the class or just plain global?</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>marian: i've never, ever, run into any issues with stack overflow, though.</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>antimatter: what, you've never had an infinite recursion? :-)</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>vorthys: i don't think it's ever happened in TC, at least.  which surprises me :)</td></tr>
<tr><td class=tutorOdd><b>antimatter</b></td><td class=tutorOdd>vorthys: definitely elsewhere, but not here :)</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>antimatter: I agree, I've never had a TC stack overflow that wasn't a bug</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>antimatter: look at my 500</td></tr>
<tr><td class=tutorEven><b>Tron3k</b></td><td class=tutorEven>interesting</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>with int[1000000] on the stack it works</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>it does segfault</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>but with int[10000000] it gives segfault</td></tr>
<tr><td class=tutorEven><b>Tron3k</b></td><td class=tutorEven>hmmm</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>Tron3k: because stack size is 8mb</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>ah, ok.  i think i've just been ingrained with something like "you need a variable, you make it global" for contests like this :)</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>marian: ok cool</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>antimatter: that's clear :)</td></tr>
<tr><td class=tutorOdd><b>Tron3k</b></td><td class=tutorOdd>antimatter: yeah me too, hehe</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>I had an annoying bug on the 1000, where I said val[x2][y2] where I meant val[x3][y3].  Took about 15 minutes to track it down... :-(  I'm not sure if more distinctive names would have helped or not.</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>vorthys: because of similiar bug I didn't advance to acm finals :)</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>vorthys: did you follow the approach laid out in the editorial, or use the (more common?) approach used by venco, for instance?</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>marian: hah, I didn't advance to the finals because my school didn't have a team! (how's that for hubris?! :-)</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>lars2520: I'm not sure what venco did.  I did DP, but didn't bother separating high-middle-low paths.</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>it seems like most people took the approach of moving the three paths 1 unit at a time, trying all 8 permutations of directions</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>the real difference is that vorthys is DPing along diagonals</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>lars2520: that's what I did</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>yeesh.  if i had only realized that 50^3*100 == 12.5 million, not 62.5 million... my solution for the 1k would have been so much nicer.</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>antimatter: your 100 is number of steps?  (as opposed to 50^4)</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>vorthys: 100 being number of steps.  i saw the diagonal approach first.</td></tr>
<tr><td class=tutorOdd><b>antimatter</b></td><td class=tutorOdd>vorthys: that is, take three paths at x=0.  at each time step, all we need to keep are their x coords.  run for (W+H-2) timesteps.</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>antimatter: yep, I did the same but inferred the time step from the x,y of the first path.</td></tr>
<tr><td class=tutorOdd><b>antimatter</b></td><td class=tutorOdd>vorthys: well, except that the catch is, i thought a straight DP would run out of memory...</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>vorthys: so i only keep the current time step, and generate the next, and then throw away the previous one.</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>anyway, I want to warn everybody about dynamic memory allocation</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>vorthys: which took some hackery to get to run in time :)</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>antimatter: ahh, yes.</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>my 1k failed because I used dynamic memory allocation instead of large arrays</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>if you do the left to right scan, it ends up being a good bit faster</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>and uses only half the memory</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>see my 500 if interested</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>I got stack overflow in java when I recursively made a spiral in a 100*100 matrix</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: (I apologize in advance for being mean :-)  You must be here to ask a question about the 250?  (Ok, you can hit me now...)</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: yeah, can anyone explain to me why i failed the 250?</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>I'm not even sure why does it segfaults, but it surely has something to do how the memory is allocated</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>marian: probably a 40M stack is outrageous</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>stack?</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>marian: put that in the static area and you'll be okay</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>marian: yeah, auto variables are stored on the stack</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>i don't use stack</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>marian: yes, you use auto variables, and those are stored on the stack area</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>isn't that stored in heap when I allocate it using new?</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>marian: if you allocate using new, but in your 500 you allocate using an automatic declaration</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>radeye: but i allocate one pointer</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>marian: you allocate a huge array , not a pointer</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>marian: int foo[10000000] in a function allocates 40MB on the stack</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>no, that's global variable</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>marian: what's global about it?</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>it's outside class. this code doesn't segfault</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>marian: maybe you didn't resubmit the code you're talking about?</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>ouch</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>yeah, i think we are talking about different code</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>that's right :)</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>radeye's just racking up the points!</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>the point is that it looks like I'm using the same amount of memory, but obviously I'm not</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>dumb question.  what if you run the first loop, but comment out the big honking array?  (or did you do that?)</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>of course</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>marian: eh?  tell us more?</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>marian: i don't get the problem</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>each time you allocate memory, there's some header information that gets allocated too.</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>vorthys: yes that is the point</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>so allocating 100 words one at a time uses more space than 100 words all at once</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>right, the memory allocation overhead is killing you</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>by a long shot</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>most allocators have eight bytes overhead</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>plus some rounding overhead to make it be aligned properly</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>so in this case you're allocating (16 + 8) or 24 bytes per</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>somebody non-red, join in!</td></tr>
<tr><td class=tutorOdd><b>UFP2161</b></td><td class=tutorOdd>duh?</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>radeye: yes, we know about heap overflows :)</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>go cosim.ro!  go go go!</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>Cosmin.ro: what challenge case are you using?</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>random 50*50</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>i liked the 1000; it took me a lot longer than it should have :-)</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>did anyone recall the MoneyRun problem?</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>the div 1 hard was very similar, though with harder limits</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: in think time or debug time?</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>lars2520: what was it about?</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: i spent lots of time debugging</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: both, but mostly think time</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>vorthys: i spent a fair bit of time debugging</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: i did diagonals, and I spent too long getting the limits on the diagonals right</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>marian: mostly the same, but with 2 paths instead of 3</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: i should have just tested inside the loop</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>marian: and small enough to BF</td></tr>
<tr><td class=tutorEven><b>antimatter</b></td><td class=tutorEven>radeye: what do you mean by limits on diagonals?</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>vorthys: well, you understand what i mean by diagonals?  i tried to compute the min and max y value for each loop</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>is the 1k doable with network flow?</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>min cost network flow I mean</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>Cosmin.ro: I don't think so</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: yep, I tested in the loop and continued</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: smart</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>vorthys: doesn't affect the runtime materially</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>vorthys: but even at 50^4 i was worried about runtime; should not have been</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: yeah, when you start talking several million operations, alarms start to go off, but several million *simple* operations are nothing</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>lol</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>Cosmin.ro: hah, got one</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>how did you do that twice?</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>you can get as many points as you want</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>well</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>I think they allowed it</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>so that you can train at challanging</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>but they forgot to count it only once</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>so you can get astronomical score in practice rooms :)</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>a feature not a bug :))</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>it's nice to have disscutions like this</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>it's cool</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>but only 3 tasks ... you don't have too much to talk about ..</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>if the turnup is bigger</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>than you would repeat the same thing again and again</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>Cosmin.ro:  5 tasks potentially, but your point is taken</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>maybe some algo stuff</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>or some tutorials</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>we could have fastest runtime, and shortest code, contests here too</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>like how to make one kind of dp</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>like the question i posted to forums recently :)</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>especially if the applet would report those figures :-)</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>yeah that's interessting</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>radeye: fastest runtime (maybe by language) but I'd be much more interested in clearest code than shortest code</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>radeye: especially if that applet could report  **that** figure :-)</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>marian: tell it again maybe they can help us on that question</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>yeah but that's much harder to judge</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>http://www.topcoder.com/rtables/viewThread.jsp?forum=7167&thread=340760&mc=3</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>I wonder if you could develop a system to judge code based on elegance</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>absolutely</td></tr>
<tr><td class=tutorEven><b>Nagi</b></td><td class=tutorEven>Nahas	marian: But isn't correct that the "modified BFS" actually performs the same relaxations as BellmanFord</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>just define elegance any way you want :-)</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>they grade test essay's automatically these days</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>nagi Nahas: i couln't prove it</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>lars2520: we can check conformance to coding style ;-)</td></tr>
<tr><td class=tutorOdd><b>lars2520</b></td><td class=tutorOdd>nicka81: yeah, but there is more too it than that</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>yes, and penalize for use of macros</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>radeye: no-oo</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>penalize for use of C++</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>radeye: I like macros</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>macros are evil</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>radeye: evil but seductive</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>nagi Nahas: what I lack is a sound argument for this claim</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>penalize coding library in code</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>not seductive if you've programmed for a while</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>radeye: I don't use macros very often in real life</td></tr>
<tr><td class=tutorEven><b>Nagi</b></td><td class=tutorEven>Nahas	marian: Yes, I am trying to come up with one.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>radeye: but for TC they do so good</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>what do you people say about this?</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>http://www.topcoder.com/rtables/viewThread.jsp?forum=7166&thread=340694&mc=3</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>radeye: what will I do without ri,rj,fe,bz e.t.c. ?</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>lars2520: the only systems I've been able to come up with involve competitors rating some sampling of other people's code, but that's obviously open to abuse if points are involved</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>the us would have a more or less constant rating history graph</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>US</td></tr>
<tr><td class=tutorEven><b>Nagi</b></td><td class=tutorEven>Nahas	marian: I am thinking along the lines of getting an explicit correspodence between each relaxation in the modified algo and BF</td></tr>
<tr><td class=tutorOdd><b>marian</b></td><td class=tutorOdd>Cosmin.ro: my country is not even on list :)</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>but for the rest I think it would be interessting :)</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>marian: get your team mates to participate</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>Cosmin.ro: I got one. he was 4th in the div 2 today</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>marian: that's how Romania started :)</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>it seems to me that shorter solutions are typically more elegant, provided they don't do too many things in one line</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>marian: and we got some topcoders change the country they participate for</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>marian: they are currently residing in US and Canada</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>marian:  so our country rating would go up :)</td></tr>
<tr><td class=tutorEven><b>marian</b></td><td class=tutorEven>Cosmin.ro: :)</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>radeye: are you polish?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Cosmin.ro: you can change the country of residence without changing the country to represent</td></tr>
<tr><td class=tutorOdd><b>radeye</b></td><td class=tutorOdd>Cosmin.ro: my grandparents are (two of them)</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>lars2520: you can certainly measure size by tokens, and that's not a bad gross estimate</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>nicka81: yes but a year or so ago the residence country == the country you represent</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>Kolmogorov complexity</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>radeye: oh I thougth you were born there</td></tr>
<tr><td class=tutorEven><b>radeye</b></td><td class=tutorEven>nah, I was (beat) born in the U.S.A.</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>radeye:  ok :)</td></tr>
<tr><td class=tutorEven><b>lars2520</b></td><td class=tutorEven>vorthys: I think you'd want to do something to prevent too much from going on in a single statement too</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>can you guys help me on this task?</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>http://acm.sgu.ru/problem.php?contest=0&problem=229</td></tr>
<tr><td class=tutorOdd><b>vorthys</b></td><td class=tutorOdd>lars2520: that's more an issue of "elegance of expression" vs "elegance of the algorithm", but both are important</td></tr>
<tr><td class=tutorEven><b>Cosmin.ro</b></td><td class=tutorEven>I've been at it for a while</td></tr>
<tr><td class=tutorOdd><b>Cosmin.ro</b></td><td class=tutorOdd>but can't do anything reasonable</td></tr>
<tr><td class=tutorEven><b>vorthys</b></td><td class=tutorEven>so long folks</td></tr>



			</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
