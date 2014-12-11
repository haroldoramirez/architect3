package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="formadepagamento")

public class FormaDePagamento {
	
	@Id
	@GeneratedValue
	@Column(name = "idformadepagamento", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idFormaDePagamento;
	
	@Column(name = "descricao", type=Column.STRING, length=100, nullable=false)
	private String descricao;

	public Integer getIdFormaDePagamento() {
		return idFormaDePagamento;
	}

	public void setIdFormaDePagamento(Integer idFormaDePagamento) {
		this.idFormaDePagamento = idFormaDePagamento;
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
		FormaDePagamento other = (FormaDePagamento) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idFormaDePagamento == null) {
			if (other.idFormaDePagamento != null)
				return false;
		} else if (!idFormaDePagamento.equals(other.idFormaDePagamento))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FormaDePagamento [idFormaDePagamento=" + this.idFormaDePagamento
				+ ", descricao=" + this.descricao + "]";
	}
	
}
