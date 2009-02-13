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
	public Long	education_id;
	public Long	profile_id;
	public Integer	degree_type_id;
	public Long	school_id;
	public Integer	graduation_year;
	public Integer	graduation_month;
	public Integer	gpa_id;
}
