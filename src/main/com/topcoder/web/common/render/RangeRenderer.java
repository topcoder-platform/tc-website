package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.Range</code>
 * @author Greg Paul
 */
public class RangeRenderer implements ElementRenderer {

    private Range range = null;

    public RangeRenderer() {
        this.range = null;
    }

    public RangeRenderer(Range range) {
        this.range = range;
    }

    public void setElement(Element element) throws Exception {
        range = (Range) element;
    }

    public String toHTML(Language language) {
        return BaseRenderer.encodeHTML(toPlainText(language));
    }

    public String toPlainText(Language language) {
        StringBuffer sb = new StringBuffer();
        sb.append(range.getMin().toString());
        sb.append(" - ");
        sb.append(range.getMax().toString());
        sb.append(" (inclusive)");
        return sb.toString();
    }
}
