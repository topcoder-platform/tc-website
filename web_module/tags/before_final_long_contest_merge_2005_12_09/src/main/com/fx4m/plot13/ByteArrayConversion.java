/*****************************************************************************
 *
 *                            ByteArrayConversion.java
 *
 * Copyright 1998-2003 Kary Fr�mling
 * Source code distributed under GNU LESSER GENERAL PUBLIC LICENSE,
 * included in the LICENSE.txt file in the topmost directory
 *
 *****************************************************************************/

//package fi.faidon.jis;
package com.fx4m.plot13;

/**
 * Class that provides utilities for converting various data types to and
 * from byte-array presentation.
 *
 * @author Kary FRAMLING 6/6/1998
 */
public class ByteArrayConversion {

    //--------------------------------------------------------------------------------------
    // Public methods.
    //--------------------------------------------------------------------------------------

    //=============================================================================
    // bytesLEAsUINT
    //=============================================================================
    /**
     * Return the unsigned int value given by the byte array in little-endian (?) order.
     *
     * @author Kary FRAMLING 7/6/1998
     */
    //=============================================================================
    public static int bytesLEasUINT(byte[] bytes, int start_offset, int end_offset) {
        int i, result;

        // AND bytes with 0xFF since bytes are actually treated as integers.
        result = bytes[start_offset] & 0xFF;
        for (i = start_offset + 1; i < bytes.length && i < end_offset; i++) {
            result = (result << 8) | (bytes[i] & 0xFF);
        }
        return result;
    }

    //=============================================================================
    // bytesLEAsUINT
    //=============================================================================
    /**
     * Return the int value given by the byte array in little-endian order.
     * Here we interpret the first bit of the first byte as being a sign bit.
     *
     * @author Kary FRAMLING 2/4/1998
     */
    //=============================================================================
    public static int bytesLEasINT(byte[] bytes, int start_offset, int end_offset) {
        int i, result;
        int max_minus;
        boolean is_negative = false;

        // See if positive or negative.
        if ((bytes[start_offset] & 0x80) != 0) is_negative = true;

        // Get absolute value.
        bytes[start_offset] &= 0x7F;
        result = bytesLEasUINT(bytes, start_offset, end_offset);

        // If it is negative, then get negative value.
        if (is_negative) {
            max_minus = (int) Math.pow(2, (end_offset - start_offset) * 8 - 1);
            result -= max_minus;
        }

        return result;
    }

    //=============================================================================
    // ulongAsBytesBE
    //=============================================================================
    /**
     * Convert the long value into a byte array that starts from index "startOff" and
     * end at index "endOff" - 1 of "buf". Bytes are in big-endian order.
     *
     * @author Kary FRAMLING 6/6/1998
     */
    //=============================================================================
    public static void ulongAsBytesBE(long value, byte[] bytes, int startOff, int endOff) {
        int i, shift_cnt;

        for (i = endOff - 1, shift_cnt = 0; i >= startOff; i--, shift_cnt += 8) {
            bytes[i] = (byte) ((value >> shift_cnt) & 0xFF);
        }
    }

    //=============================================================================
    // uintAsBytesBE
    //=============================================================================
    /**
     * Convert the int value into a byte array that starts from index "startOff" and
     * end at index "endOff" - 1 of "buf". Bytes are in big-endian order.
     *
     * @author Kary FRAMLING 6/6/1998
     */
    //=============================================================================
    public static void uintAsBytesBE(int value, byte[] bytes, int startOff, int endOff) {
        ulongAsBytesBE((long) value, bytes, startOff, endOff);
    }

    //=============================================================================
    // uintAsBytesLE
    //=============================================================================
    /**
     * Convert the int value into a little-endian byte array that starts from
     * index "startOff" and end at index "endOff" - 1 of "buf".
     */
    //=============================================================================
    public static void uintAsBytesLE(int value, byte[] bytes, int startOff, int endOff) {
        int i, shift_cnt;

        for (i = startOff, shift_cnt = 0; i < endOff; i++, shift_cnt += 8) {
            bytes[i] = (byte) ((value >> shift_cnt) & 0xFF);
        }
    }

    //=============================================================================
    // intAsBytesLE
    //=============================================================================
    /**
     * Return the int value given by the byte array in little-endian order.
     * Here we interpret the first bit of the first byte as being a sign bit.
     *
     * @author Kary FRAMLING 2/4/1998
     */
    //=============================================================================
    public static void intAsBytesLE(int value, byte[] bytes, int startOffset, int endOffset) {
        int abs_value;
        int max_minus;

        // If it is negative, then do a special treatment. Otherwise just
        // the normal one.
        if (value < 0) {
            abs_value = -value;
            max_minus = (int) Math.pow(2, (endOffset - startOffset) * 8 - 1);
            uintAsBytesLE(max_minus - abs_value, bytes, startOffset, endOffset);
            bytes[endOffset - 1] |= 0x80;
        } else {
            uintAsBytesLE(value, bytes, startOffset, endOffset);
        }
    }

}

