package com.topcoder.web.corp.view.testing.tag;

public class MonthTag extends SelectTag {
    private static final String[] months =
        {"", //skip 0
         "January", "February", "March", "April", "May", "June", "July", 
         "August", "September", "October", "November", "December" };

    protected String writeOptions() {
        StringBuffer buffer = new StringBuffer();

        int selectedNum = -1;
        if(selected != null) {
            selectedNum = Integer.parseInt(selected);
        }

        for(int i = 1; i < months.length; ++i) {
            if(i == selectedNum) {
                buffer.append("<option value=\"" + i + "\" SELECTED>" + months[i] + "</option>\n");
            }
            else {
                buffer.append("<option value=\"" + i + "\">" + months[i] + "</option>\n");
            }
        }

        return buffer.toString();
    }
}
