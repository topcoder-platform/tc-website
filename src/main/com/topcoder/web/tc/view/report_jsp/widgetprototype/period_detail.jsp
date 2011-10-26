<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Report Widget</title>
    <link href="/css/widgets/cost_report/reportStyles.css" rel="stylesheet" type="text/css" />

<%@ include file="remote.jsp" %>
<script>

window.onload = init;

function init() {
    prepareLinks();
    prepareCloses();
}

function prepareLinks() {
    var report = document.getElementById("report");
    if (report) {
        var rows = report.getElementsByTagName("tr");
        if (rows) {
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                row.onmouseover = function() {
                    this.temp = this.className;
                    if (this.className == "") this.className += "hover"; else this.className = "hover";
                }
                row.onmouseout = function() {
                    this.className = this.temp;
                }

                var authors = row.getElementsByTagName("a");
                for (var j = 0; j < authors.length; j++) {
                    var author = authors[j];
                    if (author.parentNode.tagName == "TD") {
                        author.onclick = function() {
                            popUp(this.getAttribute("href"));
                            return false;
                        }
                    }
                }
            }
        }
    }
}

function popUp(winURL) {
    window.open(winURL, "popup", "width=550,height=650,resizable=yes,scrollbars=yes");
}

function prepareCloses() {
    var close_button = document.getElementById("close_button");
    if (close_button) {
        close_button.onclick = function() {
            window.close();
        }
    }
}
                                            

            

function openwindow(projId)
{
    window.open("/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=component_detail&pj="+projId,"mywindow","menubar=1,resizable=1,width=700,height=500,scrollbars=yes");
}

function parseParams() {
    var params = [];

    qs=location.search.substring(1,location.search.length)
    if (qs.length == 0) return params;

    qs = qs.replace(/\+/g, ' ')
    var args = qs.split('&')

    for (var i=0;i<args.length;i++) {
        var value;
        var pair = args[i].split('=')
        var name = unescape(pair[0])

        if (pair.length == 2)
            value = unescape(pair[1])
        else
            value = name

        params[name] = value
    }
    return params;
}

function addCommas(nStr)
{
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}


function getNum(n) {
   if (n  == undefined || n == '') return 0.0;
   try {
   var x=parseFloat(n);
   if (x == Number.NaN) return 0.0;
   
   return x;
   } catch(e) {
      return 0;
   }
}

function formatDate(d) {
   if (d == undefined || d.length < 10) return '';

   return d.substring(5,7) + '/' + d.substring(8,10)+ '/'+ d.substring(0,4);
}



function display(root) {

    var entries = root.data || [];
    var sumCost = 0;
    var sumReviewCost = 0;

    var html = ['<table width="100%" border="0" cellspacing="0" cellpadding="0" id="report">',
        '<colgroup class="align_left"></colgroup>',
        '<colgroup span="7" class="align_right"></colgroup>',
        '<tr>',
            '<th>Component</th>',
            '<th>Ver</th>',
            '<th>Catalog</th>',
            '<th>Total Cost</th>',
            '<th>Review Cost</th>',
            '<th>Competition End</th>',
            '<th>Design Posts</th>',
            '<th>Dev Posts</th>',
        '</tr>'];


    for (var i = 0; i < entries.length; ++i) {
        var e = entries[i];

        html.push('<tr', (i % 2 ==0 ? '' : ' class="alter"'),'>');
        html.push('<td align="left">', e.component_name ,'</td>');
        html.push('<td align="left">', e.version_text ,'</td>');
        html.push('<td>', e.category_desc ,'</td>');
        html.push('<td align="right">','<a href="javascript: openwindow(',e.project_id,')">', addCommas(parseFloat(e.total_cost).toFixed(0)), '</a>','</td>');
        html.push('<td align="right">', addCommas(parseFloat(e.review_cost).toFixed(0)),'</td>');
        html.push('<td align="right">', formatDate(e.complete_date) ,'</td>');
        html.push('<td align="right">', e.num_design_contests ,'</td>');
        html.push('<td align="right">', e.num_dev_contests ,'</td>');
        html.push('</tr>');
        
        
        
        sumCost += getNum(e.total_cost);
        sumReviewCost += getNum(e.review_cost);
    }
    
    html.push('<tr>');
    html.push('<td><b>Total</b></td>');
    html.push('<td></td>');
    html.push('<td></td>');
    html.push('<td align="right">', addCommas(parseFloat(sumCost).toFixed(0)),'</td>');
    html.push('<td align="right">', addCommas(parseFloat(sumReviewCost).toFixed(0)),'</td>');
    html.push('<td></td>');
    html.push('<td></td>');
    html.push('<td></td>');
    html.push('</tr>');




    html.push('</table>');
    document.getElementById("data").innerHTML = html.join("");
    init(); // make pop up scripts work
}



function runReport() {
   
    var url = 'http://<%= request.getServerName() %>/tc';
    
    var req = new Remote.XHR(url); 
    req.setResponse("text");
    req.setQuery("module", "BasicData");
    req.setQuery("c", "dd_all_projects_cost_by_date");
    req.setQuery("json", "true");
    
    req.setQuery("sdt", "${param.sdt}" );
    req.setQuery("edt", "${param.edt}");
    if ("${param.catn}" != "") req.setQuery("catn", "${param.catn}");
    
    req.callback("display"); 
    
    
}

</script>


</head>
<body onLoad='runReport()'>

<form name="main">
<input type="hidden" name="url" value="">
<div id='runJS'></div>
</form>

<div class="wrapper" id="data">
Please wait while the report is being generated
    </div>
<!-- End wrapper -->
</body>
</html>
