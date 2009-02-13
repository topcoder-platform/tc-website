package com.topcoder.web.common.model.algo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 4, 2007
 */
public class RoundType {
    public static final Integer HS_SRM = 17;
    public static final Integer SRM = 1;
    public static final Integer MARATHON = 13;

    private Integer id;
    private Integer description;

    public RoundType() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDescription() {
        return description;
    }

    public void setDescription(Integer description) {
        this.description = description;
    }
}
