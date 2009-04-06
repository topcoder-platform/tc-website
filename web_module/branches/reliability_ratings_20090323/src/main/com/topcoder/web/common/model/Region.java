package com.topcoder.web.common.model;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class Region extends Base {
    private long id;
    private RegionType type;
    private String name;

    public Region() {
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setType(RegionType type) {
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public RegionType getType() {
        return type;
    }

}
