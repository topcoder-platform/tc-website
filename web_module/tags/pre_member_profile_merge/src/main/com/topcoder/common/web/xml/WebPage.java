package com.topcoder.common.web.xml;

import com.topcoder.shared.docGen.xml.RecordTag;

import java.io.Serializable;

public class WebPage extends RecordTag implements Serializable {

    private static final String prependText = "<?xml version=\"1.0\" ?>\n<?cocoon-process type=\"xslt\"?>\n";

    private String topFile;
    private String bodyFile;
    private String bottomFile;

    private String topTemplate;
    private String bodyTemplate;
    private String bottomTemplate;

    private String title;
    private StringBuffer xsl;

    public WebPage(String name) {
        super(name);
        title = "";
        topFile = "";
        bodyFile = "";
        bottomFile = "";
        topTemplate = "";
        bodyTemplate = "";
        bottomTemplate = "";
        xsl = new StringBuffer();
    }

    //sets
    public void setTitle(String title) {
        this.title = title;
    }

    public void setTopFile(String topFile) {
        this.topFile = topFile;
    }

    public void setBodyFile(String bodyFile) {
        this.bodyFile = bodyFile;
    }

    public void setBottomFile(String bottomFile) {
        this.bottomFile = bottomFile;
    }

    public void setTopTemplate(String topTemplate) {
        this.topTemplate = topTemplate;
    }

    public void setBodyTemplate(String bodyTemplate) {
        this.bodyTemplate = bodyTemplate;
    }

    public void setBottomTemplate(String bottomTemplate) {
        this.bottomTemplate = bottomTemplate;
    }


    //gets
    public String getTitle() {
        return title;
    }

    public String getTopFile() {
        return topFile;
    }

    public String getBodyFile() {
        return bodyFile;
    }

    public String getBottomFile() {
        return bottomFile;
    }

    public String getTopTemplate() {
        return topTemplate;
    }

    public String getBodyTemplate() {
        return bodyTemplate;
    }

    public String getBottomTemplate() {
        return bottomTemplate;
    }

    public String createXML(int offSet) {
        StringBuffer preText = new StringBuffer(96);
        preText.append(prependText);

        if (offSet > 0) {
            preText.append(super.createXML(offSet));
        } else {
            preText.append(super.createXML());
        }

        return preText.toString();

    }

    public String createXML() {
        StringBuffer preText = new StringBuffer(96);
        preText.append(prependText);

        preText.append(super.createXML());

        return preText.toString();

    }

    public String getXSL() {
        xsl = new StringBuffer();
        xsl.append("<?xml version=\"1.0\"?>");
        xsl.append("<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">");
        xsl.append("<xsl:import href=\"" + getTopFile() + "\"/>");
        xsl.append("<xsl:import href=\"" + getBodyFile() + "\"/>");
        xsl.append("<xsl:import href=\"" + getBottomFile() + "\"/>");
        xsl.append("<xsl:template match=\"/\">");
        xsl.append("<HTML>");
        xsl.append("<HEAD>");
        xsl.append("<TITLE>" + getTitle() + "</TITLE>");
        xsl.append("<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\"/>");
        xsl.append("</HEAD>");
        xsl.append("<BODY BGCOLOR=\"#FFFFFF\" TOPMARGIN=\"0\" MARGINHEIGHT=\"0\" LEFTMARGIN=\"0\" MARGINWIDTH=\"0\">");
        xsl.append("<xsl:call-template name=\"" + getTopTemplate() + "\"/>");
        xsl.append("<xsl:call-template name=\"" + getBodyTemplate() + "\"/>");
        xsl.append("<xsl:call-template name=\"" + getBottomTemplate() + "\"/>");
        xsl.append("</BODY>");
        xsl.append("</HTML>");
        xsl.append("</xsl:template>");
        xsl.append("</xsl:stylesheet>");

        return xsl.toString();

    }

}
