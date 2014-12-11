package br.edu.udc.sistemas.architect3.main;

import br.edu.udc.sistemas.architect3.dao.daoDatabase.DaoPais;
import br.edu.udc.sistemas.architect3.entity.Pais;

public class Main {
	
	public static void main(String[] args) throws Exception {
		DaoPais daoMarca = new DaoPais();
		
		Pais pais = new Pais();
		pais.setPais("");
		
		daoMarca.commit();
		
		System.out.println(pais);
	}

}
