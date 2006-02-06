package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;
import com.topcoder.shared.problem.MaxSizeConstraint;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.MaxSizeConstraint</code>
 * @author Greg Paul
 */
public class MaxSizeConstraintRenderer implements ElementRenderer {

    private MaxSizeConstraint maxSizeConstraint;

    public MaxSizeConstraintRenderer() {
        this.maxSizeConstraint = null;
    }

    public MaxSizeConstraintRenderer(MaxSizeConstraint maxSizeConstraint) {
        this.maxSizeConstraint = maxSizeConstraint;
    }

    public void setElement(Element element) throws Exception {
        maxSizeConstraint = (MaxSizeConstraint) element;
    }

    public String toHTML(Language language) {
        return toPlainText(language);
    }

    public String toPlainText(Language language) {
        StringBuffer buf = new StringBuffer(256);
        for (int i = 0; i < maxSizeConstraint.getDimension(); i++) {
            if (i == 0) {
                buf.append("Elements of ");
            } else {
                buf.append("elements of ");
            }
        }
        buf.append(maxSizeConstraint.getParamName());
        buf.append(" must have a maximum length of ");
        buf.append(maxSizeConstraint.getSize());
        return buf.toString();
    }
}
