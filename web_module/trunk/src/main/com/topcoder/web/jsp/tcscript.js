  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>');

  function getGraph(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    popup = window.open('/statistics/graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,null,size);
    return;
  }

  function getGraph(url,wd,ht,name) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+",status=0";
    popup = window.open('/statistics/graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
    return;
  }


function arena() {
  w=window.open("/contest/arena/launch.html","Launch","top=2,left=2,width=300,height=225,status=1");
  return;
}

function tcTime() {
  w=window.open("/contest/time.html","Time","top=2,left=2,width=250,height=50,status=1");
  return;
}

function sponsorLink(spons) {
  w=window.open(spons,"Sponsor");
  return;
}

function sponsorLinkWindow(spons,nam,top,lef,wid,hei) {
  w=window.open(spons,nam,"top="+top+",left="+lef+",width="+wid+",height="+hei+",resizable=no,toolbar=no,location=no,scrollbars=no,menubar=no,status=no");
  return;
}

function openWin(url, name, w, h) {
    var left = Math.round((screen.availWidth - w)/2);
    var top = Math.round((screen.availHeight-h)/2);
    win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=yes,menubar=no"
            + ",width=" + w + ",height=" + h
            + ",left=" + left + ",top=" + top);
    win.location.href = url;
    win.focus();
}

function infoWindow(url) {
  var width = 300
  var height = 250
  var left = (screen.availWidth - width) / 2;
  var top = (screen.availHeight-height)/2;
  OpenWin=this.open(url,"Info",
            "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes"
            + ",width=" + width + ",height=" + height
            + ",left=" + left + ",top=" + top);
}

function openProblemRating(id) {
    var width = Math.round(560);
    var height = Math.round(660);
    var left = Math.round((screen.availWidth - width) / 2);
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top="+top+",left="+left+",width=" + width + ",height=" + height + ",status=0";
    var name="problemRating";
    window.open('/tc?module=ProblemRatingQuestions&pid='+id,name,cmd);
    return;
  }


function goTo(selection) {
  sel = selection.options[selection.selectedIndex].value;
  if (sel == "arena")
  {
    arena();
  }
  //quick stats
  else if (sel == "alltimewin")
  {
    window.location = "/stat?c=all_time_wins";
  }
  else if (sel == "winningdebuts")
  {
    window.location = "/stat?c=winning_debuts";
  }
  else if (sel == "impressivedebuts")
  {
    window.location = "/stat?c=impressive_debuts";
  }
  else if (sel == "hightesttotal")
  {
    window.location = "/stat?c=highest_totals";
  }
  else if (sel == "ratingpointgain")
  {
    window.location = "/stat?c=biggest_rating_gains";
  }
  else if (sel == "consecwins")
  {
    window.location = "/stat?c=most_consecutive_wins";
  }
  else if (sel == "submissionaccuracy")
  {
    window.location = "/stat?c=highest_accuracy";
  }
  else if (sel == "challengesuccess")
  {
    window.location = "/stat?c=best_challengers";
  }
  //sponsor
  else if (sel == "general_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_gen";
  }
  else if (sel == "professional_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_prof";
  }
  else if (sel == "student_charts")
  {
    window.location = "/index?t=about_tc&c=spons_demo_stud";
  }
  else if (sel == "spons_srm_web")
  {
    window.location = "/index?t=about_tc&c=spons_srm_web";
  }
  else if (sel == "spons_srm_applet")
  {
    window.location = "/index?t=about_tc&c=spons_srm_applet";
  }
  else if (sel == "spons_srm_email")
  {
    window.location = "/index?t=about_tc&c=spons_srm_email";
  }
  else if (sel == "spons_tourny_web")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_web";
  }
  else if (sel == "spons_tourny_applet")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_applet";
  }
  else if (sel == "spons_tourny_email")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_email";
  }
  else if (sel == "spons_tourny_marketing")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_marketing";
  }
  else if (sel == "spons_tourny_onsite")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_onsite";
  }
  else if (sel == "spons_tourny_pr")
  {
    window.location = "/index?t=about_tc&c=spons_tourny_pr";
  }
  else if (sel == "spons_report_gen")
  {
    window.location = "/index?t=about_tc&c=spons_report_gen";
  }
  else if (sel == "spons_report_stud")
  {
    window.location = "/index?t=about_tc&c=spons_report_stud";
  }
  else if (sel == "spons_report_prof")
  {
    window.location = "/index?t=about_tc&c=spons_report_prof";
  }

  else {}
}
