package br.edu.udc.sistemas.architect3.factory;

import br.edu.udc.sistemas.architect3.dao.Dao;

public class FactoryDao {
	
	public static Dao createDao(Object obj) throws Exception {
		String daoClassName = "br.edu.udc.sistemas.architect3.dao.daoDatabase.Dao" + obj.getClass().getSimpleName(); 
		return (Dao) Class.forName(daoClassName).newInstance();
	}

}
