package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.DataType</code>
 * @author Greg Paul
 */
public class DataTypeRenderer implements ElementRenderer {

    private DataType dataType;

    public DataTypeRenderer() {
        this.dataType = null;
    }

    public DataTypeRenderer(DataType dataType) {
        this.dataType = dataType;
    }

    public void setElement(Element element) throws Exception {
        dataType = (DataType) element;
    }

    public String toHTML(Language language) {
        String desc = dataType.getDescriptor(language);

        if (desc == null)
            return "null";
        return BaseRenderer.encodeHTML(desc);
    }

    public String toPlainText(Language language) {
        String desc = dataType.getDescriptor(language);

        if (desc == null)
            return "null";
        return desc;
    }
}
