package com.topcoder.web.stat.common;

import java.util.*;
import java.math.*;

/**
 * This class stores a <tt>BigDecimal</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCBigDecimalResult extends TCResultItem {
    private BigDecimal value;
    
    /**
     * Contructs a <tt>TCBigDecimalResult</tt> object from the specified
     * <tt>BigDecimal</tt> input.  If the input is null, 0.0 will be stored
     * as a default.
     *
     * @param   value The <tt>BigDecimal</tt> to be stored.
     */
    public TCBigDecimalResult(BigDecimal value) {
        if (value == null)
            this.value = new BigDecimal(0.0);
        else
            this.value = value;
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCBigDecimalResult</tt> then their embedded
     * <tt>BigDecimal</tt> objects will be compared directly.  Otherwise,
     * a case-insensitive comparison of the objects' <tt>toString()</tt>
     * results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCBigDecimalResult) {
            BigDecimal otherBigDecimal = ((BigDecimal)((TCBigDecimalResult)other).getResultData());
            return value.compareTo(otherBigDecimal);
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
        return TCResultItem.BIGDECIMAL;
    }
   
    /**
     * Returns the string representation of the embedded <tt>BigDecimal</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>BigDecimal</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

