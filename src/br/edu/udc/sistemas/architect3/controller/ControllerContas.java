package br.edu.udc.sistemas.architect3.controller;

import br.edu.udc.sistemas.architect3.entity.CondicaoDePagamento;
import br.edu.udc.sistemas.architect3.entity.FormaDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionCondicaoDePagamento;
import br.edu.udc.sistemas.architect3.session.SessionFormaDePagamento;

public class ControllerContas extends Controller{
	
	public ControllerContas() throws Exception {
		super("Contas");
	}
	
	@Override
	public void goNew() throws Exception {
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		
		request.setAttribute("listCondicaoDePagamento", listCondicaoDePagamento);
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("nextPage","./contas/cadastrarContas.jsp");
	}

	@Override
	public void goFind() throws Exception {
		SessionFormaDePagamento sessionFormaDePagamento = new SessionFormaDePagamento();
		SessionCondicaoDePagamento sessionCondicaoDePagamento = new SessionCondicaoDePagamento();
		
		Object listFormaDePagamento[] = sessionFormaDePagamento.find(new FormaDePagamento());
		Object listCondicaoDePagamento[] = sessionCondicaoDePagamento.find(new CondicaoDePagamento());
		
		request.setAttribute("listCondicaoDePagamento", listCondicaoDePagamento);	
		request.setAttribute("listFormaDePagamento",listFormaDePagamento);
		request.setAttribute("nextPage","./contas/consultarContas.jsp");
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
