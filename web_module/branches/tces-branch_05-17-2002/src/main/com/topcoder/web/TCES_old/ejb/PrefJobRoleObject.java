package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_job_role table.
 * @see com.topcoder.web.TCES.ejb.PrefJobRole
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefJobRoleObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	job_role_id;
}
