package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * A class to represent a value.
 *
 * @author mitalub
 */
public class Value extends BaseElement implements Element {
    private String value;

    public Value(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(value);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        value = reader.readString();
    }


    public String toXML() {
        StringBuffer sb = new StringBuffer();
        sb.append("<value value='");
        sb.append(ProblemComponent.encodeHTML(value.toString()));
        sb.append("'></value>");
        return sb.toString();
    }


}
