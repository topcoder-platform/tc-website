package com.topcoder.web.stat.common;

import java.sql.*;

/**
 * This class stores a <tt>java.sql.Time</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCTimeResult extends TCResultItem {
    private Time value;
    
    /**
     * Contructs a <tt>TCTimeResult</tt> object from the specified
     * <tt>Time</tt> input.  If the input is null, the current time
     * will be used as a default.
     *
     * @param   value The <tt>Time</tt> value to be stored.
     */
    public TCTimeResult(Time value) {
        if (value == null)
            this.value = new Time(System.currentTimeMillis());
        else
            this.value = value;
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCTimeResult</tt> then their embedded
     * <tt>Time</tt> objects will be compared directly.  If the
     * other object is of different type, a case-insensitive comparison 
     * of the objects' <tt>toString()</tt> results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCTimeResult) {
            Time otherTime = ((Time)((TCTimeResult)other).getResultData());
            return value.compareTo(otherTime);
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
        return TCResultItem.TIME;
    }
   
    /**
     * Returns the string representation of the embedded <tt>Time</tt> object.
     * The string will be in the format hh:mm:ss.
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>Time</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

