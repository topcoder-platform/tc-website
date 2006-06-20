package com.topcoder.common.web.data;

import java.util.ArrayList;


public class Template {

    private int templateId;
    private String name;
    private String file;
    private String location;
    private String status;
    private String modified;
    private ArrayList templates;
    private ArrayList links;

    public Template() {
        templateId = 0;
        name = "";
        file = "";
        location = "";
        status = "";
        modified = "";
        links = new ArrayList();
        templates = new ArrayList();
    }

    // get
    public ArrayList getLinks() {
        return this.links;
    }

    public ArrayList getTemplates() {
        return this.templates;
    }

    public int getTemplateId() {
        return this.templateId;
    }

    public String getName() {
        return this.name;
    }

    public String getFile() {
        return this.file;
    }

    public String getLocation() {
        return this.location;
    }

    public String getStatus() {
        return this.status;
    }

    public String getModified() {
        return this.modified;
    }

    // set
    public void setLinks(ArrayList links) {
        this.links = links;
    }

    public void setTemplates(ArrayList templates) {
        this.templates = templates;
    }

    public void setTemplateId(int templateId) {
        this.templateId = templateId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }


    // subtemplate functions

    public Template findTemplate(int templateId) {
        return findTemplate(this, templateId);
    }

    private Template findTemplate(Template node, int templateId) {
        Template child = null;
        Template result = null;
        for (int i = 0; i < node.getTemplates().size() && result == null; i++) {
            child = (Template) node.getTemplates().get(i);
            if (child.getTemplateId() == templateId) {
                result = child;
            } else if (child.getTemplates().size() > 0) {
                result = findTemplate(child, templateId);
            }
        }
        return result;
    }


}

