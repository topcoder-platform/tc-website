package com.topcoder.web.tc.model;

import java.text.FieldPosition;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProblemRatingDistribution {

    private List frequencies = null;
    private String name = null;

    public ProblemRatingDistribution() {
        frequencies = new ArrayList();
        name = "";
    }

    public List getFrequencies() {
        return frequencies;
    }

    public void setFrequencies(List frequencies) {
        this.frequencies = frequencies;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getList() {
        StringBuffer buf = new StringBuffer(frequencies.size() * 5);
        NumberFormat format = NumberFormat.getInstance();
        format.setMaximumFractionDigits(2);
        FieldPosition fp = new FieldPosition(NumberFormat.FRACTION_FIELD);
        for (Iterator it = frequencies.iterator(); it.hasNext();) {
            format.format(it.next(), buf, fp);
            buf.append(',');
        }
        return buf.substring(0, buf.length() > 0 ? buf.length() - 1 : 0);  //skip that last comma
    }

    /**
     * @return
     */
    public String getkeyValueString() {
        return name + "=" + getList();
    }

}
