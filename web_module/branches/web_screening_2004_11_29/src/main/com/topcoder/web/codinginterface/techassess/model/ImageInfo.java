package com.topcoder.web.codinginterface.techassess.model;

import java.io.Serializable;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 27, 2005
 */
public class ImageInfo implements Serializable {
    private int width = 0;
    private int height = 0;
    private String src = "";
    private String link = "";

    public ImageInfo() {

    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
