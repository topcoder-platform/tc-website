package com.topcoder.web.common.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

import java.util.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.NodeElementRenderer</code>
 * @author Greg Paul
 */
public class NodeElementRenderer extends BaseRenderer implements ElementRenderer {

    private NodeElement nodeElement = null;

    public NodeElementRenderer() {
        this.nodeElement = null;
    }

    public NodeElementRenderer(NodeElement nodeElement) {
        this.nodeElement = nodeElement;
    }

    public void setElement(Element element) throws Exception {
        nodeElement= (NodeElement) element;
    }

    public String toHTML(Language language) throws Exception {
        StringBuffer buf = new StringBuffer(64 * nodeElement.getChildren().size());
        boolean print = new ArrayList(Arrays.asList(
                super.XML_ONLY_TAGS)).indexOf(nodeElement.getName()) == -1;

        if (print) {
            buf.append('<');
            buf.append(nodeElement.getName());
            for (Iterator i = nodeElement.getAttributes().keySet().iterator(); i.hasNext();) {
                String key = (String) i.next();

                buf.append(' ');
                buf.append(key);
                buf.append("=\"");
                buf.append(BaseRenderer.encodeHTML((String) nodeElement.getAttributes().get(key)));
                buf.append('"');
            }
            buf.append('>');
        }
        for (int i = 0; i < nodeElement.getChildren().size(); i++) {
            Element e = (Element) nodeElement.getChildren().get(i);
            buf.append(super.getRenderer(e).toHTML(language));
        }
        if (print) {
            buf.append("</");
            buf.append(nodeElement.getName());
            buf.append('>');
        }
        return buf.toString();
    }

    public String toPlainText(Language language) throws Exception {
        StringBuffer buf = new StringBuffer(64 * nodeElement.getChildren().size());

        for (int i = 0; i < nodeElement.getChildren().size(); i++) {
            Element e = (Element) nodeElement.getChildren().get(i);
            buf.append(super.getRenderer(e).toPlainText(language));
        }

        return buf.toString();
    }
}
