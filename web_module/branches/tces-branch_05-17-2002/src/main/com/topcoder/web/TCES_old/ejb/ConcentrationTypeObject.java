package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the concentration_type table.
 * @see com.topcoder.web.TCES.ejb.ConcentrationType
 * @author Phil Selby, May 22nd, 2002
 */

public class ConcentrationTypeObject 
  implements Serializable {
	public Integer	concentration_type;
	public String	description;
}
