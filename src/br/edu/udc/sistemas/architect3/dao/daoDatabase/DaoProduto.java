package br.edu.udc.sistemas.architect3.dao.daoDatabase;

import java.sql.Connection;

public class DaoProduto extends DaoDatabase{
	
	public DaoProduto() throws Exception {
		super();
	}

	public DaoProduto(Connection con) throws Exception {
		super(con);
	}

}
