package com.topcoder.web.corp.view.testing.tag;

public class HourTag extends SelectTag {
    private static final String[] hours =
        {"12AM", "1AM", "2AM", "3AM", "4AM", "5AM", 
         "6AM", "7AM", "8AM", "9AM", "10AM", "11AM",
         "12PM", "1PM", "2PM", "3PM", "4PM", "5PM", 
         "6PM", "7PM", "8PM", "9PM", "10PM", "11PM"};

    protected String writeOptions() {
        StringBuffer buffer = new StringBuffer();

        int selectedNum = -1;
        if(selected != null) {
            selectedNum = Integer.parseInt(selected);
        }

        for(int i = 0; i < hours.length; ++i) {
            if(i == selectedNum) {
                buffer.append("<option value=\"" + i + "\" SELECTED>" + hours[i] + "</option>\n");
            }
            else {
                buffer.append("<option value=\"" + i + "\">" + hours[i] + "</option>\n");
            }
        }

        return buffer.toString();
    }
}
