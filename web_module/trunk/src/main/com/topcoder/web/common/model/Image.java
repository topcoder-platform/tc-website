package com.topcoder.web.common.model;


import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class Image extends Base {

    public static final Integer MEMBER_PHOTO_TYPE = 1;
    public static final Integer INTRO_EVENT_TYPE = 15

    private Long id;
    private String fileName;
    private Integer imageTypeId;
    private Path path;
    private String link;
    private Integer height;
    private Integer width;
    private Set coders;

    public Image() {
    }

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
