package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the skill_level_lu table.
 * @see com.topcoder.web.TCES.ejb.SkillLevelLu
 * @author Phil Selby, May 22nd, 2002
 */

public class SkillLevelLuObject 
  implements Serializable {
	public Integer	skill_level_id;
	public String	skill_level_desc;
}
