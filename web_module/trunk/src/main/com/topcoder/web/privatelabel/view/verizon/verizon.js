        var agt=navigator.userAgent.toLowerCase();
         var appVer = navigator.appVersion.toLowerCase();
         var is_minor = parseFloat(appVer);
         var is_major = parseInt(is_minor);

         var iePos = appVer.indexOf('msie');
         if (iePos !=-1) {
           is_minor = parseFloat(appVer.substring(iePos+5,appVer.indexOf(';',iePos)));
           is_major = parseInt(is_minor);
         }
         var is_opera = (agt.indexOf("opera") != -1);

         var is_konq = false;
         var kqPos = agt.indexOf('konqueror');
         if (kqPos !=-1) {
           is_konq = true;
         }
         var is_safari = ((agt.indexOf('safari')!=-1)&&(agt.indexOf('mac')!=-1))?true:false;

         var is_khtml = (is_safari || is_konq);
         var is_moz = ((agt.indexOf('mozilla/5')!=-1) && (agt.indexOf('spoofer')==-1) &&  (agt.indexOf('compatible')==-1) && (agt.indexOf('opera')==-1) &&  (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1) && ((navigator.vendor=="")||(navigator.vendor=="Mozilla")));
         var is_nav = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1) && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1) && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1) && (!is_khtml) && (!(is_moz)));
         var is_nav5up = (is_nav && is_minor >= 5);
         var is_ie = ((iePos!=-1) && (!is_opera) && (!is_khtml));
         var is_ie4 = (is_ie && is_major == 4);
         var is_ie4up = (is_ie && is_minor >= 4);
         var is_ie5up = (is_ie && is_minor >= 5);
         var is_ie5_5up =(is_ie && is_minor >= 5.5);
         var is_win = ( (agt.indexOf("win")!=-1) || (agt.indexOf("16bit")!=-1) );
         var is_mac = (agt.indexOf("mac")!=-1);
         if (is_mac) { is_win = !is_mac; } var is_Flash = false;
         var is_FlashVersion = 0;
         if ((is_nav||is_opera||is_moz)|| (is_mac&&is_ie5up)) {
           var plugin = (navigator.mimeTypes && navigator.mimeTypes["application/x-shockwave-flash"] &&  navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin) ? navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin : 0;
             if (plugin) {
               is_Flash = true;
               is_FlashVersion = parseInt(plugin.description.substring(plugin.description.indexOf(".")-1));
             }
         }
         if (is_win&&is_ie4up){ document.write( '' + '\n' + 'Dim hasPlayer, playerversion' + '\n' + 'hasPlayer = false' + '\n' + 'playerversion = 10' + '\n' + 'Do While playerversion > 0' + '\n' + 'On Error Resume Next' + '\n' + 'hasPlayer = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash." & playerversion)))' + '\n' + 'If hasPlayer = true Then Exit Do' + '\n' + 'playerversion = playerversion - 1' + '\n' + 'Loop' + '\n' + 'is_FlashVersion = playerversion' + '\n' + 'is_Flash = hasPlayer' + '\n' + '<\/sc' + 'ript>' ); } var isBestClient = false;
         if (is_ie5_5up&&(is_FlashVersion >=5)) { isBestClient = true; }



        var style="pc";
        if (is_mac){style = "mac_ns4"
            if (is_ie5up)
                style="mac_ie"
            if (is_ie4)
                style="mac_ie4"}
        else { if (is_nav) {
            if (is_nav5up)
                style+="ns6"
            else
                style+="ns4"}
        }
                alert(style);
        var finalstyle = '<link rel="stylesheet" type="text/css" href="/css/verizon/vcc_' + style + '.css">';
        document.write(finalstyle);
