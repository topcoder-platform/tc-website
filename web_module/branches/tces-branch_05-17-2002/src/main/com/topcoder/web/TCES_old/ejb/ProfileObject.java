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
	public Integer	profile_id;
	public Integer	coder_id;
	public Integer	status_id;
}
