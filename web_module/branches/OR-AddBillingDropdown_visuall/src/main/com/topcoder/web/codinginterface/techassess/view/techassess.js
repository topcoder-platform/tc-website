
        function convertToTimeString(time) {
            time = (time - (time % 1000)) / 1000;
            var secs = time % 60;
            time = time - secs;
            var minutes = (time % 3600) / 60;
            time = time - (minutes * 60);
            var hours = time / 3600;

            return padWithZeroes(hours) + ":" + padWithZeroes(minutes) + ":" + padWithZeroes(secs);
        }


        function padWithZeroes(val) {
            var newVal = "00" + val;
            newVal = newVal.substring(newVal.length - 2, newVal.length);
            return newVal;
        }

