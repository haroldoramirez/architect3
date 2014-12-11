package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Categoria;
import br.edu.udc.sistemas.architect3.entity.Fabricante;
import br.edu.udc.sistemas.architect3.entity.Fornecedor;
import br.edu.udc.sistemas.architect3.entity.UnidadeDeMedida;
import br.edu.udc.sistemas.architect3.session.SessionCategoria;
import br.edu.udc.sistemas.architect3.session.SessionFabricante;
import br.edu.udc.sistemas.architect3.session.SessionFornecedor;
import br.edu.udc.sistemas.architect3.session.SessionUnidadeDeMedida;

public class ControllerProduto extends Controller{
	
	public ControllerProduto() throws Exception {
		super("Produto");
	}
	
	@Override
	public void goNew() throws Exception {
		SessionCategoria sessionCategoria = new SessionCategoria();
		SessionUnidadeDeMedida sessionUnidadeDeMedida = new SessionUnidadeDeMedida();
		SessionFornecedor sessionFornecedor = new SessionFornecedor();
		SessionFabricante sessionFabricante = new SessionFabricante();
		
		Object listCategoria[] = sessionCategoria.find(new Categoria());
		Object listUnidadeDeMedida[] = sessionUnidadeDeMedida.find(new UnidadeDeMedida());
		Object listFornecedor[] = sessionFornecedor.find(new Fornecedor());
		Object listFabricante[] = sessionFabricante.find(new Fabricante());
		
		request.setAttribute("listCategoria",listCategoria);
		request.setAttribute("listUnidadeDeMedida",listUnidadeDeMedida);
		request.setAttribute("listFornecedor",listFornecedor);
		request.setAttribute("listFabricante",listFabricante);
		request.setAttribute("nextPage","./produto/cadastrarProduto.jsp");
	}
	
	
	
	
	@Override
	public void goFind() throws Exception {
		SessionCategoria sessionCategoria = new SessionCategoria();
		SessionUnidadeDeMedida sessionUnidadeDeMedida = new SessionUnidadeDeMedida();
		SessionFornecedor sessionFornecedor = new SessionFornecedor();
		SessionFabricante sessionFabricante = new SessionFabricante();
		
		Object listCategoria[] = sessionCategoria.find(new Categoria());
		Object listUnidadeDeMedida[] = sessionUnidadeDeMedida.find(new UnidadeDeMedida());
		Object listFornecedor[] = sessionFornecedor.find(new Fornecedor());
		Object listFabricante[] = sessionFabricante.find(new Fabricante());
		
		request.setAttribute("listCategoria",listCategoria);
		request.setAttribute("listUnidadeDeMedida",listUnidadeDeMedida);
		request.setAttribute("listFornecedor",listFornecedor);
		request.setAttribute("listFabricante",listFabricante);
		request.setAttribute("nextPage","./produto/consultarProduto.jsp");
	}
	
	@Override
	public void save(Object obj) throws Exception {
		this.goNew();
	}

	@Override
	public void delete(Object obj) throws Exception {
		this.goFind();
	}

	@Override
	public void detail(Object obj) throws Exception {
		request.setAttribute("object",obj);
		this.goNew();
	}
	
	@Override
	public void find(Object obj) throws Exception {
		request.setAttribute("list",obj);
		this.goFind();
	}

	@Override
	public void clean() throws Exception {
		this.goFind();
	}
}
