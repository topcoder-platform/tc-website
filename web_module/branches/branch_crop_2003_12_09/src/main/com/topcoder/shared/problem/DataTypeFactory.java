package com.topcoder.shared.problem;

import java.util.Collection;
import java.util.HashMap;

/**
 * This class implements a global database of known data types.  Ideally it would be populated
 * at some appropriate initialization time with the set of valid data types.  Construction of
 * any new <code>DataType</code> adds to the data type population.
 *
 * @author Logan Hanks
 * @see DataType
 */
public class DataTypeFactory {
    static private HashMap types = new HashMap();

    /**
     * Obtain a <code>DataType</code> object with the given description.
     *
     * @param description A type description (e.g. <code>"String[]"</code>)
     * @throws InvalidTypeException
     */
    static public DataType getDataType(String description)
            throws InvalidTypeException {
        DataType type = (DataType) types.get(description);

        if (type == null)
            throw new InvalidTypeException(description);
        return type.cloneDataType();
    }

    static public DataType getDataType(int typeID)
            throws InvalidTypeException {
        DataType type = (DataType) types.get(new Integer(typeID));

        if (type == null)
            throw new InvalidTypeException(new String("" + typeID));
        return type.cloneDataType();
    }

    static void registerDataType(DataType type) {
        if (types.containsKey(type.getDescription()))
            return;
        types.put(type.getDescription(), type.cloneDataType());
        types.put(new Integer(type.getID()), type.cloneDataType());
    }

    static public Collection getDataTypes() {
        return types.values();
    }
}

