package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the job_type table.
 * @see com.topcoder.web.TCES.ejb.JobType
 * @author Phil Selby, May 22nd, 2002
 */

public class JobTypeObject 
  implements Serializable {
	public Integer	job_type_id;
	public String	description;
}
