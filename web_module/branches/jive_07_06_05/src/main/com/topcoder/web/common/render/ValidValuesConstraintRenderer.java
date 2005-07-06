package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;
import com.topcoder.shared.problem.ValidValuesConstraint;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.ValidValuesConstraint</code>
 * @author Greg Paul
 */
public class ValidValuesConstraintRenderer extends BaseRenderer implements ElementRenderer {

    private ValidValuesConstraint validValuesConstraint;

    public ValidValuesConstraintRenderer() {
        this.validValuesConstraint = null;
    }

    public ValidValuesConstraintRenderer(ValidValuesConstraint validValuesConstraint) {
        this.validValuesConstraint = validValuesConstraint;
    }

    public void setElement(Element element) throws Exception {
        validValuesConstraint = (ValidValuesConstraint) element;
    }

    public String toHTML(Language language) throws Exception {
        StringBuffer sb = new StringBuffer(5 * validValuesConstraint.getValidValues().size());
        for (int i = 0; i < validValuesConstraint.getDimension(); i++) {
            if (i == 0) {
                sb.append("Elements of ");
            } else {
                sb.append("elements of ");
            }
        }

        sb.append(validValuesConstraint.getParamName());
        sb.append(" must be ");

        for (int i = 0; i < validValuesConstraint.getValidValues().size(); i++) {
            sb.append(super.getRenderer(((Element) validValuesConstraint.getValidValues().get(i))).toHTML(language));
            if (i < validValuesConstraint.getValidValues().size() - 2) {
                sb.append(", ");
            } else if (i == validValuesConstraint.getValidValues().size() - 2) {
                sb.append(", or ");
            }
        }
        return sb.toString();
    }

    public String toPlainText(Language language) throws Exception {
        StringBuffer sb = new StringBuffer(5 * validValuesConstraint.getValidValues().size());
        for (int i = 0; i < validValuesConstraint.getDimension(); i++) {
            if (i == 0) {
                sb.append("Elements of ");
            } else {
                sb.append("elements of ");
            }
        }

        sb.append(validValuesConstraint.getParamName());
        sb.append(" must be ");

        for (int i = 0; i < validValuesConstraint.getValidValues().size(); i++) {
            sb.append(super.getRenderer(((Element) validValuesConstraint.getValidValues().get(i))).toPlainText(language));
            if (i < validValuesConstraint.getValidValues().size() - 2) {
                sb.append(", ");
            } else if (i == validValuesConstraint.getValidValues().size() - 2) {
                sb.append(", or ");
            }
        }
        return sb.toString();

    }
}
