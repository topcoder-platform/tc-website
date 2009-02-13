package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.Set;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class Image extends Base {

    public static final Integer MEMBER_PHOTO_TYPE = new Integer(1);

    private Long id;
    private String fileName;
    private Integer imageTypeId;
    private Path path;
    private String link;
    private Integer height;
    private Integer width;
    private Set coders;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getImageTypeId() {
        return imageTypeId;
    }

    public void setImageTypeId(Integer imageTypeId) {
        this.imageTypeId = imageTypeId;
    }

    public Path getPath() {
        return path;
    }

    public void setPath(Path path) {
        this.path = path;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Set getCoders() {
        return Collections.unmodifiableSet(coders);
    }

    public void setCoders(Set coders) {
        this.coders = coders;
    }

}
