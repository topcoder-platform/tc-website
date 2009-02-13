package com.topcoder.web.stat.common;

import java.util.*;
import java.math.*;

/**
 * This class stores a <tt>BigInteger</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCBigIntegerResult extends TCResultItem {
    private BigInteger value;
    
    /**
     * Contructs a <tt>TCBigIntegerResult</tt> object from the specified
     * <tt>BigInteger</tt> input.  If the input is null, zero will be
     * stored as a default.
     *
     * @param   value The <tt>BigInteger</tt> to be stored.
     */
    public TCBigIntegerResult(BigInteger value) {
        if (value == null)
            this.value = new BigInteger("0");
        else
            this.value = value;
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCBigIntegerResult</tt> then their embedded
     * <tt>BigInteger</tt> objects will be compared directly.  Otherwise,
     * a case-insensitive comparison of the objects' <tt>toString()</tt>
     * results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCBigIntegerResult) {
            BigInteger otherBigInteger = ((BigInteger)((TCBigIntegerResult)other).getResultData());
            return value.compareTo(otherBigInteger);
        }
        else 
            return this.toString().compareToIgnoreCase(other.toString());
    }
 
    /**
     * Returns the type of the embedded object, as defined in <tt>TCResultItem</tt>
     *
     * @return  The embedded object type
     */
    public int getType() {
        return TCResultItem.BIGINTEGER;
    }
   
    /**
     * Returns the string representation of the embedded <tt>BigInteger</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>BigInteger</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

