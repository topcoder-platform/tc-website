package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_skill_xref table.
 * @see com.topcoder.web.TCES.ejb.ProfileSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileSkillXrefObject 
  implements Serializable {
	public Long	profile_id;
	public Integer	skill_id;
	public Integer	skill_level_id;
}
