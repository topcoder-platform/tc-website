
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
                if (root.getElementById(name))
                    root.getElementById(name).innerHTML = text;
                //else alert("root " + root + " name " + name + " text + " + text);
            } else {
                alert("FIX ME");
            }
        }

        function padWithZeroes(val) {
            var newVal = "00" + val;
            newVal = newVal.substring(newVal.length - 2, newVal.length);
            return newVal;
        }