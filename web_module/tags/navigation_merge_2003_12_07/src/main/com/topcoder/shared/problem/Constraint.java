package com.topcoder.shared.problem;

import com.topcoder.shared.netCommon.CSReader;
import com.topcoder.shared.netCommon.CSWriter;

import java.io.IOException;
import java.io.ObjectStreamException;

/**
 * The <code>Constraint</code> class is intended to be a generalization
 * of input constraints in problem statements.  However, the only current
 * form of constraint supported is a free-form user constraint, consisting
 * only of writer-specified text.
 *
 * @see UserConstraint
 * @see Element
 * @see com.topcoder.server.common.problem.ConstraintFactory
 * @author Logan Hanks
 */
abstract public class Constraint extends BaseElement implements Element {
    private String param;

    public Constraint() {
    }

    public Constraint(String param) {
        this.param = param;
    }

    public void customWriteObject(CSWriter writer)
            throws IOException {
        writer.writeString(param);
    }

    public void customReadObject(CSReader reader)
            throws IOException, ObjectStreamException {
        param = reader.readString();
    }
}


