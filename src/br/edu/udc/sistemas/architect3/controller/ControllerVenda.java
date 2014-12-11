package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.Caixa;
import br.edu.udc.sistemas.architect3.entity.Cliente;
import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.entity.Produto;
import br.edu.udc.sistemas.architect3.entity.Usuario;
import br.edu.udc.sistemas.architect3.session.SessionCaixa;
import br.edu.udc.sistemas.architect3.session.SessionCliente;
import br.edu.udc.sistemas.architect3.session.SessionCondicaoDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionFormaDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionProduto;
import br.edu.udc.sistemas.architect3.session.SessionUsuario;

public class ControllerVenda extends Controller{
	
	public ControllerVenda() throws Exception {
		super("Venda");
	}
	
	@Override
	public void goNew() throws Exception {
		SessionProduto sessionProduto = new SessionProduto();
		SessionCliente sessionCliente = new SessionCliente();
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		SessionUsuario sessionUsuario = new SessionUsuario();
		SessionCaixa sessionCaixa = new SessionCaixa();
		
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listCliente[] = sessionCliente.find(new Cliente());
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		Object listUsuario[] = sessionUsuario.find(new Usuario());
		Object listCaixa[] = sessionCaixa.find(new Caixa());
			
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("listCondicaoDePagamento",listCondicaoDePagamento);
		request.setAttribute("listUsuario",listUsuario);
		request.setAttribute("listCaixa",listCaixa);
		request.setAttribute("nextPage","./venda/cadastrarVenda.jsp");
		
	}
	
	@Override
	public void goFind() throws Exception {
		SessionCliente sessionCliente = new SessionCliente();		
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionProduto sessionProduto = new SessionProduto();
		SessionUsuario sessionUsuario = new SessionUsuario();
		SessionCaixa sessionCaixa = new SessionCaixa();

		
		Object listCliente[] = sessionCliente.find(new Cliente());
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		Object listProduto[] = sessionProduto.find(new Produto());
		Object listUsuario[] = sessionUsuario.find(new Usuario());
		Object listCaixa[] = sessionCaixa.find(new Caixa());
		
	
		request.setAttribute("listCliente",listCliente);
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("listCondicaoDePagamento",listCondicaoDePagamento);
		request.setAttribute("listProduto",listProduto);
		request.setAttribute("listUsuario",listUsuario);
		request.setAttribute("listCaixa",listCaixa);
		request.setAttribute("nextPage","./venda/consultarVenda.jsp");
	
	}
	
	public void addVenda() throws Exception {
		
		System.out.println(request.getAttribute("Venda").toString());
		
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
