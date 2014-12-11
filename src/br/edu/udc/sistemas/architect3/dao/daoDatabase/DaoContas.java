package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoContas extends DaoDatabase{
	
	public DaoContas() throws Exception {
		super();
	}

	public DaoContas(Connection con) throws Exception {
		super(con);
	}

}
