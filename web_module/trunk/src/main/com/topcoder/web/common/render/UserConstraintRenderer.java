package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

import java.util.ArrayList;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.UserConstraint</code>
 * @author Greg Paul
 */
public class UserConstraintRenderer extends BaseRenderer implements ElementRenderer {

    private UserConstraint userConstraint;

    public UserConstraintRenderer() {
        this.userConstraint = null;
    }

    public UserConstraintRenderer(UserConstraint userConstraint) {
        this.userConstraint = userConstraint;
    }

    public void setElement(Element element) throws Exception {
        userConstraint = (UserConstraint) element;
    }

    public String toHTML(Language language) throws Exception {
        if (userConstraint.getUserConstraint() instanceof NodeElement) {
            ArrayList elems = ((NodeElement) userConstraint.getUserConstraint()).getChildren();
            StringBuffer buf = new StringBuffer(64 * elems.size());

            for (int i = 0; i < elems.size(); i++)
                buf.append(super.getRenderer(((Element) elems.get(i))).toHTML(language));
            return buf.toString();
        } else {
            StringBuffer buf = new StringBuffer(userConstraint.getText().length() + 4);

            buf.append(userConstraint.getText());
            return buf.toString();
        }

    }

    public String toPlainText(Language language) throws Exception {
        if (userConstraint.getUserConstraint() instanceof NodeElement) {
            ArrayList elems = ((NodeElement) userConstraint.getUserConstraint()).getChildren();
            StringBuffer buf = new StringBuffer(64 * elems.size());

            for (int i = 0; i < elems.size(); i++)
                buf.append(super.getRenderer(((Element) elems.get(i))).toPlainText(language));
            return buf.toString();
        } else {
            StringBuffer buf = new StringBuffer(userConstraint.getText().length() + 1);

            buf.append(userConstraint.getText());
            buf.append("\n");
            return buf.toString();
        }
    }
}
