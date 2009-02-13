package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;
import com.topcoder.shared.problem.Value;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.Value</code>
 * @author Greg Paul
 */
public class ValueRenderer extends BaseRenderer implements ElementRenderer {

    private Value value;

    public ValueRenderer() {
        this.value = null;
    }

    public ValueRenderer(Value value) {
        this.value = value;
    }

    public void setElement(Element element) throws Exception {
        value = (Value) element;
    }

    public String toHTML(Language language) {
        return super.encodeHTML(value.getValue());
    }

    public String toPlainText(Language language) {
        return value.getValue();
    }
}
