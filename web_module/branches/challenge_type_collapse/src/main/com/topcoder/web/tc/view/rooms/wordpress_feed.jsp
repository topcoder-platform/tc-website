<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>WordPress Feed</title>
    
    <link rel="stylesheet" href="/news/wp-content/themes/tc2/style.css" type="text/css" media="screen" />
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_home"/>
    </jsp:include>

    <script type="text/javascript" src="/js/main.js"  ></script>
    <script type="text/javascript" src="/js/cookie.js"  ></script>
    <script type="text/javascript" src="/js/slashtc20080411.js"  ></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>		
    <script>
        var len=window.location.protocol.length+window.location.host.length+3;
        var src=window.location.href.substring(len,window.location.href.length);
        window.onbeforeunload = function() {
            jQuery.ajax({url:"/tc/timer?key=0&src="+encodeURIComponent(src), async:false})
        };
        function closeWindow() {
            if (navigator.userAgent.indexOf("MSIE") > 0) {  
                if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {  
                    window.opener = null; window.close();  
                }  
                else {  
                    window.open('', '_top'); window.top.close();  
                }  
            }  
            else if (navigator.userAgent.indexOf("Firefox") > 0) {  
                location.replace('http://community.topcoder.com/tc');
                event.returnValue = false;  
                //window.history.go(-2);  
            }  
            else {  
                window.opener = null;   
                window.open('', '_self', '');  
                window.close();  
            }  
        }
        // set timeout
        window.setTimeout(function(){window.onbeforeunload = null;jQuery.ajax({url:"/tc/timer?key=1&src="+encodeURIComponent(src), async:false});window.open('', '_self', '');closeWindow();}, 300000);
        
        var goToLink = function(link) {
            window.onbeforeunload = null;
            var url = '/tc/timer?key=2&link=' + encodeURIComponent(link)+'&src='+encodeURIComponent(src);
            jQuery.ajax({url:url, async:false});
        }
        jQuery.ajax({url:'/tc/timer?src='+encodeURIComponent(src), async:false});
        
        var goToLinkWithoutTrack = function(link) {
            window.onbeforeunload = null;
        }

        function externalLinks() {
              if (!document.getElementsByTagName) return;
              $("a").each(function() {
                if ($(this).attr("href")) {
                    $(this).unbind("click").bind("click", function() {
                        goToLinkWithoutTrack();
                    });
                }
              });
              
              var anchors = $(".feedClass a");
              for (var i=0; i<anchors.length; i++)
              {
                      var anchor = anchors[i];
                      if(anchor.getAttribute("href")){
                            
                            anchor.onclick = function(){
                                goToLink(this.getAttribute("href"));
                            };
                   }

                }
            }
        window.onload = externalLinks;
    </script>

</head>
<body>
    
    <jsp:include page="../top.jsp" >
        <jsp:param name="level1" value="competition"/>
    </jsp:include>

    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top">
            <!-- Left Column Begins-->
            <td width="180">
                <jsp:include page="../includes/global_left.jsp">
                    <jsp:param name="node" value="competition_home"/>
                </jsp:include>
                <jsp:include page="coder_of_month.jsp" />
            </td>
            <!-- Left Column Ends -->

            <!-- Gutter Begins -->
            <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt="" /></td>
            <!-- Gutter Ends -->

            <!-- Center Column Begins -->
            <td width="100%" align="center">
                <jsp:include page="big_promo.jsp" />
                
                <div class="feedClass">
                    <c:forEach items="${requestScope.articles}" var="eachEntry" varStatus="index">
                        <div>
                             <h2>${eachEntry.title}</h2>
                             <div>
                                <p>
                                    <c:out value="${eachEntry.contents[0].value}" escapeXml="false" />
                            </p>
                             </div>
                        </div> 
                        
                        <c:if test="${!index.last}">
                             <hr/>
                        </c:if>
                    </c:forEach>          	
                </div>                
            </td>
            <!-- Center Column Ends -->
        </tr>
    </table>

    <jsp:include page="../foot.jsp" />    
</body>
</html>
