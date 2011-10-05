package com.topcoder.common.web.data.report;

import java.text.DateFormat;

/** A wrapper for a date
 *  @author Greg Paul
 *  @version $Revision$
 *
 */
public class DateResult extends ResultItem {

    private java.sql.Date value;

    public DateResult() {
        value = null;
    }

    public DateResult(java.sql.Date value) {
        this.value = value;
    }

    public java.sql.Date getDate() {
        return value;
    }

    public void setDate(java.sql.Date value) {
        this.value = value;
    }

    public int compareTo(Object other) {
        if (other instanceof DateResult) {
            return value.compareTo(((DateResult) other).getDate());
        } else
            return this.toString().compareToIgnoreCase(other.toString());
    }

    public int getType() {
        return ResultItem.FLOAT;
    }

    public String toString() {
        DateFormat df = DateFormat.getDateInstance(DateFormat.LONG);
        if (value == null)
            return "";
        else
            return df.format(value);
    }

}
