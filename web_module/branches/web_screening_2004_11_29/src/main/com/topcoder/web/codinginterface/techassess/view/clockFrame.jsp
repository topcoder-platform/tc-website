<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
  <head>
    <title></title>
    <META HTTP-EQUIV=Refresh CONTENT="600; URL=<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=CurrentTime">
  </head>
  <body>
    <script language="javascript">
        //perform clock sync, time below is in milliseconds after epoch
        var serverTime = new Date(<%=request.getAttribute("currentTime")%>);
        var localTime = new Date();

        var serverOffset = -5; //hours from GMT
        var offset = localTime.getTimezoneOffset();
        offset = offset / 60;
        offset = offset * -1

        serverTime = new Date(serverTime.getTime() - ((serverOffset - offset) * 60 * 60 * 1000));
        var syncedOffset = localTime.getTime() - serverTime.getTime();
        function update() {
            var d = new Date();
            d = new Date(d.getTime() - syncedOffset);
            var offset = d.getTimezoneOffset();
            offset = offset / 60;
            offset = offset * -1

            var leadingIdent = d.getHours() >= 12 ? "PM" : "AM" ;

            var text = padWithZeroes(d.getHours() % 12) + ":" + padWithZeroes(d.getMinutes()) + ":" + padWithZeroes(d.getSeconds()) + " " + leadingIdent + " GMT" + offset;

            if(top.mainFrame && top.mainFrame.document && top.mainFrame.document.getElementById("currentTimer")) {
                updateDivOrSpan(top.mainFrame.document, "currentTimer", text);
            }

            setTimeout("update()", 1000);
        }

        function convertToTimeString(time) {
            time = (time - (time % 1000)) / 1000;
            var secs = time % 60;
            time = time - secs;
            var minutes = (time % 3600) / 60;
            time = time - (minutes * 60);
            var hours = time / 3600;

            return padWithZeroes(hours) + ":" + padWithZeroes(minutes) + ":" + padWithZeroes(secs);
        }

        function updateDivOrSpan(root, name, text) {
            if(root.getElementById) {
                root.getElementById(name).innerHTML = text;
            } else {
            }
        }

        function padWithZeroes(val) {
            if(val == 0)
                val = 12;
            var newVal = "00" + val;
            newVal = newVal.substring(newVal.length - 2, newVal.length);
            return newVal;
        }

        setTimeout("update()", 1000);
    </script>
  </body>
</html>
