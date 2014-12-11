package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoUnidadeDeMedida extends DaoDatabase{
	
	public DaoUnidadeDeMedida() throws Exception {
		super();
	}

	public DaoUnidadeDeMedida(Connection con) throws Exception {
		super(con);
	}
	
}