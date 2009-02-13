package com.topcoder.shared.netCommon;

import java.io.DataInput;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * This interface is used for reading bytes from a binary stream and reconstructing from them
 * data in Java primitive types, selected Java Collections types and <code>CustomSerializable</code> 
 * instances. Usually <code>java.io.DataInput</code> is used for reading primitive types and 
 * the <code>CustomSerializable.customReadObject</code> method is used for reading custom classes.
 * 
 * @author  Timur Zambalayev
 * @see     com.topcoder.shared.netCommon.CSWriter
 * @see     com.topcoder.shared.netCommon.CustomSerializable
 * @see     java.io.DataInput
 */ 
public interface CSReader {

    /**
     * Sets the <code>DataInput</code> instance that will be used as an underlying stream.
     * 
     * @param   input   the underlying stream
     */ 
    void setDataInput(DataInput input);

    /**
     * Reads in and returns a <code>byte</code> value.
     * This method is suitable for reading the byte written by the <code>writeByte</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>byte</code> value read.
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    byte readByte() throws IOException;
    
    /**
     * Reads in and returns a <code>short</code> value.
     * This method is suitable for reading the bytes written by the <code>writeShort</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>short</code> value read. 
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    short readShort() throws IOException;
    
    /**
     * Reads in and returns a <code>int</code> value.
     * This method is suitable for reading the bytes written by the <code>writeInt</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>int</code> value read. 
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    int readInt() throws IOException;
    
    /**
     * Reads in and returns a <code>long</code> value.
     * This method is suitable for reading the bytes written by the <code>writeLong</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>long</code> value read. 
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    long readLong() throws IOException;
    
    /**
     * Reads in and returns <code>boolean</code> value.
     * This method is suitable for reading the byte written by the <code>writeBoolean</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>boolean</code> value read. 
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    boolean readBoolean() throws IOException;
    
    /**
     * Reads in and returns <code>double</code> value.
     * This method is suitable for reading the byte written by the <code>writeDouble</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>boolean</code> value read. 
     * @throws  java.io.IOException       if an I/O error has occurred.
     */ 
    double readDouble() throws IOException;
    
    /**
     * Reads in and returns a <code>String</code>.
     * This method is suitable for reading the bytes written by the <code>writeString</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  a Unicode string.
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    String readString() throws IOException;
    
    /**
     * Reads in and returns a <code>byte</code> array.
     * This method is suitable for reading the bytes written by the <code>writeByteArray</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>byte</code> array read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    byte[] readByteArray() throws IOException;
    
    /**
     * Reads in a <code>char</code> array. 
     * This method is suitable for reading the bytes written by the <code>writeCharArray</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>char</code> array read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    char[] readCharArray() throws IOException;
    
    /**
     * Reads in an <code>Object</code> array. 
     * This method is suitable for reading the bytes written by the <code>writeObjectArray</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>Object</code> array read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    Object[] readObjectArray() throws IOException;
    

    /**
     * Reads in an <code>Object</code> array.
     * This method is suitable for reading the bytes written by the <code>writeObjectArray</code> method
     * of interface <code>CSWriter</code>.
     *
     * @param clazz the array class to return
     * @return  the <code>Object</code> array read.
     * @throws  java.io.IOException             if an I/O error has occurred.
     */
    Object[] readObjectArray(Class clazz) throws IOException;


    /**
     * Reads in an <code>Object[][]</code> array. 
     * This method is suitable for reading the bytes written by the <code>writeObjectArrayArray</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>Object[][]</code> array read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    Object[][] readObjectArrayArray() throws IOException;
    
    /**
     * Reads in a <code>java.util.ArrayList</code> instance. 
     * This method is suitable for reading the bytes written by the <code>writeArrayList</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>java.util.ArrayList</code> instance read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    ArrayList readArrayList() throws IOException;
    
    /**
     * Reads in a <code>java.util.HashMap</code> instance. 
     * This method is suitable for reading the bytes written by the <code>writeHashMap</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the <code>java.util.HashMap</code> instance read. 
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    HashMap readHashMap() throws IOException;
    
    /**
     * Reads in and returns an object. 
     * This method is suitable for reading the bytes written by the <code>writeObject</code> method
     * of interface <code>CSWriter</code>.
     * 
     * @return  the object read.
     * @throws  java.io.IOException             if an I/O error has occurred.
     */ 
    Object readObject() throws IOException;

}
