package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

public class StringValue
        extends DataValue {
    private String value;

    public StringValue() {
    }

    public StringValue(String value) {
        this.value = value;
    }

    public void parse(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {
        reader.expect('"', true);

        StringBuffer buf = new StringBuffer(64);

        while (!reader.checkAhead('"')) {
            int i = reader.read(true);
            char c;

            if ((char) i == '\\')
                c = (char) reader.read(true);
            else
                c = (char) i;
            buf.append(c);
        }
        value = buf.toString();
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(value);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        value = reader.readString();
    }

    public String encode() {
        StringBuffer buf = new StringBuffer(value.length() + 32);

        buf.append('"');
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);

            if (c == '\\' || c == '"')
                buf.append('\\');
            buf.append(c);
        }
        buf.append('"');
        return buf.toString();
    }

    public Object getValue() {
        return value;
    }
}

