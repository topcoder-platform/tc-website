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

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }


    /**
     * @return the name
     */
    public String getName() {
        return name;
    }


    /**
     * @return the type
     */
    public RegionType getType() {
        return type;
    }

}
