package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class ProfileExperienceObject 
  implements Serializable {
	public Integer	experience_id;
	public Date	date_start;
	public Date	date_end;
	public String	job_title;
	public String	company_name;
	public String	company_url;
	public String	job_description;
	public Integer	profile_id;
	public Integer	salary_id;
	public Integer	industry_id;
	public Integer	job_role_id;
	public Integer	job_type_id;
	public Integer	location_id;
	public Integer	co_size_id;
}
