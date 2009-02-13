package com.topcoder.web.stat.common;

/**
 * This class stores a <tt>Double</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */

public class TCDoubleResult extends TCResultItem {
    private Double value;
    
    /**
     * Contructs a <tt>TCDoubleResult</tt> object from the specified
     * double input.
     *
     * @param   value The double value to be stored.
     */
    public TCDoubleResult(double value) {
        this.value = new Double(value);
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCDoubleResult</tt> then their embedded
     * <tt>Double</tt> objects will be compared directly.  If the
     * other object is of different type, a case-insensitive comparison 
     * of the objects' <tt>toString()</tt> results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCDoubleResult) {
            Double otherDouble = ((Double)((TCDoubleResult)other).getResultData());
            return value.compareTo(otherDouble);
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
        return TCResultItem.DOUBLE;
    }
   
    /**
     * Returns the string representation of the embedded <tt>Double</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>Double</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

