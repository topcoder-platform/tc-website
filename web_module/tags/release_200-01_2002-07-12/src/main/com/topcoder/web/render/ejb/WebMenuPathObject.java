package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class WebMenuPathObject 
  implements Serializable {
	public Integer	menu_hdr_id;
	public Integer	menu_id;
	public Integer	parent_id;
	public Integer	menu_order;
	public Integer	modify_by;
	public Date	modify_date;
}
