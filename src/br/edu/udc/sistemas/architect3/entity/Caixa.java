package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="caixa")

public class Caixa {
	
	@Id
	@GeneratedValue
	@Column(name = "idcaixa", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idCaixa;
	
	@Column(name = "dataabertura", type=Column.STRING, length = 11, nullable=false)
	private String dataAbertura;
	
	@Column(name = "datafechamento", type=Column.STRING, length = 11, nullable=false)
	private String dataFechamento;
	
	@Column(name = "valorabertura", type=Column.STRING, length = 10, nullable=false)
	private String valorAbertura;
	
	@Column(name = "valorfechamento", type=Column.STRING, length = 10, nullable=false)
	private String valorFechamento;

	@Column(name = "situacao", type=Column.STRING, length = 1, nullable=false)
	private String situacao;

	@Column(name = "descricao", type=Column.STRING, length = 150, nullable=false)
	private String descricao;

	public Integer getIdCaixa() {
		return idCaixa;
	}

	public void setIdCaixa(Integer idCaixa) {
		this.idCaixa = idCaixa;
	}

	public String getDataAbertura() {
		return dataAbertura;
	}

	public void setDataAbertura(String dataAbertura) {
		this.dataAbertura = dataAbertura;
	}

	public String getDataFechamento() {
		return dataFechamento;
	}

	public void setDataFechamento(String dataFechamento) {
		this.dataFechamento = dataFechamento;
	}

	public String getValorAbertura() {
		return valorAbertura;
	}

	public void setValorAbertura(String valorAbertura) {
		this.valorAbertura = valorAbertura;
	}

	public String getValorFechamento() {
		return valorFechamento;
	}

	public void setValorFechamento(String valorFechamento) {
		this.valorFechamento = valorFechamento;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
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
		Caixa other = (Caixa) obj;
		if (dataAbertura == null) {
			if (other.dataAbertura != null)
				return false;
		} else if (!dataAbertura.equals(other.dataAbertura))
			return false;
		if (dataFechamento == null) {
			if (other.dataFechamento != null)
				return false;
		} else if (!dataFechamento.equals(other.dataFechamento))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idCaixa == null) {
			if (other.idCaixa != null)
				return false;
		} else if (!idCaixa.equals(other.idCaixa))
			return false;
		if (situacao == null) {
			if (other.situacao != null)
				return false;
		} else if (!situacao.equals(other.situacao))
			return false;
		if (valorAbertura == null) {
			if (other.valorAbertura != null)
				return false;
		} else if (!valorAbertura.equals(other.valorAbertura))
			return false;
		if (valorFechamento == null) {
			if (other.valorFechamento != null)
				return false;
		} else if (!valorFechamento.equals(other.valorFechamento))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Caixa [idCaixa=" + this.idCaixa + ", dataAbertura=" + this.dataAbertura
				+ ", dataFechamento=" + this.dataFechamento + ", valorAbertura="
				+ this.valorAbertura + ", valorFechamento=" + this.valorFechamento
				+ ", situacao=" + this.situacao + ", descricao=" + this.descricao + "]";
	}
	
}
