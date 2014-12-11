package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoFornecedor extends DaoDatabase{
	
	public DaoFornecedor() throws Exception {
		super();
	}

	public DaoFornecedor(Connection con) throws Exception {
		super(con);
	}
	
}
