package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the job_role_lu table.
 * @see com.topcoder.web.TCES.ejb.JobRoleLu
 * @author Phil Selby, May 22nd, 2002
 */

public class JobRoleLuObject 
  implements Serializable {
	public Integer	job_role_id;
	public String	job_role_desc;
}
