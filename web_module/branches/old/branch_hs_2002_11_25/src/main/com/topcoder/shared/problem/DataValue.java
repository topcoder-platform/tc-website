package com.topcoder.shared.problem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

abstract public class DataValue extends BaseElement implements Element {
    static private HashMap types = buildTypes();

    abstract public void parse(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException;

    abstract public String encode();

    abstract public Object getValue();


    public String toXML() {
        return super.encodeHTML(encode());
    }


    static public DataValue parseValue(String text, DataType type)
            throws IOException, DataValueParseException {
        return parseValue(new DataValueReader(text), type);
    }

    static public DataValue parseValue(DataValueReader reader, DataType type)
            throws IOException, DataValueParseException {
        if (type.getDimension() > 0)
            return new ArrayValue(reader, type);

        String valuetype = (String) types.get(type.getDescription());

        if (valuetype == null)
            throw new DataValueParseException("Do not know how to handle data of type " + type.getDescription());
        try {
            Class c = Class.forName(valuetype);
            DataValue value = (DataValue) c.newInstance();

            value.parse(reader, type);
            return value;
        } catch (DataValueParseException ex) {
            throw ex;
        } catch (Exception ex) {
            throw new DataValueParseException("Error instantiating object of type " + valuetype + ": " + ex);
        }
    }

    static public DataValue[] parseValues(String[] values, DataType[] types)
            throws IOException, DataValueParseException {
        DataValue[] dvs = new DataValue[values.length];
        for (int i = 0; i < values.length; i++)
            dvs[i] = parseValue(values[i], types[i]);
        return dvs;
    }

    static public Object parseValueToObject(String text, DataType type)
            throws IOException, DataValueParseException {
        return convertDataValueToObject(parseValue(text, type), type);
    }

    static public Object[] parseValuesToObjects(String[] values,
                                                DataType[] types)
            throws IOException, DataValueParseException {
        return convertDataValuesToObjects(parseValues(values, types), types);
    }


    static public DataValue[] parseSequence(String text, DataType[] type)
            throws IOException, DataValueParseException {
        return parseSequence(new DataValueReader(text), type);
    }

    static public DataValue[] parseSequence(DataValueReader reader, DataType[] type)
            throws IOException, DataValueParseException {
        reader.expect('{', true);

        DataValue[] result = new DataValue[type.length];

        for (int i = 0; i < type.length; i++) {
            if (i > 0)
                reader.expect(',', true);
            result[i] = parseValue(reader, type[i]);
        }
        reader.expect('}', true);
        return result;
    }

    public static Object convertDataValueToObject(DataValue value,
                                                  DataType type) throws DataValueParseException {
        String desc = type.getDescription();
        Object object = null;
        try {
            if (desc.equals("int") || desc.equals("Integer")) {
                object = new Integer((int) ((Long) value.getValue())
                        .longValue());
            } else if (desc.equals("long") || desc.equals("Long")) {
                object = (Long) value.getValue();
            } else if (desc.equals("float") || desc.equals("Float")) {
                object = new Float(((Double) value.getValue()).floatValue());
            } else if (desc.equals("double") || desc.equals("Double")) {
                object = (Double) value.getValue();
            } else if (desc.equals("short") || desc.equals("Short")) {
                object = new Short((short) ((Long) value.getValue())
                        .longValue());
            } else if (desc.equals("byte") || desc.equals("Byte")) {
                throw new DataValueParseException("byte and Byte not supported.");
            } else if (desc.equals("boolean") || desc.equals("Boolean")) {
                throw new DataValueParseException(
                        "boolean and Boolean not supported.");
            } else if (desc.equals("char") || desc.equals("Character")) {
                object = (Character) value.getValue();
            } else if (desc.equals("String")) {
                object = (String) value.getValue();
            } else if (desc.equals("ArrayList")) {
                throw new DataValueParseException("ArrayList not supported.");
            } else if (desc.equals("int[]")) {
                Object[] arrayO = (Object[]) value.getValue();
                int[] arrayI = new int[arrayO.length];
                for (int j = 0; j < arrayO.length; j++) {
                    arrayI[j] = (int) ((Long) ((DataValue) arrayO[j]).getValue())
                            .longValue();
                }
                object = arrayI;
            } else if (desc.equals("double[]")) {
                throw new DataValueParseException("double[] not supported.");
            } else if (desc.equals("String[]")) {
                Object[] arrayO = (Object[]) value.getValue();
                String[] arrayS = new String[arrayO.length];
                for (int j = 0; j < arrayO.length; j++) {
                    arrayS[j] = (String) ((DataValue) arrayO[j]).getValue();
                }
                object = arrayS;
            }
        } catch (DataValueParseException de) {
            throw de;
        } catch (Exception e) {
            throw new DataValueParseException(e.toString());
        }
        return object;
    }

    /**
     * Trys to convert a list of DataValues to a list of Object.
     * Throws a DataValueParseException if there is an error.
     */
    public static Object[] convertDataValuesToObjects(DataValue[] values,
                                                      DataType[] types) throws DataValueParseException {
        Object[] objects = new Object[values.length];

        try {
            for (int i = 0; i < objects.length; i++) {
                objects[i] = convertDataValueToObject(values[i], types[i]);
            }
        } catch (DataValueParseException de) {
            throw de;
        } catch (Exception e) {
            throw new DataValueParseException(e.toString());
        }
        return objects;
    }

    public static DataValue convertObjectToDataValue(Object obj, DataType type)
            throws DataValueParseException {
        DataValue dataValue = null;
        try {
            String desc = type.getDescription();
            if (desc.equals("int") || desc.equals("Integer")) {
                dataValue = new IntegralValue(((Integer) obj).longValue());
            } else if (desc.equals("long") || desc.equals("Long")) {
                dataValue = new IntegralValue(((Long) obj).longValue());
            } else if (desc.equals("float") || desc.equals("Float")) {
                dataValue = new DecimalValue(((Float) obj).doubleValue());
            } else if (desc.equals("double") || desc.equals("Double")) {
                dataValue = new DecimalValue(((Double) obj).doubleValue());
            } else if (desc.equals("short") || desc.equals("Short")) {
                dataValue = new IntegralValue(((Long) obj).longValue());
            } else if (desc.equals("byte") || desc.equals("Byte")) {
                throw new DataValueParseException("byte and Byte not supported.");
            } else if (desc.equals("boolean") || desc.equals("Boolean")) {
                throw new DataValueParseException(
                        "boolean and Boolean not supported.");
            } else if (desc.equals("char") || desc.equals("Character")) {
                dataValue = new CharacterValue(((Character) obj).charValue());
            } else if (desc.equals("String")) {
                dataValue = new StringValue((String) obj);
            } else if (desc.equals("ArrayList")) {
                throw new DataValueParseException("ArrayList not supported.");
            } else if (desc.equals("int[]")) {
                ArrayList values = new ArrayList();
                int[] ints = (int[]) obj;
                for (int i = 0; i < ints.length; i++)
                    values.add(new IntegralValue((long) ints[i]));
                dataValue = new ArrayValue(values);
            } else if (desc.equals("double[]")) {
                throw new DataValueParseException("double[] not supported.");
            } else if (desc.equals("String[]")) {
                ArrayList values = new ArrayList();
                String[] strings = (String[]) obj;
                for (int i = 0; i < strings.length; i++)
                    values.add(new StringValue(strings[i]));
                dataValue = new ArrayValue(values);
            }
        } catch (ClassCastException e) {
            throw new DataValueParseException("Error converting Object to DataValue. "
                    + "Expected " + type.getDescription() + ", got " + e.getMessage());
        }

        return dataValue;
    }

    public static DataValue[] convertObjectsToDataValues(
            Object[] objs, DataType[] types) throws DataValueParseException {
        DataValue[] values = new DataValue[objs.length];
        for (int i = 0; i < values.length; i++)
            values[i] = convertObjectToDataValue(objs[i], types[i]);
        return values;
    }

    static private HashMap buildTypes() {
        HashMap types = new HashMap();

        types.put("char", "com.topcoder.shared.problem.CharacterValue");
        types.put("Character", "com.topcoder.shared.problem.CharacterValue");
        types.put("int", "com.topcoder.shared.problem.IntegralValue");
        types.put("Integer", "com.topcoder.shared.problem.IntegralValue");
        types.put("long", "com.topcoder.shared.problem.IntegralValue");
        types.put("Long", "com.topcoder.shared.problem.IntegralValue");
        types.put("short", "com.topcoder.shared.problem.IntegralValue");
        types.put("Short", "com.topcoder.shared.problem.IntegralValue");
        types.put("double", "com.topcoder.shared.problem.DecimalValue");
        types.put("Double", "com.topcoder.shared.problem.DecimalValue");
        types.put("float", "com.topcoder.shared.problem.DecimalValue");
        types.put("Float", "com.topcoder.shared.problem.DecimalValue");
        types.put("String", "com.topcoder.shared.problem.StringValue");
        return types;
    }
}

