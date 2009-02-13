package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the skill table.
 * @see com.topcoder.web.TCES.ejb.Skill
 * @author Phil Selby, May 22nd, 2002
 */

public class SkillObject 
  implements Serializable {
	public Integer	skill_id;
	public Integer	skill_type_id;
	public String	skill_desc;
	public Integer	skill_order;
	public String	status;
	public Date	modify_date;
	public Long	profile_id;
}
