package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

public class IntegralValue
        extends DataValue {
    private long value;

    public IntegralValue() {
    }

    public IntegralValue(long value) {
        this.value = value;
    }

    public void parse(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {
        reader.skipWhitespace();

        int i = reader.read();
        boolean valid = false;
        long sign = 1;

        value = 0;
        if ((char) i == '+' || (char) i == '-') {
            if ((char) i == '-')
                sign = -1;
            reader.skipWhitespace();
            i = reader.read();
        }
        while (i != -1 && Character.isDigit((char) i)) {
            value = value * 10 + (i - '0');
            i = reader.read();
            valid = true;
        }
        reader.unread(i);
        if (!valid)
            reader.expectedException("decimal digit", i);
        value *= sign;
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeLong(value);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        value = reader.readLong();
    }

    public String encode() {
        return String.valueOf(value);
    }

    public Object getValue() {
        return new Long(value);
    }
}

