package com.topcoder.web.stat.common;

/**
 * This class stores a <tt>Int</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */
public class TCIntResult extends TCResultItem {
    private Integer value;
    
    /**
     * Contructs a <tt>TCIntResult</tt> object from the specified
     * integer input.
     *
     * @param   value The Int value to be stored.
     */
    public TCIntResult(int value) {
        this.value = new Integer(value);
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCIntResult</tt> then their embedded
     * <tt>Int</tt> objects will be compared directly.  If the
     * other object is of different type, a case-insensitive comparison 
     * of the objects' <tt>toString()</tt> results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCIntResult) {
            Integer otherInt = ((Integer)((TCIntResult)other).getResultData());
            return value.compareTo(otherInt);
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
        return TCResultItem.INT;
    }
   
    /**
     * Returns the string representation of the embedded <tt>Int</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>Int</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

