package br.edu.udc.sistemas.architect3.controller;

public class ControllerUsuario extends Controller{
	
	public ControllerUsuario() throws Exception {
		super("Usuario");
	}

	@Override
	public void goNew() throws Exception {
		request.setAttribute("nextPage","./usuario/cadastrarUsuario.jsp");
	}

	@Override
	public void goFind() throws Exception {
		request.setAttribute("nextPage","./usuario/consultarUsuario.jsp");
	}
	
	public void goLogin() throws Exception {
		request.setAttribute("nextPage","./admin/login.jsp");
	}
	
	public void goLogoff() throws Exception {
		request.setAttribute("nextPage","./admin/logoff.jsp");
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
