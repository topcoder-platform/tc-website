package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the job_type_lu table.
 * @see com.topcoder.web.TCES.ejb.JobTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class JobTypeLuObject 
  implements Serializable {
	public Integer	job_type_id;
	public String	job_type_desc;
}
