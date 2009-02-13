package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the coder_notify table.
 * @see com.topcoder.web.TCES.ejb.CoderNotify
 * @author Phil Selby, May 22nd, 2002
 */

public class CoderNotifyObject 
  implements Serializable {
	public Long	coder_id;
	public Integer	notify_id;
}
