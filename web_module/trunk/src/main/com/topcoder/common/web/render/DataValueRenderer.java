package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.DataValue;
import com.topcoder.shared.problem.Element;
import com.topcoder.shared.problem.ElementRenderer;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.DataValue</code>
 * @author Greg Paul
 */
public class DataValueRenderer implements ElementRenderer {

    private DataValue dataValue;

    public DataValueRenderer() {
        this.dataValue = null;
    }

    public DataValueRenderer(DataValue dataValue) {
        this.dataValue = dataValue;
    }

    public void setElement(Element element) throws Exception {
        dataValue = (DataValue) element;
    }

    public String toHTML(Language language) {
        return BaseRenderer.encodeHTML(toPlainText(language));
    }

    public String toPlainText(Language language) {
        return dataValue.encode();
    }
}
