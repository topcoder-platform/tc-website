package com.topcoder.web.corp.view.testing.tag;

import com.topcoder.web.corp.view.testing.tag.SelectTag;

import java.util.Calendar;

public class YearTag extends SelectTag {
    private String start;
    private String count;

    /**
     * Sets the value of <code>start</code>.
     *
     * @param start
     */
    public void setStart( String val ) {
        start = val;
    }

    /**
     * Sets the value of <code>count</code>.
     *
     * @param count
     */
    public void setCount( String val ) {
        count = val;
    }

    protected String writeOptions() {
        StringBuffer buffer = new StringBuffer();

        int selectedNum = -1;
        if(selected != null) {
            selectedNum = Integer.parseInt(selected);
        }

        int length = 5;
        if(count != null) {
            length = Integer.parseInt(count);
        }

        int startYear = 0; 
        if(start != null) {
            startYear = Integer.parseInt(start);
        }
        else {
            startYear = Calendar.getInstance().get(Calendar.YEAR);
        }

        for(int i = 0; i < length; ++i) {
            int year = startYear + i;
            if(year == selectedNum) {
                buffer.append("<option value=\"" + year + "\" SELECTED>" + year + "</option>\n");
            }
            else {
                buffer.append("<option value=\"" + year + "\">" + year + "</option>\n");
            }
        }

        return buffer.toString();
        
    }
}
