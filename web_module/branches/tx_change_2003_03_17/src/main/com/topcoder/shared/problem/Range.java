package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * A class to represent a range of values.
 *
 * @author mitalub
 */
public class Range extends BaseElement implements Element {
    private String min, max;
//TODO shouldn't these be ints?
    public Range(String min, String max) {
        this.min = min;
        this.max = max;
    }

    public Range() {
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(min);
        writer.writeString(max);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        min = reader.readString();
        max = reader.readString();
    }

    public String getMin() {
        return min;
    }

    public String getMax() {
        return max;
    }

    public String toXML() {
        StringBuffer sb = new StringBuffer();
        sb.append("<range min='");
        sb.append(ProblemComponent.encodeHTML(min.toString()));
        sb.append("' max='");
        sb.append(ProblemComponent.encodeHTML(max.toString()));
        sb.append("'></range>");
        return sb.toString();
    }
}
