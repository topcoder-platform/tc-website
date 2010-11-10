/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * <p>A POJO class used for representing the contest channels. Maintains the contest channel ID and description.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.2)
 */
public class ContestChannel extends Base {

    /**
     * <p>An <code>Integer</code> referencing the contest channel corresponding to contests posted by <code>Studio
     * Administrator</code>.</p>
     */
    public static final Integer STUDIO_ADMINISTRATOR  = 1;

    /**
     * <p>An <code>Integer</code> referencing the contest channel corresponding to contests posted from <code>TopCoder
     * Direct</code> application.</p>
     */
    public static final Integer TOPCODER_DIRECT  = 2;
    
    /**
     * <p>An <code>Integer</code> referencing the contest channel corresponding to contests posted by <code>Studio
     * Administrator v.1</code>.</p>
     */
    public static final Integer STUDIO_ADMINISTRATOR_V1  = 3;

    /**
     * <p>An <code>Integer</code> maitaining the ID of this contest channel.</p>
     */
    private Integer id = null;

    /**
     * <p>A <code>String</code> maitaining the textual description of this contest channel.</p>
     */
    private String description = null;

    /**
     * <p>Constructs new <code>ContestChannel</code> instance. This implementation does nothing.</p>
     */
    public ContestChannel() {
    }

    /**
     * <p>Gets the ID of this contest channel.</p>
     *
     * @return an <code>Integer</code> providing the ID of this contest channel.
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this contest channel.</p>
     *
     * @param id an <code>Integer</code> providing the ID of this contest channel.
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * <p>Gets the description of this contest channel.</p>
     *
     * @return a <code>String</code> providing description ID of this contest channel.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this contest channel.</p>
     *
     * @param description a <code>String</code> providing description ID of this contest channel.
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
