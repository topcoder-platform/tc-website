package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.TextElement</code>
 * @author Greg Paul
 */
public class TextElementRenderer extends BaseRenderer implements ElementRenderer {

    private TextElement textElement;

    public TextElementRenderer() {
        this.textElement = null;
    }

    public TextElementRenderer(TextElement textElement) {
        this.textElement = textElement;
    }

    public void setElement(Element element) throws Exception {
        textElement = (TextElement) element;
    }
    public String toHTML(Language language) {
        return super.encodeHTML(textElement.getEditableText());
    }

    public String toPlainText(Language language) {
        return textElement.getEditableText();
    }
}
