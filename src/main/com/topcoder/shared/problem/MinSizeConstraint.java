package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>MinSizeConstraint</code> class is for constraints related to the
 * minimum size (length) of a parameter.
 *
 * @author mitalub
 */
public class MinSizeConstraint
        extends SizeConstraint {

    public MinSizeConstraint(int size, int dimension, String paramName) {
        super(size, dimension, paramName);
    }

    public MinSizeConstraint() {
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


