package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the additional_skill table.
 * @see com.topcoder.web.TCES.ejb.AdditionalSkill
 * @author Phil Selby, May 22nd, 2002
 */

public class AdditionalSkillObject 
  implements Serializable {
	public Long	additional_skill_id;
	public Long	profile_id;
	public String	skill_type;
	public String	description;
}
