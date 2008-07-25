<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>Winformula Developer Challenge :: Powered by TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>

   <script type="text/javascript" src="/js/winformula/RSSProcessor.js"></script>
   <script type="text/javascript" src="/js/winformula/AJAXProcessor.js"></script>

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/winformula/tabs/registerOn.png';
            img.src = '/i/events/winformula/tabs/submitOn.png';
            img.src = '/i/events/winformula/tabs/apisOn.png';
            img.src = '/i/events/winformula/tabs/discussOn.png';
        }
    </script>
        <script type="text/javascript" language="JavaScript">
            function loadRSS(){
                try {
                    var RSSData = '<?xml version="1.0" encoding="UTF-8" ?>' +
                    '<rss version="2.0">' +
                    '<channel>' +
                    '<title>Channel title</title>' +
                    '<description>Some channel</description>' +
                    '<link isPermaLink="false">www.topcoder.com</link>' +
                    '<lastBuildDate>Fri, 11 July 2008 11:12:55 \-0400 </lastBuildDate>' +
                    '<pubDate>Fri, 11 July 2010 11:12:55 \-0400</pubDate>' +
                    '<item>' +
                    '<title>Item1</title>' +
                    '<description>Item1 description</description>' +
                    '<link>news.html</link>' +
                    '<pubDate>Wed, 2 July 2008 09:00:00 \-0400</pubDate>' +
                    '</item>' +
                    '<item>' +
                    '<title>Item2</title>' +
                    '<description>Item2 description</description>' +
                    '<link>news.html</link>' +
                    '<pubDate>Wed, 3 July 2008 09:00:00 \-0400</pubDate>' +
                    '</item>' +
                    '</channel>' +
                    '</rss>';

                    var template = '<div>' +
                    '<h2><a href = "[%= channel.link %]">[%= channel.title %]</a></h2>' +
                    '[% foreach item %]' +
                    '    <h1><a href = "[%= link%]">[%= title%]</a></h1>' +
                    '   [%= description %]' +
                    '   <br/><br/>' +
                    '[% /foreach %]' +
                    '</div>';

var RSSData2 = '<?xml version="1.0" encoding="UTF-8"?>' +
          '<rss version="2.0">' +
          '<channel>' +
          '<title>Winning Formula</title>' +
          '<link>http://topcoderblogs.com/winningformula</link>' +
          '<item>' +
          '<title isPerm = "f">This is the second pos</title>' +
          '</item>' +

          '</channel>' +
          '</rss>';

var RSSData3 = '<?xml version="1.0" encoding="UTF-8"?>' +
          '<rss version="2.0"' +
          '	xmlns:content="http://purl.org/rss/1.0/modules/content/"' +
          '	xmlns:wfw="http://wellformedweb.org/CommentAPI/"' +
          '	xmlns:dc="http://purl.org/dc/elements/1.1/"' +
          '	xmlns:atom="http://www.w3.org/2005/Atom"' +
          '	>' +
          '' +
          '<channel>' +
          '	<title>Winning Formula 4</title>' +
          '	<link>http://topcoderblogs.com/winningformula</link>' +
          '	<description>Just another WordPress weblog</description>' +
          '			<item>' +
          '		<title>This is the second post&#8230;</title>' +
          '		<link>http://topcoderblogs.com/winningformula/?p=3</link>' +
          '		<comments>http://topcoderblogs.com/winningformula/?p=3#comments</comments>' +
          '' +
          '		<pubDate>Tue, 22 Jul 2008 01:28:51 +0000</pubDate>' +
          '		<dc:creator>tony</dc:creator>' +
          '		' +
          '		<category><![CDATA[Uncategorized]]></category>' +
          '' +
          '		<guid isPermaLink="false">http://topcoderblogs.com/winningformula/?p=3</guid>' +
          '		<description><![CDATA[I bunch of content would be here.' +
          ']]></description>' +
          '			<content:encoded><![CDATA[<p>I bunch of content would be here.</p>' +
          ']]></content:encoded>' +
          '			<wfw:commentRss>http://topcoderblogs.com/winningformula/?feed=rss2&amp;p=3</wfw:commentRss>' +
          '' +
          '		</item>' +
          '		<item>' +
          '		<title>Hello world!</title>' +
          '		<link>http://topcoderblogs.com/winningformula/?p=1</link>' +
          '		<comments>http://topcoderblogs.com/winningformula/?p=1#comments</comments>' +
          '		<pubDate>Mon, 21 Jul 2008 21:53:06 +0000</pubDate>' +
          '		<dc:creator>admin</dc:creator>' +
          '' +
          '		' +
          '		<category><![CDATA[Uncategorized]]></category>' +
          '' +
          '		<guid isPermaLink="false">http://topcoderblogs.com/winningformula/?p=1</guid>' +
          '		<description><![CDATA[Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!' +
          ']]></description>' +
          '			<content:encoded><![CDATA[<p>Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!</p>' +
          ']]></content:encoded>' +
          '			<wfw:commentRss>http://topcoderblogs.com/winningformula/?feed=rss2&amp;p=1</wfw:commentRss>' +
          '		</item>' +
          '	</channel>' +
          '' +
          '</rss>';



var RSSData7 = '<?xml version="1.0" encoding="UTF-8"?>' + 
           '<rss version="2.0"' + 
           '    xmlns:content="http://purl.org/rss/1.0/modules/content/"' + 
           '    xmlns:wfw="http://wellformedweb.org/CommentAPI/"' + 
           '    xmlns:dc="http://purl.org/dc/elements/1.1/"' + 
           '    xmlns:atom="http://www.w3.org/2005/Atom"' + 
           '    >' + 
           '' + 
           '<channel>' + 
           '    <title>Winning Formula</title>' + 
           '    <atom:link href="http://topcoderblogs.com/winningformula/?feed=rss2" rel="self" type="application/rss+xml" > </atom:link>' + 
           '    <link>http://topcoderblogs.com/winningformula</link>' + 
           '    <description>Just another WordPress weblog</description>' + 
           '    <pubDate>Tue, 22 Jul 2008 01:28:51 +0000</pubDate>' + 
           '    <generator>http://wordpress.org/?v=2.5.1</generator>' + 
           '    <language>en</language>' + 
           '            <item>' + 
           '        <title>This is the second post&#8230;</title>' + 
           '        <link>http://topcoderblogs.com/winningformula/?p=3</link>' + 
           '        <comments>http://topcoderblogs.com/winningformula/?p=3#comments</comments>' + 
           '        <pubDate>Tue, 22 Jul 2008 01:28:51 +0000</pubDate>' + 
           '        <dc:creator>tony</dc:creator>' + 
           '        ' + 
           '        <category><![CDATA[Uncategorized]]></category>' + 
           '' + 
           '        <guid isPermaLink="false">http://topcoderblogs.com/winningformula/?p=3</guid>' + 
           '        <description><![CDATA[I bunch of content would be here.' + 
           ']]></description>' + 
           '            <content:encoded><![CDATA[<p>I bunch of content would be here.</p>' + 
           ']]></content:encoded>' + 
           '            <wfw:commentRss>http://topcoderblogs.com/winningformula/?feed=rss2&amp;p=3</wfw:commentRss>' + 
           '        </item>' + 
           '        <item>' + 
           '        <title>Hello world!</title>' + 
           '        <link>http://topcoderblogs.com/winningformula/?p=1</link>' + 
           '        <comments>http://topcoderblogs.com/winningformula/?p=1#comments</comments>' + 
           '        <pubDate>Mon, 21 Jul 2008 21:53:06 +0000</pubDate>' + 
           '        <dc:creator>admin</dc:creator>' + 
           '        ' + 
           '        <category><![CDATA[Uncategorized]]></category>' + 
           '' + 
           '        <guid isPermaLink="false">http://topcoderblogs.com/winningformula/?p=1</guid>' + 
           '        <description><![CDATA[Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!' + 
           ']]></description>' + 
           '            <content:encoded><![CDATA[<p>Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!</p>' + 
           ']]></content:encoded>' + 
           '            <wfw:commentRss>http://topcoderblogs.com/winningformula/?feed=rss2&amp;p=1</wfw:commentRss>' + 
           '        </item>' + 
           '    </channel>' + 
           '</rss>';

//    var processor = new AJAXProcessor();
    //try {
//        processor.request({
            //"url": "http://www.dev.topcoder.com/winformula/?module=RSSFeed&feed=blog",
            //"async": false
        //});
    //} catch (Error) {
        //throw new js.topcoder.rss.template.AJAXFetchException("Failure while loading file: " + url + "Error:" + Error);
    //}
    //alert (processor.getResponseText());
    
//                    var RSSData4 = processor.getResponseText();
  //                  alert(RSSData4);
    
//                    var processor = new js.topcoder.rss.template.RSSProcessor(true, template);
  //                  var result = processor.transformRSSFeed("http://www.dev.topcoder.com/winformula/?module=RSSFeed&feed=blog");

                    var processor2 = new js.topcoder.rss.template.RSSProcessor(true, template);
                    var result2 = processor2.transformRSSFeed("http://www.dev.topcoder.com/winformula/?module=RSSFeed&feed=forum");

//                    var processor3 = new js.topcoder.rss.template.RSSProcessor(true, template);
  //                  var result3 = processor3.transformRSSFeed("http://www.dev.topcoder.com/winformula/?module=RSSFeed&feed=espn");
                    
                    //alert(result)                                        
        //            document.getElementById("target").innerHTML = result;
                   document.getElementById("target2").innerHTML = result2;
                   alert(result2);
     //               document.getElementById("target3").innerHTML = result3;
                } catch (Error) {
                    alert(Error.toString());
                }
            }
        </script>
</head>

<body onLoad="loadRSS()">

<jsp:include page="tcTop.jsp"/>


<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">
                <jsp:include page="winformulaTop.jsp"/>

                <div class="content" align="left">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">
                            <p>
                                <div class="siteBoxFull" id="target">
                                </div>
                            </p>
                            <p>
                                <div class="siteBoxFull" id="target2">
                                </div>
                            </p>
                            <p>
                                <div class="siteBoxFull" id="target3">
                                </div>
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>

</html>

