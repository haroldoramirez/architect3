package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoFabricante extends DaoDatabase{
	
	public DaoFabricante() throws Exception {
		super();
	}

	public DaoFabricante(Connection con) throws Exception {
		super(con);
	}

}
