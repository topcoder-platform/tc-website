<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />

    <%-- THICKBOX GALLERY --%>
    <script type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
    <%----------------------------%>

    <style type="text/css">
    a.spaced {
     margin: 1px;
    }
    </style>
    
</head>

<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="photos"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Photos</span></h1>

                        <p align="center">
                            <a href="/i/tournament/tco07/onsitePhotos/reception/1.jpg">Reception</a>
                            | <a href="#algo1">Algo Room 1</a>
                            | <a href="#marathon">Marathon Match</a>
                            | <a href="#algo2">Algo Room 2</a>
                            | <a href="#studio">Studio</a>
                            | <a href="#algo3">Algo Room 3</a>
                            | <a href="#wildcard">WildCard</a>
                        </p>
                        <p align="center">
                            <a href="#comp">Component Finals</a>
                            | <a href="#algofin">Algorithm Finals</a>
                            | <a href="#winners">Winners</a>
                        </p>

<a name="reception"/> 
<p><strong>Reception</strong></p>
<script type="text/javascript">
for(var i=1; i<37; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/reception/'+i+'.jpg" title="Reception" rel="reception" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/reception/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="algo1"/> 
<p><strong>Algorithm Room 1</strong></p>
<script type="text/javascript">
for(var i=1; i<41; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/algo1/'+i+'.jpg" title="Algorithm Room 1" rel="algo1" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/algo1/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="marathon"/> 
<p><strong>Marathon Match Finals</strong></p>
<script type="text/javascript">
for(var i=1; i<30; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/marathon/'+i+'.jpg" title="Marathon Match Finals" rel="marathon" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/marathon/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="algo2"/> 
<p><strong>Algorithm Room 2</strong></p>
<script type="text/javascript">
for(var i=1; i<29; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/algo2/'+i+'.jpg" title="Algorithm Room 2" rel="algo2" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/algo2/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="studio"/> 
<p><strong>Studio Finals</strong></p>
<script type="text/javascript">
for(var i=1; i<13; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/studio/'+i+'.jpg" title="Studio Finals" rel="studio" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/studio/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="algo3"/> 
<p><strong>Algorithm Room 3</strong></p>
<script type="text/javascript">
for(var i=1; i<21; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/algo3/'+i+'.jpg" title="Algorithm Room 3" rel="algo3" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/algo3/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="wildcard"/> 
<p><strong>Algorithm Wildcard</strong></p>
<script type="text/javascript">
for(var i=1; i<21; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/wildcard/'+i+'.jpg" title="Algorithm Wildcard" rel="wildcard" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/wildcard/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="comp"/> 
<p><strong>Component Finals</strong></p>
<script type="text/javascript">
for(var i=1; i<7; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/comp/'+i+'.jpg" title="Component Finals" rel="comp" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/comp/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="algofin"/> 
<p><strong>Algorithm Finals</strong></p>
<script type="text/javascript">
for(var i=1; i<18; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/algofin/'+i+'.jpg" title="Algorithm Finals" rel="algofin" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/algofin/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

<br /><br />

<a name="winners"/> 
<p><strong>Winners</strong></p>
<script type="text/javascript">
for(var i=1; i<30; i++){
    doWrite('<a href="/i/tournament/tco07/onsitePhotos/winners/'+i+'.jpg" title="Winners" rel="winners" class="thickbox spaced"><img src="/i/tournament/tco07/onsitePhotos/winners/thumbs/'+i+'.jpg" alt="+"/></a>');
}
</script>

            </div>
            </form>
            <br clear="all" />

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
