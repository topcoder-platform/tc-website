package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the concentration_type_lu table.
 * @see com.topcoder.web.TCES.ejb.ConcentrationTypeLu
 * @author Phil Selby, May 22nd, 2002
 */

public class ConcentrationTypeLuObject 
  implements Serializable {
	public Integer	concentration_type_id;
	public String	concentration_type_desc;
}
