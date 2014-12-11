package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoCidade;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoEstado;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoPais;
import br.edu.udc.sistemas.architect3.entity.Cidade;
import br.edu.udc.sistemas.architect3.entity.Cliente;
import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionCliente extends Session{
	
	public SessionCliente(Dao dao) {
		super(dao);
	}
	
	public SessionCliente() throws Exception{
		super(FactoryDao.createDao(new Cliente()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoPais daoPais = new DaoPais();
		DaoEstado daoEstado = new DaoEstado();
		DaoCidade daoCidade = new DaoCidade();
		for (int i = 0; i < list.length; i++) {
			Cliente cliente = (Cliente) list[i];
			cliente.setPais((Pais) daoPais.findByPrimaryKey(cliente.getPais()));
			cliente.setEstado((Estado) daoEstado.findByPrimaryKey(cliente.getEstado()));
			cliente.setCidade((Cidade) daoCidade.findByPrimaryKey(cliente.getCidade()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Cliente cliente = (Cliente) super.findByPrimaryKey(obj);
		DaoPais daoPais = new DaoPais();
		DaoEstado daoEstado = new DaoEstado();
		DaoCidade daoCidade = new DaoCidade();
		cliente.setPais((Pais) daoPais.findByPrimaryKey(cliente.getPais()));
		cliente.setEstado((Estado) daoEstado.findByPrimaryKey(cliente.getEstado()));
		cliente.setCidade((Cidade) daoCidade.findByPrimaryKey(cliente.getCidade()));
		return cliente;
	}
	
}
