<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
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
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
						<div align="center"><IMG SRC="/i/pressroom/avidpronet_frontpage.jpg" ALT="" border="0"/></div><BR/>
						<p><span class="bodyTitle">Gladiator geeks&#8230;</span><BR/></p>
                        </div>
						Jul 2, 2001 7:03 PM<BR/>
						by Jared Kendall<BR/><BR/>
						Oftentimes my readers write to ask why I chose to cover a particular topic, so I've decided to start including a personal note with each column. Here's my 
						thinking for this column:<BR/><BR/>Human beings thrive on competition -- even reclusive, sedentary nerd types. I think good programmers would love to have 
						a way to prove their talent, and TopCoder will finally give them a way to do it. It'll be interesting to see how things play out.<BR/><BR/>
						Computer programmers are like spouses. Everyone wants the best, but by the time you really get to know yours, it's often too late. Like spouses, there never seem to be enough to go 
						around. You have a hard time telling whether yours is any good. Even if the one you end up with is lousy, you're afraid to lose them, on the chance that the next one could be even worse.<BR/><BR/>
						It's a stormy business relationship, to say the least.<BR/><BR/>TopCoder thinks it may have a solution: Programming tournaments. The idea is to take a bunch of 
						programmers, and set them up in direct, head-to-head competition to see just how good they really are. The idea is to provide firms with a way to 
						distinguish between people who really know how to program, and those that have just taken all the right classes, passed the right tests.<BR/><BR/>
						Programming is more than just a function of training. It also involves some natural, instinctual talents. You can take two people and put them through the same programming class and end up with vastly 
						different results. The truth is, all programmers are not equal. Not even close. Some of us are born to code. Others, like myself, just 
						aren't.<BR/><BR/>Unfortunately, there haven't been many ways to tell the difference. On paper, programmers tend to look a lot alike. Being 
						certified in a particular platform just means that you have a certain amount of knowledge. Programming is more about skill than it is about 
						knowledge, so if all you can do is measure knowledge, you're in trouble.<BR/><BR/>Most tests measure whether you know what a particular 
						command does. TopCoder aims to see instead how you apply those commands in the real world. It's like the difference between asking an artist about 
						colors of paint, and asking him to paint you a portrait. The portrait is what matters.<BR/><BR/>As businesses come to rely on computers, they also 
						come to rely on programmers. They just haven't had a good way to rate those programmers. Even if the programmer works for you, it's hard to tell 
						that they know what they're doing. After all, they're bound to know more about what they're doing than you do. How can you tell whether a project 
						is running into delays because the programmer is incompetent, or because it just turned out to be more difficult than originally 
						anticipated?<BR/><BR/>Asking a programmer to tell you whether he stinks is like asking a car salesman whether his cars are any good. The answer you 
						receive is one which you've got to take with a grain of salt. The source is biased, and has a vested interest in the sort of answer you get. You 
						can't tell whether the guy is any good, and he isn't about to tell you that he isn't.<BR/><BR/>Usually, firms don't find out that they were saddled 
						with a second-rate programmer until a new, better programmer comes in and finds flaws in the code that was left behind. This sort of post- mortem 
						evaluation doesn't do you a whole heck of a lot of good. 20/20 hindsight is primarily useful for historians and tail gunners. About the best the 
						rest of us can do is say, "Well, gee, I guess I'm glad he's gone, at least." Which is weak consolation, to say the least.<BR/><BR/>It will be 
						interesting to see if TopCoder can make much money in their venture, as they plan to turn a profit by having firms pay for access to the talent 
						TopCoder uncovers. Whether they make a buck at it or not, I think they have hit upon a system that really will reveal the best programmers out 
						there. Not that it will matter to most businesses.<BR/><BR/>The biggest problem here is that there's a shortage of programmers in general, let 
						alone competent ones. The firms that can afford to attract the champion coders TopCoder will identify will benefit, but the rest of the business 
						world will just have to keep on muddling through. Pageants might be nice, but we can't all marry the winners. Most of us take what we can get, and 
						hope that what we get isn't so bad. We know there are other fish in the sea, we just aren't so sure we can afford to go fishing.<BR/>
            </TD></TR>                                                                 
<p><br></p>
                    </td>
                </tr>
            </table>
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
