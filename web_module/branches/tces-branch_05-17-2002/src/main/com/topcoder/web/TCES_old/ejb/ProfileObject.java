package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile table.
 * @see com.topcoder.web.TCES.ejb.Profile
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileObject 
  implements Serializable {
	public Long	profile_id;
	public Date	date_available;
	public Integer	profile_status_id;
	public Integer	preference_travel_level_id;
	public Integer	preference_travel_time_id;
	public Integer	preference_salary_id;
}
