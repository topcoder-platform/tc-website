package com.topcoder.web.stat.common;

/**
 * This class stores a <tt>java.sql.Date</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCDateResult extends TCResultItem {
    private java.sql.Date value;
    
    /**
     * Contructs a <tt>TCDateResult</tt> object from the specified
     * <tt>java.sql.Date</tt> input.  If the input is null, the
     * current date will be used as a default.
     *
     * @param   value The <tt>java.sql.Date</tt> to be stored.
     */
    public TCDateResult(java.sql.Date value) {
        if (value == null)
            this.value = new java.sql.Date(System.currentTimeMillis());
        else
            this.value = value;
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCDateResult</tt> then their embedded
     * <tt>java.sql.Date</tt> objects will be compared directly.  Otherwise,
     * a case-insensitive comparison of the objects' <tt>toString()</tt>
     * results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCDateResult) {
            java.sql.Date otherDate = ((java.sql.Date)((TCDateResult)other).getResultData());
            return value.compareTo(otherDate);
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
        return TCResultItem.DATE;
    }
   
    /**
     * Returns the string representation of the embedded <tt>java.sql.Date</tt> object.
     * The string format is yyyy-mm-dd as per <tt>java.sql.Date.toString()</tt>
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>java.sql.Date</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

