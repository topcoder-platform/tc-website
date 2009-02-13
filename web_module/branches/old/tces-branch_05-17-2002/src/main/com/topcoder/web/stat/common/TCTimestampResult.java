package com.topcoder.web.stat.common;

import java.sql.*;

/**
 * This class stores a <tt>java.sql.Timestamp</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCTimestampResult extends TCResultItem {
    private Timestamp value;
    
    /**
     * Contructs a <tt>TCTimestampResult</tt> object from the specified
     * <tt>Timestamp</tt> input.  If the input is null, the current
     * date and time will be used as a default.
     *
     * @param   value The <tt>Timestamp</tt> value to be stored.
     */
    public TCTimestampResult(Timestamp value) {
        if (value == null)
            this.value = new Timestamp(System.currentTimeMillis());
        else
            this.value = value;
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCTimestampResult</tt> then their embedded
     * <tt>Timestamp</tt> objects will be compared directly.  If the
     * other object is of different type, a case-insensitive comparison 
     * of the objects' <tt>toString()</tt> results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCTimestampResult) {
            Timestamp otherTimestamp = ((Timestamp)((TCTimestampResult)other).getResultData());
            return value.compareTo(otherTimestamp);
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
        return TCResultItem.DATETIME;
    }
   
    /**
     * Returns the string representation of the embedded <tt>Timestamp</tt> object.
     * The string will be in the format yyyy-mm-dd hh:mm:ss.fffffffff format,
     * where the f's are fractional seconds.  Not all nine fractional second digits
     * may actually be printed out, if the additional digits are zeros and do not
     * change the time value.  At least one fractional second digit will be printed.
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>Timestamp</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

