package com.topcoder.shared.netCommon;

import java.io.DataOutput;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * This interface is used for converting from Java primitive types, selected Java Collections types 
 * and <code>CustomSerializable</code> instances to a series of bytes and writing these bytes to
 * a binary stream. Usually <code>java.io.DataOutput</code> is used for writing primitive types and 
 * the <code>CustomSerializable.customWriteObject</code> method is used for writing custom classes.
 * 
 * @author  Timur Zambalayev
 * @see     com.topcoder.shared.netCommon.CSReader
 * @see     com.topcoder.shared.netCommon.CustomSerializable
 * @see     java.io.DataInput
 */ 
public interface CSWriter {

    /**
     * Sets the <code>DataOutput</code> instance that will be used as an underlying stream.
     * 
     * @param   output   the underlying stream
     */ 
    void setDataOutput(DataOutput output);

    /**
     * Writes a <code>byte</code> value to the output stream.
     * The byte written by this method may be read by the <code>readByte</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>byte</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeByte(byte v) throws IOException;
    
    /**
     * Writes a <code>short</code> value to the output stream.
     * The bytes written by this method may be read by the <code>readShort</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>short</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeShort(short v) throws IOException;
    
    /**
     * Writes a <code>int</code> value to the output stream.
     * The bytes written by this method may be read by the <code>readInt</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>int</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeInt(int v) throws IOException;
    
    /**
     * Writes a <code>long</code> value to the output stream.
     * The bytes written by this method may be read by the <code>readLong</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>long</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeLong(long v) throws IOException;
    
    /**
     * Writes a <code>boolean</code> value to the output stream.
     * The byte written by this method may be read by the <code>readBoolean</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>boolean</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeBoolean(boolean v) throws IOException;

    /**
     * Writes a <code>double</code> value to the output stream.
     * The byte written by this method may be read by the <code>readDouble</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   v                       the <code>boolean</code> value to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeDouble(double v) throws IOException;

    /**
     * Writes a <code>String</code> to the output stream.
     * The bytes written by this method may be read by the <code>readString</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   string                  the <code>String</code> to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeString(String string) throws IOException;
    
    /**
     * Writes a <code>byte</code> array to the output stream.
     * The bytes written by this method may be read by the <code>readByteArray</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   byteArray               the <code>byte</code> array to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeByteArray(byte[] byteArray) throws IOException;
    
    /**
     * Writes a <code>char</code> array to the output stream.
     * The bytes written by this method may be read by the <code>readCharArray</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   charArray               the <code>char</code> array to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeCharArray(char[] charArray) throws IOException;
    
    /**
     * Writes an <code>Object</code> array to the output stream.
     * The bytes written by this method may be read by the <code>readObjectArray</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   objectArray             the <code>Object</code> array to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeObjectArray(Object[] objectArray) throws IOException;
    
    /**
     * Writes an <code>Object[][]</code> array to the output stream.
     * The bytes written by this method may be read by the <code>readObjectArrayArray</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   objectArrayArray        the <code>Object[][]</code> array to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeObjectArrayArray(Object[][] objectArrayArray) throws IOException;
    
    /**
     * Writes a <code>java.util.ArrayList</code> instance to the output stream.
     * The bytes written by this method may be read by the <code>readArrayList</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   list                    the <code>ArrayList</code> instance to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeArrayList(ArrayList list) throws IOException;
    
    /**
     * Writes a <code>java.util.HashMap</code> instance to the output stream.
     * The bytes written by this method may be read by the <code>readHashMap</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   map                     the <code>HashMap</code> instance to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeHashMap(HashMap map) throws IOException;
    
    /**
     * Writes a an object to the output stream.
     * The bytes written by this method may be read by the <code>readObject</code> method of
     * interface <code>CSReader</code>. 
     * 
     * @param   object                  the object to be written. 
     * @throws  java.io.IOException     if an I/O error has occurred.
     */ 
    void writeObject(Object object) throws IOException;

}
