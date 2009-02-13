package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class Country extends Base {

    public static final String US_CODE = "840";
    
    private String code;
    private String name;

    protected Country() {
        
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }



}
