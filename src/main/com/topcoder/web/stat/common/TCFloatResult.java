package com.topcoder.web.stat.common;

/**
 * This class stores a <tt>Float</tt>.  Instances of this class are
 * created by a <tt>ResultSetContainer</tt> object when it stores
 * results coming back from the database.
 * 
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002
 * @see     TCResultItem
 * @see     ResultSetContainer
 */
public class TCFloatResult extends TCResultItem {
    private Float value;
    
    /**
     * Contructs a <tt>TCFloatResult</tt> object from the specified
     * float input.
     *
     * @param   value The float value to be stored.
     */
    public TCFloatResult(float value) {
        this.value = new Float(value);
    }
    
    /**
     * Compares this object with another object.  If the other object
     * is also a <tt>TCFloatResult</tt> then their embedded
     * <tt>Float</tt> objects will be compared directly.  If the
     * other object is of different type, a case-insensitive comparison 
     * of the objects' <tt>toString()</tt> results will be applied.
     *
     * @param   other The object against which this will be compared.
     * @return  -1, 0, or 1 depending on whether this object is less than, 
     * equal to, or greater than <tt>other</tt>, respectively.
     */
    public int compareTo(Object other) {
        if (other instanceof TCFloatResult) {
            Float otherFloat = ((Float)((TCFloatResult)other).getResultData());
            return value.compareTo(otherFloat);
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
        return TCResultItem.FLOAT;
    }
   
    /**
     * Returns the string representation of the embedded <tt>Float</tt> object
     *
     * @return  The embedded object's string representation
     */
    public String toString() {
        return value.toString();
    }    

    /**
     * Returns the embedded <tt>Float</tt> object
     *
     * @return  The embedded object
     */
    public Object getResultData() {
        return value;
    }
}

