package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="condicaodepagamento")

public class CondicaoDePagamento {
	
	@Id
	@GeneratedValue
	@Column(name = "idcondicaodepagamento", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idCondicaoDePagamento;
	
	@Column(name = "descricao", type=Column.STRING, length=100, nullable=false)
	private String descricao;

	public Integer getIdCondicaoDePagamento() {
		return idCondicaoDePagamento;
	}

	public void setIdCondicaoDePagamento(Integer idCondicaoDePagamento) {
		this.idCondicaoDePagamento = idCondicaoDePagamento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CondicaoDePagamento other = (CondicaoDePagamento) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idCondicaoDePagamento == null) {
			if (other.idCondicaoDePagamento != null)
				return false;
		} else if (!idCondicaoDePagamento.equals(other.idCondicaoDePagamento))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CondicaoDePagamento [idCondicaoDePagamento="
				+ this.idCondicaoDePagamento + ", descricao=" + this.descricao + "]";
	}
	
}
