package com.topcoder.common.web.data.report;

/** A wrapper for a int
 *  @author Greg Paul
 *  @version $Revision$
 *
 */
public class IntResult extends ResultItem {

    private int value;

    public IntResult() {
        value = 0;
    }

    public IntResult(int value) {
        this.value = value;
    }

    public int getInt() {
        return value;
    }

    public int compareTo(Object other) {
        if (other instanceof IntResult) {
            int otherInt = ((IntResult) other).getInt();
            if (otherInt < value)
                return -1;
            else if (otherInt > value)
                return 1;
            else
                return 0;
        } else
            return this.toString().compareToIgnoreCase(other.toString());
    }

    public int getType() {
        return ResultItem.FLOAT;
    }

    public String toString() {
        return String.valueOf(value);
    }

}
