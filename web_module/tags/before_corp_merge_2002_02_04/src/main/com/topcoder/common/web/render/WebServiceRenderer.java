package com.topcoder.common.web.render;

import com.topcoder.shared.language.Language;
import com.topcoder.shared.problem.*;

/**
 * Handles the display of a <code>com.topcoder.shared.problem.WebServiceRenderer</code>
 * @author Greg Paul
 */
public class WebServiceRenderer extends BaseRenderer implements ElementRenderer {

    private WebService webService;

    public WebServiceRenderer() {
        this.webService = null;
    }

    public WebServiceRenderer(WebService webService) {
        this.webService = webService;
    }

    public void setElement(Element element) throws Exception {
        webService = (WebService) element;
    }

    public String toHTML(Language language) {
        StringBuffer html = new StringBuffer();
        html.append("<h3>Web Service: ");
        html.append(webService.getName());
        html.append("</h3>");
        return super.encodeHTML(html.toString());
    }

    public String toPlainText(Language language) {
        StringBuffer html = new StringBuffer();
        html.append("WEB SERVICE: ");
        html.append(webService.getName());
        html.append("\n");
        return html.toString();
    }

}
