package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_status table.
 * @see com.topcoder.web.TCES.ejb.ProfileStatus
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileStatusObject 
  implements Serializable {
	public Integer	status_id;
	public String	description;
}
