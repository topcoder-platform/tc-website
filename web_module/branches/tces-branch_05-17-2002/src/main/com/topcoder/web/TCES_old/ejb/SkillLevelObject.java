package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the skill_level table.
 * @see com.topcoder.web.TCES.ejb.SkillLevel
 * @author Phil Selby, May 22nd, 2002
 */

public class SkillLevelObject 
  implements Serializable {
	public Integer	skill_level_id;
	public String	description;
}
