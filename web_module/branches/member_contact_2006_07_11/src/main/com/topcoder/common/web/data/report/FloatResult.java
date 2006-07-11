package com.topcoder.common.web.data.report;

import java.text.DecimalFormat;

/** A wrapper for a float
 *  @author Greg Paul
 *  @version $Revision$
 *
 */
public class FloatResult extends ResultItem {

    private float value;

    public FloatResult() {
        value = 0;
    }

    public FloatResult(float value) {
        this.value = value;
    }

    public float getFloat() {
        return value;
    }

    public void setFloat(float value) {
        this.value = value;
    }

    public int compareTo(Object other) {
        if (other instanceof FloatResult) {
            float otherFloat = ((FloatResult) other).getFloat();
            if (otherFloat < value)
                return -1;
            else if (otherFloat > value)
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
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(value);
    }

}
