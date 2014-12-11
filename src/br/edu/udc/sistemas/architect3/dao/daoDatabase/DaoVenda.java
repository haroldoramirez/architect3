package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoVenda extends DaoDatabase{
	
	public DaoVenda() throws Exception {
		super();
	}

	public DaoVenda(Connection con) throws Exception {
		super(con);
	}

}
