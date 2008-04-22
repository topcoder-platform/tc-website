package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public class ContestProperty extends Base {

    public static final Integer CONTEST_OVERVIEW_TEXT = 1;
    public static final Integer PRIZE_DESCRIPTION = 2;
    public static final Integer VIEWABLE_SUBMISSIONS = 3;
    public static final Integer MIN_WIDTH = 4;
    public static final Integer MAX_WIDTH = 5;
    public static final Integer MIN_HEIGHT = 6;
    public static final Integer MAX_HEIGHT = 7;
    public static final Integer MAX_SUBMISSIONS = 8;
    public static final Integer VIEWABLE_SUBMITTERS = 9;

    /**
     * <p>An <code>Integer</code> referencing the <code>Requires Preview Image</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    public static final Integer REQUIRE_PREVIEW_IMAGE = 10;

    /**
     * <p>An <code>Integer</code> referencing the <code>Requires Preview File</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly (Req# 5.4)
     */
    public static final Integer REQUIRE_PREVIEW_FILE = 11;

    /**
     * <p>An <code>Integer</code> referencing the <code>Other File Types</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer OTHER_FILE_TYPES = 12;

    /**
     * <p>An <code>Integer</code> referencing the <code>Full Description</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer FULL_DESCRIPTION = 13;

    /**
     * <p>An <code>Integer</code> referencing the <code>Color Requirements</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer COLOR_REQUIREMENTS = 14;

    /**
     * <p>An <code>Integer</code> referencing the <code>Font Requirements</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer FONT_REQUIREMENTS = 15;

    /**
     * <p>An <code>Integer</code> referencing the <code>Size Requirements</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer SIZE_REQUIREMENTS = 16;

    /**
     * <p>An <code>Integer</code> referencing the <code>Content Requirements</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer CONTENT_REQUIREMENTS = 17;

    /**
     * <p>An <code>Integer</code> referencing the <code>Other Requirements</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer OTHER_REQUIREMENTS = 18;

    /**
     * <p>An <code>Integer</code> referencing the <code>Submission File Format</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer SUBMISSION_FILE_FORMAT = 19;

    /**
     * <p>An <code>Integer</code> referencing the <code>Winner Selection</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer WINNER_SELECTION = 20;

    /**
     * <p>An <code>Integer</code> referencing the <code>Eligibility</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer ELIGIBILITY = 21;

    /**
     * <p>An <code>Integer</code> referencing the <code>Client</code> contest property.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    public static final Integer CLIENT = 22;


    private Integer id;
    private String description;

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