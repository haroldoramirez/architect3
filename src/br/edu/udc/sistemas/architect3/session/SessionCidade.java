package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoEstado;
import br.edu.udc.sistemas.architect3.entity.Cidade;
import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCidade extends Session{
	
	public SessionCidade() throws Exception{
		super(FactoryDao.createDao(new Cidade()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoEstado daoEstado = new DaoEstado();
		for (int i = 0; i < list.length; i++) {
			Cidade cidade = (Cidade) list[i];
			cidade.setEstado((Estado) daoEstado.findByPrimaryKey(cidade.getEstado()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Cidade cidade = (Cidade) super.findByPrimaryKey(obj);
		DaoEstado daoEstado = new DaoEstado();
		cidade.setEstado((Estado) daoEstado.findByPrimaryKey(cidade.getEstado()));
		return cidade;
	}
	
	public SessionCidade(Dao dao) {
		super(dao);
	}

}
