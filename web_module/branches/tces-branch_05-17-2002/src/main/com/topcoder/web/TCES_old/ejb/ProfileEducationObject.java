package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_education table.
 * @see com.topcoder.web.TCES.ejb.ProfileEducation
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileEducationObject 
  implements Serializable {
	public Integer	education_id;
	public Integer	profile_id;
	public Integer	degree_type_id;
	public Integer	school_id;
	public Date	graduation_date;
	public String	new_school;
}
