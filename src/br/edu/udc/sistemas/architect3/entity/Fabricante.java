package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="fabricante")

public class Fabricante {
	
	@Id
	@GeneratedValue
	@Column(name = "idfabricante", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idFabricante;
	
	@Column(name = "descricao", type=Column.STRING, length=150, nullable=false)
	private String descricao;
	
	@Column(name = "observacoes", type=Column.STRING, length=400, nullable=false)
	private String observacoes;

	public Integer getIdFabricante() {
		return idFabricante;
	}

	public void setIdFabricante(Integer idFabricante) {
		this.idFabricante = idFabricante;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Fabricante other = (Fabricante) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idFabricante == null) {
			if (other.idFabricante != null)
				return false;
		} else if (!idFabricante.equals(other.idFabricante))
			return false;
		if (observacoes == null) {
			if (other.observacoes != null)
				return false;
		} else if (!observacoes.equals(other.observacoes))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Fabricante [idFabricante=" + this.idFabricante + ", descricao="
				+ this.descricao + ", observacoes=" + this.observacoes + "]";
	}
	
}
