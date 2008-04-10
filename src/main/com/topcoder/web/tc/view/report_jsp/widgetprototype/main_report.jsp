<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Report Widget</title>
    <link href="/css/widgets/cost_report/reportStyles.css" rel="stylesheet" type="text/css" />

    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>


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
                                            

            

function addUnique(arr, element) {
   for(i=0; i<arr.length;i++)
      if(arr[i] == element) return;
   arr.push(element);
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


function display(root) {

    var resultType = document.main.result_type.options[document.main.result_type.selectedIndex].value;
    var timescale = document.main.timescale.options[document.main.timescale.selectedIndex].value;

    var entries = root.data || [];
    var amount = [];
    var periods= [];
    var categories = [];
    var periodsData=[];
    var totalAmount=[]
    var totalCount=[];

    amount['sum']=[];
    amount['count']=[];

    for (var i = 0; i < entries.length; ++i) {
      var entry = entries[i];

      var period = entry.year + '-' + (entry.period < 10? '0' : '' ) + entry.period;
      var category = entry.category_desc;


      addUnique(periods, period);
      addUnique(categories, category);

      if (periodsData[period] == undefined) {
         periodsData[period] = [];

         periodsData[period]['name'] = entry.year + '-' + entry.period;  // fix


         if( timescale == 12) { // yearly
            periodsData[period]['name'] = entry.year;
         }
         if( timescale == 3) { // quarterly
            periodsData[period]['name'] = entry.year + ' Q' + entry.period;
         }
         if( timescale == 1) { // monthly
            periodsData[period]['name'] = period;
         }


         var sdt = new Date();
         var edt = new Date();

         if (sdt.__msh_oldSetFullYear) {
            sdt.__msh_oldSetFullYear(entry.year,entry.period * timescale - timescale, 1);
            edt.__msh_oldSetFullYear(entry.year,entry.period * timescale , 1);
         } else {
            sdt.setFullYear(entry.year,entry.period * timescale - timescale, 1);
            edt.setFullYear(entry.year,entry.period * timescale , 1);
         }
         
         edt.setDate(edt.getDate() - 1);


         // changed due to a patch in the calendar
         //periodsData[period]['sdt'] = sdt.getFullYear() + '-' + (sdt.getMonth()+1) + '-' + sdt.getDate();
         //periodsData[period]['edt'] = edt.getFullYear() + '-' + (edt.getMonth()+1) + '-' + edt.getDate();
         periodsData[period]['sdt'] = sdt.print("%Y-%m-%d");
         periodsData[period]['edt'] = edt.print("%Y-%m-%d");


      }

      if (amount[period] == undefined) {
          amount[period]  = [];
      }

      var value;
      if (resultType == 'sum') value = parseFloat(entry.total_cost);
      if (resultType == 'avg') value = parseFloat(entry.total_cost) / parseFloat(entry.project_count);
      if (resultType == 'count') value = parseInt(entry.project_count);

      amount[period][entry.category_desc]  = value;

      if (amount['sum'][entry.category_desc] == undefined) {
          amount['sum'][entry.category_desc] = 0.0;
      }
      if (amount['count'][entry.category_desc] == undefined) {
          amount['count'][entry.category_desc] = 0;
      }
      amount['sum'][entry.category_desc] += parseFloat(entry.total_cost);
      amount['count'][entry.category_desc] += parseInt(entry.project_count);


      if (totalAmount[period] == undefined) totalAmount[period] = 0;
      totalAmount[period] +=  parseFloat(entry.total_cost);

      if (totalCount[period] == undefined) totalCount[period] = 0;
      totalCount[period] +=  parseInt(entry.project_count);

    }

    periods.sort();
    categories.sort();

    

    var html = ['<table border="0" cellpadding="0" cellspacing="0" id="report">',
            '<colgroup class="align_left"></colgroup>',
            '<colgroup span="', periods.length + 1,'" class="align_right"></colgroup>',
            '<tr>',
                '<th><a href="#" class="filter">Catalog</a></th>'];


    for (var j=0;j<periods.length;j++) {
        html.push('<th>', periodsData[periods[j]].name, '</th>');
    }
    html.push('<th>', document.main.result_type.options[document.main.result_type.selectedIndex].text,'</th>',' </tr>');


    for (var i=0; i<categories.length; i++) {
        html.push('<tr', (i % 2 ==0 ? '' : ' class="alter"'),'><td>', categories[i], '</td>');


        for (var j=0;j<periods.length;j++) {
            var p = periods[j];
            var x = amount[p][categories[i]];
            
            
            var linkParams = 'sdt=' + periodsData[p].sdt + '&edt=' + periodsData[p].edt + '&catn=' + categories[i].replace(/\+/g, '%2B');

            html.push('<td align="right">',
                        '<a href="/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=period_detail&', linkParams,'">', (x == undefined || x == 0? '&nbsp' : addCommas(x.toFixed(0))), '</a></td>');
        }

        var summary;
        if (resultType == 'sum') summary = amount['sum'][categories[i]];
        if (resultType == 'avg') summary = amount['sum'][categories[i]] / amount['count'][categories[i]];
        if (resultType == 'count') summary = amount['count'][categories[i]];

        var summaryParams = 'sdt=' + prepareDate(document.main.from.value) + '&edt=' + prepareDate(document.main.to.value) + '&catn=' + categories[i].replace(/\+/g, '%2B');

        html.push('<td align="right">','<a href="/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=period_detail&', summaryParams,'">',
                (summary == undefined || summary == 0? '&nbsp' : addCommas(summary.toFixed(0))), '</a></td>');

        html.push('</tr>');

    }

    
    html.push('<tr><td><b>Total</b></td>');
    
    var bigTotalAmount = 0;
    var bigTotalCount = 0;
    
    for (var j=0;j<periods.length;j++) {
        var p = periods[j];
        var tot;

        if (resultType == 'sum') tot = totalAmount[p];
        if (resultType == 'avg') tot = totalAmount[p] / totalCount[p];
        if (resultType == 'count') tot = totalCount[p];
    
        bigTotalCount +=  totalCount[p];
        bigTotalAmount +=  totalAmount[p];
    
        var linkParams = 'sdt=' + periodsData[p].sdt + '&edt=' + periodsData[p].edt;
        html.push('<td align="right">',
                '<a href="/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=period_detail&', linkParams,'">',
                
                addCommas(tot.toFixed(0)), '</a></td>');
    }

    var tot;
    if (resultType == 'sum') tot = bigTotalAmount;
    if (resultType == 'avg') tot = bigTotalAmount / bigTotalCount;
    if (resultType == 'count') tot = bigTotalCount;

    var summaryParams = 'sdt=' + prepareDate(document.main.from.value) + '&edt=' + prepareDate(document.main.to.value);
    html.push('<td align="right">',
            '<a href="/tc?module=Static&d1=report_jsp&d2=widgetprototype&d3=period_detail&', summaryParams,'">',

            addCommas(tot.toFixed(0)), '</a></td>');


    html.push('</tr>');
    
    

    html.push('</table>');
    document.getElementById("data").innerHTML = html.join("");
    init(); // make pop up scripts work
}

function prepareDate(d) {
    return d.substring(6,10) + '-' + d.substring(0,2) + '-' + d.substring(3,5);
}



function runReport() {
    var timescale = document.main.timescale.options[document.main.timescale.selectedIndex].value;

    var url = 'http://<%= request.getServerName() %>/tc';
    
    var req = new Remote.XHR(url); 
    req.setResponse("text");
    req.setQuery("module", "BasicData");
    req.setQuery("c", "dd_all_projects_cost_summary");
    req.setQuery("json", "true");
    req.setQuery("sdt", prepareDate(document.main.from.value));
    req.setQuery("edt", prepareDate(document.main.to.value));
    req.setQuery("pl", timescale);
    
        
    req.callback("display"); 

}   




</script>


</head>
<body style="margin: 0px">


<div class="wrapper-iframe_content">
<div class="wrapper-iframe_sub">

<!-- ADD YOUR CONTENT HERE - DO NOT CHANGE CONTENT ABOVE OR BELOW THESE COMMENTS! -->
    <form action="#" method="post" name="main" id="main">
    <input type="hidden" name="url" value="">
    
    <div id="header">
        Component Cost Summary - Report Parameters
    </div>
    <!--
    <div class="parameter">
        <label>
        <select name="catalog" size="7" multiple="multiple" class="input" id="catalog">
            <option value="Java">Java</option>
            <option value=".NET">.NET</option>
            <option value="Java Custom">Java Custom</option>
            <option value=".NET Custom">.NET Custom</option>
            <option value="Javascript">Javascript</option>
            <option value="Flash">Flash</option>
            <option value="C++">C++</option>
            <option value="Python">Python</option>
        </select>
        </label>
    </div>
    
    -->
    
    <div class="parameter">
        <label>
        <select name="timescale" id="timescale" class="input">
            <option value="12" selected>Yearly</option>
            <option value="3">Quarterly</option>
            <option value="1">Monthly</option>
        </select>
        </label>
        <div id="date_range">
            <div><strong>Date Range</strong></div>
            <div>
                <label>
                    From:
                    <input name="from" type="text" class="date" id="from" value="01/01/<%= new java.util.Date().getYear()+1900 %>" />
                    <img src="/i/widgets/cost_report/cal.png" alt="Cal" width="26" height="18" id="trigger_start_date" />
                 </label>
           </div>
            <div>
                <label>
                    To: &nbsp; &nbsp;
                    <input name="to" type="text" class="date" id="to" value="12/31/<%= new java.util.Date().getYear()+1900 %>" />
                </label>
                <img src="/i/widgets/cost_report/cal.png" alt="Cal" width="26" height="18" id="trigger_end_date" />
                
                
                </div>
        </div>
    </div>
    <div class="parameter">
        <select name="result_type" id="result_type" class="input">
            <option value="avg">Average Cost</option>
            <option value="sum">Total Cost</option>
            <option value="count">Total Count</option>
        </select>
        <div id="run_report">
            <input type="image" name="run" id="run" src="/i/widgets/cost_report/run.png" onClick="runReport(); return false;" />
        </div>
    </div>
    <div class="content" id="data">
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
<div id='runJS'></div>
    </form>
    <!-- END CONTENT HERE - DO NOT CHANGE CONTENT ABOVE OR BELOW THESE COMMENTS! -->

</div><!-- End iframe-sub-->
</div><!-- End iframe-content-->

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "from",  
                    ifFormat    : "%m/%d/%Y",    
                    button      : "trigger_start_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);



Calendar.setup(
{
 inputField  : "to",  
                    ifFormat    : "%m/%d/%Y",    
                    button      : "trigger_end_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);

                -->
</script>


</body>
</html>
