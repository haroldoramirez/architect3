package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoPais;
import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionEstado extends Session{
	
	public SessionEstado() throws Exception{
		super(FactoryDao.createDao(new Estado()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoPais daoPais = new DaoPais();
		for (int i = 0; i < list.length; i++) {
			Estado estado = (Estado) list[i];
			estado.setPais((Pais) daoPais.findByPrimaryKey(estado.getPais()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Estado estado = (Estado) super.findByPrimaryKey(obj);
		DaoPais daoPais = new DaoPais();
		estado.setPais((Pais) daoPais.findByPrimaryKey(estado.getPais()));
		return estado;
	}
	
	public SessionEstado(Dao dao) {
		super(dao);
	}

}
