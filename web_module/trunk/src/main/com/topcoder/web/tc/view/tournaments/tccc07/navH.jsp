<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<script language="javascript" type="text/javascript">
    <!--
    function toggleMenu(menuTitle, menuID) {
        if (menuTitle.className == 'closed') menuTitle.className = 'open';
        else menuTitle.className = 'closed';
        return;
    }
    // -->
</script>
<div align="center">
    <div id="navHButtons">
        <%--------------TOURNAMENT OVERVIEW---------------%>
        <div style="float:left;">
            <a href=""><img src="/i/tournament/tccc07/tournie.png" alt="Tournament Overview" /></a>
        </div>
        
        <%--------------ALGORITHM---------------%>
        <div style="float:left;">
            <a href=""><img src="/i/tournament/tccc07/alg.png" alt="Algorithm Competition" /></a>
        </div>
    
        <%--------------COMPONENT---------------%>
        <div style="float:left;">
            <a href=""><img src="/i/tournament/tccc07/comp.png" alt="Component Competition" /></a>
        </div>
        
        <%--------------MARATHON---------------%>
        <div style="float:left;">
            <a href=""><img src="/i/tournament/tccc07/mara.png" alt="Marathon Competition" /></a>
        </div>
        
        <%--------------STUDIO---------------%>
        <div style="float:left;">
            <a href=""><img src="/i/tournament/tccc07/studio.png" alt="Studio Overview" /></a>
        </div>
    </div>
    
    <div id="navHText">
        <p class="secondaryLinks"><a href="" alt="Secondary Navigation">Secondary Navigation</a> | <a href="" alt="Secondary Navigation">Secondary Navigation</a> | <a href="" alt="Secondary Navigation">Secondary Navigation</a> | <a href="" alt="Secondary Navigation">Secondary Navigation ON</a> | <a href="" alt="Secondary Navigation">Secondary Navigation</a></p>
        <p class="tertiaryLinks"><a href="" alt="Tertiary Navigation">Tertiary Navigation</a> | <a href="" alt="Tertiary Navigation">Tertiary Navigation</a> | <a href="" alt="Tertiary Navigation">Tertiary Navigation ON</a> | <a href="" alt="Tertiary Navigation">Tertiary Navigation</a> | <a href="" alt="Tertiary Navigation">Tertiary Navigation</a></p>
    </div>
    
    <div style="position:absolute; top:430px; right:30px;">
        <img src="/i/tournament/tccc07/stylebar.png" alt="stylebar" />
    </div>
</div>
    