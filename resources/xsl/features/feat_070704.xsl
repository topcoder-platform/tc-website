<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->   
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>Healthy Computing</strong></font><br />
                        Wednesday, July 2, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=276230"><strong>dimkadimon</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
Any type of work can lead to injuries and other health issues. Computer work is no exception to this rule. When programming, we often have to spend many hours sitting in the same position and staring in one direction. Even if we cannot control the amount of time that we spend at the computer, we can at least control how we spend it. We must remember that neglecting a healthy computer environment increases the risk of immediate injuries and can lead to severe health problems in the future. These issues are no joke and should be treated seriously. 
In this article I would like to describe how to avoid and overcome injuries related to computer work. This involves having proper set up for your chair, keyboard, mouse and monitor, as well as, having correct sitting posture, document positioning and use of input devices. Finally, I will touch on some simple exercises that will keep you healthy during long working hours.
</p>
<p><span class="bodySubtitle">Setting up the chair</span><br/>
First lets have a look at chairs as they are the single most important component to a healthy environment. There is no such thing as a perfect chair and you should try a variety of chairs to find the one that suits you best. Chairs that have wheels are generally a good idea, especially if you are working at multiple desks and need to move around the room. Be careful though; because some floors are slippery and make you unintentionally move backwards as you type. If you are using a non-adjustable chair and it is too high then consider using a footrest. 
The main idea is to feel comfortable while sitting in your chair. This means that your back should be well supported and the actual seat does not apply too much pressure to the back of your knees. Adjust the chair height until your feet are comfortably placed on the ground and your knees are nicely relaxed. Next adjust the reclining angle. Experts recommend keeping the chair slightly reclined, as this helps relieve tension from your lower back. Also if you can, adjust the reclining tension so that the chair provides consistent support as you move back and forth.
</p>
<p><span class="bodySubtitle">Sitting posture</span><br/>
Your sitting posture is also important. It is a good idea to change your posture every now and then. By doing so you will improve circulation and reduce muscle fatigue. Your back should be comfortably reclined - it should not be erect or leaning forward. Your head should be well balanced - do not tilt it back or too far forward as this will strain your neck. Your arms should be relatively close to the body - not out to the side or too much to the front. Your wrists should be roughly level with your forearms. If your chair has armrests then make sure that they do not interfere with your arm movements.
</p>
<p><span class="bodySubtitle">Document positioning</span><br/>
Often we have to work from printed documents while using the computer. Improper positioning of documents can lead to neck and shoulder pain. Try to keep your body straight and avoid twisting it at awkward angles. It helps to have a large desk so that both monitor and documents can be in direct view. If your desk is too small to fit your documents then consider using a monitor mounted document holder. On a personal note, I strongly recommend learning how to touch-type. Not only does it save you time, but also prevents you from having to constantly turn your neck while typing.
</p>
<p><span class="bodySubtitle">Choosing the right keyboard</span><br/>
When it comes to buying a new keyboard there is no shortage of choice. The most commonly used type of keyboard is the "101-key traditional" keyboard. Generally these are well suited for everyday use and there is no need to change them unless you have special requirements. If you have a broad chest then perhaps you should try a split keyboard. Split-design keyboards divide the letter keys into two halves. By doing so, they aim to achieve a more natural position for your wrists and forearms. Contoured keyboards arrange the keys in a way that approaches the natural position of your fingers. This reduces the distance that your fingers have to travel between keys, thus minimizing the risk of strain.<br/><br/>
Finally, there are keyboards that use a different layout altogether. For example, chording keyboards use fewer keys and are operated by using combinations of keys instead of individual keystrokes. Dvorak keyboards position the most commonly used letters directly under the user's strongest fingers. Although these keyboards have their own advantages, they take considerable time to master.
</p>
<p><span class="bodySubtitle">Setting up the keyboard</span><br/>
Now lets examine some of the ways in which you can adjust your keyboard. Ideally you should have a keyboard tray, as this allows you to make both horizontal and vertical adjustments. Position the keyboard so that it is about 4 inches above your lap level. Always un-extend the "legs" that are attached to the front of your keyboard. If you can, tilt the keyboard slightly forward, as this will keep your wrists in a relaxed neutral position. Position your keyboard so that the middle of the letter keys is centered with respect to your body.
</p>
<p><span class="bodySubtitle">Using the keyboard</span><br/>
When typing it is important to follow a few simple guidelines. Try to use a light touch, because striking the keys too hard can strain the tendons from your fingers. Do not bend your wrists up and down too much as this can cause pain and lead to injuries. Keep your elbows at angles equal or greater than 90 degrees - this avoids nerve compressions that lead to sore wrists and arms. Do not use wrist rests or armrests while typing - only use them when resting. Avoid raising you shoulders to meet the keyboard, instead you should lower the keyboard or adjust your chair height.
</p>
<p><span class="bodySubtitle">Setting up the mouse</span><br/>
The mouse can be set up in a similar manner to the keyboard. If the mouse is too far from the keyboard then your shoulders will tire from supporting your outstretched arm. So place your mouse within easy reach, close to the keyboard. Use your operating system to adjust the mouse's speed and response time. As mice come in different shapes and sizes it is important to find one that fits comfortably in your hand.
</p>
<p><span class="bodySubtitle">Using the mouse</span><br/>
When using the mouse try to avoid making "flicking" movements with your wrist as this can lead to wrist and finger pain. Instead, move the mouse with your forearm. A scroll wheel is an absolute must when editing those long documents and pieces of code. Avoid having your fingers "hover" above the buttons - give them a rest by letting them lie gently on the buttons. Also avoid tilting and angling your wrists - keep them in a neutral position. Just like with keyboards, there is no need to use excessive force when clicking mouse buttons.
</p>
<p><span class="bodySubtitle">Setting up the monitor</span><br/>
It is vital to position your monitor correctly, because failing to do so can lead to neck pain, shoulder pain and even eyestrain. The best position for the monitor is in the center of your workspace. This position guarantees that you don't have to experience any uncomfortable twisting and awkward posture. Just like with televisions, it is not advisory to sit too close to your monitor. You should sit about an arm's length away and even further for monitors that are larger than 19 inches. Position your monitor so that the top of the viewing area is about 2-3 inches above your eye level.
</p>
<p><span class="bodySubtitle">Reducing glare</span><br/>
Window light can cause many viewing problems associated with monitor use. For example, if your monitor is positioned next to a window then you will have competing brightness levels between the window and the monitor. This can be very uncomfortable and often causes headaches and fatigue. On the other hand, a window situated behind you will produce glare. One solution is to keep windows mostly shut and use overhead lighting. Another solution is to attach an anti-glare screen to your monitor. However the best solution is to use an LCD (liquid crystal display) monitor. These monitors are ideal, because they emit minimal glare and save desk space at the same time.
</p>
<p><span class="bodySubtitle">Exercises</span><br/>
Now for some exercises that you can do between work to relieve tension and muscle fatigue:
</p>

<ol>
<li>Stand up and stretch your arms over your head.</li>
<li>Give your eyes a rest by looking into the distance or closing them for a few seconds.</li>
<li>Turn your neck slowly to the left for 5 seconds and then to the right for 5 seconds. Repeat several times.</li>
<li>Relax your arms at your side and rotate your shoulders in a circular motion.</li>
<li>Clasp your hands behind your back and slowly arch your back, bending your head backwards. Hold for up to 5 seconds.</li>
<li>Place your hands palm-to-palm and slowly rotate them away from you until you feel a mild stretch.</li>
<li>Clench both fists and hold for 5 seconds. Now spread your fingers as far as you can and hold for another 5 seconds. Repeat several times.</li>
</ol>

                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

