package com.topcoder.shared.netCommon;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.io.StreamCorruptedException;
import java.io.UTFDataFormatException;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.lang.reflect.*;

/**
 * The default <code>CSReader</code> and <code>CSWriter</code> implementation.
 * This class is designed for inheritance. You may want to subclass it if you want
 * to send/recv your custom classes but you cannot or do not want to change <code>CSHandler</code>.
 * 
 * @author  Timur Zambalayev
 */ 
public abstract class CSHandler implements CSReader, CSWriter {

    // primitives
    private static final byte NULL=1;
    private static final byte STRING=2;
    private static final byte BOOLEAN=3;
    private static final byte INTEGER=4;
    private static final byte CHAR_ARRAY=5;
    private static final byte DOUBLE=6;
    private static final byte BYTE=7;
    private static final byte BYTE_ARRAY=8;
    private static final byte OBJECT_ARRAY=9;
    private static final byte INT_ARRAY=10;
    private static final byte CHAR=11;
    private static final byte STRING_ARRAY=12;
    private static final byte LONG=13;
    private static final byte OBJECT_ARRAY_ARRAY=14;
    private static final byte LONG_STRING=15;

    // collections
    private static final byte ARRAY_LIST=33;
    private static final byte HASH_MAP=34;

    private static final byte CUSTOM_SERIALIZABLE=65;
    
    // 66-96 reserved for NetCommonCSHandler and its subclasses

    // 97 and higher reserved for other subclasses

    private DataOutput output;
    private DataInput input;

    /**
     * Constructs a new custom serialization handler.
     */ 
    public CSHandler() {
    }

    public final void setDataInput(DataInput input) {
        this.input=input;
    }

    public final void setDataOutput(DataOutput output) {
        this.output=output;
    }

    public final void writeByte(byte b) throws IOException {
        output.writeByte(b);
    }

    public final byte readByte() throws IOException {
        return input.readByte();
    }

    private boolean isNull(byte expected) throws IOException {
        byte b=readByte();
        if (b==NULL) {
            return true;
        }
        if (b!=expected) {
            throw new RuntimeException("unexpected, b="+b+", expected="+expected);
        }
        return false;
    }

    private void writeNull() throws IOException {
        writeByte(NULL);
    }

    public final short readShort() throws IOException {
        return input.readShort();
    }

    public final void writeShort(short v) throws IOException {
        output.writeShort(v);
    }

    public final int readInt() throws IOException {
        return input.readInt();
    }

    public final void writeInt(int v) throws IOException {
        output.writeInt(v);
    }

    public final long readLong() throws IOException {
        return input.readLong();
    }

    public final void writeLong(long v) throws IOException {
        output.writeLong(v);
    }

    public final boolean readBoolean() throws IOException {
        return input.readBoolean();
    }

    public final void writeBoolean(boolean v) throws IOException {
        output.writeBoolean(v);
    }

    public final ArrayList readArrayList() throws IOException {
        if (isNull(ARRAY_LIST)) {
            return null;
        }
        return readJustArrayList();
    }

    private ArrayList readJustArrayList() throws IOException {
        int size=readShort();
        ArrayList list=new ArrayList(size);
        for (int i=0; i<size; i++) {
            list.add(readObject());
        }
        return list;
    }

    public final void writeArrayList(ArrayList list) throws IOException {
        if (list==null) {
            writeNull();
            return;
        }
        int size=list.size();
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("list big size: "+size);
        }
        writeByte(ARRAY_LIST);
        writeShort((short) size);
        try {
            for (Iterator it=list.iterator(); it.hasNext();) {
                writeObject(it.next());
            }
        } catch (ConcurrentModificationException e) {
            throwConcurrentModificationException(e,list);
        }
    }
    
    private Object[] readJustObjectArray(Class clazz) throws IOException {
        int size=readShort();
        Object[] r=(Object[]) Array.newInstance(clazz,size);
        for (int i=0; i<size; i++) {
            r[i]=readObject();
        }
        return r;
    }

    private Object[] readJustObjectArray() throws IOException {
        int size=readShort();
        Object[] r=new Object[size];
        for (int i=0; i<size; i++) {
            r[i]=readObject();
        }
        return r;
    }

    public final Object[] readObjectArray() throws IOException {
        if (isNull(OBJECT_ARRAY)) {
            return null;
        }
        return readJustObjectArray();
    }
    

    public final Object[] readObjectArray(Class clazz) throws IOException {
        if (isNull(OBJECT_ARRAY)) {
            return null;
        }
        return readJustObjectArray(clazz);
    }

    private void writeJustObjectArray(Object[] objectArray) throws IOException {
        int size=objectArray.length;
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("object array big size: "+size);
        }
        writeShort((short) size);
        for (int i=0; i<size; i++) {
            writeObject(objectArray[i]);
        }
    }

    public final void writeObjectArray(Object[] objectArray) throws IOException {
        if (objectArray==null) {
            writeNull();
            return;
        }
        writeByte(OBJECT_ARRAY);
        writeJustObjectArray(objectArray);
    }

    public final Object[][] readObjectArrayArray() throws IOException {
        if (isNull(OBJECT_ARRAY)) {
            return null;
        }
        int size=readShort();
        Object[][] r=new Object[size][];
        for (int i=0; i<size; i++) {
            r[i]=readJustObjectArray();
        }
        return r;
    }

    public final void writeObjectArrayArray(Object[][] objectArrayArray) throws IOException {
        if (objectArrayArray==null) {
            writeNull();
            return;
        }
        int size=objectArrayArray.length;
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("object array big size: "+size);
        }
        writeByte(OBJECT_ARRAY_ARRAY);
        writeShort((short) size);
        for (int i=0; i<size; i++) {
            writeJustObjectArray(objectArrayArray[i]);
        }
    }

    private int[] readJustIntArray() throws IOException {
        int size=readShort();
        int[] intArray=new int[size];
        for (int i=0; i<size; i++) {
            intArray[i]=readInt();
        }
        return intArray;
    }

    private void writeIntArray(int[] intArray) throws IOException {
        if (intArray==null) {
            writeNull();
            return;
        }
        int size=intArray.length;
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("int array big size: "+size);
        }
        writeByte(INT_ARRAY);
        writeShort((short) size);
        for (int i=0; i<size; i++) {
            writeInt(intArray[i]);
        }
    }

    private String[] readJustStringArray() throws IOException {
        int size=readShort();
        String[] stringArray=new String[size];
        for (int i=0; i<size; i++) {
            stringArray[i]=readString();
        }
        return stringArray;
    }

    private void writeStringArray(String[] stringArray) throws IOException {
        if (stringArray==null) {
            writeNull();
            return;
        }
        int size=stringArray.length;
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("String array big size: "+size);
        }
        writeByte(STRING_ARRAY);
        writeShort((short) size);
        for (int i=0; i<size; i++) {
            writeString(stringArray[i]);
        }
    }

    public final HashMap readHashMap() throws IOException {
        if (isNull(HASH_MAP)) {
            return null;
        }
        return readJustHashMap();
    }

    private HashMap readJustHashMap() throws IOException {
        int size=readShort();
        HashMap map=new HashMap(size);
        for (int i=0; i<size; i++) {
            Object key=readObject();
            Object value=readObject();
            map.put(key,value);
        }
        return map;
    }

    public final void writeHashMap(HashMap map) throws IOException {
        if (map==null) {
            writeNull();
            return;
        }
        int size=map.size();
        if (size>Short.MAX_VALUE) {
            throw new RuntimeException("map big size: "+size);
        }
        writeByte(HASH_MAP);
        writeShort((short) size);
        try {
            for (Iterator it=map.entrySet().iterator(); it.hasNext();) {
                Map.Entry entry=(Map.Entry) it.next();
                writeObject(entry.getKey());
                writeObject(entry.getValue());
            }
        } catch (ConcurrentModificationException e) {
            throwConcurrentModificationException(e,map);
        }
    }

    private void throwConcurrentModificationException(ConcurrentModificationException e, Object obj) {
        throw new ConcurrentModificationException(e+", object="+obj);
    }

    private String readUTF() throws IOException {
        return input.readUTF();
    }

    private void writeUTF(String s) throws IOException {
        output.writeUTF(s);
    }

    public final String readString() throws IOException {
        if (isNull(STRING)) {
            return null;
        }
        return readUTF();
    }
    
    static int getUTFLength(String s) {
        int sum=0;
        int length=s.length();
        for (int i=0; i<length; i++) {
            char ch=s.charAt(i);
            if (0x0001<=ch && ch<=0x007F) {
                sum++;
            } else if (ch>0x07FF) {
                sum+=3;
            } else {
                sum+=2;
            }
        }
        return sum;
    }
    
    private String readLongString() throws IOException {
        return readUTFBody(readInt());
    }
    
    private String readUTFBody(int utfLength) throws IOException {
        byte[] bytearr=readBytes(utfLength);
        StringBuffer buf=new StringBuffer(utfLength);
        for (int count=0; count<utfLength; ) {
            int c=bytearr[count] & 0xFF;
            int prefix=c>>4;
            switch (prefix) {
            case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
                /* 0xxxxxxx */
                count++;
                break;
            case 12: case 13:
                /* 110x xxxx   10xx xxxx */
                count+=2;
                if (count>utfLength) {
                    throw new UTFDataFormatException();
                }
                {
                    int char2=(int) bytearr[count-1];
                    if ((char2 & 0xC0) != 0x80) {
                        throw new UTFDataFormatException();
                    }
                    c=((c & 0x1F) << 6) | (char2 & 0x3F);
                }
                break;
            case 14:
                /* 1110 xxxx  10xx xxxx  10xx xxxx */
                count+=3;
                if (count>utfLength) {
                    throw new UTFDataFormatException();
                }
                {
                    int char2=(int) bytearr[count-2];
                    int char3=(int) bytearr[count-1];
                    if (((char2 & 0xC0) != 0x80) || ((char3 & 0xC0) != 0x80)) {
                        throw new UTFDataFormatException();
                    }
                    c=((c & 0x0F) << 12) | ((char2 & 0x3F) << 6) | ((char3 & 0x3F) << 0);
                }
                break;
            default:
                /* 10xx xxxx,  1111 xxxx */
                throw new UTFDataFormatException();
            }
            buf.append((char) c);
        }
        return buf.toString();
    }
    
    private void writeUTFBody(String s) throws IOException {
        int length=s.length();
        for (int i=0; i<length; i++) {
            char c=s.charAt(i);
            if ((0x0001<=c) && (c<=0x007F)) {
                writeByte((byte) c);
            } else if (0x07FF<c) {
                writeByte((byte) (0xE0 | ((c >> 12) & 0x0F)));
                writeByte((byte) (0x80 | ((c >>  6) & 0x3F)));
                writeByte((byte) (0x80 | ((c >>  0) & 0x3F)));
            } else {
                writeByte((byte) (0xC0 | ((c >>  6) & 0x1F)));
                writeByte((byte) (0x80 | ((c >>  0) & 0x3F)));
            }
        }
    }
    
    private void writeLongUTF(String string, int utfLength) throws IOException {
        writeInt(utfLength);
        if (utfLength==string.length()) {
            output.writeBytes(string);
        } else {
            writeUTFBody(string);
        }
    }

    public final void writeString(String string) throws IOException {
        if (string==null) {
            writeNull();
            return;
        }
        int len=getUTFLength(string);
        if (len>65535) {
            writeByte(LONG_STRING);
            writeLongUTF(string,len);
        } else {
            writeByte(STRING);
            writeUTF(string);
        }
    }
    
    private byte[] readBytes(int length) throws IOException {
        byte[] b=new byte[length];
        input.readFully(b);
        return b;
    }

    public final byte[] readByteArray() throws IOException {
        if (isNull(BYTE_ARRAY)) {
            return null;
        }
        return readBytes(readInt());
    }

    public final void writeByteArray(byte[] byteArray) throws IOException {
        if (byteArray==null) {
            writeNull();
            return;
        }
        int size=byteArray.length;
        writeByte(BYTE_ARRAY);
        writeInt(size);
        output.write(byteArray);
    }

    public final char[] readCharArray() throws IOException {
        if (isNull(CHAR_ARRAY)) {
            return null;
        }
        return readJustCharArray();
    }

    private char[] readJustCharArray() throws IOException {
        return readUTF().toCharArray();
    }

    public final void writeCharArray(char[] charArray) throws IOException {
        if (charArray==null) {
            writeNull();
            return;
        }
        writeByte(CHAR_ARRAY);
        writeUTF(new String(charArray));
    }

    public final double readDouble() throws IOException {
        String s=readUTF();
        if (s.equals("NaN")) {
            return Double.NaN;
        }
        if (s.equals("-Infinity")) {
            return Double.NEGATIVE_INFINITY;
        }
        if (s.equals("Infinity")) {
            return Double.POSITIVE_INFINITY;
        }
        return Double.parseDouble(s);
    }

    public final void writeDouble(double v) throws IOException {
        writeUTF(""+v);
    }

    /**
     * A convenience method for writing <code>CustomSerializable</code> instances.
     * 
     * @param   object                  the object to be written, it should be a <code>CustomSerializable</code> 
     *                                  instance. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    protected final void customWriteObject(Object object) throws IOException {
        ((CustomSerializable) object).customWriteObject(this);
    }

    /**
     * This method should be used by subclasses to write their custom types.
     * 
     * @param   object                  the object to be written.
     * @return  <code>true</code> if object is processed, <code>false</code> otherwise.
     * @throws  java.io.IOException     if an I/O error has occurred.
     */
    protected abstract boolean writeObjectOverride(Object object) throws IOException;

    public final void writeObject(Object object) throws IOException {
        if (object==null) {
            writeNull();
            return;
        }
        if (writeObjectOverride(object)) {
            return;
        }
        if (object instanceof ArrayList) {
            writeArrayList((ArrayList) object);
        } else if (object instanceof String) {
            writeString((String) object);
        } else if (object instanceof Integer) {
            writeByte(INTEGER);
            writeInt(((Integer) object).intValue());
        } else if (object instanceof HashMap) {
            writeHashMap((HashMap) object);
        } else if (object instanceof Boolean) {
            writeByte(BOOLEAN);
            writeBoolean(((Boolean) object).booleanValue());
        } else if (object instanceof Byte) {
            writeByte(BYTE);
            writeByte(((Byte) object).byteValue());
        } else if (object instanceof Long) {
            writeByte(LONG);
            writeLong(((Long) object).longValue());
        } else if (object instanceof Character) {
            writeByte(CHAR);
            writeShort((short) ((Character) object).charValue());
        } else if (object instanceof Double) {
            writeByte(DOUBLE);
            writeDouble(((Double) object).doubleValue());
        } else if (object instanceof char[]) {
            writeCharArray((char[]) object);
        } else if (object instanceof int[]) {
            writeIntArray((int[]) object);
        } else if (object instanceof String[]) {
            writeStringArray((String[]) object);
        } else if (object instanceof CustomSerializable) { // this is mainly for testing
            writeByte(CUSTOM_SERIALIZABLE);
            writeUTF(object.getClass().getName());
            customWriteObject(object);
        } else {
            throw new RuntimeException("writeBaseObject, not implemented: "+object.getClass());
        }
    }

    /**
     * Returns a <code>Boolean</code> instance representing the specified <code>boolean</code> value.
     * In Java 1.4 you should use the <code>Boolean.valueOf(boolean)</code> method instead.
     * 
     * @param   b   a <code>boolean</code> value.
     * @return  a <code>Boolean</code> instance representing b
     */ 
    private static Boolean booleanValueOf(boolean b) {
        return b ? Boolean.TRUE : Boolean.FALSE;
    }

    public final Object readObject() throws IOException {
        byte type=readByte();
        switch (type) {
        case NULL:
            return null;
        case STRING:
            return readUTF();
        case BOOLEAN:
            return booleanValueOf(readBoolean());
        case INTEGER:
            return new Integer(readInt());
        case LONG:
            return new Long(readLong());
        case DOUBLE:
            return new Double(readDouble());
        case BYTE:
            return new Byte(readByte());
        case CHAR:
            return new Character(readUTF().charAt(0));
        case ARRAY_LIST:
            return readJustArrayList();
        case CHAR_ARRAY:
            return readJustCharArray();
        case INT_ARRAY:
            return readJustIntArray();
        case STRING_ARRAY:
            return readJustStringArray();
        case LONG_STRING:
            return readLongString();
        case CUSTOM_SERIALIZABLE:
            String name=readUTF();
            CustomSerializable cs=(CustomSerializable) ReflectUtils.newInstance(name);
            cs.customReadObject(this);
            return cs;
        case HASH_MAP:
            return readJustHashMap();
        default:
            return readObjectOverride(type);
        }
    }

    /**
     * This method should be used by subclasses to read their custom types.
     * It is called only after <code>CSHandler</code> was not able to process
     * this type.
     *  
     * @param   type                    byte value representing the type of the object.
     * @return  the object read.
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    protected Object readObjectOverride(byte type) throws IOException {
        throw new StreamCorruptedException("readObjectOverride, type="+type);
    }
    
}
