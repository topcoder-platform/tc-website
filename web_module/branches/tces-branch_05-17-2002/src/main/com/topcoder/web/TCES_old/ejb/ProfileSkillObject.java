package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_skill table.
 * @see com.topcoder.web.TCES.ejb.ProfileSkill
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileSkillObject 
  implements Serializable {
	public Integer	profile_skill_id;
	public Integer	profile_id;
	public Integer	skill_level_id;
	public Integer	skill_id;
	public Integer	proficiency;
}
