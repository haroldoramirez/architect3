package br.edu.udc.sistemas.architect3.session;

import br.edu.udc.sistemas.architect3.dao.Dao;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFabricante;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoFornecedor;
import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoUnidadeDeMedida;
import br.edu.udc.sistemas.architect3.entity.Fabricante;
import br.edu.udc.sistemas.architect3.entity.Fornecedor;
import br.edu.udc.sistemas.architect3.entity.Produto;
import br.edu.udc.sistemas.architect3.entity.UnidadeDeMedida;
import br.edu.udc.sistemas.architect3.factory.FactoryDao;

public class SessionProduto extends Session{
	
	public SessionProduto(Dao dao) {
		super(dao);
	}
	
	public SessionProduto() throws Exception{
		super(FactoryDao.createDao(new Produto()));
	}

	@Override
	public Object[] find(Object obj) throws Exception {
		Object list[] = super.find(obj);
		DaoUnidadeDeMedida daoUnidadeDeMedida = new DaoUnidadeDeMedida();
		DaoFornecedor daoFornecedor = new DaoFornecedor();
		DaoFabricante daoFabricante = new DaoFabricante();
		for (int i = 0; i < list.length; i++) {
			Produto produto = (Produto) list[i];
			produto.setUnidadeDeMedida((UnidadeDeMedida) daoUnidadeDeMedida.findByPrimaryKey(produto.getUnidadeDeMedida()));
			produto.setFornecedor((Fornecedor) daoFornecedor.findByPrimaryKey(produto.getFornecedor()));
			produto.setFabricante((Fabricante) daoFabricante.findByPrimaryKey(produto.getFabricante()));
		}
		return list;
	}
	
	@Override
	public Object findByPrimaryKey(Object obj) throws Exception {
		Produto produto = (Produto) super.findByPrimaryKey(obj);
		DaoUnidadeDeMedida daoUnidadeDeMedida = new DaoUnidadeDeMedida();
		DaoFornecedor daoFornecedor = new DaoFornecedor();
		DaoFabricante daoFabricante = new DaoFabricante();
		produto.setUnidadeDeMedida((UnidadeDeMedida) daoUnidadeDeMedida.findByPrimaryKey(produto.getUnidadeDeMedida()));
		produto.setFornecedor((Fornecedor) daoFornecedor.findByPrimaryKey(produto.getFornecedor()));
		produto.setFabricante((Fabricante) daoFabricante.findByPrimaryKey(produto.getFabricante()));
		return produto;
	}
}
