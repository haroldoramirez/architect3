package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoUsuario extends DaoDatabase{
	
	public DaoUsuario() throws Exception {
		super();
	}

	public DaoUsuario(Connection con) throws Exception {
		super(con);
	}

}
