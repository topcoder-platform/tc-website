package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the experience_skill_xref table.
 * @see com.topcoder.web.TCES.ejb.ExperienceSkillXref
 * @author Phil Selby, May 22nd, 2002
 */

public class ExperienceSkillXrefObject 
  implements Serializable {
	public Long	experience_id;
	public Integer	skill_id;
}
