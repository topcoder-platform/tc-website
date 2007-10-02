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
    public static final Integer EDUCATION_ROUND_TYPE = 21;

    private Integer id;
    private String description;

    public RoundType() {
        
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
