package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>MaxSizeConstraint</code> class is for constraints related to the
 * maximum size (length) of a parameter.
 *
 * @author mitalub
 */
public class MaxSizeConstraint
        extends SizeConstraint {

    public MaxSizeConstraint(int size, int dimension, String paramName) {
        super(size, dimension, paramName);
    }

    public MaxSizeConstraint() {
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        super.customWriteObject(writer);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        super.customReadObject(reader);
    }

    public String toXML() {
        //left to logan to fill in to match the dtd...
        return "";
    }

}


