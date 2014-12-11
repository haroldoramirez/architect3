package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoCliente extends DaoDatabase{
	
	public DaoCliente() throws Exception {
		super();
	}

	public DaoCliente(Connection con) throws Exception {
		super(con);
	}

}
