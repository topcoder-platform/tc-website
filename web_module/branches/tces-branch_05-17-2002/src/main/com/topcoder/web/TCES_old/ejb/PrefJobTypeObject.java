package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the pref_job_type table.
 * @see com.topcoder.web.TCES.ejb.PrefJobType
 * @author Phil Selby, May 22nd, 2002
 */

public class PrefJobTypeObject 
  implements Serializable {
	public Integer	profile_id;
	public Integer	job_type_id;
}
