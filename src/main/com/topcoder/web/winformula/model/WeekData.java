package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id$
 */
public class WeekData implements Serializable {
    private Integer id;
    private String desc;
    
    public WeekData(Integer id, String desc) {
        super();
        this.id = id;
        this.desc = desc;
    }
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
