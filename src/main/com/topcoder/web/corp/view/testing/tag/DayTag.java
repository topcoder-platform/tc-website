package com.topcoder.web.corp.view.testing.tag;

public class DayTag extends SelectTag {

    protected String writeOptions() {
        StringBuffer buffer = new StringBuffer();

        int selectedNum = -1;
        if(selected != null) {
            selectedNum = Integer.parseInt(selected);
        }

        for(int i = 1; i <= 31; ++i) {
            if(i == selectedNum) {
                buffer.append("<option value=\"" + i + "\" SELECTED>" + i + "</option>\n");
            }
            else {
                buffer.append("<option value=\"" + i + "\">" + i + "</option>\n");
            }
        }

        return buffer.toString();
    }
}

