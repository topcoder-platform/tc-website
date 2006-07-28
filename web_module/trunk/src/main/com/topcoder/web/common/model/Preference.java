package com.topcoder.web.common.model;


/**
 * A class to hold preference data.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class Preference extends Base {

    public static final Integer TYPE_BOOLEAN = new Integer(1);
    public static final Integer TYPE_MULTIPLE_CHOICE = new Integer(2);
    public static final Integer TYPE_TEXT_FIELD = new Integer(3);

    public static final Long MEMBER_CONTACT_PREFERENCE_ID = new Long(24);
    
    private Long id;
    private Integer preferenceTypeId;
    private String name;
    private String desc;

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPreferenceTypeId() {
		return preferenceTypeId;
	}

	public void setPreferenceTypeId(Integer preferenceTypeId) {
		this.preferenceTypeId = preferenceTypeId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
