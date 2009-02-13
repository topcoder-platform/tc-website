package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_experience table.
 * @see com.topcoder.web.TCES.ejb.ProfileExperience
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileExperienceObject 
  implements Serializable {
	public Long	experience_id;
	public Date	date_start;
	public Date	date_end;
	public String	job_title;
	public String	organization_name;
	public String	organization_url;
	public String	job_description;
	public Long	profile_id;
	public Integer	salary_id;
	public Integer	industry_id;
	public Integer	job_role_id;
	public Integer	job_type_id;
	public Integer	organization_size_id;
	public String	city;
	public String	state_code;
	public String	country_code;
}
