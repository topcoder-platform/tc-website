package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;
import java.util.ArrayList;

public class ArrayValue
        extends DataValue {
    private ArrayList values;

    public ArrayValue() {
    }

    public ArrayValue(ArrayList values) {
        this.values = values;
    }

    public ArrayValue(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {
        parse(reader, type);
    }

    public void parse(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {

        try {
            reader.expect('{', true);

            DataType subtype = type.reduceDimension();

            values = new ArrayList();
            if (reader.checkAhead('}', true))
                return;
            do
                values.add(DataValue.parseValue(reader, subtype));
            while (reader.checkAhead(',', true));
            reader.expect('}', true);
        } catch (InvalidTypeException ex) {
            reader.exception("Invalid array type: " + type.getDescription());
        }
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeArrayList(values);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        values = reader.readArrayList();
    }

    public String encode() {
        String[] vals = new String[values.size()];
        int len = 2;

        for (int i = 0; i < vals.length; i++) {
            vals[i] = ((DataValue) values.get(i)).encode();
            len += vals[i].length() + 2;
        }

        StringBuffer buf = new StringBuffer(len);

        buf.append('{');
        for (int i = 0; i < vals.length; i++) {
            if (i > 0)
                buf.append(",\n ");
            buf.append(' ');
            buf.append(vals[i]);
        }
        buf.append(" }");
        return buf.toString();
    }

    public Object getValue() {
        return values.toArray();
    }
}

