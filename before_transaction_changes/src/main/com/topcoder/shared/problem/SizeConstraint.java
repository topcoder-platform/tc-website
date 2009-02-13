package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>SizeConstraint</code> class is for constraints related to the
 * size (length) of a parameter.  The SizeConstraint hold information
 * as to which dimension the size refers to, the name of the parameter,
 * and what the size is.
 *
 * @see MaxSizeConstraint
 * @see MinSizeConstraint
 * @author mitalub
 */
abstract public class SizeConstraint
        extends Constraint {
    protected int size;
    protected int dimension;
    protected String paramName;

    public SizeConstraint(int size, int dimension, String paramName) {
        this.size = size;
        this.dimension = dimension;
        this.paramName = paramName;
    }

    public SizeConstraint() {
    }

    public int getSize() {
        return size;
    }

    public int getDimension() {
        return dimension;
    }

    public String getParamName() {
        return paramName;
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeInt(size);
        writer.writeInt(dimension);
        writer.writeString(paramName);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        size = reader.readInt();
        dimension = reader.readInt();
        paramName = reader.readString();
    }
}
