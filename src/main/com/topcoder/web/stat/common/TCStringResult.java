package com.topcoder.web.stat.common;

/**
 * This class stores a <tt>String</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */
public class TCStringResult extends TCResultItem {
    private String value;

    /**
     * Contructs a <tt>TCStringResult</tt> object from the specified
     * String input.  If the input is null, an empty string will be
     * stored as a default.
     *
     * @param   value The <tt>String</tt> value to be stored.
     */
    public TCStringResult(String value) {
        if (value == null)
            this.value = "";
        else
            this.value = value;
    }
  
    /**
     * Compares this object with another object, using a case-insensitive 
     * comparison of the objects' <tt>toString()</tt> results.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        return this.toString().compareToIgnoreCase(other.toString());
    }
 
    /**
     * Returns the type of the embedded object, as defined in <tt>TCResultItem</tt>
     *
     * @return  The embedded object type
     */
    public int getType() {
        return TCResultItem.STRING;
    }
  
    /**
     * Returns the string representation of the embedded <tt>String</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value;
    } 

    /**
     * Returns the embedded <tt>String</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

