package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class ProfileEducationObject 
  implements Serializable {
	public Integer	education_id;
	public Integer	profile_id;
	public Integer	degree_type_id;
	public Integer	school_id;
	public Date	graduation_date;
	public String	new_school;
}
