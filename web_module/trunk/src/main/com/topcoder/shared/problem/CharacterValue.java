package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

public class CharacterValue
        extends DataValue {
    private char value;

    public CharacterValue() {
    }

    public CharacterValue(char value) {
        this.value = value;
    }

    public void parse(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {
        reader.expect('\'', true);

        int i = reader.read(true);

        switch ((char) i) {
            case '\'':
                reader.exception("Missing character");
            case '\\':
                value = (char) reader.read(true);
                break;
            default:
                value = (char) i;
        }
        reader.expect('\'', true);
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeInt((int) value);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        value = (char) reader.readInt();
    }

    public String encode() {
        if (value == '\\' || value == '\'')
            return "'\\" + value + "'";
        return "'" + value + "'";
    }

    public char getChar() {
        return value;
    }

    public Object getValue() {
        return new Character(value);
    }
}
