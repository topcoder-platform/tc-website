package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.MinSizeConstraint</code>
 * @author Greg Paul
 */
public class MinSizeConstraintRenderer implements ElementRenderer {

    private MinSizeConstraint minSizeConstraint;

    public MinSizeConstraintRenderer() {
        this.minSizeConstraint = null;
    }

    public MinSizeConstraintRenderer(MinSizeConstraint minSizeConstraint) {
        this.minSizeConstraint = minSizeConstraint;
    }

    public String toHTML(Language language) {
        return toPlainText(language);
    }

    public void setElement(Element element) throws Exception {
        minSizeConstraint = (MinSizeConstraint) element;
    }

    public String toPlainText(Language language) {
        StringBuffer buf = new StringBuffer(256);
        for (int i = 0; i < minSizeConstraint.getDimension(); i++) {
            if (i == 0) {
                buf.append("Elements of ");
            } else {
                buf.append("elements of ");
            }
        }
        buf.append(minSizeConstraint.getParamName());
        buf.append(" must have a minimum length of ");
        buf.append(minSizeConstraint.getSize());
        return buf.toString();
    }
}
