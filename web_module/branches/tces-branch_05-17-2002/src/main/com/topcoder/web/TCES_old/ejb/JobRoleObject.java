package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the job_role table.
 * @see com.topcoder.web.TCES.ejb.JobRole
 * @author Phil Selby, May 22nd, 2002
 */

public class JobRoleObject 
  implements Serializable {
	public Integer	job_role_id;
	public String	description;
}
