package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoCidade;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoEstado;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoPais;
import br.edu.udc.sistemas.architect3.entity.Cidade;
import br.edu.udc.sistemas.architect3.entity.Estado;
import br.edu.udc.sistemas.architect3.entity.Fornecedor;
import br.edu.udc.sistemas.architect3.entity.Pais;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionFornecedor extends Session{
	
	public SessionFornecedor(Dao dao) {
		super(dao);
	}
	
	public SessionFornecedor() throws Exception{
		super(FactoryDao.createDao(new Fornecedor()));
	}
	
	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoPais daoPais = new DaoPais();
		DaoEstado daoEstado = new DaoEstado();
		DaoCidade daoCidade = new DaoCidade();
		for (int i = 0; i < list.length; i++) {
			Fornecedor fornecedor = (Fornecedor) list[i];
			fornecedor.setPais((Pais) daoPais.findByPrimaryKey(fornecedor.getPais()));
			fornecedor.setEstado((Estado) daoEstado.findByPrimaryKey(fornecedor.getEstado()));
			fornecedor.setCidade((Cidade) daoCidade.findByPrimaryKey(fornecedor.getCidade()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Fornecedor fornecedor = (Fornecedor) super.findByPrimaryKey(obj);
		DaoPais daoPais = new DaoPais();
		DaoEstado daoEstado = new DaoEstado();
		DaoCidade daoCidade = new DaoCidade();
		fornecedor.setPais((Pais) daoPais.findByPrimaryKey(fornecedor.getPais()));
		fornecedor.setEstado((Estado) daoEstado.findByPrimaryKey(fornecedor.getEstado()));
		fornecedor.setCidade((Cidade) daoCidade.findByPrimaryKey(fornecedor.getCidade()));
		return fornecedor;
	}

}
