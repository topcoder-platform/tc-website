package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;
import java.util.ArrayList;

/**
 * The <code>ValidValuesConstraint</code> is a constraint containing information
 * as to the valid values of a parameter.
 *
 * @author mitalub
 */
public class ValidValuesConstraint
        extends Constraint {
    protected ArrayList validValues;
    protected String paramName;
    protected int dimension;

    /**
     * @param validValues An ArrayList where each element is an instance of
     *                    Value or Range, and the valid
     *                    elements are those elements in any one
     *                    of the Ranges or Values.
     * @param paramName  The name of the parameter.
     * @param dimension  The dimension this constraint refers to.
     */
    public ValidValuesConstraint(ArrayList validValues,
                                 int dimension,
                                 String paramName) {
        this.validValues = validValues;
        this.paramName = paramName;
        this.dimension = dimension;
    }

    public ValidValuesConstraint() {
    }

    public ArrayList getValidValues() {
        return validValues;
    }

    public int getDimension() {
        return dimension;
    }

    public String getParamName() {
        return paramName;
    }


    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeArrayList(validValues);
        writer.writeString(paramName);
        writer.writeInt(dimension);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        validValues = reader.readArrayList();
        paramName = reader.readString();
        dimension = reader.readInt();
    }


    public String toXML() {
        StringBuffer sb = new StringBuffer();
        sb.append("<valid-values>");
        for (int i = 0; i < validValues.size(); i++) {
            sb.append(((Element) validValues.get(i)).toXML());
        }
        sb.append("</valid-values>");
        return sb.toString();
    }

}


