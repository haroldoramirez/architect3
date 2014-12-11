package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Caixa;
import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Fornecedor;
import br.edu.udc.sistemas.architect3.entity.Produto;
import br.edu.udc.sistemas.architect3.entity.Usuario;
import br.edu.udc.sistemas.architect3.session.SessionCaixa;
import br.edu.udc.sistemas.architect3.session.SessionCondicaoDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionFormaDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionFornecedor;
import br.edu.udc.sistemas.architect3.session.SessionProduto;
import br.edu.udc.sistemas.architect3.session.SessionUsuario;

public class ControllerCompra extends Controller{
	
	public ControllerCompra() throws Exception {
		super("Compra");
	}
	
	@Override
	public void goNew() throws Exception {
		SessionProduto sessionProduto = new SessionProduto();
		SessionFornecedor sessionFornecedor = new SessionFornecedor();
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		SessionUsuario sessionUsuario = new SessionUsuario();
		SessionCaixa sessionCaixa = new SessionCaixa();
		
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listFornecedor[] = sessionFornecedor.find(new Fornecedor());
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		Object listUsuario[] = sessionUsuario.find(new Usuario());
		Object listCaixa[] = sessionCaixa.find(new Caixa());
		
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("listFornecedor",listFornecedor);
		request.setAttribute("listUsuario",listUsuario);
		request.setAttribute("listCaixa",listCaixa);
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("listCondicaoDePagamento",listCondicaoDePagamento);
		request.setAttribute("nextPage","./compra/cadastrarCompra.jsp");
	}
	
	@Override
	public void goFind() throws Exception {
		SessionFornecedor sessionFornecedor = new SessionFornecedor();
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		SessionProduto sessionProduto = new SessionProduto();
		SessionUsuario sessionUsuario = new SessionUsuario();
		SessionCaixa sessionCaixa = new SessionCaixa();
		
		Object listFornecedor[] = sessionFornecedor.find(new Fornecedor());
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listUsuario[] = sessionUsuario.find(new Usuario());
		Object listCaixa[] = sessionCaixa.find(new Caixa());
		
		request.setAttribute("listFornecedor",listFornecedor);
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("listCondicaoDePagamento",listCondicaoDePagamento);
		request.setAttribute("listProduto", listProduto);
		request.setAttribute("listUsuario",listUsuario);
		request.setAttribute("listCaixa",listCaixa);
		request.setAttribute("nextPage","./compra/consultarCompra.jsp");
	
	}
	
	
	public void addCompra() throws Exception {
		
		System.out.println(request.getAttribute("Compra").toString());
		
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
